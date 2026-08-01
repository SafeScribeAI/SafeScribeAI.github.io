# SafeScribeAI.github.io

SafeScribe's legal and support pages, served via GitHub Pages at
`https://safescribeai.github.io/`.

This site exists for one reason: Apple requires a reachable Support URL and a
Privacy Policy URL, and a reviewer opens both. It is **not** a marketing site.

## Pages

| Path | Purpose |
| --- | --- |
| `en/privacy.md` · `tr/privacy.md` | Privacy policy |
| `en/terms.md` · `tr/terms.md` | Terms of use (includes pre-purchase disclosure) |
| `en/support.md` · `tr/support.md` | Support — must always contain a working contact method |
| `index.md` | Root landing page linking to the six pages above |

## Rules

- **No custom domain.** Every URL entered into a store console must be a
  `safescribeai.github.io` URL, so that nothing breaks if a domain lapses.
  `safescribe.dev` was retired on 2026-08-01.
- **One support address:** `safescribeai@gmail.com`. It appears in the footer
  and on the support page and must stay reachable for as long as the app is
  listed.
- **The site may never contradict the App Store privacy declaration.** The app
  declares "Data Not Collected"; these pages have to remain true alongside it.
  There is no server, no account and no telemetry — do not reintroduce that
  language.
- **The two purchase sentences in `terms.md` are verbatim-locked** to the app's
  `pro_storeAccountNotice` string and the store listing. Change one, change all
  three.

## Local preview

```bash
bundle install
bundle exec jekyll serve
```
