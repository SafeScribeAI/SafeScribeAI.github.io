#!/usr/bin/env bash
# One-command gated release for the marketing site.
#
# No CHANGELOG/semver convention here (skipped from auto-versioning — see
# backend/mobile scripts/bump_version.py for that).
#
# "Gate" and "deploy" collapse into the same action for this repo: pushing to
# `main` both fires the pre-push hook AND is what triggers GitHub's own Pages
# build. So the heavy layer runs BEFORE the push here (unlike backend/mobile,
# where it runs after the gate but before a separate deploy step) — it has to
# finish before the one action that both gates and ships.
#
# Order: dirty-tree guard -> skip-if-unchanged -> weekly heavy layer (jekyll
# build + check_facts.py + html-proofer) -> gate=push (fires pre-push hook,
# IS the deploy) -> verify-live (poll GitHub's own Pages build record) -> move
# the `deployed` tag.
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/.."

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; CYAN='\033[0;36m'; NC='\033[0m'
pass(){ printf "${GREEN}✓${NC} %s\n" "$1"; }
fail(){ printf "${RED}✗${NC} %s\n" "$1" >&2; exit 1; }
info(){ printf "${CYAN}→${NC} %s\n" "$1"; }
warn(){ printf "${YELLOW}⚠${NC} %s\n" "$1"; }

HEAVY_STAMP=".release-heavy-stamp"
HEAVY_MAX_AGE_DAYS=7

bash scripts/install-hooks.sh >/dev/null

if [[ -n "$(git status --porcelain)" ]]; then
  fail "Working tree not clean — commit or stash before releasing."
fi

if git rev-parse deployed >/dev/null 2>&1 && [[ "$(git rev-parse deployed)" == "$(git rev-parse HEAD)" ]]; then
  pass "No changes since last release."
  exit 0
fi

run_heavy=false
if [[ ! -f "$HEAVY_STAMP" ]]; then
  run_heavy=true
else
  stamp_date="$(cat "$HEAVY_STAMP")"
  stamp_epoch="$(date -j -f "%Y-%m-%d" "$stamp_date" +%s 2>/dev/null || date -d "$stamp_date" +%s)"
  now_epoch="$(date +%s)"
  age_days=$(( (now_epoch - stamp_epoch) / 86400 ))
  if (( age_days > HEAVY_MAX_AGE_DAYS )); then
    run_heavy=true
  else
    info "Heavy layer last ran ${age_days}d ago (<= ${HEAVY_MAX_AGE_DAYS}d) — skipping."
  fi
fi

if $run_heavy; then
  info "Running weekly heavy layer: jekyll build + check_facts.py + html-proofer"
  bundle exec jekyll build || fail "Jekyll build failed — release aborted before push."

  if [[ -f ../scripts/check_facts.py ]]; then
    python3 ../scripts/check_facts.py || fail "Fact drift detected — release aborted before push."
  else
    warn "../scripts/check_facts.py not found (lone clone, not the full workspace) — skipping"
  fi

  bundle exec htmlproofer ./_site --disable-external || fail "html-proofer found broken internal links/HTML — release aborted before push."

  date +%Y-%m-%d > "$HEAVY_STAMP"
  pass "Heavy layer green — stamp refreshed."
fi

if [[ -n "$(git log @{u}..HEAD 2>/dev/null || true)" ]]; then
  info "Pushing (fires pre-push hook; this push is also the deploy)"
  git push
else
  info "Nothing to push — invoking pre-push hook inline (deploy already happened on a prior push)"
  bash .git/hooks/pre-push || fail "Gate failed — release aborted."
fi

command -v gh >/dev/null 2>&1 || fail "gh CLI not found — required to check Pages build status (the Pages API needs auth even for public repos)."

LOCAL_SHA="$(git rev-parse HEAD)"
REPO_SLUG="$(git remote get-url origin | sed -E 's#.*[:/]([^/]+/[^/]+?)(\.git)?$#\1#')"

info "Verifying GitHub Pages build for ${LOCAL_SHA:0:12} (repo: ${REPO_SLUG})"
status=""
commit=""
for _ in $(seq 1 30); do
  build_json="$(gh api "repos/${REPO_SLUG}/pages/builds/latest" 2>/dev/null || echo '{}')"
  status="$(echo "$build_json" | python3 -c 'import json,sys; print(json.load(sys.stdin).get("status",""))' 2>/dev/null || echo "")"
  commit="$(echo "$build_json" | python3 -c 'import json,sys; print(json.load(sys.stdin).get("commit",""))' 2>/dev/null || echo "")"
  if [[ "$commit" == "$LOCAL_SHA" && "$status" == "built" ]]; then
    break
  fi
  if [[ "$commit" == "$LOCAL_SHA" && "$status" == "errored" ]]; then
    fail "GitHub Pages build errored for ${LOCAL_SHA:0:12} — 'deployed' tag not moved."
  fi
  sleep 10
done

if [[ "$commit" != "$LOCAL_SHA" || "$status" != "built" ]]; then
  fail "Pages build did not confirm ${LOCAL_SHA:0:12} as built within timeout — 'deployed' tag not moved."
fi
pass "GitHub Pages build confirmed for ${LOCAL_SHA:0:12}."

git tag -f deployed HEAD >/dev/null
git push -f origin deployed
pass "'deployed' tag moved to ${LOCAL_SHA:0:12} and pushed."
