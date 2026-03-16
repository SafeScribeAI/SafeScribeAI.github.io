# SafeScribeAI.github.io

Public-facing documentation for [SafeScribe](https://safescribe.dev) — privacy-first AI audio transcription.

Served via GitHub Pages at `https://safescribe.dev/`.

## Structure

```
index.md                     Root redirect (language selector)
_config.yml                  Jekyll config (title, description, url)
_data/
  i18n.yml                   Nav/footer label translations for all 10 languages
_layouts/
  default.html               Layout: language-aware nav, footer, lang switcher
assets/css/
  style.css                  Custom styles (dark/light mode, all components)
en/
  index.md                   How It Works
  privacy.md                 Privacy Policy
  security.md                Security Architecture
  dpia.md                    Data Protection Impact Assessment
  terms.md                   Terms of Use
tr/
  index.md                   Nasıl Çalışır
  privacy.md                 Gizlilik Politikası
  security.md                Güvenlik Mimarisi
  dpia.md                    Veri Koruma Etki Değerlendirmesi
  terms.md                   Kullanım Şartları
de/ fr/ es/ pt/ ar/ zh/ ja/ ko/
  index.md                   How It Works (localized)
  privacy.md                 Privacy Policy (localized)
```

**Language coverage:**
- All 10 languages (`en tr de fr es pt ar zh ja ko`): `index.md`, `privacy.md`
- English + Turkish only: `security.md`, `dpia.md`, `terms.md` — other languages link to the English versions

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

## Local preview

```bash
gem install jekyll
jekyll serve
# Open http://localhost:4000
```

> **Note:** No `Gemfile` is included. If you need one for GitHub Actions or CI, create it with `gem 'jekyll'` and run `bundle exec jekyll serve` instead.
