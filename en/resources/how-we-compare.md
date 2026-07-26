---
layout: default
title: How SafeScribe Compares — Resources
description: Side-by-side analysis of SafeScribe against Otter, Rev, Descript, Fireflies, and other transcription services.
lang: en
---

<div class="hero hero-compact">
  <h1>How SafeScribe Compares</h1>
  <p class="hero-tagline hero-tagline-sm">A side-by-side look at the privacy posture, pricing, and architecture of mainstream transcription tools.</p>
</div>

<div class="content-narrow-920">

<p>Every competitor in this market makes some version of the same promise: <em>"we respect your privacy."</em> The differences live in the architecture. The table below is the version we use internally — not curated marketing claims, but what each provider actually does with your audio.</p>

<span class="section-label">The Matrix</span>

<div class="comparison-table" markdown="0">
<table>
  <thead>
    <tr>
      <th>Provider</th>
      <th>Category</th>
      <th>Floor price ($/min)</th>
      <th>Privacy posture</th>
      <th>On-device?</th>
      <th>Model</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>SafeScribe</strong></td>
      <td>Consumer mobile, privacy-first</td>
      <td>$0.0104 – $0.0165</td>
      <td>RAM-only, no content retained after delivery, no training, OIDC-pseudonymous</td>
      <td>Hybrid (device preprocess + RAM-only cloud inference)</td>
      <td>PAYG (no subscription)</td>
    </tr>
    <tr>
      <td>Otter.ai</td>
      <td>Meeting-bot SaaS</td>
      <td>$16.99/mo tier (free 300 min/mo)</td>
      <td>"De-identified" training — opt-out is opt-out, not absent</td>
      <td class="no">No (cloud)</td>
      <td>Subscription</td>
    </tr>
    <tr>
      <td>Rev</td>
      <td>Marketplace + ASR</td>
      <td>$0.02 (AI) / $0.25 (human)</td>
      <td>Standard SaaS, SOC 2</td>
      <td class="no">No</td>
      <td>PAYG + sub</td>
    </tr>
    <tr>
      <td>Descript</td>
      <td>Audio/video editing</td>
      <td>$12 – $24/mo tier</td>
      <td>Training opt-in, default-off (after Reddit backlash)</td>
      <td>Partial (Overdub)</td>
      <td>Subscription</td>
    </tr>
    <tr>
      <td>Sonix</td>
      <td>Enterprise ASR</td>
      <td>$0.166</td>
      <td>Standard SaaS, enterprise DPA</td>
      <td class="no">No</td>
      <td>Sub + PAYG</td>
    </tr>
    <tr>
      <td>Fireflies.ai</td>
      <td>Meeting-bot SaaS</td>
      <td>$10 – $19/user/mo</td>
      <td>Server-stored speaker embeddings — biometric-privacy concerns</td>
      <td class="no">No</td>
      <td>Subscription</td>
    </tr>
    <tr>
      <td>Good Tape</td>
      <td>Journalism-focused</td>
      <td>$12/mo tier</td>
      <td>EU servers, GDPR-aligned, audio retained per policy</td>
      <td class="no">No</td>
      <td>Subscription</td>
    </tr>
    <tr>
      <td>Deepgram</td>
      <td>Developer API</td>
      <td>$0.0043 (Nova-3)</td>
      <td>Standard SaaS, BAA available</td>
      <td class="no">No</td>
      <td>PAYG</td>
    </tr>
    <tr>
      <td>MacWhisper / Aiko</td>
      <td>Desktop native</td>
      <td>$0 – $59 one-time</td>
      <td>Fully on-device</td>
      <td class="yes">Yes</td>
      <td>One-time / free</td>
    </tr>
    <tr>
      <td>Voice Memos / Recorder</td>
      <td>OS-bundled</td>
      <td>Free</td>
      <td>Fully on-device (iOS 18+ / Pixel)</td>
      <td class="yes">Yes</td>
      <td>Free, OS-locked</td>
    </tr>
  </tbody>
</table>
</div>

<p class="hero-lang-note">Pricing reflects publicly listed floors at the time of writing. The competitive landscape moves quickly — this is a snapshot, not a contract.</p>

<span class="section-label u-mt-25">What stands out</span>
<h2>Five Things The Table Doesn't Tell You</h2>

<ul class="do-list">
  <li>
    <span class="check-mark">&#x2713;</span>
    <span class="item-body">
      <strong>"De-identified" is a marketing word, not an architecture.</strong>
      <span class="item-desc">The industry has been repeatedly tested on whether "de-identified" audio still ends up in training datasets. Our position: don't say "de-identified" — state exactly what survives delivery, and let users verify it (ACK the transcript, then query the work ID — the server returns 404). What survives is the billing row: duration, cost, a one-way user hash. No audio, no text.</span>
    </span>
  </li>
  <li>
    <span class="check-mark">&#x2713;</span>
    <span class="item-body">
      <strong>Voiceprints are a privacy minefield.</strong>
      <span class="item-desc">Server-stored speaker embeddings have repeatedly attracted biometric-privacy challenges across the industry. Any future diarization feature in SafeScribe will be client-side or fully ephemeral — we will never persist a voiceprint server-side.</span>
    </span>
  </li>
  <li>
    <span class="check-mark">&#x2713;</span>
    <span class="item-body">
      <strong>Default-off training isn't enough — we don't offer training at all.</strong>
      <span class="item-desc">Several competitors have walked back default-on training toggles after public backlash. We removed the option entirely: there's no toggle to flip, no setting to forget, no "help improve the model" upsell. The system has no path for your audio to become training data.</span>
    </span>
  </li>
  <li>
    <span class="check-mark">&#x2713;</span>
    <span class="item-body">
      <strong>On-device preprocessing is a real differentiator.</strong>
      <span class="item-desc">Roughly all cloud competitors upload your raw audio. We optimize on your device first (loudness normalization, high-pass filtering, 16 kHz FLAC) so the server only ever sees an already-processed stream — and then forgets it.</span>
    </span>
  </li>
  <li>
    <span class="check-mark">&#x2713;</span>
    <span class="item-body">
      <strong>No third-party analytics SDKs.</strong>
      <span class="item-desc">No Mixpanel, no Amplitude, no Firebase Analytics, no advertising IDs. The privacy claim falls apart the moment a behavioral SDK ships in the bundle, so we ship none. The only telemetry is a backend-side, PII-scrubbed crash report you can disable.</span>
    </span>
  </li>
</ul>

<div class="callout callout-green u-mt-2">
  <strong>Verify it yourself.</strong> After receiving a transcript, query <code>GET /v1/status/{work_id}</code> — the server returns <code>404 Not Found</code>. That's the receipt. There is no other copy.
</div>

<p class="u-mt-2"><a href="../resources">&larr; Back to Resources</a></p>

</div>
