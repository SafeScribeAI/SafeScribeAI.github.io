#!/usr/bin/env bash
# Install git hooks (pre-commit + pre-push) — macOS, Linux, Git Bash (Windows).
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

if [[ ! -d "$REPO_ROOT/.git" ]]; then
  echo "Error: Not a git repository. Run from project root."
  exit 1
fi

mkdir -p "$REPO_ROOT/.git/hooks"

for hook in pre-commit pre-push; do
  src="$SCRIPT_DIR/$hook"
  if [[ -f "$src" ]]; then
    cp "$src" "$REPO_ROOT/.git/hooks/$hook"   # copy, not symlink, for Windows
    chmod +x "$REPO_ROOT/.git/hooks/$hook"
    echo "✓ Installed $hook"
  fi
done
