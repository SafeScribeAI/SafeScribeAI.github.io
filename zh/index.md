---
layout: default
title: SafeScribe — 隐私优先的AI语音转录
description: 大多数转录应用会把您的录音保留好几天。SafeScribe 不会：您的录音只在我们服务器的内存（RAM）里处理,不会写入磁盘,文本一生成就立即删除。
lang: zh
---

<div class="hero">
  <div class="hero-icon">&#x1f512;</div>
  <h1>SafeScribe</h1>
  <p class="hero-tagline">大多数转录应用会把您的录音保留好几天。<br>SafeScribe 一概不保留。</p>
  <p style="font-size:0.95rem;color:var(--color-text-secondary);margin:0 auto 1.5rem;max-width:520px;">您的录音只在我们服务器的内存（RAM）里处理,不会写入磁盘,您一收到文本就立即删除。</p>
  <p style="font-size:0.85rem;color:var(--color-text-secondary);margin:0 auto 0;max-width:600px;font-style:italic;">在 SafeScribe,隐私不是一项政策,而是系统本身的设计方式。即便面对法院调取,我们能交出的也只有与单向哈希关联的余额和使用记录——录音、转录文本、姓名、电子邮件、IP 从未保存过,因此无可交出,也绝不与您的身份相关联。</p>
  <div class="cta-group">
    <a class="cta-btn cta-btn-primary" href="#pricing">&#x1f3a4; 查看价格</a>
    <a class="cta-btn cta-btn-secondary" href="security">&#x1f6e1; 我们如何保护您的数据</a>
  </div>
  <p class="hero-free-tier">先免费用 2 小时即可开始 — 无需信用卡</p>
  <div class="store-badges" aria-label="App Store 和 Google Play — 即将推出">
    <span class="store-badge" role="img" aria-label="App Store — 即将推出">
      <span class="store-badge-icon">&#xf8ff;</span>
      <span class="store-badge-textcol">
        <span class="store-badge-tagline">即将上架</span>
        <span class="store-badge-name">App Store</span>
      </span>
      <span class="store-badge-status">即将推出</span>
    </span>
    <span class="store-badge" role="img" aria-label="Google Play — 即将推出">
      <span class="store-badge-icon">&#x25B6;</span>
      <span class="store-badge-textcol">
        <span class="store-badge-tagline">即将上架</span>
        <span class="store-badge-name">Google Play</span>
      </span>
      <span class="store-badge-status">即将推出</span>
    </span>
  </div>
</div>

---

<span class="section-label">核心差异</span>
## SafeScribe对比其他服务

<div class="comparison-table" markdown="0">
<table>
  <thead>
    <tr>
      <th>功能</th>
      <th>SafeScribe</th>
      <th>Otter.ai</th>
      <th>Fireflies</th>
      <th>Good Tape</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>纯内存处理</td>
      <td class="yes">是</td>
      <td class="no">否</td>
      <td class="no">否</td>
      <td class="no">否</td>
    </tr>
    <tr>
      <td>音频立即删除</td>
      <td class="yes">是</td>
      <td class="no">30天</td>
      <td class="no">手动</td>
      <td class="yes">是</td>
    </tr>
    <tr>
      <td>从服务器删除转录文本</td>
      <td class="yes">是</td>
      <td class="no">否</td>
      <td class="no">否</td>
      <td class="no">否</td>
    </tr>
    <tr>
      <td>邮箱存储在服务器上</td>
      <td class="yes">否（仅哈希值）</td>
      <td class="no">是</td>
      <td class="no">是</td>
      <td class="no">是</td>
    </tr>
    <tr>
      <td>设备端音频优化</td>
      <td class="yes">是</td>
      <td class="no">否</td>
      <td class="no">否</td>
      <td class="no">否</td>
    </tr>
    <tr>
      <td>设备端预处理</td>
      <td class="yes">是</td>
      <td class="no">否</td>
      <td class="no">否</td>
      <td class="no">否</td>
    </tr>
    <tr>
      <td>数据可被司法传唤</td>
      <td class="yes">否</td>
      <td class="no">是</td>
      <td class="no">是</td>
      <td class="partial">部分</td>
    </tr>
  </tbody>
</table>
</div>

---

<span class="section-label">工作原理</span>
## 简单三步

<div class="steps">
  <div class="step">
    <div class="step-number">1</div>
    <div class="step-icon">&#x1f3a4;</div>
    <h3>录音或选择文件</h3>
    <p>直接在应用内录音，或从设备中选择音频/视频文件。支持MP3、WAV、M4A、MP4等格式。</p>
  </div>
  <div class="step">
    <div class="step-number">2</div>
    <div class="step-icon">&#x1f9e0;</div>
    <h3>AI 在内存中完成转录</h3>
    <p>您的音频由我们服务器上最先进的语音识别AI处理——完全在RAM中进行。任何内容都不会写入磁盘。</p>
  </div>
  <div class="step">
    <div class="step-number">3</div>
    <div class="step-icon">&#x1f4c4;</div>
    <h3>获取文本，数据立即删除</h3>
    <p>转录文本经完整性验证后交付至您的设备。所有服务器数据立即永久清除。</p>
  </div>
</div>

---

<span class="section-label">我们的承诺</span>
## 14条隐私承诺
{: #privacy-promises}

以下每条承诺均由代码强制执行——而非仅靠政策。每条均附有技术证据链接。

<span class="section-label">核心架构</span>

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>纯内存处理</strong><span class="item-desc">您的音频仅在转录期间存在于易失性内存中——从不写入磁盘。 <a href="security#layer-2">了解更多 →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>级联删除 + 故障保护</strong><span class="item-desc">每个步骤都删除上一步的数据。若代码出错，数据通过TTL自动销毁。 <a href="security#layer-6">了解更多 →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>自托管AI</strong><span class="item-desc">您的音频永远不会到达OpenAI、Google或任何第三方服务。我们自己运营基础设施。 <a href="security#layer-2">了解更多 →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>完整性验证</strong><span class="item-desc">每份转录文本携带SHA-256校验和，确认其原封不动地送达。 <a href="security#layer-1">了解更多 →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>不支持重新下载</strong><span class="item-desc">您收到转录文本后，服务器上什么都不剩。没有"再次下载"这个选项。 <a href="security#layer-6">了解更多 →</a></span></span></li>
</ul>

<span class="section-label">我们不收集也不做的事</span>

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>您的邮箱或姓名——从不存储</strong><span class="item-desc">我们只保存账户ID的单向哈希值。无法被逆向还原以揭露您的身份。 <a href="privacy#sign-in">了解更多 →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>您的IP地址——从不记录</strong><span class="item-desc">仅短暂用于速率限制（以哈希形式），随后丢弃。从不出现在任何日志中。 <a href="privacy#zero-disk">了解更多 →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>您的录音——从不用于训练</strong><span class="item-desc">转录完成后音频立即删除。无副本、无存档、无训练数据集。 <a href="privacy#zero-disk">了解更多 →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>不做画像或自动化决策</strong><span class="item-desc">我们从不对您评分、排名或作出任何自动化决定。 <a href="privacy#your-rights">了解更多 →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>不追踪行为</strong><span class="item-desc">我们不使用任何分析SDK。没有Mixpanel，没有Firebase Analytics，没有任何追踪器。 <a href="privacy#third-parties">了解更多 →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>不收集通讯录、位置或生物特征</strong><span class="item-desc">我们只申请麦克风权限——不需要设备上的任何其他信息。 <a href="privacy#no-collect">了解更多 →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>支付信息——我们从不知晓</strong><span class="item-desc">支付完全由Apple或Google处理。我们只收到一张购买收据。 <a href="privacy#billing">了解更多 →</a></span></span></li>
</ul>

<span class="section-label">我们如何保护传输中的数据</span>

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>AES-256 + 硬件支持的密钥</strong><span class="item-desc">设备上的转录文本经过加密。密钥存储在iOS Keychain或Android Keystore中。 <a href="security#layer-4">了解更多 →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>崩溃报告：默认关闭</strong><span class="item-desc">可选开启。启用后，个人数据在离开设备前会自动剥离。 <a href="security#layer-5">了解更多 →</a></span></span></li>
</ul>

---

<span class="section-label">谁需要这个</span>
## 为重视隐私的场景而打造

<div class="segment-cards">
  <div class="segment-card">
    <div class="segment-icon">&#x1f4f0;</div>
    <h4>新闻工作者</h4>
    <p>您的消息来源始终安全——不是因为我们承诺,而是因为我们根本接触不到。服务器上不保留任何内容,即便被要求,我们也没有什么可以披露的。</p>
  </div>
  <div class="segment-card">
    <div class="segment-icon">&#x2696;&#xfe0f;</div>
    <h4>律师</h4>
    <p>符合律师与当事人保密要求的转录。我们的服务器上没有可被调取或泄露的数据。</p>
  </div>
  <div class="segment-card">
    <div class="segment-icon">&#x270a;</div>
    <h4>维权人士</h4>
    <p>可抵御监控的转录。不保留日志、用户画像或任何痕迹;您的声音变成文字,其余的随即删除。</p>
  </div>
  <div class="segment-card">
    <div class="segment-icon">&#x1f4bc;</div>
    <h4>专业人士</h4>
    <p>面向会议记录、采访和口述的快速准确转录。处理完成后，服务器上不留任何数据。</p>
  </div>
</div>

---

<span class="section-label">值得信赖的精准度</span>
## 再嘈杂也能精准转录

每个音频文件都经过优化的处理流程——在您的设备和我们的服务器上——以确保最高的转录精度。

<div class="pipeline-steps">
  <div class="pipeline-step">
    <div class="pipeline-icon">&#x1f4f1;</div>
    <h4>设备端优化</h4>
    <p>高通滤波、前置静音裁剪、LUFS响度归一化（-16 LUFS，针对ASR优化）、峰值限幅及16kHz重采样——以无损FLAC格式编码后上传。</p>
  </div>
  <div class="pipeline-step">
    <div class="pipeline-icon">&#x1f6e1;</div>
    <h4>语音活动检测</h4>
    <p><a href="https://github.com/snakers4/silero-vad">Silero VAD</a>识别语音片段，通过将转录限制在检测到语音的区域，消除静音段中的AI幻觉。</p>
  </div>
</div>

<div class="callout callout-green">
  <strong>基于成熟标准构建。</strong>我们的处理流程基于经过验证的音频工程标准和经同行评审的研究——而非任意默认值。结果：即使在高难度环境中，您也可以依赖的转录精度。
</div>

---

<span class="section-label">定价</span>
## 简单，按量付费
{: #pricing}

<div class="pricing-free-wrapper"><span class="pricing-free-badge">先免费用 2 小时</span></div>

无订阅。无隐藏费用。购买积分，随时使用。与订阅服务不同，您永远不会为未使用的时间付费。每个新账户均可获得2小时免费转录额度——无需信用卡。

<div class="pricing-grid">
  <div class="pricing-card" data-hours="1">
    <div class="pricing-amount">$0.99</div>
    <div class="pricing-minutes">1小时</div>
    <div class="pricing-rate">$0.0165/分钟</div>
  </div>
  <div class="pricing-card popular" data-hours="7">
    <div class="pricing-amount">$6.49</div>
    <div class="pricing-minutes">7小时</div>
    <div class="pricing-rate">$0.015/分钟</div>
  </div>
  <div class="pricing-card" data-hours="15">
    <div class="pricing-amount">$12.99</div>
    <div class="pricing-minutes">15小时</div>
    <div class="pricing-rate">$0.014/分钟</div>
  </div>
  <div class="pricing-card" data-hours="30">
    <div class="pricing-amount">$23.99</div>
    <div class="pricing-minutes">30小时</div>
    <div class="pricing-rate">$0.013/分钟</div>
  </div>
  <div class="pricing-card" data-hours="60">
    <div class="pricing-amount">$44.99</div>
    <div class="pricing-minutes">60小时</div>
    <div class="pricing-rate">$0.012/分钟</div>
  </div>
  <div class="pricing-card" data-hours="120">
    <div class="pricing-amount">$84.99</div>
    <div class="pricing-minutes">120小时</div>
    <div class="pricing-rate">$0.012/分钟</div>
  </div>
</div>


<div class="callout callout-info">
  <strong>因我方服务器技术故障导致未能完成的转录，绝不收费。</strong>仅当转录在我方成功完成后才收费。支付完全通过Apple App Store或Google Play处理——我们永远看不到您的支付详情。
</div>

---

<span class="section-label">常见问题</span>
## 常见问题解答

<details class="faq-item">
  <summary>转录完成后我的音频会怎样？</summary>
  <div class="faq-answer">已永久消失。您的音频完全在服务器RAM（易失性内存）中处理，转录文本交付的瞬间即被删除。没有磁盘副本、没有备份、无法恢复。即使对服务器进行物理扣押也不会获得任何音频数据。</div>
</details>

<details class="faq-item">
  <summary>你们会用我的录音训练AI吗？</summary>
  <div class="faq-answer">绝对不会。您的音频仅用于一个目的：生成您的转录文本。它永远不会被存储、分析或用于模型训练或改进。我们运行自己的AI基础设施——您的数据不会发送到任何第三方AI服务。</div>
</details>

<details class="faq-item">
  <summary>您能看到我的支付或卡片信息吗？</summary>
  <div class="faq-answer">不能。所有付款均通过Apple App Store或Google Play完全处理。我们仅收到一份购买收据用于余额验证——我们从不查看、接收或存储您的卡号或任何支付详情。</div>
</details>

<details class="faq-item">
  <summary>支持哪些语言？</summary>
  <div class="faq-answer">开源<a href="https://github.com/openai/whisper#available-models-and-languages">Whisper语音识别模型</a>支持 99 种语言并可自动检测语言。您也可以在转录前手动选择语言以提高准确度。</div>
</details>

<details class="faq-item">
  <summary>我可以使用哪些文件格式？</summary>
  <div class="faq-answer">支持<strong>40种格式</strong> — 22种音频格式（MP3、WAV、FLAC、M4A、OGG、Opus、AAC、AIFF、AMR等）和18种视频格式（MP4、MOV、MKV、AVI、WEBM、3GP等 — 上传前在您的设备上提取音频）。文件大小最多50 MB，时长最长2小时。</div>
</details>

<details class="faq-item">
  <summary>我的数据是如何加密的？</summary>
  <div class="faq-answer">传输中：TLS 1.2+加密保护您的数据在设备与SafeScribe服务器之间的传输安全。在您的设备上：转录文本存储在AES-256加密容器中，密钥受手机安全硬件保护（iOS Keychain / Android Keystore）。</div>
</details>

<details class="faq-item">
  <summary>我可以删除所有数据吗？</summary>
  <div class="faq-answer">可以。您可以在应用内删除单条转录文本或整个账户。删除账户将永久移除您的登录身份、所有本地数据和剩余积分余额。由于服务器在处理后不保留任何个人数据，服务器端无需删除任何内容。</div>
</details>

<details class="faq-item">
  <summary>你们会记录我的IP地址吗？</summary>
  <div class="faq-answer">不会。IP地址从不存储或记录。我们的架构在代码层面强制执行这一点——日志系统被明确配置为在IP到达任何日志输出之前将其丢弃。我们对所有内部操作使用匿名标识符（您登录身份的SHA-256单向哈希值）。此哈希值无法被逆推以揭露您的身份。</div>
</details>

<details class="faq-item">
  <summary>如何验证你们的隐私声明？</summary>
  <div class="faq-answer">我们发布完整的<a href="security">安全架构</a>和<a href="dpia">数据保护影响评估</a>以确保技术透明度。您也可以使用网络分析工具（如Wireshark）确认所有流量均经TLS加密——任何请求中都不会出现邮箱、姓名或个人标识符。</div>
</details>

<details class="faq-item">
  <summary>设备端预处理如何提高准确度？</summary>
  <div class="faq-answer">上传前，SafeScribe在设备上应用音频滤波链：80 Hz高通滤波消除低频噪声和背景嗡嗡声，LUFS响度归一化（-16 LUFS）为Whisper优化音频电平，峰值限制防止削波。结合服务器上的语音活动检测，即使是高难度录音也能获得清晰、准确的文本。</div>
</details>

---

<div class="callout callout-info" style="margin-top:1.5rem;">
  <p style="margin:0 0 0.5rem;"><strong>应用商店隐私标签</strong> — 我们在 App Store 和 Google Play 上的隐私标签与此处文档内容完全一致。</p>
  <p style="margin:0;"><strong>漏洞披露</strong> — 发现安全漏洞？请联系 <a href="mailto:security@safescribe.dev">security@safescribe.dev</a>。</p>
</div>

<p style="font-size:0.8rem;color:var(--color-text-secondary);margin-top:1rem;">SafeScribe通过开源<a href="https://github.com/SYSTRAN/faster-whisper">faster-whisper</a>库（SYSTRAN，MIT许可证）使用OpenAI的<a href="https://github.com/openai/whisper">Whisper</a>模型权重。SafeScribe与OpenAI没有关联，也未获得其背书或赞助。</p>

---

