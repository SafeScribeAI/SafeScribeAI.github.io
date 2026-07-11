---
layout: default
title: SafeScribe — 安全架构
description: SafeScribe 如何保护您的音频数据 — 我们隐私优先设计方法的技术概述。
lang: zh
---

<div class="page-content" markdown="1">

# 安全架构

<div class="summary-box">
  <strong>简而言之：</strong>SafeScribe 仅在服务器的随机访问内存（RAM）中处理您的音频数据。转录文本送达后，所有数据将被永久删除。不写入磁盘、不留备份、不保留副本——从不。本页说明每个保护层的工作原理。
</div>

<p class="page-meta">最后更新：2026 年 3 月</p>

---

<span class="section-label">概述</span>
## 六层保护

<div class="infra-grid">
  <div class="infra-item">
    <div class="infra-icon">&#x1f510;</div>
    <h4>第一层 — 传输安全</h4>
    <p>每次连接使用 TLS 1.3 加密，流量全程端对端加密，无例外。</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f9e0;</div>
    <h4>第二层 — 仅使用 RAM</h4>
    <p>音频从不触碰磁盘。在易失性内存中处理，转录完成后立即删除。</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f464;</div>
    <h4>第三层 — 假名身份</h4>
    <p>您的邮箱和姓名从不存储。仅保留账户 ID 的单向哈希值。</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f512;</div>
    <h4>第四层 — 本地加密</h4>
    <p>设备端 AES-256 加密存储。密钥仅存于硬件安全存储（iOS Keychain / Android Keystore）。</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f41b;</div>
    <h4>第五层 — 个人信息清除</h4>
    <p>崩溃报告在离开设备前会自动清除所有个人信息。</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f5d1;</div>
    <h4>第六层 — 级联删除</h4>
    <p>每个处理步骤立即删除前一步骤的数据，TTL 作为安全保障。</p>
  </div>
</div>

---

<span class="section-label">设计原则</span>
## 处理、交付、删除

传统转录服务将音频写入磁盘，可能无限期保留。SafeScribe 在 RAM 中接收音频，完成处理，并在您收到转录文本时立即删除——不向持久存储写入任何字节。完整流程请参见下方<a href="#your-datas-journey">数据流图</a>。

关键区别：即使服务器被物理没收，也不会找到任何音频或转录数据——它们仅存在于易失性内存中。

---

<span class="section-label">第一层</span>
## 传输安全
{: #layer-1}

| 保护措施 | 防范内容 |
|---------|---------|
| TLS 1.3 加密 | 网络流量窃听 |
| SHA-256 完整性校验 | 传输过程中的转录篡改 |

<div class="callout callout-green">
  <strong>可验证：</strong>可使用 Wireshark 确认所有 SafeScribe 流量均经过 TLS 加密。
</div>

---

<span class="section-label">第二层</span>
## 服务器仅 RAM 处理
{: #layer-2}

这是 SafeScribe 隐私设计的核心。服务器通过自托管推理引擎 <a href="https://github.com/SYSTRAN/faster-whisper">faster-whisper</a> 运行 OpenAI Whisper 模型权重——不调用任何第三方 API。数据存储配置为完全易失性操作，不向磁盘持久化任何数据。

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span> 服务器重启会永久清除所有内存数据——这是设计使然</li>
  <li><span class="check-mark">&#x2713;</span> 没有任何文件、备份或日志包含您的音频数据</li>
  <li><span class="check-mark">&#x2713;</span> 对服务器进行取证分析不会发现任何音频内容</li>
</ul>

**服务器临时存储（仅 RAM）：**

| 数据 | 删除时机 |
|-----|---------|
| 音频字节 | 转录完成后 |
| 转录文本 | 接收确认后 |
| 任务元数据 | 接收确认后 |

**服务器永久存储（磁盘）：**

| 数据 | 用途 | 含个人信息？ |
|-----|-----|-----------|
| 假名用户 ID | 账单记录 | 否——单向哈希，不可逆 |
| 时长和费用 | 财务记录 | 否 |
| 文件大小（字节） | 服务分析 | 否 |
| 字数统计 | 服务分析 | 否 |
| 时间戳 | 审计追踪 | 否 |

<div class="callout callout-green">
  <strong>设计使然：</strong>没有"重新下载"功能。一旦确认接收，数据即消失——没有任何东西可以找回。
</div>

---

<span class="section-label">第三层</span>
## 假名身份
{: #layer-3}

SafeScribe 使用 Google 登录和 Sign in with Apple。您的个人数据从不存储：

| 身份验证提供商传递的内容 | 我们存储的内容 |
|----------------------|-------------|
| 电子邮件地址 | **不存储** |
| 显示名称 | **不存储** |
| 账户 ID | 仅单向加密哈希 |

您账户 ID 的单向哈希：

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span> 无法逆向还原以揭露您的身份</li>
  <li><span class="check-mark">&#x2713;</span> 对您唯一——仅用于计费</li>
  <li><span class="check-mark">&#x2713;</span> 不包含任何个人信息</li>
</ul>

<div class="callout callout-green">
  <strong>可验证：</strong>检查应用的网络流量。身份验证后，任何请求都不包含您的邮箱或姓名——只有服务器在内部验证的 Bearer Token。
</div>

---

<span class="section-label">第四层</span>
## 本地加密
{: #layer-4}

存储在设备上的转录文本受以下保护：

| 保护 | 技术 |
|----|-----|
| 加密 | AES-256 |
| 密钥存储 | iOS Keychain / Android Keystore |
| 数据库 | 加密容器 |

即使直接访问文件系统，转录数据也会显示为不可读的二进制内容。密钥存于硬件安全存储，不在应用文件中。卸载应用会永久销毁密钥。

---

<span class="section-label">第五层</span>
## 诊断数据中的个人信息清除
{: #layer-5}

应用遇到错误时，可选择性发送崩溃报告。报告离开设备前，以下内容会自动清除：

<div class="callout callout-info">
  <strong>发送前清除：</strong>电子邮件地址 · 电话号码 · IP 地址 · 文件路径 · 身份验证令牌
</div>

<div class="callout callout-green">
  <strong>报告包含：</strong>错误类型和堆栈跟踪 · 设备型号 · 操作系统版本 · 应用版本
</div>

您可以在应用隐私设置中完全关闭崩溃报告。

---

<span class="section-label">第六层</span>
## 级联删除
{: #layer-6}

每个处理步骤立即删除上一步骤的数据：音频在转录后删除，转录文本在确认后删除。<a href="#your-datas-journey">数据流图</a>展示了包含所有删除节点的完整流程。

这不是后台清理任务。删除操作作为处理流水线的一部分即时发生。

<div class="callout callout-info">
  <strong>安全保障：</strong>即使正常删除流程失败（网络错误、应用崩溃），服务器 RAM 中的每条数据都有自动过期时间。数据会自动销毁——无论发生什么。
</div>

---

<span class="section-label">完整流程</span>
## 您的数据之旅
{: #your-datas-journey}

<div class="flow-diagram">
您的设备                     SafeScribe 服务器             您的设备
------                       ----------------             ------

录制/选择音频
    |
本地预处理
    |
加密+上传 --------TLS-------> 接收至 RAM
                                   |
                               AI 转录
                               （仅 RAM）
                                   |
                               音频已删除
                                   |
接收转录文本    <---TLS------  发送转录文本
    |                              |
验证完整性                     等待确认
    |                              |
本地加密存储   确认 ----------> 转录文本已删除
（AES-256）                    任务元数据已删除
    |                              |
完成                           服务器零数据
</div>

---

<span class="section-label">透明度</span>
## 独立验证

我们欢迎安全研究人员和隐私倡导者验证我们的声明：

<ul class="verify-steps">
  <li><span><strong>网络分析</strong> 使用 Wireshark 或 Charles Proxy 可确认所有 SafeScribe 流量均经过 TLS 加密。</span></li>
  <li><span><strong>已发布评估</strong> 我们的<a href="dpia">数据保护影响评估</a>包含完整的风险分析和决策记录。</span></li>
  <li><span><strong>负责任披露</strong> 发现漏洞？请联系 <a href="mailto:security@safescribe.dev">security@safescribe.dev</a>。</span></li>
</ul>

</div>
