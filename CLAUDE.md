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
