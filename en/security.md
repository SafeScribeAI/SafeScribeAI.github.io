---
layout: default
title: SafeScribe — Security Architecture
description: How SafeScribe protects your data — a technical overview of our privacy-by-design approach.
lang: en
---

<div class="lang-bar">
  <strong>English</strong> · <a href="../tr/security">Turkce</a>
</div>

<div class="page-content">

# Security Architecture

<div class="summary-box">
  <strong>In short:</strong> SafeScribe processes your audio exclusively in volatile server memory (RAM). The moment your transcript is delivered, all data is permanently erased. No disk writes, no backups, no copies — ever. This page explains how each layer of protection works.
</div>

<p class="page-meta">Last updated: March 2026</p>

---

## Design Principle: Process, Deliver, Delete

Traditional transcription services write your audio to disk, queue it for processing, and may store it indefinitely. SafeScribe takes the opposite approach:

<div class="flow-diagram">
Traditional:  Audio --> Disk --> Queue --> Process --> Disk --> Store --> Maybe delete

SafeScribe:   Audio --> RAM --> Process --> Deliver --> DELETE (immediately)
</div>

The difference: even if a server were physically seized, there would be no audio or transcript data to recover — it only ever existed in volatile memory.

---

<span class="section-label">Layer 1</span>
## Transport Security

| Protection | What It Prevents |
|------------|-----------------|
| TLS 1.2+ encryption | Eavesdropping on network traffic |
| Certificate pinning | Man-in-the-middle attacks, rogue servers |
| Integrity checksums | Transcript corruption or tampering |

The app contains a cryptographic fingerprint of SafeScribe's server certificate. Even if a certificate authority were compromised, the app refuses to connect to anything other than the genuine SafeScribe server.

<div class="callout callout-green">
  <strong>You can verify:</strong> Use any network inspection tool (e.g., Wireshark) to confirm all SafeScribe traffic is TLS-encrypted. Attempting to intercept with a proxy will fail — certificate pinning rejects the proxy's certificate.
</div>

---

<span class="section-label">Layer 2</span>
## RAM-Only Server Processing

This is the core of SafeScribe's privacy design.

**How it works:** The server's data store is configured for memory-only operation with no disk persistence whatsoever. Every piece of data has an automatic expiry as a failsafe. This means:

- If the server restarts, all in-memory data is permanently lost (by design)
- No disk file, backup, or log contains your audio
- Forensic disk analysis of the server would find zero audio content

### What the server holds temporarily (in RAM)

| Data | Deleted When |
|------|-------------|
| Audio bytes | Transcription completes |
| Transcript text | You acknowledge receipt |
| Job metadata | You acknowledge receipt |

### What the server stores permanently (on disk)

| Data | Purpose | Contains PII? |
|------|---------|--------------|
| Pseudonymous user identifier | Billing record | No — one-way hash of your account ID, cannot be reversed |
| Duration and cost | Financial record | No |
| Timestamps | Audit trail | No |

**No email, name, phone number, or IP address is ever written to disk.**

<div class="callout callout-green">
  <strong>You can verify:</strong> After completing a transcription and receiving the result, query the status endpoint — it returns 404 (not found). The data no longer exists. There is no "download again" option.
</div>

---

<span class="section-label">Layer 3</span>
## Pseudonymous Identity

SafeScribe uses Google Sign-In and Apple Sign-In for authentication. However, your personal details are never stored:

| What the auth provider gives us | What we store |
|-------------------------------|--------------|
| Email address | **Not stored** |
| Display name | **Not stored** |
| Account ID | One-way cryptographic hash only |

The server never sees or stores your email or name. It computes a one-way hash of your account identifier that:
- Cannot be reversed to reveal your identity
- Is unique to you (for billing)
- Contains zero personally identifiable information

<div class="callout callout-green">
  <strong>You can verify:</strong> Inspect API traffic from the app. After authentication, no request contains your email or name — only a Bearer token that the server validates internally.
</div>

---

<span class="section-label">Layer 4</span>
## Local Encryption

Transcripts stored on your device are protected by:

| Protection | Technology |
|------------|-----------|
| Encryption | AES-256 |
| Key storage | Platform secure hardware (iOS Keychain / Android Keystore) |
| Database | Encrypted containers |

Even if someone accesses your device's file system, transcript data appears as encrypted binary — unreadable without the key. The encryption key is stored in hardware-backed secure storage, not in the app's files. Deleting the app permanently destroys the key.

---

<span class="section-label">Layer 5</span>
## PII Redaction in Diagnostics

When the app encounters an error, an optional crash report can be sent. Before any report leaves your device:

**Redacted:** Email addresses, phone numbers, IP addresses, file paths, authentication tokens, work identifiers

**Included:** Error type and stack trace (technical only), device model, OS version, app version

You can opt out of crash reporting entirely in the app's privacy settings.

---

<span class="section-label">Layer 6</span>
## Cascade Deletion

SafeScribe implements immediate cascade deletion — each processing step triggers deletion of the previous step's data:

<div class="flow-diagram">
Upload        Audio received into RAM
                |
Transcribe    AI processes audio
              Audio DELETED from RAM
                |
Deliver       Transcript sent to your device
              You confirm receipt
              Transcript DELETED from RAM
              Job metadata DELETED
                |
Result        ZERO personal data on server
</div>

This is not a background cleanup job. Deletion happens immediately as part of the processing pipeline — there is no window where data accumulates.

**Failsafe:** Even if the normal deletion process fails (network error, app crash), every piece of data in server memory has an automatic expiry. Data self-destructs regardless.

---

## Your Data's Journey

<div class="flow-diagram">
Your Device                  SafeScribe Server             Your Device
-----------                  -----------------             -----------

Record/select audio
    |
Preprocess locally
    |
Encrypt + upload ---TLS---->  Receive in RAM
                                   |
                               AI transcription
                               (RAM only)
                                   |
                               Audio DELETED
                                   |
Receive transcript  <--TLS----  Send transcript
    |                              |
Verify integrity               Wait for ACK
    |                              |
Store encrypted    Send ACK --->  Transcript DELETED
locally (AES-256)              Job metadata DELETED
    |                              |
Done                           ZERO data remains
</div>

---

## Independent Verification

We encourage security researchers and privacy advocates to verify our claims:

- **Network analysis:** All traffic is TLS-encrypted with certificate pinning
- **Post-delivery queries:** Status/transcript endpoints return 404 after acknowledgment
- **Published assessments:** [Data Protection Impact Assessment](dpia)
- **Responsible disclosure:** security@safescribe.dev

---

<div class="trust-footer">
  <div class="footer-links">
    <a href="./">How It Works</a>
    <a href="privacy">Privacy Policy</a>
    <a href="dpia">DPIA</a>
  </div>
  <p>privacy@safescribe.dev &middot; security@safescribe.dev &middot; support@safescribe.dev</p>
</div>

</div>
