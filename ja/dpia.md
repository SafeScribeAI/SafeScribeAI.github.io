---
layout: default
title: SafeScribe — データ保護影響評価
description: GDPR および KVKK に基づく SafeScribe 音声文字起こしサービスの正式なリスク評価。
lang: ja
---

<div class="page-content" markdown="1">

# データ保護影響評価

<div class="summary-box">
  <strong>主な結論：</strong>音声が揮発性メモリで処理され即座に削除される — 処理後にサーバー上に個人データが残らない — ため、特定されたすべてのリスクは緩和措置の適用後に<strong>低</strong>まで軽減されます。処理は文書化された法的根拠と保護措置のもとで実施できます。
</div>

<p class="page-meta">SafeScribe AI 音声文字起こし · バージョン 1.0 · 2026 年 3 月 · ローンチ前評価 · 次回レビュー：ローンチ後 6 か月</p>

---

<span class="section-label">第 1 節</span>
## 処理の説明

### 処理内容と目的

| 目的 | 処理されるデータ | 法的根拠（GDPR） | KVKK の根拠 |
|----|--------------|--------------|-----------|
| 音声文字起こし | 音声ファイル（RAM のみ、処理後削除） | 第 6 条 (1)(b) — 契約の履行 | 明示的な同意 |
| アカウントと課金 | 仮名ユーザー ID、残高、利用メタデータ | 第 6 条 (1)(b) — 契約の履行 | 明示的な同意 |
| 認証 | OIDC アカウント ID（ハッシュ済み、原本破棄） | 第 6 条 (1)(b) — 契約の履行 | 契約の履行 |
| アプリ内購入 | App Store / Play Store の IAP レシート | 第 6 条 (1)(b) — 契約の履行 | 契約の履行 |
| 年齢確認 | 自己申告による年齢確認（17 歳以上） | GDPR 第 8 条 / KVKK 第 6 条 | 法的義務 |
| クラッシュレポート | 匿名化されたエラーレポート（オプトイン、個人情報削除済み） | 第 6 条 (1)(a) — 同意 | 明示的な同意 |

### データ目録

| データ | サーバーでの保持期間 |
|------|-----------------|
| 音声ファイル | RAM のみ — 文字起こし後に削除 |
| 文字起こしテキスト | クライアントの確認まで（約数秒） |
| 仮名ユーザー ID | アカウント削除まで |
| アカウント残高 + 利用メタデータ | アカウント削除まで |
| メールアドレス | 通過のみ — **保存しない** |
| IP アドレス | 通過のみ — **ログに記録しない** |
| クラッシュレポート（オプトイン） | Sentry の保持ポリシー |

<p>データ目録の詳細については、<a href="privacy#data-we-collect">プライバシーポリシー § 収集するデータ</a>をご覧ください。</p>

<div class="callout callout-info">
  <strong>ジョブごとのメタデータ</strong>には、音声の長さ（秒）、ファイルサイズ（バイト）、文字数、請求金額（USD）、処理タイムスタンプが含まれます。音声コンテンツ、文字起こしテキスト、ユーザーを識別できる情報は含まれません。
</div>

<div class="callout callout-info">
  <strong>バックアップの保持。</strong>サービス継続のためにアカウントレコードの日次バックアップを 1 件保持します。各バックアップは前のバックアップを上書きします。アカウント削除により削除されたデータはライブシステムから即座に、バックアップからは 24 時間以内に削除されます — それ以降はコピーが残りません。
</div>

### 処理フロー

<div class="flow-diagram">
1. ユーザーがデバイスで音声を録音または選択する
2. デバイスで音声を前処理（80 Hz ハイパスフィルター、冒頭無音のトリミング、<a href="https://tech.ebu.ch/publications/r128">EBU R128</a> ラウドネス正規化、ピークリミッティング、16 kHz リサンプリング、FLAC エンコード）
3. SafeScribe サーバーへ暗号化してアップロード（TLS + 証明書ピン留め）
4. サーバーが RAM で音声を処理 — <a href="https://github.com/SYSTRAN/faster-whisper">faster-whisper</a> / CTranslate2 経由の自己ホスト型 Whisper モデルウェイト、サードパーティ API 呼び出しなし
5. SHA-256 整合性チェックサム付きで文字起こしを返送
6. クライアントがチェックサムを検証し受信確認
7. サーバーが RAM から文字起こしと音声を即座に削除
8. 文字起こしをデバイスの AES-256 暗号化ストレージにローカル保存
</div>

---

<span class="section-label">第 2 節</span>
## 必要性と比例原則

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>音声のアップロードは必要です</strong><span class="item-desc">サーバーサイドの AI 処理は、SafeScribe が要求する品質レベルで現在のオンデバイス代替手段より高い精度を実現します</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>認証は必要です</strong><span class="item-desc">ユーザーごとの課金とジョブの分離に必要です</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>クラッシュレポートは適切です</strong><span class="item-desc">送信前に個人情報を削除；オプトインのみ</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>データの最小化</strong><span class="item-desc">音声は RAM のみで処理され、ディスクへの書き込みはありません</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>最小限の保持期間</strong><span class="item-desc">文字起こしは確認後数秒以内に削除されます</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>二次利用なし</strong><span class="item-desc">音声はモデルのトレーニングや分析に使用されません</span></span></li>
</ul>

### データ主体の権利

GDPR および KVKK に基づくすべてのデータ主体の権利（アクセス、訂正、削除、制限、ポータビリティ、異議申し立て、同意の撤回）は、アプリ内または privacy@safescribe.dev への連絡で行使できます。詳細は<a href="privacy#what-you-can-do">プライバシーポリシー § できること</a>をご覧ください。

---

<span class="section-label">第 3 節</span>
## リスク評価

### 特定されたリスクと緩和措置

| リスク | 固有リスク | 緩和措置 | 残余リスク |
|-----|---------|--------|---------|
| 音声に機密個人データが含まれる（健康、法律、財務） | **高** | RAM 専用処理；即時削除；永続的なストレージなし；第三者アクセスなし | **低** |
| 転送中の文字起こしへの不正アクセス | 中 | TLS 1.2+ 証明書ピン留め；SHA-256 整合性チェックサム | **低** |
| サーバー侵害による音声や文字起こしの漏洩 | 中 | 永続的な音声ストレージなし；認証 API；ジョブ分離；TTL フェイルセーフ | **低** |
| ローカル暗号化ストレージへの不正アクセス | 低 | AES-256 暗号化コンテナ；鍵は iOS Keychain / Android Keystore | **低** |
| クラッシュレポートによる個人情報漏洩 | 低 | Sentry 送信前にメール、電話、IP、トークンのパターンベース削除 | **低** |
| 国境を越えたデータ転送 | 中 | 初回起動時の KVKK 明示的同意；サブプロセッサーとの GDPR SCC | **低** |
| AI が機密コンテンツの不正確な文字起こしを生成 | 低 | 文字起こしは情報提供のみ；ユーザーがすべての出力を確認；自動化された意思決定なし | **低** |

<div class="callout callout-green">
  <strong>すべての残余リスクは低です。</strong>主なリスク要因 — 機密音声コンテンツ — はアーキテクチャレベルで対処されています：音声はディスクに書き込まれることなく、処理後に保持されることもなく、第三者と共有されることもありません。
</div>

---

<span class="section-label">第 4 節</span>
## 同意と透明性

初回利用前に、4 つの独立したカードからなる詳細な同意画面が表示されます：

<div class="infra-grid">
  <div class="infra-item">
    <div class="infra-icon">&#x1f3a4;</div>
    <h4>音声処理 <em style="font-weight:400;font-size:0.8rem;">（必須）</em></h4>
    <p>RAM 専用処理、即時削除、音声がディスクに書き込まれず第三者と共有されないことを説明します。</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f4ca;</div>
    <h4>保存データ <em style="font-weight:400;font-size:0.8rem;">（必須）</em></h4>
    <p>保持される永続データを説明します：仮名アカウント ID、クレジット残高、匿名の利用メタデータ。</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f9d2;</div>
    <h4>年齢確認 <em style="font-weight:400;font-size:0.8rem;">（必須）</em></h4>
    <p>ユーザーが 17 歳以上であることを確認します。必須カードは続行するために同意が必要です。</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f41b;</div>
    <h4>クラッシュレポート <em style="font-weight:400;font-size:0.8rem;">（任意）</em></h4>
    <p>匿名クラッシュレポートへのオプトインを許可します。デフォルトはオフ。プライバシー設定からいつでも変更できます。</p>
  </div>
</div>

- 同意・拒否ボタンは同等の視覚的重要性を持ちます（ダークパターンに関する <a href="https://www.edpb.europa.eu/our-work-tools/our-documents/guidelines/guidelines-052020-consent-under-regulation-2016679_en">EDPB ガイドライン</a>に準拠）
- ユーザーはいつでもプライバシー設定から同意を撤回し、アカウントを削除できます
- 本評価は年 1 回、または処理に重大な変更があった場合にレビューされます
- 公開透明性のためこの URL に掲載されています

---

<span class="section-label">第 5 節</span>
## 決定

<div class="callout callout-green">
  上記の評価に基づき、すべての残余リスクは<strong>低</strong>です。処理は特定された法的根拠のもと、文書化された保護措置を講じて実施できます。監督機関への事前協議は不要です。
</div>

---

<span class="section-label">レビューログ</span>
## バージョン履歴

| 日付 | バージョン | 変更内容 |
|----|---------|--------|
| 2026 年 3 月 | 1.0 | 音声文字起こしパイプライン、同意画面設計、リスク評価、法的根拠の文書化を網羅したローンチ前初期評価 |

---

</div>
