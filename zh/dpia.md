---
layout: default
title: SafeScribe — 数据保护影响评估
description: SafeScribe 音频转录服务在 GDPR 和 KVKK 框架下的正式风险评估。
lang: zh
---

<div class="page-content" markdown="1">

# 数据保护影响评估

<div class="summary-box">
  <strong>主要结论：</strong>由于音频在易失性内存中处理后立即删除——处理后服务器上不留存任何个人数据——所有已识别风险在应用缓解措施后均降至<strong>低级</strong>。处理可在已记录的法律依据和保障措施下进行。
</div>

<p class="page-meta">SafeScribe AI 音频转录 · 版本 1.0 · 2026 年 3 月 · 上线前评估 · 审查期限：上线后 6 个月</p>

---

<span class="section-label">第 1 节</span>
## 处理说明

### 处理内容及原因

| 目的 | 处理数据 | 法律依据（GDPR） | KVKK 依据（土耳其） |
|-----|---------|---------------|----------|
| 音频转录 | 音频文件（仅 RAM，处理后删除） | 第 6(1)(b) 条——合同履行 | 明确同意 |
| 账户与计费 | 假名用户 ID、余额、使用元数据 | 第 6(1)(b) 条——合同履行 | 明确同意 |
| 身份验证 | OIDC 账户 ID（已哈希，原始数据丢弃） | 第 6(1)(b) 条——合同履行 | 合同履行 |
| 应用内购买 | App Store / Play Store 的 IAP 收据 | 第 6(1)(b) 条——合同履行 | 合同履行 |
| 年龄确认 | 自我申报年龄确认（17+） | GDPR 第 8 条 / KVKK 第 6 条 | 法律义务 |
| 崩溃报告 | 匿名错误报告（选择加入，个人信息已清除） | 第 6(1)(a) 条——同意 | 明确同意 |

### 数据清单

| 数据 | 服务器保留 |
|----|---------|
| 音频文件 | 仅 RAM——转录后删除 |
| 转录文本 | 直至客户端确认（若未收到ACK，服务器24小时TTL兜底删除） |
| 假名用户 ID | 直至账户删除 |
| 账户余额 + 使用元数据 | 直至账户删除 |
| 电子邮件地址 | 仅传输——**不存储** |
| IP 地址 | 仅传输——**不记录** |
| 崩溃报告（选择加入） | SafeScribe 自有崩溃报告端点——不与第三方共享 |

<p>完整数据清单详情，请参阅<a href="privacy#data-we-collect">隐私政策 § 我们收集的数据</a>。</p>

<div class="callout callout-info">
  <strong>每项任务元数据</strong>包括：音频时长（秒）、文件大小（字节）、字数、收费金额（美元）及处理时间戳。不包含音频内容、转录文本或任何可识别用户的信息。
</div>

<div class="callout callout-info">
  <strong>备份保留。</strong>每日保留一份账户记录备份以确保服务连续性。每份备份覆盖前一份。通过账户删除操作删除的数据立即从线上系统中移除，并在 24 小时内从备份中移除——此后不再保留任何副本。
</div>

### 处理流程

<div class="flow-diagram">
1. 用户在设备上录制或选择音频
2. 设备端音频预处理（80 Hz 高通滤波器、前置静音修剪、-16 LUFS 响度归一化、峰值限制、16 kHz 重采样、FLAC 编码）
3. 加密上传至 SafeScribe 服务器（TLS 1.3）
4. 服务器在 RAM 中处理音频——自托管，通过 <a href="https://github.com/SYSTRAN/faster-whisper">faster-whisper</a> / CTranslate2 运行 Whisper 系列中的强大模型，不调用第三方 API
5. 返回转录文本及 SHA-256 完整性校验和
6. 客户端验证校验和并确认接收
7. 服务器立即从 RAM 中删除转录文本和音频
8. 转录文本以 AES-256 加密存储在设备本地
</div>

---

<span class="section-label">第 2 节</span>
## 必要性与比例原则

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>音频上传是必要的</strong><span class="item-desc">服务器端 AI 处理在 SafeScribe 所需质量水平上比当前设备端替代方案提供更高精度</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>身份验证是必要的</strong><span class="item-desc">用于按用户计费和任务隔离</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>崩溃报告是适度的</strong><span class="item-desc">个人信息在传输前清除；仅限选择加入</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>数据最小化</strong><span class="item-desc">音频仅在 RAM 中处理，从不写入磁盘</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>最短保留期</strong><span class="item-desc">转录文本在确认时立即删除；若客户端始终未确认，服务器24小时TTL兜底删除</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>无二次使用</strong><span class="item-desc">音频从不用于模型训练或分析</span></span></li>
</ul>

### 数据主体权利

所有 GDPR 和 KVKK 数据主体权利（访问、更正、删除、限制、可携带、反对及撤回同意）均可在应用内行使或通过联系 privacy@safescribe.dev 行使。详情请参阅<a href="privacy#what-you-can-do">隐私政策 § 您可以做什么</a>。

---

<span class="section-label">第 3 节</span>
## 风险评估

### 已识别风险及缓解措施

| 风险 | 固有风险 | 缓解措施 | 残余风险 |
|-----|---------|---------|--------|
| 音频包含敏感个人数据（健康、法律、财务） | **高** | 仅 RAM 处理；立即删除；无持久存储；无第三方访问 | **低** |
| 传输中转录文本被未授权访问 | 中 | TLS 1.3；SHA-256 完整性校验 | **低** |
| 服务器端泄露导致音频或转录暴露 | 中 | 无持久音频存储；认证 API；任务隔离；TTL 安全保障 | **低** |
| 本地加密存储被未授权访问 | 低 | AES-256 加密容器；密钥在 iOS Keychain / Android Keystore | **低** |
| 通过崩溃报告泄露个人信息 | 低 | 发送至 SafeScribe 自有崩溃报告端点前按模式清除邮件、电话、IP 和令牌 | **低** |
| 跨境数据传输 | 中 | 土耳其（KVKK — 土耳其个人数据保护法）首次启动时明确同意；依据 GDPR 第 49(1)(a) 条在首次启动时获取明确知情同意 | **低** |
| AI 对敏感内容产生不准确转录 | 低 | 转录仅供参考；用户审查所有输出；无自动决策 | **低** |

<div class="callout callout-green">
  <strong>所有残余风险均为低级。</strong>主要风险驱动因素——敏感音频内容——在架构层面得到解决：音频从不写入磁盘，从不在处理后保留，从不与第三方共享。
</div>

---

<span class="section-label">第 4 节</span>
## 同意与透明度

用户在首次使用前会看到包含四个独立卡片的细粒度同意界面：

<div class="infra-grid">
  <div class="infra-item">
    <div class="infra-icon">&#x1f3a4;</div>
    <h4>音频处理 <em class="u-label-light">（必选）</em></h4>
    <p>说明仅 RAM 处理、立即删除，以及音频从不写入磁盘或与第三方共享。</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f4ca;</div>
    <h4>存储数据 <em class="u-label-light">（必选）</em></h4>
    <p>说明保留的持久数据：假名账户 ID、积分余额及匿名使用元数据。</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f9d2;</div>
    <h4>年龄确认 <em class="u-label-light">（必选）</em></h4>
    <p>确认用户年满 17 周岁。必选卡片须接受才能继续。</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f41b;</div>
    <h4>崩溃报告 <em class="u-label-light">（可选）</em></h4>
    <p>允许选择加入匿名崩溃报告。默认关闭，可随时在隐私设置中切换。</p>
  </div>
</div>

- 接受和拒绝按钮具有同等视觉显著性（符合<a href="https://www.edpb.europa.eu/our-work-tools/our-documents/guidelines/guidelines-052020-consent-under-regulation-2016679_en">EDPB 指南</a>关于暗模式的规定）
- 用户可随时从隐私设置中撤回同意并删除账户
- 本评估每年审查一次，或在重大处理变更时审查
- 发布于此 URL 以实现公开透明

---

<span class="section-label">第 5 节</span>
## 决定

<div class="callout callout-green">
  根据上述评估，所有残余风险均为<strong>低级</strong>。处理可在已识别的法律依据下，凭已记录的保障措施进行。无需事先咨询监管机构。
</div>

---

<span class="section-label">审查日志</span>
## 版本历史

| 日期 | 版本 | 变更内容 |
|----|-----|--------|
| 2026 年 3 月 | 1.0 | 上线前初始评估，涵盖音频转录流水线、同意界面设计、风险评估及法律依据记录 |

---

</div>
