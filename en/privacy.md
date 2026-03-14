---
layout: default
title: SafeScribe — Privacy Policy
description: What data SafeScribe collects, how we process it, and your rights.
lang: en
---

<div class="lang-bar">
  <strong>English</strong> · <a href="../tr/privacy">Turkce</a> · <a href="../de/privacy">Deutsch</a> · <a href="../fr/privacy">Francais</a> · <a href="../es/privacy">Espanol</a> · <a href="../pt/privacy">Portugues</a> · <a href="../ar/privacy">&#x0627;&#x0644;&#x0639;&#x0631;&#x0628;&#x064a;&#x0629;</a> · <a href="../zh/privacy">&#x4e2d;&#x6587;</a> · <a href="../ja/privacy">&#x65e5;&#x672c;&#x8a9e;</a> · <a href="../ko/privacy">&#xd55c;&#xad6d;&#xc5b4;</a>
</div>

<div class="page-content">

# Privacy Policy

<div class="summary-box">
  <strong>Plain-language summary:</strong> We process your audio in server memory to create a transcript, then immediately delete it. We don't store your audio on disk, use it for AI training, or share it with anyone. Your transcripts are encrypted on your device and under your control. We keep only pseudonymous billing records. You can delete everything at any time.
</div>

<p class="page-meta">Last updated: March 2026</p>

---

## 1. Introduction

SafeScribe is a privacy-first AI transcription app. This policy describes what data we collect, how we process it, and your rights regarding your personal information.

## 2. Data We Collect

### Persistent Data (stored until account deletion)

| Data | Purpose |
|------|---------|
| Pseudonymous user ID (SHA-256 hash of Google/Apple account ID) | Account identity |
| Account balance (USD) | Credit management |
| Free transcription minutes remaining | Welcome bonus tracking |
| Account creation and last update timestamps | Account management |

**Per-job records (stored for each transcription):**

| Data | Purpose |
|------|---------|
| Audio duration (seconds) | Service analytics |
| File size (bytes) | Service analytics |
| Word count | Service analytics |
| Cost charged (USD) | Billing records |
| Processing timestamps (upload, start, completion, delivery, acknowledgment) | Service analytics |

### Transient Data (deleted after processing)

| Data | Retention | Purpose |
|------|-----------|---------|
| Audio files | RAM only — deleted immediately after transcription | Transcription |
| Transcripts | Deleted from server after delivery acknowledgment | Delivered to user |

### Optional Data (opt-in only)

| Data | Purpose |
|------|---------|
| Crash reports and error logs | App stability (via Sentry, PII-redacted) |

**We do NOT collect or store:** email addresses, names, phone numbers, IP addresses, contacts, location, browsing history, advertising identifiers, or biometric data.

## 3. Audio Processing — Zero Disk Policy

- Audio is processed **exclusively in RAM** (volatile memory) on our servers.
- Audio is **never written to disk** at any stage.
- All audio data is **immediately erased from memory** when transcription completes or fails.
- No copies, backups, or logs of audio content are ever created.
- We run our own AI infrastructure — your audio is **never sent to third-party AI services**.

## 4. Local Storage

All data on your device is stored in **AES-256 encrypted** containers. The encryption key is protected by your phone's secure hardware (iOS Keychain / Android Keystore).

**What's stored on your device (encrypted):**

| Data | Retention |
|------|-----------|
| Transcripts (text, segments, metadata) | Until you delete them |
| Offline upload queue | Temporary — removed after successful upload |
| App settings and consent records | Until you sign out or delete your account |

**What's stored in platform secure storage:**

| Data | Purpose |
|------|---------|
| Encryption key | Protects all local data |
| Authentication tokens | Keeps you signed in |

- No user profile is stored locally (no name, photo, phone number, or address).
- Audio recordings are deleted from the device after upload.
- All local data is permanently erased when you delete your account.

## 5. Authentication

- We use OpenID Connect (OIDC) via Google Sign-In and Sign in with Apple.
- We receive only the minimum information for authentication (user ID, email).
- We do not access your contacts, calendars, or other account data.
- Your email is used only for authentication — it is **not stored on our servers**.

## 6. Payment Data

- Payments are handled entirely by Apple App Store or Google Play Store.
- SafeScribe **never receives, stores, or processes** credit card numbers or payment details.
- We receive only purchase receipts for credit balance verification.

## 7. Server-Side Processing

- Audio is uploaded via encrypted connections with certificate pinning.
- Audio is processed in RAM only and **never touches disk**.
- Transcripts are held temporarily and **deleted after you acknowledge receipt**.
- We use a state-of-the-art speech recognition AI that we self-host — no third-party API calls are made with your audio.

## 8. Error Tracking

- We use Sentry for optional crash reporting (you can opt out in the app).
- All reports are scrubbed for personally identifiable information (PII) before transmission.
- Redacted data types: email addresses, phone numbers, IP addresses, file paths, tokens, and work IDs.

## 9. Data Sharing

We do **not** sell, rent, or share your personal data with third parties for marketing.

Data is shared only with:
- **Our transcription servers** (self-hosted infrastructure) for audio processing
- **Sentry** for crash reporting (PII-redacted, opt-in only)
- **Apple/Google** for authentication and payment processing

## 10. Data Retention

| Data | Server Retention | Device Retention |
|------|-----------------|-----------------|
| Audio | Deleted immediately after transcription | Deleted after upload |
| Transcripts | Deleted after you acknowledge receipt | Until you delete them |
| Billing records | Pseudonymous, kept for legal requirements | Not stored |
| Crash reports | Per Sentry retention policy | Not stored |

## 11. Your Rights

You have the right to:

| Right | How to Exercise |
|-------|----------------|
| **Access** your data | View transcripts in the app at any time |
| **Delete** your data | Delete individual transcripts or your entire account from the app |
| **Export** your data | Use the share/export function in the app, or request a data export from Privacy Settings |
| **Opt out** of diagnostics | Toggle crash reporting off in Privacy Settings |
| **Withdraw consent** | Sign out and delete your account from Privacy Settings |
| **CCPA opt-out** | Toggle "Do Not Sell or Share" in Privacy Settings |

For any privacy request you can't handle in-app, contact us at **privacy@safescribe.dev**.

## 12. International Transfers

If you use SafeScribe from a jurisdiction with data transfer restrictions (EU/EEA under GDPR, Turkey under KVKK), your consent at first launch constitutes authorization for cross-border transfer to our processing servers.

## 13. Children's Privacy

SafeScribe is rated 17+ and is not intended for children under 17. We do not knowingly collect data from minors.

## 14. Changes to This Policy

We will update this page when our practices change. The "Last updated" date at the top reflects the most recent revision.

## 15. Contact

For privacy inquiries, data deletion requests, or to exercise your rights:

**Email:** privacy@safescribe.dev

For security issues:

**Email:** security@safescribe.dev

---

<div class="trust-footer">
  <div class="footer-links">
    <a href="./">How It Works</a>
    <a href="security">Security Architecture</a>
    <a href="dpia">DPIA</a>
  </div>
  <p>privacy@safescribe.dev</p>
</div>

</div>
