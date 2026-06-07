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

Type: Frontend (static marketing/trust-brand) | Stack: Jekyll/GitHub Pages/10-locale i18n | Target: Production
Priorities: Documentation, Spec-alignment, UX/Design, Performance
Constraints: GitHub Pages built-in deploy (no custom build pipeline); no machine translation (hand-crafted i18n); Pages plugin whitelist
Data: None (no forms/cookies/analytics) | Regulations: N/A on site; DPIA published as artifact
Audience: Public visitors/prospects/regulatory reviewers | Deploy: GitHub Pages + CNAME safescribe.dev (Cloudflare DNS)

Entry: index.md (root redirect → /en/ default)
Modules: _layouts/default.html=template(nav,footer,head,CSP,SEO); _data/i18n.yml=i18n SSOT; {en,tr,de,fr,es,pt,ar,zh,ja,ko}/=per-locale pages(index,privacy,security,dpia,terms,resources,whats-new); en/resources/=EN deep pages; assets/css(24KB); assets/js(2KB)
Data Flow: visitor→landing→CTA(#pricing/security)→store badges
External: faster-whisper, silero-vad, Whisper — informational links only
Toolchain: Jekyll (GitHub Pages) | CI: none (Pages built-in deploy) | Container: none

Ideal: coupling=low cohesion=high complexity=na coverage=na

Scores: sec=68 quality=72 arch=66 perf=62 resil=64 test=na stack=70 dx=65 docs=68 overall=66

## End Blueprint Profile
