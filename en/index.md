---
layout: default
title: SafeScribe — Privacy-First AI Transcription
description: Most transcription apps keep your recordings for days. SafeScribe doesn't: your audio is processed only in our server's memory (RAM), never written to disk, and deleted the moment your text is ready.
lang: en
---

<div class="hero">
  <div class="hero-icon">&#x1f512;</div>
  <h1>SafeScribe</h1>
  <p class="hero-tagline">Most transcription apps keep your recordings for days.<br>SafeScribe keeps none.</p>
  <p class="hero-body-text">Your audio is processed only in our server's memory (RAM), never written to disk, and deleted the moment you receive your text.</p>
  <p class="hero-footnote">Privacy isn't a policy here — it's how the system is built. Even under a court order, we'd have no audio, transcript, name, email, or IP to hand over — only a balance and usage record tied to a one-way hash, never to your identity.</p>
  <div class="cta-group">
    <a class="cta-btn cta-btn-primary" href="#pricing">&#x1f3a4; Get Started — See Pricing</a>
    <a class="cta-btn cta-btn-secondary" href="security">&#x1f6e1; How We Protect Your Data</a>
  </div>
  <p class="hero-free-tier">Start with 2 hours of free usage — no credit card required</p>
  <div class="store-badges" aria-label="App Store and Google Play — Coming Soon">
    <span class="store-badge" role="img" aria-label="App Store — Coming Soon">
      <span class="store-badge-icon">&#xf8ff;</span>
      <span class="store-badge-textcol">
        <span class="store-badge-tagline">Coming to</span>
        <span class="store-badge-name">App Store</span>
      </span>
      <span class="store-badge-status">Coming Soon</span>
    </span>
    <span class="store-badge" role="img" aria-label="Google Play — Coming Soon">
      <span class="store-badge-icon">&#x25B6;</span>
      <span class="store-badge-textcol">
        <span class="store-badge-tagline">Coming to</span>
        <span class="store-badge-name">Google Play</span>
      </span>
      <span class="store-badge-status">Coming Soon</span>
    </span>
  </div>
</div>

---

<span class="section-label">The Difference</span>
## How SafeScribe Compares

<div class="comparison-table" markdown="0">
<table>
  <thead>
    <tr>
      <th>Feature</th>
      <th>SafeScribe</th>
      <th>Otter.ai</th>
      <th>Fireflies</th>
      <th>Good Tape</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>RAM-only processing</td>
      <td class="yes">Yes</td>
      <td class="no">No</td>
      <td class="no">No</td>
      <td class="no">No</td>
    </tr>
    <tr>
      <td>Audio deleted immediately</td>
      <td class="yes">Yes</td>
      <td class="no">30 days</td>
      <td class="no">Manual</td>
      <td class="yes">Yes</td>
    </tr>
    <tr>
      <td>Transcript deleted from server</td>
      <td class="yes">Yes</td>
      <td class="no">No</td>
      <td class="no">No</td>
      <td class="no">No</td>
    </tr>
    <tr>
      <td>Email stored on server</td>
      <td class="yes">No (hash only)</td>
      <td class="no">Yes</td>
      <td class="no">Yes</td>
      <td class="no">Yes</td>
    </tr>
    <tr>
      <td>On-device audio optimization</td>
      <td class="yes">Yes</td>
      <td class="no">No</td>
      <td class="no">No</td>
      <td class="no">No</td>
    </tr>
    <tr>
      <td>On-device preprocessing</td>
      <td class="yes">Yes</td>
      <td class="no">No</td>
      <td class="no">No</td>
      <td class="no">No</td>
    </tr>
    <tr>
      <td>Data available for subpoena</td>
      <td class="yes">No</td>
      <td class="no">Yes</td>
      <td class="no">Yes</td>
      <td class="partial">Partial</td>
    </tr>
  </tbody>
</table>
</div>

---

<span class="section-label">How It Works</span>
## Three Simple Steps

<div class="steps">
  <div class="step">
    <div class="step-number">1</div>
    <div class="step-icon">&#x1f3a4;</div>
    <h3>Record or Pick a File</h3>
    <p>Record directly in the app or choose an audio/video file from your device. Supports MP3, WAV, M4A, MP4, and more.</p>
  </div>
  <div class="step">
    <div class="step-number">2</div>
    <div class="step-icon">&#x1f9e0;</div>
    <h3>AI Transcribes in Memory</h3>
    <p>Your audio is processed by a state-of-the-art speech recognition AI on our servers — entirely in RAM. Nothing is ever written to disk.</p>
  </div>
  <div class="step">
    <div class="step-number">3</div>
    <div class="step-icon">&#x1f4c4;</div>
    <h3>Get Your Text, Data Deleted</h3>
    <p>The transcript is delivered to your device with integrity verification. All server data is immediately and permanently erased.</p>
  </div>
</div>

---

<span class="section-label">Our Commitments</span>
## 14 Privacy Promises
{: #privacy-promises}

Every claim below is enforced in code — not just policy. Each links to the technical evidence.

<span class="section-label">Core Architecture</span>

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>RAM-only processing</strong><span class="item-desc">Your audio exists in volatile memory only during transcription — never written to disk. <a href="security#layer-2">learn more →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Cascade deletion + failsafe</strong><span class="item-desc">Each step deletes the previous step's data. If our code fails, data self-destructs via TTL. <a href="security#layer-6">learn more →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Self-hosted AI</strong><span class="item-desc">Your audio never reaches OpenAI, Google, or any third-party service. We run our own infrastructure. <a href="security#layer-2">learn more →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Integrity verification</strong><span class="item-desc">Every transcript carries a SHA-256 checksum so you know it arrived unaltered. <a href="security#layer-1">learn more →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>No re-download</strong><span class="item-desc">Once you receive your transcript, nothing remains on our servers. There is no "download again." <a href="security#layer-6">learn more →</a></span></span></li>
</ul>

<span class="section-label">What We Don't Collect or Do</span>

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Your email or name — never stored</strong><span class="item-desc">Only a one-way hash of your account ID is kept. It cannot be reversed to reveal who you are. <a href="privacy#sign-in">learn more →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Your IP address — never logged</strong><span class="item-desc">Used briefly for rate limiting (as a hash), then discarded. Never appears in any log. <a href="privacy#zero-disk">learn more →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Your recordings — never used for training</strong><span class="item-desc">Your audio is deleted immediately after transcription. No copy, no archive, no training dataset. <a href="privacy#zero-disk">learn more →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>No profiling or automated decisions</strong><span class="item-desc">We never score, rank, or make automated decisions about you. <a href="privacy#your-rights">learn more →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>No behaviour tracking</strong><span class="item-desc">We use zero analytics SDKs. No Mixpanel, no Firebase Analytics, no trackers of any kind. <a href="privacy#third-parties">learn more →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>No contacts, location, or biometrics</strong><span class="item-desc">We request only microphone access — nothing else from your device. <a href="privacy#no-collect">learn more →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Payment details — never seen by us</strong><span class="item-desc">Payments handled entirely by Apple or Google. We receive only a purchase receipt. <a href="privacy#billing">learn more →</a></span></span></li>
</ul>

<span class="section-label">How We Protect What Must Move</span>

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>AES-256 + hardware-backed keys</strong><span class="item-desc">Transcripts on your device are encrypted. Keys stored in iOS Keychain or Android Keystore. <a href="security#layer-4">learn more →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Crash reports: off by default</strong><span class="item-desc">Optional. If enabled, personal data is automatically stripped before anything leaves your device. <a href="security#layer-5">learn more →</a></span></span></li>
</ul>

---

<span class="section-label">Who Needs This</span>
## Built for Work Where Privacy Is Essential

<div class="segment-cards">
  <div class="segment-card">
    <div class="segment-icon">&#x1f4f0;</div>
    <h4>Journalists</h4>
    <p>Your sources stay safe — not because we promise it, but because we have no access. Since nothing is retained on the server, there's nothing to disclose even if it's demanded.</p>
  </div>
  <div class="segment-card">
    <div class="segment-icon">&#x2696;&#xfe0f;</div>
    <h4>Lawyers</h4>
    <p>Transcription suited to attorney-client confidentiality. Our servers hold no data that could be subpoenaed or breached.</p>
  </div>
  <div class="segment-card">
    <div class="segment-icon">&#x270a;</div>
    <h4>Activists</h4>
    <p>Transcription that resists surveillance. No logs, profiles, or traces are kept; your voice becomes text and the rest is deleted.</p>
  </div>
  <div class="segment-card">
    <div class="segment-icon">&#x1f4bc;</div>
    <h4>Professionals</h4>
    <p>Fast, accurate transcription for meeting notes, interviews, and dictation — with no data left on the server once it's done.</p>
  </div>
</div>

---

<span class="section-label">Accuracy You Can Trust</span>
## Accurate, Even in Noise

Every audio file passes through an optimized pipeline — on your device and on our servers — to ensure the highest possible accuracy.

<div class="pipeline-steps">
  <div class="pipeline-step">
    <div class="pipeline-icon">&#x1f4f1;</div>
    <h4>On-Device Optimization</h4>
    <p>High-pass filtering, LUFS loudness normalization (-16 LUFS, optimized for ASR), peak limiting, and 16 kHz resampling — encoded as lossless FLAC before upload.</p>
  </div>
  <div class="pipeline-step">
    <div class="pipeline-icon">&#x1f6e1;</div>
    <h4>Voice Activity Detection</h4>
    <p><a href="https://github.com/snakers4/silero-vad">Silero VAD</a> identifies speech segments and eliminates AI hallucinations in silent passages by restricting transcription to detected speech regions only.</p>
  </div>
</div>

<div class="callout callout-green">
  <strong>Built on established standards.</strong> Our pipeline relies on proven audio engineering standards and peer-reviewed research — not arbitrary defaults. The result: transcription accuracy you can rely on, even in challenging environments.
</div>

---

<span class="section-label">Pricing</span>
## Simple, Pay-As-You-Go
{: #pricing}

<div class="pricing-free-wrapper"><span class="pricing-free-badge">2 hours of free usage to start</span></div>

No subscriptions. No hidden fees. Buy credits and use them whenever you want. Unlike subscription services, you never pay for time you don't use. Every new account starts with 2 hours of free transcription — no card required.

<div class="pricing-grid">
  <div class="pricing-card" data-hours="{{ site.data.facts.packages[0].hours }}">
    <div class="pricing-amount">${{ site.data.facts.packages[0].price_usd }}</div>
    <div class="pricing-minutes">1 hour</div>
  </div>
  <div class="pricing-card recommended" data-hours="{{ site.data.facts.packages[1].hours }}">
    <div class="pricing-recommended-badge">Recommended</div>
    <div class="pricing-amount">${{ site.data.facts.packages[1].price_usd }}</div>
    <div class="pricing-minutes">8 hours</div>
  </div>
  <div class="pricing-card" data-hours="{{ site.data.facts.packages[2].hours }}">
    <div class="pricing-amount">${{ site.data.facts.packages[2].price_usd }}</div>
    <div class="pricing-minutes">32 hours</div>
  </div>
  <div class="pricing-card" data-hours="{{ site.data.facts.packages[3].hours }}">
    <div class="pricing-amount">${{ site.data.facts.packages[3].price_usd }}</div>
    <div class="pricing-minutes">128 hours</div>
  </div>
</div>


<div class="callout callout-info">
  <strong>If our server fails to complete a transcription, you are never charged.</strong> You only pay when a transcription completes successfully on our end. Payments are handled entirely by Apple App Store or Google Play — we never see your payment details.
</div>

---

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {"@type": "Question", "name": "What happens to my audio after transcription?", "acceptedAnswer": {"@type": "Answer", "text": "It's gone permanently. Your audio is processed entirely in server RAM and deleted the instant your transcript is delivered. No disk copy, no backup, no recovery."}},
    {"@type": "Question", "name": "Do you use my recordings to train AI?", "acceptedAnswer": {"@type": "Answer", "text": "No. Your audio is used only for generating your transcript. Never stored, analyzed, or used for model training. We run our own AI infrastructure."}},
    {"@type": "Question", "name": "Which languages are supported?", "acceptedAnswer": {"@type": "Answer", "text": "The open-source Whisper model supports 99 languages with automatic detection. You can also manually select the language for improved accuracy."}},
    {"@type": "Question", "name": "What file formats can I use?", "acceptedAnswer": {"@type": "Answer", "text": "40 formats — 22 audio (MP3, WAV, FLAC, M4A, OGG, Opus, AAC, AIFF, AMR and more) and 18 video (MP4, MOV, MKV, AVI, WEBM, 3GP and more) with audio extracted on-device. Files up to 96 MB and 6 hours."}},
    {"@type": "Question", "name": "How is my data encrypted?", "acceptedAnswer": {"@type": "Answer", "text": "TLS 1.3 encryption in transit. AES-256 encrypted containers on your device with keys in iOS Keychain or Android Keystore."}},
    {"@type": "Question", "name": "Do you log my IP address?", "acceptedAnswer": {"@type": "Answer", "text": "No. IP addresses are never stored. The logging system drops IPs before any output. We use a one-way SHA-256 hash for internal operations."}}
  ]
}
</script>

<span class="section-label">FAQ</span>
## Frequently Asked Questions

<details class="faq-item">
  <summary>What happens to my audio after transcription?</summary>
  <div class="faq-answer">It's gone — permanently. Your audio is processed entirely in server RAM (volatile memory) and deleted the instant your transcript is delivered. There is no disk copy, no backup, and no way to recover it. Even a physical seizure of the server would yield zero audio data.</div>
</details>

<details class="faq-item">
  <summary>Do you use my recordings to train AI?</summary>
  <div class="faq-answer">Absolutely not. Your audio is used for one purpose only: generating your transcript. It is never stored, analyzed, or used for model training or improvement. We run our own AI infrastructure — your data doesn't go to any third-party AI service.</div>
</details>

<details class="faq-item">
  <summary>Do you see my payment or card details?</summary>
  <div class="faq-answer">No. All payments are processed entirely by Apple App Store or Google Play. We receive only a purchase receipt for balance verification — we never see, receive, or store your card number or any payment details.</div>
</details>

<details class="faq-item">
  <summary>Which languages are supported?</summary>
  <div class="faq-answer">The open-source <a href="https://github.com/openai/whisper#available-models-and-languages">Whisper speech recognition model</a> supports 99 languages with automatic language detection. You can also manually select the language before transcription for improved accuracy.</div>
</details>

<details class="faq-item">
  <summary>What file formats can I use?</summary>
  <div class="faq-answer"><strong>40 formats</strong> are supported — 22 audio formats (MP3, WAV, FLAC, M4A, OGG, Opus, AAC, AIFF, AMR, and more) plus 18 video formats (MP4, MOV, MKV, AVI, WEBM, 3GP, and more — audio is extracted on your device before upload). Files up to 96 MB and up to 6 hours long.</div>
</details>

<details class="faq-item">
  <summary>How is my data encrypted?</summary>
  <div class="faq-answer">In transit: TLS 1.3 encryption ensures your data is protected between your device and SafeScribe servers. On your device: transcripts are stored in AES-256 encrypted containers with keys protected by your phone's secure hardware (iOS Keychain / Android Keystore).</div>
</details>

<details class="faq-item">
  <summary>Can I delete all my data?</summary>
  <div class="faq-answer">Yes. You can delete individual transcripts or your entire account from within the app. Account deletion permanently removes your sign-in identity, all local data, and remaining credit balance. Since the server retains no personal data after processing, there's nothing to delete server-side.</div>
</details>

<details class="faq-item">
  <summary>Do you log my IP address?</summary>
  <div class="faq-answer">No. IP addresses are never stored or logged. Our architecture enforces this at the code level — the logging system is explicitly configured to drop IPs before they reach any log output. We use a pseudonymous identifier (a one-way SHA-256 hash of your sign-in identity) for all internal operations. This hash cannot be reversed to reveal your identity.</div>
</details>

<details class="faq-item">
  <summary>How do I verify your privacy claims?</summary>
  <div class="faq-answer">We publish our full <a href="security">Security Architecture</a> and <a href="dpia">Data Protection Impact Assessment</a> for technical transparency. You can also use a network analysis tool (e.g. Wireshark) to confirm all traffic is TLS-encrypted — no email, name, or personal identifiers appear in any request.</div>
</details>

<details class="faq-item">
  <summary>How does on-device preprocessing improve accuracy?</summary>
  <div class="faq-answer">Before upload, SafeScribe applies an on-device audio filter chain: 80 Hz high-pass filtering removes rumble and background hum, LUFS loudness normalization (-16 LUFS) optimizes audio levels for Whisper, and peak limiting prevents clipping. Combined with Voice Activity Detection on the server, this ensures you get clean, accurate text even from challenging recordings.</div>
</details>

---

<div class="callout callout-info u-mt-15">
  <p class="u-m0-b05"><strong>App Store Privacy Labels</strong> — Our privacy nutrition labels on the App Store and Google Play reflect exactly what is documented here.</p>
  <p class="u-m0"><strong>Responsible Disclosure</strong> — Found a vulnerability? Contact <a href="mailto:security@safescribe.dev">security@safescribe.dev</a>.</p>
</div>

<p class="attribution-note">SafeScribe uses OpenAI's <a href="https://github.com/openai/whisper">Whisper</a> model weights via the open-source <a href="https://github.com/SYSTRAN/faster-whisper">faster-whisper</a> library (SYSTRAN, MIT license). SafeScribe is not affiliated with, endorsed by, or sponsored by OpenAI.</p>

---

