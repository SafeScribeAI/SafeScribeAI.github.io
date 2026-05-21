# SafeScribeAI.github.io

Marketing landing site for [SafeScribe](https://safescribe.dev) — privacy-first AI audio transcription. Served via GitHub Pages at `https://safescribe.dev/`.

## Meta

- **Status:** active
- **Owner:** sungurerdim (private / commercial)
- **License:** Proprietary
- **Stack:** Jekyll (GitHub Pages)
- **Languages:** 10 (en, tr, de, fr, es, pt, ar, zh, ja, ko)

## Project Structure

| Path | Purpose |
|------|---------|
| `index.md` | Root redirect — language selector |
| `_config.yml` | Jekyll config (title, description, url) |
| `_data/i18n.yml` | Nav/footer label translations |
| `_layouts/default.html` | Layout — language-aware nav, footer, lang switcher |
| `assets/css/style.css` | Custom styles (dark/light mode, components) |
| `<lang>/index.md` | Per-language home — hero, comparison, How It Works, personas, pipeline, pricing, FAQ |
| `<lang>/privacy.md` | Per-language privacy policy |
| `<lang>/security.md` | Per-language security architecture |
| `<lang>/dpia.md` | Per-language DPIA |
| `<lang>/terms.md` | Per-language terms of service |
| `<lang>/resources.md` | Per-language Resources hub (links to /en/resources/* deep pages) |
| `<lang>/whats-new.md` | Per-language release notes (Apple-style aggregate, not per-commit) |
| `en/resources/*.md` | English-only deep pages: how-we-compare, security-tradeoffs, our-stack |
| `CNAME` | Custom domain (`safescribe.dev`) |

## Development

```bash
bundle install            # Local Ruby/Jekyll deps
bundle exec jekyll serve  # Local preview at http://localhost:4000
```

## Git Workflow

- **Direct push to main** — no branch requirement
- Push triggers GitHub Pages deploy automatically (built-in, not Actions)
- **Conventional commits** — `feat:`, `fix:`, `docs:`, `chore:`

## Notes

- 10-language i18n is **hand-crafted** (no machine translation)
- Privacy policy versioned per language
- Custom domain `safescribe.dev` via CNAME (TLS auto by GitHub Pages)
- No GitHub Actions — Pages built-in deploy is sufficient

## Blueprint Profile

**Project:** SafeScribeAI Website | **Type:** Frontend (static marketing landing) | **Stack:** Jekyll / GitHub Pages / 10-locale i18n | **Target:** Production (trust-brand site)

### Config
- **Priorities:** Documentation, Spec-alignment, UX/Design, Performance
- **Constraints:** GitHub Pages built-in deploy (no custom build pipeline), no machine translation (hand-crafted i18n), Pages plugin whitelist
- **Data:** None (no forms, no cookies, no analytics SDKs) | **Regulations:** N/A on website; DPIA published as artifact
- **Audience:** Public visitors / prospects / regulatory reviewers | **Deploy:** GitHub Pages + CNAME `safescribe.dev` (Cloudflare DNS)

### Project Map
```
Entry: index.md (root redirect) → /en/ default
Layout: _layouts/default.html → shared template (nav, footer, head, CSP, SEO)

Modules:
  _data/i18n.yml                        → nav/footer translations (SSOT)
  {en,tr,de,fr,es,pt,ar,zh,ja,ko}/      → per-locale pages: index, privacy, security, dpia, terms, resources, whats-new
  en/resources/                         → EN-only deep pages: how-we-compare, our-stack, security-tradeoffs
  assets/css/style.css                  → ~24KB unminified
  assets/js/main.js                     → ~2KB unminified (lang-switcher + pricing badges)
  CNAME                                 → safescribe.dev

Data Flow: visitor → landing → CTA (#pricing / security) → store badges ("Coming Soon")
External refs: faster-whisper (GitHub), silero-vad (GitHub), Whisper (OpenAI GitHub) — informational links only
Toolchain: Jekyll (GitHub Pages), no Actions, no sitemap plugin
Missing infra: robots.txt, sitemap.xml, .nojekyll, _headers, 404.html, favicon, og:image
```

### Ideal Metrics
| Metric | Target |
|--------|--------|
| Coupling | Low (single layout, i18n via _data) |
| Cohesion | High (1 locale dir per language) |
| Complexity | N/A (static content) |
| Coverage | N/A (link/HTML validation in CI desired) |

### Current Scores
| Dimension | Score | Status |
|-----------|-------|--------|
| Security & Privacy | 70 | WARN |
| Code Quality | 73 | WARN |
| Architecture | 70 | WARN |
| Performance | 62 | WARN |
| Resilience | 45 | FAIL |
| Testing | N/A | — |
| Stack Health | 75 | OK |
| DX | 60 | WARN |
| Documentation | 75 | OK |
| Overall | 64 | WARN |

### Last Run
- 2026-05-13: ds-blueprint full | Findings: 24 (5 CRITICAL / 9 MAJOR / 10 MINOR) | Fixed: 0 | Skipped: 0 | Failed: 0 | Overall —→64

## End Blueprint Profile
