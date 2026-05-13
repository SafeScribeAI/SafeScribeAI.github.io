---
layout: default
title: Our Open Architecture — Resources
description: The open-source models and infrastructure SafeScribe runs on, and why each was chosen.
lang: en
---

<div class="hero" style="padding-bottom:1rem;">
  <h1>Our Open Architecture</h1>
  <p class="hero-tagline" style="font-size:1rem;">The open components SafeScribe runs on, and why each one was chosen.</p>
</div>

<div class="content-section" style="max-width:920px;margin:0 auto;">

<p>SafeScribe is closed-source, but the technology underneath is largely open. Where we use third-party components, we use them because they're auditable, peer-reviewed, and battle-tested — not because they were the easiest box to check. This page lists what we run and why.</p>

<span class="section-label">Speech recognition</span>
<h2>Whisper large-v3-turbo</h2>

<p><strong>What it is.</strong> An open-source speech recognition model from <a href="https://github.com/openai/whisper" rel="noopener noreferrer">OpenAI Whisper</a>, supporting 99 languages with automatic detection. We run the <code>large-v3-turbo</code> variant compiled to CTranslate2 via <a href="https://github.com/SYSTRAN/faster-whisper" rel="noopener noreferrer">faster-whisper</a> for GPU efficiency.</p>

<p><strong>Why this model.</strong> We benchmarked Whisper variants against the FLEURS evaluation set on representative languages and tracked both word error rate and per-stream throughput. The configuration we ship gave us roughly three times the throughput of plain <code>large-v3</code> at slightly lower error rates — the combination of production-grade accuracy and a reasonable per-minute cost we needed to make a privacy-first PAYG model viable. We can quote our parameters because we measured them ourselves on a modern data-center GPU, not because we copied a marketing chart.</p>

<span class="section-label" style="margin-top:2.5rem;">Voice activity detection</span>
<h2>Silero VAD</h2>

<p><strong>What it is.</strong> An open-source neural voice activity detector from the <a href="https://github.com/snakers4/silero-vad" rel="noopener noreferrer">Silero project</a>, designed to identify speech segments in audio.</p>

<p><strong>Why we use it.</strong> Whisper has a known failure mode where it hallucinates plausible-sounding text on silent or near-silent audio. Silero VAD runs first and tells the transcription stage which segments contain speech, eliminating the overwhelming majority of those hallucinations. The parameter set we ship was selected by sweeping representative languages on the FLEURS evaluation set, not by guesswork or by adopting library defaults.</p>

<span class="section-label" style="margin-top:2.5rem;">On-device audio pipeline</span>
<h2>FFmpeg via ffmpeg_kit_flutter_new_audio</h2>

<p><strong>What it does.</strong> Every audio file is preprocessed on your device before upload — high-pass filtering at 80 Hz to remove rumble, leading-silence trimming, two-pass loudness normalization to −16 LUFS (the level whisper-style models prefer), peak limiting, and resampling to 16 kHz mono FLAC. The server only ever sees an already-optimized, lossless stream.</p>

<p><strong>Why on-device.</strong> The fewer transformations we do server-side, the smaller the surface area where things can go wrong with your data. Doing the work on your device also means a 50 MB raw video can become a 2 MB FLAC before it touches the network — better for your data plan, better for our bandwidth, equivalent quality.</p>

<span class="section-label" style="margin-top:2.5rem;">Network and TLS</span>
<h2>Cloudflare Tunnel</h2>

<p><strong>What it is.</strong> A reverse-proxy connector from <a href="https://www.cloudflare.com/products/tunnel/" rel="noopener noreferrer">Cloudflare</a> that exposes our backend without opening any inbound ports on the origin server. TLS is terminated at Cloudflare's edge.</p>

<p><strong>Why this approach.</strong> No inbound port means no DDoS surface and no certificate-renewal automation on the origin. Cloudflare's CT-compliant certificate rotation happens automatically. The origin server is invisible to the public internet; it only initiates outbound connections.</p>

<span class="section-label" style="margin-top:2.5rem;">Authentication</span>
<h2>OIDC (Google Sign-In, Apple Sign-In)</h2>

<p><strong>What it is.</strong> Standard OpenID Connect via Google and Apple. We never see your email or display name — the authentication providers do.</p>

<p><strong>What we store.</strong> A SHA-256 hash of the OIDC <code>sub</code> claim, salted with a per-deployment secret. That's our entire user identifier. It's deterministic enough to recognize a returning user, and one-way enough that it can't be reversed to reveal who you are. No email, no name, no phone number, no IP address ever lands in storage or logs.</p>

<span class="section-label" style="margin-top:2.5rem;">Storage</span>
<h2>Redis (RAM-only) and SQLite</h2>

<p><strong>Redis.</strong> Configured with no snapshotting and no append-only log — there is no persistence to disk. Audio blobs and transcripts live here only as long as the request needs them, and are deleted immediately when the user acknowledges the transcript. A power loss takes everything in flight with it.</p>

<p><strong>SQLite (ledger).</strong> Used only for financial bookkeeping — credit balances, IAP receipts, refund records. No audio, no transcripts, no PII. Backed up to Cloudflare R2 daily and verifiable via WAL checkpoint.</p>

<span class="section-label" style="margin-top:2.5rem;">Mobile platform</span>
<h2>Flutter, Riverpod, Hive</h2>

<p><strong>Why Flutter.</strong> One codebase, two stores. Same security posture on iOS and Android — no platform-specific compromises in the privacy story.</p>

<p><strong>Local storage.</strong> Hive boxes encrypted with AES-256, with the encryption key stored in iOS Keychain or Android Keystore — both backed by the device's secure hardware. Transcripts on your device stay yours.</p>

<span class="section-label" style="margin-top:2.5rem;">Container runtime</span>
<h2>Non-root containers</h2>

<p>All backend services (API, worker, ledger) run as a dedicated non-root user inside their containers — never as root. Defense in depth: even if a service is compromised, the attacker is confined to a low-privilege account that cannot touch the host or other services.</p>

<div class="callout callout-green" style="margin-top:2rem;">
  <strong>If you're a security researcher:</strong> we welcome responsible-disclosure reports at <a href="mailto:security@safescribe.dev">security@safescribe.dev</a>. Our published <a href="../security">Security Architecture</a> and <a href="../dpia">DPIA</a> spell out the threat model in more detail.
</div>

<p style="margin-top:2rem;"><a href="../resources">&larr; Back to Resources</a></p>

</div>
