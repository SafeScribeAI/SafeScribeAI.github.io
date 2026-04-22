---
layout: default
title: SafeScribe — Security Architecture
description: How SafeScribe protects your data — a technical overview of our privacy-by-design approach.
lang: en
---

<div class="page-content" markdown="1">

# Security Architecture

<div class="summary-box">
  <strong>In short:</strong> SafeScribe processes your audio exclusively in volatile server memory (RAM). The moment your transcript is delivered, all data is permanently erased. No disk writes, no backups, no copies — ever. This page explains how each layer of protection works.
</div>

<p class="page-meta">Last updated: March 2026</p>

---

<span class="section-label">Overview</span>
## Six Layers of Protection

<div class="infra-grid">
  <div class="infra-item">
    <div class="infra-icon">&#x1f510;</div>
    <h4>Layer 1 — Transport</h4>
    <p>TLS 1.2+ encryption on every connection. Traffic is end-to-end encrypted with no exceptions.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f9e0;</div>
    <h4>Layer 2 — RAM-Only</h4>
    <p>Audio never touches disk. Processed in volatile memory and deleted immediately after transcription.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f464;</div>
    <h4>Layer 3 — Pseudonymous Identity</h4>
    <p>Your email and name are never stored. Only a one-way hash of your account ID is kept.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f512;</div>
    <h4>Layer 4 — Local Encryption</h4>
    <p>AES-256 encrypted storage on device. Keys in hardware-backed secure storage only.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f41b;</div>
    <h4>Layer 5 — PII Redaction</h4>
    <p>All crash reports are scrubbed of personal data before leaving your device.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f5d1;</div>
    <h4>Layer 6 — Cascade Deletion</h4>
    <p>Each processing step immediately deletes the previous step's data. TTL failsafe as backup.</p>
  </div>
</div>

---

<span class="section-label">Design Principle</span>
## Process, Deliver, Delete

Traditional transcription services write your audio to disk, queue it for processing, and may store it indefinitely. SafeScribe takes the opposite approach:

Traditional services write audio to disk and may retain it indefinitely. SafeScribe receives audio into RAM, processes it, and deletes it the moment you receive your transcript. See the <a href="#your-datas-journey">full data journey diagram</a> below.

The difference: even if a server were physically seized, there would be no audio or transcript data to recover — it only ever existed in volatile memory.

---

<span class="section-label">Layer 1</span>
## Transport Security

| Protection | What It Prevents |
|------------|-----------------|
| TLS 1.2+ encryption | Eavesdropping on network traffic |
| Integrity checksums | Transcript corruption or tampering |

<div class="callout callout-green">
  <strong>You can verify:</strong> Use any network inspection tool (e.g., Wireshark) to confirm all SafeScribe traffic is TLS-encrypted.
</div>

---

<span class="section-label">Layer 2</span>
## RAM-Only Server Processing

This is the core of SafeScribe's privacy design. The server runs OpenAI's Whisper model weights via the self-hosted <a href="https://github.com/SYSTRAN/faster-whisper">faster-whisper</a> inference engine — no third-party API calls. The data store is configured for memory-only operation with no disk persistence whatsoever. Every piece of data has an automatic expiry as a failsafe.

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span> If the server restarts, all in-memory data is permanently lost — by design</li>
  <li><span class="check-mark">&#x2713;</span> No disk file, backup, or log contains your audio</li>
  <li><span class="check-mark">&#x2713;</span> Forensic disk analysis of the server would find zero audio content</li>
</ul>

**What the server holds temporarily (in RAM):**

| Data | Deleted When |
|------|-------------|
| Audio bytes | Transcription completes |
| Transcript text | You acknowledge receipt |
| Job metadata | You acknowledge receipt |

**What the server stores permanently (on disk):**

| Data | Purpose | Contains PII? |
|------|---------|--------------|
| Pseudonymous user identifier | Billing record | No — one-way hash, cannot be reversed |
| Duration and cost | Financial record | No |
| File size (bytes) | Service analytics | No |
| Word count | Service analytics | No |
| Timestamps | Audit trail | No |

<div class="callout callout-green">
  <strong>By design:</strong> There is no "download again" option. Once you acknowledge receipt, the data is gone — there is nothing left to retrieve.
</div>

---

<span class="section-label">Layer 3</span>
## Pseudonymous Identity

SafeScribe uses Google Sign-In and Apple Sign-In for authentication. Your personal details are never stored:

| What the auth provider gives us | What we store |
|---------------------------------|--------------|
| Email address | **Not stored** |
| Display name | **Not stored** |
| Account ID | One-way cryptographic hash only |

The one-way hash of your account identifier:

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span> Cannot be reversed to reveal your identity</li>
  <li><span class="check-mark">&#x2713;</span> Is unique to you — for billing only</li>
  <li><span class="check-mark">&#x2713;</span> Contains zero personally identifiable information</li>
</ul>

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

When the app encounters an error, an optional crash report can be sent. Before any report leaves your device, the following are automatically removed:

<div class="callout callout-info">
  <strong>Redacted before sending:</strong> Email addresses · Phone numbers · IP addresses · File paths · Authentication tokens
</div>

<div class="callout callout-green">
  <strong>What's included:</strong> Error type and stack trace (technical only) · Device model · OS version · App version
</div>

You can opt out of crash reporting entirely in the app's Privacy Settings.

---

<span class="section-label">Layer 6</span>
## Cascade Deletion

SafeScribe implements immediate cascade deletion — each processing step triggers deletion of the previous step's data:

Each processing step immediately deletes the previous step's data: audio is deleted after transcription, transcript is deleted after acknowledgment. The <a href="#your-datas-journey">full data journey diagram</a> shows the complete flow with all deletion points.

This is not a background cleanup job. Deletion happens immediately as part of the processing pipeline — there is no window where data accumulates.

<div class="callout callout-info">
  <strong>Failsafe:</strong> Even if the normal deletion process fails (network error, app crash), every piece of data in server memory has an automatic expiry. Data self-destructs regardless.
</div>

---

<span class="section-label">Full Journey</span>
## Your Data's Journey
{: #your-datas-journey}

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

<span class="section-label">Transparency</span>
## Independent Verification

We encourage security researchers and privacy advocates to verify our claims:

<ul class="verify-steps">
  <li><span><strong>Network analysis</strong> Use Wireshark or Charles Proxy to inspect traffic. All SafeScribe connections are TLS-encrypted.</span></li>
  <li><span><strong>Published assessments</strong> Read our <a href="dpia">Data Protection Impact Assessment</a> for the full risk analysis and decision record.</span></li>
  <li><span><strong>Responsible disclosure</strong> Found a vulnerability? Contact <a href="mailto:security@safescribe.dev">security@safescribe.dev</a>.</span></li>
</ul>

</div>
