---
layout: default
title: SafeScribe — セキュリティアーキテクチャ
description: SafeScribe がお客様の音声データを保護する仕組み — プライバシー・バイ・デザインの技術的概要。
lang: ja
---

<div class="page-content" markdown="1">

# セキュリティアーキテクチャ

<div class="summary-box">
  <strong>要約：</strong>SafeScribe はお客様の音声データをサーバーの RAM（ランダムアクセスメモリ）のみで処理します。文字起こしが届いた瞬間、すべてのデータは完全に削除されます。ディスクへの書き込みなし、バックアップなし、コピーなし — 一切ありません。このページでは各保護レイヤーの仕組みを説明します。
</div>

<p class="page-meta">最終更新：2026 年 3 月</p>

---

<span class="section-label">概要</span>
## 6 つの保護レイヤー

<div class="infra-grid">
  <div class="infra-item">
    <div class="infra-icon">&#x1f510;</div>
    <h4>レイヤー 1 — 通信</h4>
    <p>すべての接続で TLS 1.3 暗号化を使用。通信はエンドツーエンドで暗号化され、例外はありません。</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f9e0;</div>
    <h4>レイヤー 2 — RAM 専用</h4>
    <p>音声データはディスクに触れることがありません。揮発性メモリ内で処理し、文字起こし完了後に即座に削除します。</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f464;</div>
    <h4>レイヤー 3 — 仮名 ID</h4>
    <p>メールアドレスや氏名は一切保存されません。アカウント ID の一方向ハッシュのみが保持されます。</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f512;</div>
    <h4>レイヤー 4 — ローカル暗号化</h4>
    <p>デバイス上の AES-256 暗号化ストレージ。鍵はハードウェアセキュアストレージ（iOS Keychain / Android Keystore）のみに保存。</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f41b;</div>
    <h4>レイヤー 5 — 個人情報の除去</h4>
    <p>クラッシュレポートはデバイスを離れる前に個人情報が自動的に削除されます。</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f5d1;</div>
    <h4>レイヤー 6 — カスケード削除</h4>
    <p>各処理ステップが前のステップのデータを即座に削除します。TTL によるフェイルセーフも備えています。</p>
  </div>
</div>

---

<span class="section-label">設計原則</span>
## 処理、配信、削除

一般的な文字起こしサービスは音声をディスクに書き込み、無期限に保持する場合があります。SafeScribe は音声を RAM で受け取り、処理し、文字起こしが届いた時点で削除します — 永続ストレージへの書き込みは一切ありません。完全なフローは下の<a href="#your-datas-journey">データフロー図</a>をご覧ください。

重要な違い：サーバーが物理的に押収されたとしても、音声や文字起こしのデータは存在しません — それらは揮発性メモリにのみ存在していたからです。

---

<span class="section-label">レイヤー 1</span>
## 通信セキュリティ

| 保護手段 | 防ぐもの |
|---------|--------|
| TLS 1.3 暗号化 | ネットワークトラフィックの盗聴 |
| SHA-256 整合性チェックサム | 転送中の文字起こしへの改ざん |

<div class="callout callout-green">
  <strong>検証可能：</strong>Wireshark を使用して SafeScribe のすべての通信が TLS 暗号化されていることを確認できます。
</div>

---

<span class="section-label">レイヤー 2</span>
## サーバーの RAM 専用処理

これが SafeScribe のプライバシー設計の核心です。サーバーは自己ホスト型推論エンジン <a href="https://github.com/SYSTRAN/faster-whisper">faster-whisper</a> を通じて OpenAI の Whisper モデルウェイトを実行します — サードパーティ API への呼び出しは一切ありません。データストレージはディスク永続化なしの完全揮発性動作に設定されています。

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span> サーバーの再起動はメモリ内のすべてのデータを完全に削除します — 設計上の意図です</li>
  <li><span class="check-mark">&#x2713;</span> どのファイル、バックアップ、ログにも音声データは含まれません</li>
  <li><span class="check-mark">&#x2713;</span> サーバーのフォレンジック解析を行っても音声コンテンツは発見されません</li>
</ul>

**サーバーの一時保存（RAM のみ）：**

| データ | 削除タイミング |
|------|-------------|
| 音声バイト | 文字起こし完了後 |
| 文字起こしテキスト | 受信確認後 |
| ジョブメタデータ | 受信確認後 |

**サーバーの恒久保存（ディスク）：**

| データ | 目的 | 個人情報を含む？ |
|------|-----|--------------|
| 仮名ユーザー ID | 請求記録 | いいえ — 一方向ハッシュ、逆引き不可 |
| 処理時間と費用 | 財務記録 | いいえ |
| ファイルサイズ（バイト） | サービス分析 | いいえ |
| 文字数 | サービス分析 | いいえ |
| タイムスタンプ | 監査証跡 | いいえ |

<div class="callout callout-green">
  <strong>設計上の特性：</strong>「再ダウンロード」機能はありません。受信確認後、データは消去されます — 取り戻せるものは何もありません。
</div>

---

<span class="section-label">レイヤー 3</span>
## 仮名 ID

SafeScribe は Google ログインと Sign in with Apple を使用します。お客様の個人情報は一切保存されません：

| 認証プロバイダーから受け取るもの | 保存するもの |
|---------------------------|-----------|
| メールアドレス | **保存しない** |
| 表示名 | **保存しない** |
| アカウント ID | 一方向暗号ハッシュのみ |

アカウント ID の一方向ハッシュは：

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span> 逆引きしてお客様の身元を特定することはできません</li>
  <li><span class="check-mark">&#x2713;</span> お客様固有のもの — 請求目的にのみ使用</li>
  <li><span class="check-mark">&#x2713;</span> 個人情報を一切含みません</li>
</ul>

<div class="callout callout-green">
  <strong>検証可能：</strong>アプリのネットワークトラフィックを検査してください。認証後、どのリクエストにもメールアドレスや氏名は含まれません — サーバーが内部で検証する Bearer トークンのみです。
</div>

---

<span class="section-label">レイヤー 4</span>
## ローカル暗号化

デバイスに保存された文字起こしは以下で保護されます：

| 保護 | 技術 |
|----|-----|
| 暗号化 | AES-256 |
| 鍵の保存 | iOS Keychain / Android Keystore |
| データベース | 暗号化コンテナ |

ファイルシステムへの直接アクセスがあっても、文字起こしデータは読み取れないバイナリとして表示されます。鍵はアプリファイル外のハードウェアセキュアストレージに保存されています。アプリの削除により鍵は永久に破壊されます。

---

<span class="section-label">レイヤー 5</span>
## 診断データからの個人情報除去

アプリがエラーに遭遇した場合、オプションでクラッシュレポートを送信できます。デバイスを離れる前に、以下が自動的に除去されます：

<div class="callout callout-info">
  <strong>送信前に除去：</strong>メールアドレス · 電話番号 · IP アドレス · ファイルパス · 認証トークン
</div>

<div class="callout callout-green">
  <strong>レポートに含まれるもの：</strong>エラータイプとスタックトレース · デバイスモデル · OS バージョン · アプリバージョン
</div>

アプリのプライバシー設定からクラッシュレポートを完全に無効にできます。

---

<span class="section-label">レイヤー 6</span>
## カスケード削除

各処理ステップが前のステップのデータを即座に削除します：音声は文字起こし後に削除され、文字起こしは確認後に削除されます。<a href="#your-datas-journey">データフロー図</a>にすべての削除ポイントを含む完全なフローが示されています。

これはバックグラウンドのクリーンアップジョブではありません。削除は処理パイプラインの一部として即座に行われます。

<div class="callout callout-info">
  <strong>フェイルセーフ：</strong>通常の削除プロセスが失敗した場合（ネットワークエラー、アプリクラッシュ）でも、サーバー RAM 内の各データには自動有効期限があります。データは自動的に消去されます — 何があっても。
</div>

---

<span class="section-label">完全なフロー</span>
## データの旅
{: #your-datas-journey}

<div class="flow-diagram">
お使いの端末                 SafeScribe サーバー           お使いの端末
----------                   -----------------            ----------

音声録音/選択
    |
デバイスで前処理
    |
暗号化+送信 -----TLS-------> RAM で受信
                                   |
                               AI 文字起こし
                               （RAM 専用）
                                   |
                               音声データ削除済み
                                   |
文字起こし受信   <--TLS------  文字起こし送信
    |                              |
整合性確認                     確認待ち
    |                              |
暗号化して     確認 ----------> 文字起こし削除済み
ローカル保存                   ジョブメタデータ削除済み
（AES-256）                        |
    |                         データゼロ
完了
</div>

---

<span class="section-label">透明性</span>
## 独立した検証

セキュリティ研究者やプライバシー擁護者による当社の主張の検証を歓迎します：

<ul class="verify-steps">
  <li><span><strong>ネットワーク解析</strong> Wireshark または Charles Proxy を使用して SafeScribe のすべての通信が TLS 暗号化されていることを確認できます。</span></li>
  <li><span><strong>公開された評価書</strong> 当社の<a href="dpia">データ保護影響評価</a>には完全なリスク分析と決定記録が含まれています。</span></li>
  <li><span><strong>責任ある開示</strong> 脆弱性を発見しましたか？<a href="mailto:security@safescribe.dev">security@safescribe.dev</a> までご連絡ください。</span></li>
</ul>

</div>
