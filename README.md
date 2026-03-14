# SafeScribeAI.github.io

Public-facing documentation for [SafeScribe](https://safescribe.dev) — privacy-first AI audio transcription.

Served via GitHub Pages at `https://safescribe.dev/`.

## Structure

```
index.md                     Landing page (language selector)
en/
  index.md                   How It Works (English)
  privacy.md                 Privacy Policy
  security.md                Security Architecture
  dpia.md                    Data Protection Impact Assessment
tr/
  index.md                   Nasil Calisir (Turkce)
  privacy.md                 Gizlilik Politikasi
  security.md                Guvenlik Mimarisi
  dpia.md                    Veri Koruma Etki Degerlendirmesi
de/ fr/ es/ pt/ ar/ zh/ ja/ ko/
  index.md                   How It Works (localized)
  privacy.md                 Privacy Policy (localized)
_layouts/
  default.html               Custom layout (overrides jekyll-theme-minimal)
assets/css/
  style.css                  Custom styles (dark/light mode, components)
```

## Adding a page

1. Create `en/page-name.md` with Jekyll front matter (`layout: default`, `title:`)
2. Create `tr/page-name.md` (Turkish translation)
3. Add cross-language links at the top of each file
4. Link from `en/index.md` / `tr/index.md`

## Local preview

```bash
gem install bundler jekyll
bundle exec jekyll serve
# Open http://localhost:4000
```
