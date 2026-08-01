# SafeScribeAI.github.io — legal + support pages

Served via GitHub Pages at `https://safescribeai.github.io/`. No custom domain.

## What this repo is

The minimum public web surface a paid iOS app must have: Apple requires a
reachable Support URL and a Privacy Policy URL, and a reviewer actually opens
them. Nothing else belongs here.

It was a full marketing site until 2026-08-01. The 2026-07-29 pivot (server
removed, app is fully on-device) made that content actively false, so the
marketing pages, the DPIA, the security-architecture page and the resources
section were deleted rather than rewritten.

## Layout

| Path | Purpose |
| --- | --- |
| `index.md` | Root landing, links to all six pages |
| `en/`, `tr/` | `privacy.md`, `terms.md`, `support.md` in each |
| `_layouts/default.html` | The only layout; nav + footer + language switch |
| `assets/css/style.css` | ~130 lines, light/dark, no JS |

Front matter needs `lang` (`en`/`tr`) and `page_key` (`privacy`/`terms`/
`support`) — the layout uses both for nav state and the language switch.

## Hard rules

- **No custom domain, ever.** Store consoles get `safescribeai.github.io` URLs
  only. A lapsed domain must never be able to break a mandatory store field.
- **One contact address:** `safescribeai@gmail.com`.
- **Never reintroduce server, account, balance, or data-controller language.**
  The app declares "Data Not Collected" to Apple; a page that contradicts that
  declaration is an app-removal risk, not a copy error.
- **EEA/UK are out of scope** in v1 — no GDPR representative, no DSA trader
  disclosure. Do not add GDPR framing back.
- **Purchase disclosure is verbatim-locked** across three places: the app's
  `pro_storeAccountNotice` l10n string, `terms.md`, and the store listing.
  These exist because a disclaimer clause does not protect under Turkish Code
  of Obligations art. 115 — actual disclosure does. Edit all three together.
- **i18n is hand-written**, EN + TR only. No machine translation of legal text.

## Tracking

Work is tracked in this repo's GitHub issues; product sequencing lives in the
`kumanda` panel.
