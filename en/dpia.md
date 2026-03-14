---
layout: default
title: SafeScribe — Data Protection Impact Assessment
description: Formal risk assessment for SafeScribe's audio transcription service under GDPR and KVKK.
lang: en
---

<div class="lang-bar">
  <strong>English</strong> · <a href="../tr/dpia">Turkce</a>
</div>

<div class="page-content">

# Data Protection Impact Assessment (DPIA)

<div class="summary-box">
  <strong>Plain-language summary:</strong> This assessment evaluates the privacy risks of SafeScribe's audio transcription service. The key finding: because audio is processed in volatile memory and deleted immediately, and no personal data is stored on our servers after processing, all identified risks are reduced to <strong>Low</strong> after mitigations are applied.
</div>

**SafeScribe — AI Audio Transcription Service**

| Field | Value |
|-------|-------|
| Version | 1.1 |
| Date | March 2026 |
| Review Due | March 2027 |
| Status | Active |

---

## 1. Processing Description

### 1.1 Nature of Processing

SafeScribe processes user-uploaded audio files through a self-hosted speech recognition AI to generate text transcripts. The processing flow:

1. User records or selects an audio file on their mobile device.
2. Audio is preprocessed locally on-device (loudness normalization, noise reduction).
3. Preprocessed audio is uploaded to SafeScribe servers over encrypted connections with certificate pinning.
4. Server processes audio in RAM using self-hosted speech recognition AI (no third-party API calls).
5. Generated transcript is returned with integrity verification.
6. Client acknowledges receipt; server deletes transcript and audio from memory.
7. Transcript is stored locally on-device in AES-256 encrypted storage.

### 1.2 Scope of Processing

| Data Category | Collected | Retained Server-Side | Retained Client-Side |
|---------------|-----------|---------------------|---------------------|
| Audio files | Yes | RAM only — deleted after transcription + ACK | Deleted after upload |
| Transcripts | Generated | Until client ACK (~seconds) | Encrypted local storage (user-controlled) |
| Pseudonymous user ID | SHA-256 hash of OIDC subject | Until account deletion | Not stored |
| Account balance (USD) | Yes | Until account deletion | Not stored |
| Free minutes remaining | Yes | Until account deletion | Not stored |
| Per-job records | Yes | Until account deletion | Not stored |
| Email address | Transit only (OIDC) | Not stored server-side | Not stored client-side |
| Purchase receipts | Yes (IAP) | Ledger record | Not stored |
| Crash reports | Optional (Sentry) | Sentry retention policy | Not stored |
| IP addresses | Transit only | Not logged | Not stored |

**Per-job records** include: audio duration (seconds), file size (bytes), word count, charge amount (USD), and processing timestamps (upload, start, complete, deliver, acknowledge). No audio content, transcript text, or user-identifiable data is included.

### 1.3 Context of Processing

- **Data subjects:** End users (general public, 17+ age rating)
- **Relationship:** Direct (B2C), users provide granular informed consent before first use via 4-card consent screen
- **Technology:** AI/ML speech recognition (self-hosted inference, no third-party data sharing)
- **Data volume:** Individual audio files, per-user processing, no batch or bulk operations

### 1.4 Purpose of Processing

- **Primary:** Convert speech audio to text for the user's personal use
- **Secondary:** Billing (duration-based pricing via in-app purchase)
- **Secondary:** Error monitoring for app stability (PII-redacted crash reports, opt-in)

---

## 2. Necessity and Proportionality

### 2.1 Lawful Basis

| Processing Activity | Legal Basis (GDPR) | KVKK Basis | Consent Card |
|--------------------|--------------------|--------------------|-------------|
| Audio transcription | Art. 6(1)(b) Contract performance | Explicit consent | Audio Processing (required) |
| Stored data (balance, usage stats) | Art. 6(1)(b) Contract performance | Explicit consent | Stored Data (required) |
| Authentication | Art. 6(1)(b) Contract performance | Contract performance | — |
| Billing/IAP | Art. 6(1)(b) Contract performance | Contract performance | — |
| Age confirmation (16+) | Art. 8 GDPR / KVKK Art. 6 | Legal obligation | Age Confirmation (required) |
| Crash reporting | Art. 6(1)(a) Consent | Explicit consent | Crash Reports (optional) |

### 2.2 Necessity

- Audio upload is necessary for server-side AI transcription (no on-device model available at required quality).
- Authentication is necessary for per-user billing and job isolation.
- Crash reporting is necessary for service reliability; PII is redacted before transmission.

### 2.3 Proportionality

- Audio is processed in RAM only — never written to persistent storage.
- Transcripts are deleted within seconds of client acknowledgment.
- No audio or transcript data is retained for model training or improvement.
- Users can delete all local data at any time.

### 2.4 Data Subject Rights

| Right | Implementation |
|-------|---------------|
| Access (Art. 15 / KVKK Art. 11) | In-app transcript list; server retains no personal data post-processing |
| Rectification (Art. 16) | Users edit transcripts locally; server data is ephemeral |
| Erasure (Art. 17) | In-app account deletion; server-side cascade delete |
| Restriction (Art. 18) | Cancel active transcription job |
| Portability (Art. 20) | Share/export transcript as text; data export from Privacy Settings |
| Object (Art. 21) | Sentry opt-out in privacy settings |
| Withdraw consent | Sign out + delete account at any time |

---

## 3. Risk Assessment

### 3.1 Identified Risks

| # | Risk | Likelihood | Severity | Inherent Risk |
|---|------|-----------|----------|---------------|
| R1 | Audio contains sensitive personal data (health, legal, financial) | High | High | High |
| R2 | Unauthorized access to transcripts in transit | Low | High | Medium |
| R3 | Server-side breach exposing audio/transcripts | Low | High | Medium |
| R4 | Unauthorized access to local encrypted storage | Low | Medium | Low |
| R5 | PII leakage through crash reports | Low | Medium | Low |
| R6 | Cross-border transfer to inadequate jurisdiction | Medium | Medium | Medium |
| R7 | AI producing inaccurate transcription of sensitive content | Medium | Low | Low |

### 3.2 Mitigations

| # | Mitigation | Controls | Residual Risk |
|---|-----------|----------|---------------|
| R1 | Ephemeral processing | RAM-only, no persistent storage, immediate deletion | Low |
| R2 | Transport encryption + pinning | TLS 1.2+, certificate pinning enforced in release builds | Low |
| R3 | Minimal retention + access controls | No persistent audio, authenticated API, per-user job isolation | Low |
| R4 | Platform-native encryption | AES-256 encrypted containers, key in Keychain/Keystore | Low |
| R5 | PII redaction pipeline | Pattern-based scrubbing of emails, phones, IPs, tokens before Sentry | Low |
| R6 | Consent-based transfer | KVKK explicit consent, GDPR SCCs with processors | Low |
| R7 | No automated decisions | Transcription is informational only, user reviews output | Low |

---

## 4. Consultation

- Users are presented with a **granular consent screen** before first use, consisting of 4 independent cards:
  1. **Audio Processing** (required) — explains RAM-only processing and immediate deletion
  2. **Stored Data** (required) — explains what persistent data is kept (balance, anonymous usage stats)
  3. **Age Confirmation** (required) — confirms user is 16+ years old
  4. **Crash Reports** (optional) — allows opting into anonymous crash reporting via Sentry
- Each card has an independent toggle; required cards must be accepted to proceed. The optional crash reporting card defaults to off and can be toggled at any time from Privacy Settings.
- Accept and Reject buttons have equal visual prominence (CNIL 2025 compliance).
- Users can withdraw consent and delete their account at any time from Privacy Settings.
- This DPIA is reviewed annually or upon significant processing changes.
- Published for transparency at this URL.

## 5. Decision

Based on the assessment above, the residual risks are **Low** after mitigations are applied. The processing may proceed under the identified legal bases with the documented safeguards in place.

## 6. Review Log

| Date | Version | Changes |
|------|---------|---------|
| March 2026 | 1.1 | Consent screen redesigned: 4 independent consent cards (audio processing, stored data, age confirmation, crash reports). Per-job record fields documented. Crash reporting legal basis updated from legitimate interest to explicit consent. Privacy policy updated with detailed data breakdown. |
| March 2026 | 1.0 | DPIA created covering audio transcription pipeline |

---

<div class="trust-footer">
  <div class="footer-links">
    <a href="./">How It Works</a>
    <a href="privacy">Privacy Policy</a>
    <a href="security">Security Architecture</a>
  </div>
  <p>privacy@safescribe.dev</p>
</div>

</div>
