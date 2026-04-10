---
layout: default
title: SafeScribe — 隐私政策
description: SafeScribe收集哪些数据、我们如何处理以及您的权利。
lang: zh
---

<div class="page-content" markdown="1">

# 隐私政策

<div class="summary-box">
  <strong>简明说明：</strong>我们在服务器内存中处理您的音频以创建转录文本，然后立即将其删除。我们不在磁盘上存储音频，不将其用于AI训练，也不与任何人共享。您的转录文本在设备上加密存储，由您掌控。我们仅保留匿名账单记录。
</div>

<p class="page-meta">最后更新：2026年3月</p>

---

<span class="section-label">我们绝不做的事</span>
## 我们不收集或存储的数据
{: #data-we-dont-collect-or-store}

<ul class="dont-list">
  <li><span class="x-mark">&#x2717;</span> 将音频存储在磁盘上——永远不</li>
  <li><span class="x-mark">&#x2717;</span> 存储您的电子邮件地址或姓名</li>
  <li><span class="x-mark">&#x2717;</span> 记录或存储IP地址</li>
  <li><span class="x-mark">&#x2717;</span> 使用录音训练AI模型</li>
  <li><span class="x-mark">&#x2717;</span> 与广告商或数据经纪商共享数据</li>
  <li><span class="x-mark">&#x2717;</span> 跨应用程序或会话跟踪行为</li>
  <li><span class="x-mark">&#x2717;</span> 收集联系人、位置或生物特征数据</li>
  <li><span class="x-mark">&#x2717;</span> 账户删除后保留数据</li>
</ul>

---

<span class="section-label">我们存储的内容</span>
## 收集的数据

### 服务器端（永久保存至账户删除）

| 数据 | 用途 |
|------|------|
| 匿名用户ID（账户ID的SHA-256哈希值） | 账户身份——不可逆 |
| 匿名设备标识符（设备属性的SHA-256哈希值） | 防滥用——不可逆 |
| 账户余额（USD） | 信用管理 |
| 剩余免费转录分钟数 | 欢迎奖励追踪 |
| 账户创建和最后更新时间戳 | 账户管理 |

**每项任务记录**（为每次完成的转录存储）：

| 数据 | 用途 |
|------|------|
| 音频时长（秒） | 服务分析 |
| 文件大小（字节） | 服务分析 |
| 字数统计 | 服务分析 |
| 收费金额（USD） | 账单记录 |
| 处理时间戳 | 服务分析 |

<div class="callout callout-info">
  <strong>每项任务记录中永远不包含音频内容或转录文本。</strong>这些记录仅包含元数据（数字和时间戳）——从不包含您所说的内容。
</div>

### 服务器端（临时——处理后删除）

| 数据 | 删除时间 |
|------|---------|
| 音频文件 | 转录完成后立即删除 |
| 转录文本 | 您确认收到（确认）后删除 |

### 在您的设备上（加密）

| 数据 | 保留期限 |
|------|---------|
| 转录文本（文字、片段、元数据） | 直到您删除 |
| 离线上传队列 | 成功上传后移除 |
| 应用设置和同意记录 | 直到退出登录或删除账户 |
| 加密密钥 | 存于iOS Keychain / Android Keystore——随应用删除 |

### 可选（仅在接受时）

| 数据 | 用途 |
|------|------|
| 崩溃报告 | 通过SafeScribe自有崩溃报告端点提升应用稳定性——传输前移除所有个人信息 |

<div class="callout callout-green">
  <strong>服务器从不存储您的姓名、电子邮件地址、IP地址、音频内容或转录文本。</strong>与您账户关联的唯一持久记录是不可逆用户哈希值、匿名设备标识符、信用余额和使用统计数据（仅数字——无内容，无身份信息）。
</div>

---

<span class="section-label">完整删除</span>
## 删除应用vs.删除账户

这是两个不同的操作，结果各异：

| 操作 | 结果 | 您的余额 |
|------|------|---------|
| **删除应用** | 本地转录文本和加密密钥从设备中移除 | 保留在服务器上——重新安装并以相同账户登录即可完全恢复 |
| **删除账户** | 所有服务器端记录永久删除——不可撤销 | 消失 |

<div class="callout callout-info">
  <strong>随时重新安装。</strong>如果您删除应用但不删除账户，重新安装并以相同的Google或Apple账户登录即可恢复完整余额和访问权限——无需任何操作。
</div>

### 删除账户——零数据残留

从隐私设置中删除账户将永久删除所有服务器端记录：

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span> 匿名用户ID——永久删除</li>
  <li><span class="check-mark">&#x2713;</span> 匿名设备标识符——永久删除</li>
  <li><span class="check-mark">&#x2713;</span> 信用余额——永久删除</li>
  <li><span class="check-mark">&#x2713;</span> 剩余免费分钟数——永久删除</li>
  <li><span class="check-mark">&#x2713;</span> 所有任务统计数据——永久删除</li>
  <li><span class="check-mark">&#x2713;</span> 每日备份在24小时内覆盖——<strong>任何地方均无副本残留</strong></li>
</ul>

这不是匿名化处理。您的记录不会以聚合或修改的形式保留——它们被删除。唯一的每日备份在删除后24小时内被覆盖，此后您的数据在任何系统中均不存在副本。

应用内删除操作构成您根据GDPR第17条及KVKK第11条(e)款正式行使删除权的行为。如果您无法访问账户，请联系**privacy@safescribe.dev**通过电子邮件提交删除请求。

---

<span class="section-label">音频处理</span>
## 零磁盘策略

<div class="flow-diagram">
您的音频：上传 --> RAM --> AI转录 --> 交付 --> 删除
                                             （立即）

我们的磁盘：仅余额记录——无音频、无转录文本、无邮箱
</div>

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>仅在RAM中</strong><span class="item-desc">——音频仅在易失性内存中处理</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>从不写入磁盘</strong><span class="item-desc">——哪怕是临时写入</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>不用于AI训练</strong><span class="item-desc">——您的音频永远不会用于改进模型</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>自托管AI</strong><span class="item-desc">——没有任何第三方AI服务接收您的音频</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>TTL安全保护</strong><span class="item-desc">——即使删除代码失败，数据也会自动销毁</span></span></li>
</ul>

---

<span class="section-label">身份验证</span>
## 通过Google或Apple登录

我们通过Google Sign-In和Sign in with Apple使用OpenID Connect (OIDC)。

| 提供商发送给我们的内容 | 我们的处理方式 |
|---------------------|-------------|
| 账户ID | 哈希处理（SHA-256+盐值）——原始值丢弃 |
| 电子邮件地址 | 仅用于身份验证——**不存储** |
| 显示名称 | **不存储** |

我们不访问您的联系人、日历或任何其他账户数据。

---

<span class="section-label">付款</span>
## 通过应用商店计费

付款完全由Apple App Store或Google Play Store处理。SafeScribe**从不接收、存储或处理**信用卡号或付款详细信息。我们仅接收购买收据用于余额验证。

<div class="callout callout-info">
  <strong>Apple或Google保存的付款记录</strong>不在SafeScribe的控制范围内，不在SafeScribe账户删除流程的覆盖范围内。如需管理这些记录，请直接联系<a href="https://support.apple.com">Apple支持</a>或<a href="https://support.google.com/googleplay">Google Play支持</a>。
</div>

---

<span class="section-label">错误追踪</span>
## 崩溃报告（可选）

我们将可选的崩溃报告发送至SafeScribe自有崩溃报告端点。默认情况下**已关闭**，可随时在隐私设置中切换。

在传输任何报告之前，以下内容会被自动移除：

**已删除：**电子邮件地址 · 电话号码 · IP地址 · 文件路径 · 身份验证令牌 · 任务标识符

**保留：**错误类型和堆栈跟踪 · 设备型号 · 操作系统版本 · 应用版本

---

<span class="section-label">第三方</span>
## 第三方服务

我们使用以下服务。除注明内容外，不向任何第三方共享音频、转录内容或个人信息。

| 服务 | 用途 | 共享数据 | 隐私政策 |
|------|------|---------|---------|
| Google Sign-In | 身份验证 | 仅OIDC令牌 | [policies.google.com/privacy](https://policies.google.com/privacy) |
| Apple Sign-In | 身份验证 | 仅OIDC令牌 | [apple.com/legal/privacy](https://www.apple.com/legal/privacy/) |
| Apple App Store | 应用内购买 | 仅购买收据 | [apple.com/legal/privacy](https://www.apple.com/legal/privacy/) |
| Google Play Store | 应用内购买 | 仅购买收据 | [policies.google.com/privacy](https://policies.google.com/privacy) |
| SafeScribe崩溃报告端点 | 崩溃报告（可选） | 匿名错误报告——个人信息已删除 | 由SafeScribe自行运营，无第三方 |

---

<span class="section-label">法律依据</span>
## 处理的法律依据

| 处理活动 | GDPR依据 | KVKK依据 | 是否必要？ |
|---------|---------|---------|---------|
| 音频转录 | 第6(1)(b)条——合同 | 明确同意 | 使用服务必须 |
| 账户与计费 | 第6(1)(b)条——合同 | 合同履行 | 使用服务必须 |
| 身份验证(OIDC) | 第6(1)(b)条——合同 | 合同履行 | 使用服务必须 |
| 应用内购买 | 第6(1)(b)条——合同 | 合同履行 | 购买必须 |
| 崩溃报告 | 第6(1)(a)条——同意 | 明确同意 | 可选 |

提供转录、身份验证和计费数据是使用SafeScribe的**必要条件**。崩溃报告是**可选的**——服务在没有它的情况下也能完全运行。

---

<span class="section-label">您的权利</span>
## 您可以做什么

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>访问</strong><span class="item-desc">——随时在应用中查看所有转录文本</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>删除</strong><span class="item-desc">——从隐私设置中删除单个转录文本或整个账户；删除账户后任何数据库中均无记录残留</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>导出</strong><span class="item-desc">——分享或导出转录文本，或从隐私设置请求完整数据导出</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>拒绝诊断</strong><span class="item-desc">——在隐私设置中关闭崩溃报告</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>撤回同意</strong><span class="item-desc">——随时退出登录并删除账户</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>CCPA选择退出</strong><span class="item-desc">——在隐私设置中切换"不出售或共享"</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>无自动化决策</strong><span class="item-desc">——我们从不对您做出自动化决策，包括具有法律或类似重大影响的画像（GDPR第22条）</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>提出投诉</strong><span class="item-desc">——欧盟/欧洲经济区居民可联系其国家监管机构（<a href="https://www.edpb.europa.eu/about-edpb/about-edpb/members_en">edpb.europa.eu</a>）；土耳其居民可联系KVKK（<a href="https://www.kvkk.gov.tr">kvkk.gov.tr</a>）</span></span></li>
</ul>

如需在应用内无法完成的任何请求，请联系**privacy@safescribe.dev**。

---

<span class="section-label">法律信息</span>
## 补充信息

**数据控制者。**SafeScribe由位于土耳其的独立开发者运营。联系方式：privacy@safescribe.dev。未任命数据保护官（DPO）——处理规模不大，且未系统性保留特殊类别数据（音频仅在RAM中临时处理，从不持久化到磁盘）。

**备份。**为保障服务连续性，保留账户记录（匿名ID、余额、使用统计）的单份每日备份。每份备份覆盖上一份。账户删除时，数据立即从实时系统中删除，并在24小时内从备份中删除。

**国际传输。**如果您从欧盟/欧洲经济区使用SafeScribe，您的音频和账户数据将在土耳其的服务器上处理。土耳其目前尚无<a href="https://commission.europa.eu/law/law-topic/data-protection/international-dimension-data-protection/adequacy-decisions_en">欧盟充分性决定</a>；传输受您首次启动时明确知情同意的覆盖（GDPR第49(1)(a)条）。对于土耳其（KVKK）用户，跨境传输依据KVKK第9条在首次启动时通过明确同意授权。

**儿童。**SafeScribe在App Store和Google Play评级为17+，不面向17岁以下用户。我们不会在知情情况下收集17岁以下任何人的数据。在法定完全行为能力年龄为18岁的司法管辖区（包括土耳其），17岁用户在使用应用前需获得父母或监护人同意。

**政策变更。**当我们的做法发生变化时，我们将更新此页面。上述"最后更新"日期反映最新修订。

---

<span class="section-label">联系方式</span>
## 联系我们

| 主题 | 联系方式 |
|------|---------|
| 隐私请求、数据删除、权利 | privacy@safescribe.dev |
| 安全漏洞 | security@safescribe.dev |
| 一般支持 | support@safescribe.dev |

---


</div>
