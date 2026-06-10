---
layout: default
title: Security Decisions, Explained — Resources
description: The security controls SafeScribe kept, the ones we evaluated and skipped, and why.
lang: en
---

<div class="hero hero-compact">
  <h1>Security Decisions, Explained</h1>
  <p class="hero-tagline hero-tagline-sm">What we kept, what we skipped, and why.</p>
</div>

<div class="content-section content-narrow-920">

<p>Mature security work isn't about adding every control you can think of. It's about understanding which controls actually defend against your real threat model — and being honest about the ones that look impressive on a checklist but don't move the needle. This page documents both sides of that ledger.</p>

<span class="section-label">Threat Model</span>
<h2>Who We Defend Against</h2>

<div class="do-list-wrapper">
<ul class="do-list">
  <li>
    <span class="check-mark">&#x2713;</span>
    <span class="item-body">
      <strong>Passive network observers</strong>
      <span class="item-desc">ISPs, public Wi-Fi, corporate proxies. Mitigated by TLS 1.3, App Transport Security on iOS, and Android's <code>network_security_config</code>.</span>
    </span>
  </li>
  <li>
    <span class="check-mark">&#x2713;</span>
    <span class="item-body">
      <strong>Malicious or compromised certificate authorities</strong>
      <span class="item-desc">A rogue or mis-issued public-CA certificate. Mitigated by Certificate Transparency enforcement at the OS level — Apple since iOS 12.1.1, Chrome and Android in parallel. Mis-issued certs land in public CT logs and are rejected by the platform without app involvement.</span>
    </span>
  </li>
  <li>
    <span class="check-mark">&#x2713;</span>
    <span class="item-body">
      <strong>Server-side compromise</strong>
      <span class="item-desc">An attacker who gains backend access. Mitigated <em>architecturally</em>: RAM-only data layer with no disk persistence, immediate post-ACK purge, OIDC pseudonymization (your sign-in identity is SHA-256-hashed before storage), and Cloudflare Tunnel for origin isolation. Even a full compromise would expose only in-flight data — there is nothing at rest to exfiltrate.</span>
    </span>
  </li>
  <li>
    <span class="check-mark">&#x2713;</span>
    <span class="item-body">
      <strong>Local device compromise</strong>
      <span class="item-desc">Physical access to an unlocked device. Mitigated by AES-256 encrypted local storage (Hive) with keys stored in iOS Keychain or Android Keystore, plus app-switcher screen blur for over-the-shoulder protection.</span>
    </span>
  </li>
</ul>
</div>

<span class="section-label u-mt-25">Considered, kept</span>
<h2>Controls That Earn Their Complexity</h2>

<p>The short list — TLS 1.3 with system trust anchors, OIDC bearer authentication, Cloudflare Tunnel for origin isolation, Silero VAD to filter silence before transcription, RAM-only Redis with no persistence, and SHA-256 user-hash pseudonymization. Each one ties to a specific threat in the model above. The longer engineering rationale lives in our DPIA — see the <a href="../dpia">DPIA page</a> for the risk register.</p>

<span class="section-label u-mt-25">Considered, not adopted</span>
<h2>Controls We Evaluated and Skipped — And Why</h2>

<h3 class="u-mt-15">1. Application-layer Certificate Pinning</h3>
<p><strong>What it is:</strong> Hard-coding the server's certificate fingerprint into the app, so the client refuses to talk to anything else.</p>
<p><strong>Why we don't do it:</strong></p>
<ul>
  <li>TLS terminates at Cloudflare's edge, and Cloudflare rotates certificates autonomously. A pinned binary would either need every user to update before each rotation, or it would silently break their app — both are hard failure modes.</li>
  <li>Certificate Transparency at the OS level already defends against the primary pinning threat (rogue or mis-issued certs). Apple and Google enforce CT for public CAs without any app involvement.</li>
  <li>The user-visible trust signal we want isn't "this app pinned a cert" — it's "the server can't keep your data" (RAM-only architecture + ACK-then-404 deletion proof). That's the work that earns trust.</li>
</ul>
<p><strong>If we change our mind:</strong> The decision is reversible. If we later take on an enterprise customer that requires MASVS L2, we add pinning with a runtime kill-switch and a documented rotation runbook.</p>

<h3 class="u-mt-15">2. Memory locking to prevent swap-to-disk</h3>
<p><strong>What it is:</strong> Lock the worker process's memory pages into RAM so the kernel can't swap sensitive data to disk.</p>
<p><strong>Why we don't do it:</strong> It requires elevated container privileges that complicate a rootless deployment. The marginal benefit is small: between the RAM-only data layer and explicit zeroization of sensitive buffers after use, sensitive data lives for microseconds. The window where the kernel could swap it is vanishingly thin.</p>

<h3 class="u-mt-15">3. Redis TLS and password authentication</h3>
<p><strong>What it is:</strong> Encrypted and authenticated connections to the in-memory data layer from internal services.</p>
<p><strong>Why we don't do it:</strong> The data layer runs only on a private internal network that is not exposed to the public. Anyone with access to that network already has container-level access — TLS inside a single-node private bridge is pure overhead, and a password adds a rotation burden without raising the security floor.</p>

<h3 class="u-mt-15">4. Circuit breakers between services</h3>
<p><strong>What it is:</strong> Hystrix-style fail-fast breakers on Redis client calls.</p>
<p><strong>Why we don't do it:</strong> YAGNI for a single-node deployment. If Redis goes down, the whole host is down — failing fast on one call doesn't help anything. We'll revisit this if we ever scale to a multi-node deployment.</p>

<h3 class="u-mt-15">5. Third-party crash and analytics SDKs</h3>
<p><strong>What it is:</strong> Mixpanel, Amplitude, Sentry, Firebase Analytics, advertising IDs.</p>
<p><strong>Why we don't do it:</strong> The privacy claim falls apart the moment a behavioral SDK ships in the bundle. Crash reports go to our own backend, scrubbed of PII before transmission, and the user can disable them entirely. There are no analytics SDKs to disable, because there are none in the bundle.</p>

<div class="callout callout-info u-mt-2">
  <strong>What this list is and isn't.</strong> It's a snapshot of evaluated decisions at a point in time, not a permanent commitment. If the threat model changes — new regulations, new customer segments, new published attacks — we'll re-evaluate and update this page. What it's <em>not</em> is a security audit; for that, see our <a href="../security">Security Architecture</a> and <a href="../dpia">DPIA</a>.
</div>

<p class="u-mt-2"><a href="../resources">&larr; Back to Resources</a></p>

</div>
