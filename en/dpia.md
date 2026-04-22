---
layout: default
title: SafeScribe — Data Protection Impact Assessment
description: Formal risk assessment for SafeScribe's audio transcription service under GDPR and KVKK.
lang: en
---

<div class="page-content" markdown="1">

# Data Protection Impact Assessment

<div class="summary-box">
  <strong>Key finding:</strong> Because audio is processed in volatile memory and deleted immediately — and no personal data remains on our servers after processing — all identified risks are reduced to <strong>Low</strong> after mitigations are applied. The processing may proceed under the documented legal bases and safeguards.
</div>

<p class="page-meta">SafeScribe AI Audio Transcription · Version 1.0 · March 2026 · Pre-launch assessment · Review due: 6 months post-launch</p>

---

<span class="section-label">Section 1</span>
## Processing Description

### What we process and why

| Purpose | Data Processed | Legal Basis (GDPR) | KVKK Basis (Turkey) |
|---------|---------------|-------------------|-----------|
| Audio transcription | Audio file (RAM only, deleted after processing) | Art. 6(1)(b) — Contract performance | Explicit consent |
| Account & billing | Pseudonymous user ID, balance, usage metadata | Art. 6(1)(b) — Contract performance | Explicit consent |
| Authentication | OIDC account ID (hashed, original discarded) | Art. 6(1)(b) — Contract performance | Contract performance |
| In-app purchase | IAP receipt from App Store / Play Store | Art. 6(1)(b) — Contract performance | Contract performance |
| Age confirmation | Self-declared age confirmation (17+) | Art. 8 GDPR / KVKK Art. 6 | Legal obligation |
| Crash reporting | Anonymised error reports (opt-in, PII-redacted) | Art. 6(1)(a) — Consent | Explicit consent |

### Data inventory

| Data | Server Retention |
|------|-----------------|
| Audio file | RAM only — deleted after transcription |
| Transcript text | Until client acknowledgment (24-hour server failsafe if no ACK received) |
| Pseudonymous user ID | Until account deletion |
| Account balance + usage metadata | Until account deletion |
| Email address | Transit only — **not stored** |
| IP addresses | Transit only — **not logged** |
| Crash reports (opt-in) | SafeScribe's crash reporting endpoint — not shared with third parties |

<p>For complete data inventory details, see <a href="privacy#data-we-collect">Privacy Policy § Data We Collect</a>.</p>

<div class="callout callout-info">
  <strong>Per-job metadata</strong> includes: audio duration (seconds), file size (bytes), word count, charge amount (USD), and processing timestamps. It contains no audio content, no transcript text, and no user-identifiable information.
</div>

<div class="callout callout-info">
  <strong>Backup retention.</strong> A single daily backup of account records is maintained for service continuity. Each backup overwrites the previous one. Data deleted via account deletion is removed from live systems immediately and from the backup within 24 hours — no copy persists beyond that window.
</div>

### Processing flow

<div class="flow-diagram">
1. User records or selects audio on device
2. Audio preprocessed on-device (80 Hz high-pass filter, leading-silence trimming, single-pass loudness normalization to -16 LUFS (speech-optimized, not broadcast-compliant) — peak limiting, 16 kHz resampling, FLAC encoding)
3. Encrypted upload to SafeScribe servers (TLS 1.2+)
4. Server processes audio in RAM — self-hosted, a powerful model from the Whisper family via <a href="https://github.com/SYSTRAN/faster-whisper">faster-whisper</a> / CTranslate2, no third-party API calls
5. Transcript returned with SHA-256 integrity checksum
6. Client verifies checksum, acknowledges receipt
7. Server deletes transcript and audio from RAM immediately
8. Transcript stored locally on device in AES-256 encrypted storage
</div>

---

<span class="section-label">Section 2</span>
## Necessity and Proportionality

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Audio upload is necessary</strong><span class="item-desc">server-side AI processing provides higher accuracy than current on-device alternatives at the quality level SafeScribe requires</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Authentication is necessary</strong><span class="item-desc">required for per-user billing and job isolation</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Crash reporting is proportionate</strong><span class="item-desc">PII is redacted before transmission; opt-in only</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Data is minimised</strong><span class="item-desc">audio processed in RAM only, never written to disk</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Retention is minimised</strong><span class="item-desc">transcripts deleted immediately on acknowledgment; 24-hour server TTL failsafe if client never acknowledges</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>No secondary use</strong><span class="item-desc">audio is never used for model training or analytics</span></span></li>
</ul>

### Data subject rights

All GDPR and KVKK data subject rights (access, rectification, erasure, restriction, portability, objection, and consent withdrawal) are exercisable in-app or by contacting privacy@safescribe.dev. Data subject rights and their implementation are detailed in our <a href="privacy#what-you-can-do">Privacy Policy § What You Can Do</a>.

---

<span class="section-label">Section 3</span>
## Risk Assessment

### Identified risks and mitigations

| Risk | Inherent | Mitigation | Residual |
|------|----------|-----------|---------|
| Audio contains sensitive personal data (health, legal, financial) | **High** | RAM-only processing; immediate deletion; no persistent storage; no third-party access | **Low** |
| Unauthorised access to transcript in transit | Medium | TLS 1.2+ enforced in production builds; SHA-256 integrity checksum | **Low** |
| Server-side breach exposing audio or transcripts | Medium | No persistent audio storage; authenticated API; per-user job isolation; TTL failsafe | **Low** |
| Unauthorised access to local encrypted storage | Low | AES-256 encrypted containers; key in iOS Keychain / Android Keystore | **Low** |
| PII leakage through crash reports | Low | Pattern-based scrubbing of emails, phones, IPs, and tokens before sending to SafeScribe's own crash reporting endpoint | **Low** |
| Cross-border data transfer | Medium | Turkey (KVKK — Turkey's Personal Data Protection Law) explicit consent at first launch; GDPR Art. 49(1)(a) explicit informed consent at first launch | **Low** |
| AI producing inaccurate transcript of sensitive content | Low | Transcription is informational only; user reviews all output; no automated decisions | **Low** |

<div class="callout callout-green">
  <strong>All residual risks are Low.</strong> The primary risk driver — sensitive audio content — is addressed at the architectural level: audio is never written to disk, never retained beyond processing, and never shared with third parties.
</div>

---

<span class="section-label">Section 4</span>
## Consent and Transparency

Users are presented with a granular consent screen before first use, consisting of four independent cards:

<div class="infra-grid">
  <div class="infra-item">
    <div class="infra-icon">&#x1f3a4;</div>
    <h4>Audio Processing <em style="font-weight:400;font-size:0.8rem;">(required)</em></h4>
    <p>Explains RAM-only processing, immediate deletion, and that audio is never written to disk or shared with third parties.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f4ca;</div>
    <h4>Stored Data <em style="font-weight:400;font-size:0.8rem;">(required)</em></h4>
    <p>Explains what persistent data is kept: pseudonymous account ID, credit balance, and anonymous usage metadata.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f9d2;</div>
    <h4>Age Confirmation <em style="font-weight:400;font-size:0.8rem;">(required)</em></h4>
    <p>Confirms the user is 17 or older. Required cards must be accepted to proceed.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f41b;</div>
    <h4>Crash Reports <em style="font-weight:400;font-size:0.8rem;">(optional)</em></h4>
    <p>Allows opting into anonymous crash reporting. Defaults to off. Can be toggled at any time from Privacy Settings.</p>
  </div>
</div>

- Accept and Reject buttons have equal visual prominence (<a href="https://www.edpb.europa.eu/our-work-tools/our-documents/guidelines/guidelines-052020-consent-under-regulation-2016679_en">EDPB consent guidelines</a> on dark patterns)
- Users can withdraw consent and delete their account at any time from Privacy Settings
- This DPIA is reviewed annually or upon significant processing changes
- Published at this URL for public transparency

---

<span class="section-label">Section 5</span>
## Decision

<div class="callout callout-green">
  Based on the assessment above, all residual risks are <strong>Low</strong>. The processing may proceed under the identified legal bases with the documented safeguards in place. No prior consultation with a supervisory authority is required.
</div>

---

<span class="section-label">Review Log</span>
## Version History

| Date | Version | Changes |
|------|---------|---------|
| March 2026 | 1.0 | Initial pre-launch DPIA covering audio transcription pipeline, consent screen design, risk assessment, and legal basis documentation |

---


</div>
