# SafeScribeAI.github.io

Public-facing documentation for [SafeScribe](https://safescribe.dev) — privacy-first AI audio transcription.

Served via GitHub Pages at `https://safescribe.dev/`.

## Structure

```
index.md                     Root language selector
404.html                     Custom 404 page
robots.txt                   Crawler policy + sitemap pointer
safescribe.svg               Favicon (single SVG)
_config.yml                  Jekyll config (title, description, url, plugins)
_data/
  i18n.yml                   Nav/footer label translations for all 10 languages
  facts.yml                  Canonical numeric/pricing facts (pricing cards render from it)
_layouts/
  default.html               Layout: language-aware nav, footer, lang switcher, SEO/CSP
assets/css/
  style.css                  Custom styles (dark/light mode, all components)
assets/js/
  main.js                    Nav toggle, lang dropdown, pricing save badges
<lang>/                          10 languages: en tr de fr es pt ar zh ja ko
  index.md                   Home (How It Works, pricing, FAQ)
  privacy.md                 Privacy Policy
  security.md                Security Architecture
  dpia.md                    Data Protection Impact Assessment
  terms.md                   Terms of Use
  resources.md               Resources hub (links to /en/resources/* deep pages)
  whats-new.md               Release notes
  support.md                 Support / contact
en/resources/                English-only deep pages (how-we-compare, security-tradeoffs, our-stack)
```

**Language coverage:** All 10 languages ship the full set of 8 pages; the three `en/resources/` deep pages are English-only.

## Adding a new language page

1. Create `<lang>/page-name.md` with front matter:
   ```yaml
   ---
   layout: default
   title: "Page Title"
   lang: de
   ---
   ```
2. If it's a new page type that only exists in `en`/`tr`, no extra work needed — the nav and footer automatically fall back to `/en/page-name`.
3. If it will exist in all 10 languages, add translations to `_data/i18n.yml` (`nav_*`, `link_*` fields).

## Adding a new language

1. Create `<lang>/index.md` and `<lang>/privacy.md` with `lang: <code>` front matter.
2. Add a new entry to `_data/i18n.yml` with all required fields (copy the `en` block as a template).
3. Add `<lang>` to the `all_langs` string in `_layouts/default.html`.

## Release

`./safescribe.sh release-site` (from the `SafeScribeAI/` root) or `bash scripts/release.sh` (from this repo) is the canonical path: run once after `bash scripts/install-hooks.sh` (this repo shipped with no installed hooks before). It runs the weekly heavy layer (`jekyll build` + `../scripts/check_facts.py` + `html-proofer` against `_site/`) before pushing, pushes to `main` (which both fires the pre-push gate and triggers GitHub's own Pages build — the two collapse into one action here), then polls GitHub's Pages build API (via the `gh` CLI — the endpoint needs auth even for public repos) until the pushed commit shows `status: built`.

## Local preview

```bash
bundle install
bundle exec jekyll serve
# Open http://localhost:4000
```

The `Gemfile` pins the `github-pages` gem so local preview matches the exact Jekyll + plugin versions GitHub Pages builds with.

**Ruby version:** `github-pages` pins Jekyll 3.9.0 → `liquid` 4.0.3, which calls `String#tainted?` — removed in Ruby 3.2. On Ruby >= 3.2, `bundle exec jekyll build`/`serve` fails with `undefined method 'tainted?'`. `.ruby-version` (3.1.7) documents the working version; `scripts/pre-push` and `scripts/release.sh` auto-prefer a keg-only `brew install ruby@3.1` if present (`/opt/homebrew/opt/ruby@3.1/bin`) — install it once and both scripts pick it up automatically. Without it, run `bundle exec jekyll ...` manually via that Ruby, or expect the pre-push gate to warn and the build to fail.
