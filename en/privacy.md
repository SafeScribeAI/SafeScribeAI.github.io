---
layout: default
title: SafeScribe — Privacy Policy
description: What data SafeScribe collects, how we process it, and your rights.
lang: en
---

<div class="page-content" markdown="1">

# Privacy Policy

<div class="summary-box">
  <strong>Plain-language summary:</strong> We process your audio in server memory to create a transcript, then delete it immediately. We don't store audio on disk, don't use it for AI training, and don't share it with anyone. Your transcripts are encrypted on your device and under your control. We keep only pseudonymous billing records.
</div>

<p class="page-meta">Last updated: March 2026</p>

---

<span class="section-label">What We Never Do</span>
## Data We Don't Collect or Store

<ul class="dont-list">
  <li><span class="x-mark">&#x2717;</span> Store audio on disk — ever</li>
  <li><span class="x-mark">&#x2717;</span> Store your email address or name</li>
  <li><span class="x-mark">&#x2717;</span> Log or store IP addresses</li>
  <li><span class="x-mark">&#x2717;</span> Use recordings to train AI models</li>
  <li><span class="x-mark">&#x2717;</span> Share data with advertisers or brokers</li>
  <li><span class="x-mark">&#x2717;</span> Track behaviour across apps or sessions</li>
  <li><span class="x-mark">&#x2717;</span> Collect contacts, location, or biometric data</li>
  <li><span class="x-mark">&#x2717;</span> Retain data after account deletion</li>
</ul>

---

<span class="section-label">What We Do Store</span>
## Data We Collect

### Server-side (persistent until account deletion)

| Data | Purpose |
|------|---------|
| Pseudonymous user ID (SHA-256 hash of your account ID) | Account identity — cannot be reversed |
| Pseudonymous device identifier (SHA-256 hash of device properties) | Abuse prevention — cannot be reversed |
| Account balance (USD) | Credit management |
| Free transcription minutes remaining | Welcome bonus tracking |
| Account creation and last update timestamps | Account management |

**Per-job records** (stored for each completed transcription):

| Data | Purpose |
|------|---------|
| Audio duration (seconds) | Service analytics |
| File size (bytes) | Service analytics |
| Word count | Service analytics |
| Cost charged (USD) | Billing record |
| Processing timestamps | Service analytics |

<div class="callout callout-info">
  <strong>No audio content or transcript text is ever included in per-job records.</strong> These records contain only metadata (numbers and timestamps) — never the words you said.
</div>

### Server-side (transient — deleted after processing)

| Data | When Deleted |
|------|-------------|
| Audio file | Immediately after transcription completes |
| Transcript text | After you confirm receipt (acknowledgment) |

### On your device (encrypted)

| Data | Retention |
|------|-----------|
| Transcripts (text, segments, metadata) | Until you delete them |
| Offline upload queue | Removed after successful upload |
| App settings and consent records | Until sign-out or account deletion |
| Encryption key | In iOS Keychain / Android Keystore — deleted with the app |

### Optional (opt-in only)

| Data | Purpose |
|------|---------|
| Crash reports | App stability via SafeScribe's own crash reporting endpoint — all PII stripped before sending |

<div class="callout callout-green">
  <strong>The server never stores your name, email address, IP address, audio content, or transcript text.</strong> The only persistent records linked to your account are a non-reversible user hash, a pseudonymous device identifier, a credit balance, and usage statistics (numbers only — no content, no identity).
</div>

---

<span class="section-label">Complete Deletion</span>
## Deleting the App vs. Deleting Your Account

These are two distinct actions with different outcomes:

| Action | What happens | Your balance |
|--------|-------------|-------------|
| **Delete the app** | Local transcripts and encryption key removed from your device | Preserved on the server — reinstalling and signing in with the same account fully restores it |
| **Delete your account** | Every server-side record permanently erased — cannot be undone | Gone |

<div class="callout callout-info">
  <strong>Reinstall anytime.</strong> If you delete the app without deleting your account, reinstalling and signing in with the same Google or Apple account restores your full balance and access — no action required.
</div>

### Account Deletion — Nothing Left That Identifies You

Deleting your account from Privacy Settings permanently removes every server-side record linked to your identity:

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Pseudonymous user ID</strong><span class="item-desc">permanently deleted</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Credit balance</strong><span class="item-desc">permanently deleted</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Free minutes remaining</strong><span class="item-desc">permanently deleted</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Per-job statistics</strong><span class="item-desc">anonymized immediately — re-labelled to a shared DELETED_USER tombstone, auto-purged after 2 years</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Pseudonymous device identifier</strong><span class="item-desc">reduced to a salted one-way hash kept up to 2 years — blocks repeat welcome-credit abuse, cannot be reversed or tied to you</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Daily backup</strong><span class="item-desc">overwritten within 24 hours — no identifying copy remains anywhere</span></span></li>
</ul>

Every link to your identity is destroyed at the moment of deletion. Two narrow categories persist for a limited time <em>without any identity link</em>: financial records (purchase and usage amounts) are anonymized to the DELETED_USER tombstone and kept for 2 years under the consumer-dispute statute of limitations (TBK Art. 146), and a salted one-way device hash is kept up to 2 years to prevent repeated free-credit grants (GDPR Art. 6(1)(f) legitimate interest). Both are automatically purged when the window expires. The single daily backup is overwritten within 24 hours of deletion.

Using the in-app deletion constitutes your formal exercise of the right to erasure under GDPR Art. 17 and KVKK Art. 11(e). If you cannot access your account, contact **privacy@safescribe.dev** to submit a deletion request by email.

---

<span class="section-label">Audio Processing</span>
## Zero Disk Policy

<div class="flow-diagram">
Your audio:  Upload --> RAM --> AI transcription --> Deliver --> DELETE
                                                              (immediate)

Our disk:    Balance records only — no audio, no transcript, no email
</div>

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>RAM-only</strong><span class="item-desc">audio processed in volatile memory only</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Never written to disk</strong><span class="item-desc">not even temporarily</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>No AI training</strong><span class="item-desc">your audio is never used to improve models</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Self-hosted AI</strong><span class="item-desc">no third-party AI service receives your audio</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>TTL failsafe</strong><span class="item-desc">data self-destructs even if deletion code fails</span></span></li>
</ul>

---

<span class="section-label">Authentication</span>
## Sign-In via Google or Apple

We use OpenID Connect (OIDC) via Google Sign-In and Sign in with Apple.

| What the provider sends us | What we do with it |
|---------------------------|-------------------|
| Account ID | Hashed (SHA-256 + salt) — original discarded |
| Email address | Used for authentication only — **not stored** |
| Display name | **Not stored** |

We do not access your contacts, calendar, or any other account data.

---

<span class="section-label">Payments</span>
## Billing via App Stores

Payments are processed entirely by Apple App Store or Google Play Store. SafeScribe **never receives, stores, or processes** credit card numbers or payment details. We receive only a purchase receipt for balance verification.

<div class="callout callout-info">
  <strong>Payment records held by Apple or Google</strong> are outside SafeScribe's control and are not covered by SafeScribe's account deletion process. To manage those records, contact <a href="https://support.apple.com">Apple Support</a> or <a href="https://support.google.com/googleplay">Google Play Support</a> directly.
</div>

---

<span class="section-label">Error Tracking</span>
## Crash Reports (Optional)

We send optional crash reports to SafeScribe's own crash reporting endpoint. This is **off by default** and can be toggled from Privacy Settings at any time.

Before any report is transmitted, the following are automatically removed:

**Redacted:** email addresses · phone numbers · IP addresses · file paths · authentication tokens

**Retained:** error type and stack trace · device model · OS version · app version

---

<span class="section-label">Third Parties</span>
## Third-Party Services

We use the following services. No audio, transcript content, or personal information beyond what is noted is shared with any third party.

| Service | Purpose | Data shared | Privacy Policy |
|---------|---------|------------|---------------|
| Google Sign-In | Authentication | OIDC token only | [policies.google.com/privacy](https://policies.google.com/privacy) |
| Apple Sign-In | Authentication | OIDC token only | [apple.com/legal/privacy](https://www.apple.com/legal/privacy/) |
| Apple App Store | In-app purchases | Purchase receipt only | [apple.com/legal/privacy](https://www.apple.com/legal/privacy/) |
| Google Play Store | In-app purchases | Purchase receipt only | [policies.google.com/privacy](https://policies.google.com/privacy) |
| SafeScribe crash endpoint | Crash reporting (opt-in) | Anonymised error report — PII stripped | SafeScribe-operated, no third party |

---

<span class="section-label">Legal Basis</span>
## Legal Basis for Processing

| Processing activity | GDPR Basis | KVKK Basis (Turkey) | Required? |
|--------------------|-----------|-----------|---------|
| Audio transcription | Art. 6(1)(b) — Contract | Explicit consent | Required to use the service |
| Account & billing | Art. 6(1)(b) — Contract | Contract performance | Required to use the service |
| Authentication (OIDC) | Art. 6(1)(b) — Contract | Contract performance | Required to use the service |
| In-app purchases | Art. 6(1)(b) — Contract | Contract performance | Required to make purchases |
| Crash reporting | Art. 6(1)(a) — Consent | Explicit consent | Optional |

Providing data for transcription, authentication, and billing is **required** to use SafeScribe. Crash reporting is **optional** — the service operates fully without it.

---

<span class="section-label">Your Rights</span>
## What You Can Do

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Access</strong><span class="item-desc">view all your transcripts in the app at any time</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Delete</strong><span class="item-desc">remove individual transcripts or delete your entire account from Privacy Settings; account deletion leaves zero rows in any database</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Export</strong><span class="item-desc">share or export transcripts, or request a full data export from Privacy Settings</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Opt out of diagnostics</strong><span class="item-desc">turn off crash reporting in Privacy Settings</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Withdraw consent</strong><span class="item-desc">sign out and delete your account at any time</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>CCPA opt-out</strong><span class="item-desc">toggle "Do Not Sell or Share" in Privacy Settings</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>No automated decisions</strong><span class="item-desc">we never make automated decisions about you, including profiling with legal or similarly significant effects (GDPR Art. 22)</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Lodge a complaint</strong><span class="item-desc">EU/EEA residents may contact their national supervisory authority (<a href="https://www.edpb.europa.eu/about-edpb/about-edpb/members_en">edpb.europa.eu</a>); Turkey residents may contact KVKK (<a href="https://www.kvkk.gov.tr">kvkk.gov.tr</a>)</span></span></li>
</ul>

For any request you can't complete in-app, contact **privacy@safescribe.dev**.

---

<span class="section-label">Legal</span>
## Additional Information

**Data controller.** SafeScribe is operated by an independent developer based in Turkey. Contact: privacy@safescribe.dev. No Data Protection Officer (DPO) has been appointed — processing is not carried out at large scale and no special-category data is systematically retained (audio is processed ephemerally in RAM only, never persisted to disk).

**Backups.** A single daily backup of account records (pseudonymous ID, balance, usage statistics) is maintained for service continuity. Each backup overwrites the previous one. Data deleted by account deletion is removed from live systems immediately and from the backup within 24 hours.

**International transfers.** If you use SafeScribe from the EU/EEA, your audio and account data are processed on servers in Turkey. Turkey does not currently hold an <a href="https://commission.europa.eu/law/law-topic/data-protection/international-dimension-data-protection/adequacy-decisions_en">EU adequacy decision</a>; transfers are covered by your explicit informed consent at first launch (GDPR Art. 49(1)(a)). For Turkey (KVKK — Turkey's Personal Data Protection Law) users, cross-border transfer is authorised by explicit consent at first launch under KVKK Art. 9.

**Children.** SafeScribe is rated 17+ on the App Store and Google Play and is not intended for users under 17. We do not knowingly collect data from anyone under 17. In jurisdictions where 18 is the age of full legal capacity (including Turkey), users aged 17 require parental or guardian consent before using the app.

**Policy changes.** We will update this page when our practices change. The "Last updated" date above reflects the most recent revision.

---

<span class="section-label">Contact</span>
## Get in Touch

| Topic | Contact |
|-------|---------|
| Privacy requests, data deletion, rights | privacy@safescribe.dev |
| Security vulnerabilities | security@safescribe.dev |
| General support | support@safescribe.dev |

---


</div>
