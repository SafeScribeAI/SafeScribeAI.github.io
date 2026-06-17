---
layout: default
title: SafeScribe — プライバシーポリシー
description: SafeScribeが収集するデータ、処理方法、およびお客様の権利。
lang: ja
---

<div class="page-content" markdown="1">

# プライバシーポリシー

<div class="summary-box">
  <strong>わかりやすく説明すると：</strong>音声をサーバーメモリで処理して文字起こしを作成した後、即座に削除します。音声をディスクに保存したり、AIのトレーニングに使用したり、第三者と共有したりすることは一切ありません。文字起こしはデバイス上で暗号化して保存され、お客様が管理します。保持するのは仮名の請求記録のみです。
</div>

<p class="page-meta">最終更新：March 2026</p>

---

<span class="section-label">絶対にしないこと</span>
## 収集・保存しないデータ
{: #data-we-dont-collect-or-store}

<ul class="dont-list">
  <li><span class="x-mark">&#x2717;</span> 音声をディスクに保存する — 絶対に</li>
  <li><span class="x-mark">&#x2717;</span> メールアドレスや氏名を保存する</li>
  <li><span class="x-mark">&#x2717;</span> IPアドレスを記録・保存する</li>
  <li><span class="x-mark">&#x2717;</span> 録音をAIモデルのトレーニングに使用する</li>
  <li><span class="x-mark">&#x2717;</span> 広告主やデータブローカーとデータを共有する</li>
  <li><span class="x-mark">&#x2717;</span> アプリやセッションをまたいで行動を追跡する</li>
  <li><span class="x-mark">&#x2717;</span> 連絡先、位置情報、生体データを収集する</li>
  <li><span class="x-mark">&#x2717;</span> アカウント削除後もデータを保持する</li>
</ul>

---

<span class="section-label">保存するもの</span>
## 収集するデータ

### サーバー側（アカウント削除まで永続）

| データ | 目的 |
|------|---------|
| 仮名ユーザーID（アカウントIDのSHA-256ハッシュ） | アカウント識別 — 逆算不可 |
| 仮名デバイス識別子（デバイス属性のSHA-256ハッシュ） | 不正利用防止 — 逆算不可 |
| アカウント残高（USD） | クレジット管理 |
| 残り無料文字起こし分数 | ウェルカムボーナスの追跡 |
| アカウント作成・最終更新タイムスタンプ | アカウント管理 |

**ジョブごとの記録**（完了した文字起こしごとに保存）：

| データ | 目的 |
|------|---------|
| 音声時間（秒） | サービス分析 |
| ファイルサイズ（バイト） | サービス分析 |
| 単語数 | サービス分析 |
| 請求金額（USD） | 請求記録 |
| 処理タイムスタンプ | サービス分析 |

<div class="callout callout-info">
  <strong>ジョブごとの記録には音声コンテンツも文字起こしテキストも含まれません。</strong>これらの記録にはメタデータ（数値とタイムスタンプ）のみが含まれます — お客様が話した内容は含まれません。
</div>

### サーバー側（一時的 — 処理後に削除）

| データ | 削除タイミング |
|------|-------------|
| 音声ファイル | 文字起こし完了直後 |
| 文字起こしテキスト | 受信確認後 |

### デバイス上（暗号化）

| データ | 保持期間 |
|------|-----------|
| 文字起こし（テキスト、セグメント、メタデータ） | 削除するまで |
| オフラインアップロードキュー | アップロード成功後に削除 |
| アプリ設定と同意記録 | ログアウトまたはアカウント削除まで |
| 暗号化鍵 | iOS Keychain / Android Keystore — アプリ削除時に消去 |

### オプション（受け入れ時のみ）

| データ | 目的 |
|------|---------|
| クラッシュレポート | SafeScribe自社のクラッシュレポートエンドポイントによるアプリ安定性 — 送信前にすべての個人情報を削除 |
| フィードバックと問題報告 | 製品改善 — お客様が送信を選択した評価、バグ報告、苦情または提案。自由記述テキストは保存前にサーバー側で個人情報を削除し、お客様の仮名ユーザーハッシュとのみ紐付けて保持します（氏名、メールアドレス、IPアドレスは含みません）。最長24か月保持し、その後自動的に消去します。 |

<div class="callout callout-green">
  <strong>サーバーはお客様の氏名、メールアドレス、IPアドレス、音声コンテンツ、文字起こしテキストを一切保存しません。</strong>お客様のアカウントに紐付く唯一の永続的な記録は、不可逆のユーザーハッシュ値、仮名デバイス識別子、クレジット残高、使用統計（数値のみ — コンテンツなし、個人識別情報なし）、およびお客様が送信を選択したフィードバック（個人情報削除済み）です。報告に返信する場合、その返信はお客様のユーザーハッシュに照合された一度限りのアプリ内メッセージとしてのみ届きます — 当社がお客様の身元を知ることは一切ありません。
</div>

---

<span class="section-label">完全削除</span>
## アプリを削除する vs. アカウントを削除する

これらは異なる結果をもたらす2つの独立した操作です：

| 操作 | 結果 | 残高 |
|--------|-------------|-------------|
| **アプリを削除** | ローカルの文字起こしと暗号化鍵がデバイスから削除される | サーバーに保持 — 同じアカウントで再インストール・ログインすると完全に復元 |
| **アカウントを削除** | すべてのサーバー側レコードが永久削除 — 取り消し不可 | 失われる |

<div class="callout callout-info">
  <strong>いつでも再インストール可能。</strong>アカウントを削除せずにアプリを削除した場合、再インストールして同じGoogleまたはAppleアカウントでログインすると、残高とアクセス権が完全に復元されます — 追加の操作は不要です。
</div>

### アカウント削除 — あなたを特定できるものは何も残りません

プライバシー設定からアカウントを削除すると、あなたの身元に紐づくすべてのサーバー側レコードが完全に削除されます：

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>仮名ユーザーID</strong><span class="item-desc">完全に削除</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>クレジット残高</strong><span class="item-desc">完全に削除</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>残りの無料時間</strong><span class="item-desc">完全に削除</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>ジョブごとの統計</strong><span class="item-desc">即時に匿名化 — 共有の DELETED_USER マーカーに付け替えられ、2年後に自動消去</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>仮名デバイス識別子</strong><span class="item-desc">ソルト付き一方向ハッシュに縮約され最長2年保持 — ウェルカムクレジットの再取得悪用を防止。逆算もあなたへの紐付けも不可能</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>日次バックアップ</strong><span class="item-desc">24時間以内に上書き — 識別可能なコピーはどこにも残りません</span></span></li>
</ul>

削除の瞬間に、あなたの身元へのリンクはすべて破棄されます。<em>身元との関連を一切持たない</em>2つの限定的なカテゴリーのみが一時的に保持されます：財務記録（購入額・利用額）は DELETED_USER マーカーに匿名化され、消費者紛争の時効（トルコ債務法第146条）に基づき2年間保持されます。また、ソルト付き一方向デバイスハッシュは無料クレジットの重複付与を防ぐため最長2年間保持されます（GDPR第6条1項(f)・正当な利益）。いずれも期限が切れると自動的に消去されます。唯一の日次バックアップは削除後24時間以内に上書きされます。

アプリ内での削除操作は、GDPRの第17条およびKVKKの第11条(e)に基づく削除権の正式な行使となります。アカウントにアクセスできない場合は、**privacy@safescribe.dev** までメールでの削除リクエストをお送りください。

---

<span class="section-label">音声処理</span>
## ゼロディスクポリシー

<div class="flow-diagram">
音声：  アップロード --> RAM --> AI文字起こし --> 配信 --> 削除
                                                         （即座）

ディスク：残高記録のみ — 音声なし、文字起こしなし、メールなし
</div>

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>RAMのみ</strong><span class="item-desc">音声は揮発性メモリのみで処理</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>ディスクへの書き込みなし</strong><span class="item-desc">一時的であっても</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>AIトレーニングなし</strong><span class="item-desc">音声はモデル改善に使用されない</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>自社ホスティングAI</strong><span class="item-desc">第三者AIサービスが音声を受け取ることはない</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>TTLセーフガード</strong><span class="item-desc">削除コードが失敗してもデータが自動消滅</span></span></li>
</ul>

---

<span class="section-label">認証</span>
## GoogleまたはAppleでサインイン

Google Sign-InとSign in with AppleによるOpenID Connect (OIDC)を使用しています。

| プロバイダーから受け取るもの | 当社の対応 |
|---------------------------|-------------------|
| アカウントID | ハッシュ化（SHA-256 + ソルト） — 元の値は破棄 |
| メールアドレス | 認証にのみ使用 — **保存しない** |
| 表示名 | **保存しない** |

連絡先、カレンダー、その他のアカウントデータにはアクセスしません。

---

<span class="section-label">支払い</span>
## アプリストア経由の課金

支払いはApple App StoreまたはGoogle Play Storeが完全に処理します。SafeScribeはクレジットカード番号や支払い詳細を**受け取り、保存、または処理することは一切ありません**。残高確認のために購入レシートのみを受け取ります。

<div class="callout callout-info">
  <strong>AppleまたはGoogleが保持する支払い記録</strong>はSafeScribeの管理外であり、SafeScribeのアカウント削除プロセスの対象外です。これらの記録を管理するには、<a href="https://support.apple.com">Appleサポート</a>または<a href="https://support.google.com/googleplay">Google Playサポート</a>に直接お問い合わせください。
</div>

---

<span class="section-label">エラー追跡</span>
## クラッシュレポート（オプション）

オプションのクラッシュレポートはSafeScribe自社のクラッシュレポートエンドポイントに送信されます。**デフォルトでオフ**になっており、いつでもプライバシー設定で変更できます。

レポートが送信される前に、以下が自動的に削除されます：

**削除：**メールアドレス · 電話番号 · IPアドレス · ファイルパス · 認証トークン

**保持：**エラータイプとスタックトレース · デバイスモデル · OSバージョン · アプリバージョン

---

<span class="section-label">第三者サービス</span>
## 第三者サービス

当社は以下のサービスを使用しています。記載された内容を超えた音声、文字起こしコンテンツ、または個人情報は、いかなる第三者とも共有されません。

| サービス | 目的 | 共有データ | プライバシーポリシー |
|---------|---------|------------|---------------|
| Google Sign-In | 認証 | OIDCトークンのみ | [policies.google.com/privacy](https://policies.google.com/privacy) |
| Apple Sign-In | 認証 | OIDCトークンのみ | [apple.com/legal/privacy](https://www.apple.com/legal/privacy/) |
| Apple App Store | アプリ内購入 | 購入レシートのみ | [apple.com/legal/privacy](https://www.apple.com/legal/privacy/) |
| Google Play Store | アプリ内購入 | 購入レシートのみ | [policies.google.com/privacy](https://policies.google.com/privacy) |
| SafeScribeクラッシュレポートエンドポイント | クラッシュレポート（オプトイン） | 匿名エラーレポート — 個人情報削除済み | SafeScribeが自社運営、第三者なし |

---

<span class="section-label">法的根拠</span>
## 処理の法的根拠

| 処理活動 | GDPR根拠 | KVKK 根拠（トルコ） | 必須？ |
|--------------------|-----------|-----------|---------|
| 音声文字起こし | 第6(1)(b)条 — 契約 | 明示的同意 | サービス利用に必須 |
| アカウント・課金 | 第6(1)(b)条 — 契約 | 契約履行 | サービス利用に必須 |
| 認証（OIDC） | 第6(1)(b)条 — 契約 | 契約履行 | サービス利用に必須 |
| アプリ内購入 | 第6(1)(b)条 — 契約 | 契約履行 | 購入に必須 |
| クラッシュレポート | 第6(1)(a)条 — 同意 | 明示的同意 | オプション |

文字起こし、認証、課金のためのデータ提供はSafeScribeの利用に**必須**です。クラッシュレポートは**オプション** — サービスはそれなしで完全に機能します。

---

<span class="section-label">お客様の権利</span>
## お客様にできること

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>アクセス</strong><span class="item-desc">いつでもアプリ内ですべての文字起こしを確認</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>削除</strong><span class="item-desc">プライバシー設定から個別の文字起こしまたはアカウント全体を削除；アカウント削除はいかなるデータベースにも行を残しません</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>エクスポート</strong><span class="item-desc">文字起こしを共有・エクスポート、またはプライバシー設定から完全なデータエクスポートをリクエスト</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>診断を拒否</strong><span class="item-desc">プライバシー設定でクラッシュレポートをオフにする</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>同意の撤回</strong><span class="item-desc">いつでもログアウトしてアカウントを削除</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>CCPAオプトアウト</strong><span class="item-desc">プライバシー設定で「販売・共有しない」を切り替える</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>自動化された意思決定なし</strong><span class="item-desc">法的または類似の重大な影響をもたらすプロファイリングを含め、お客様に関する自動化された意思決定は一切行いません（GDPR第22条）</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>苦情の申し立て</strong><span class="item-desc">EU/EEA居住者は各国の監督機関に連絡できます（<a href="https://www.edpb.europa.eu/about-edpb/about-edpb/members_en">edpb.europa.eu</a>）；トルコ居住者はKVKKに連絡できます（<a href="https://www.kvkk.gov.tr">kvkk.gov.tr</a>）</span></span></li>
</ul>

アプリ内で完了できないリクエストは **privacy@safescribe.dev** までお問い合わせください。

---

<span class="section-label">法的事項</span>
## 追加情報

**データ管理者。**SafeScribeはトルコを拠点とする独立した開発者によって運営されています。連絡先：privacy@safescribe.dev。データ保護責任者（DPO）は任命されていません — 処理は大規模に行われておらず、特別カテゴリのデータは体系的に保持されていません（音声はRAMのみで一時的に処理され、ディスクには保存されません）。

**バックアップ。**サービス継続性のため、アカウントレコード（仮名ID、残高、使用統計）の単一の日次バックアップが保持されます。各バックアップは前のものを上書きします。アカウント削除によって削除されたデータはライブシステムから即時に、バックアップからは24時間以内に削除されます。

**国際送信。**EU/EEAからSafeScribeをご利用の場合、音声とアカウントデータはトルコのサーバーで処理されます。トルコは現在<a href="https://commission.europa.eu/law/law-topic/data-protection/international-dimension-data-protection/adequacy-decisions_en">EUの十分性認定</a>を受けていません；転送は初回起動時のお客様の明示的な十分な情報に基づく同意によってカバーされます（GDPR第49(1)(a)条）。トルコ（KVKK — トルコ個人データ保護法）ユーザーの場合、国境を越えた転送はKVKK第9条に基づく初回起動時の明示的な同意によって承認されます。

**お子様について。**SafeScribeはApp StoreおよびGoogle Playで17歳以上向けに評価されており、17歳未満のお子様向けではありません。未成年者からのデータを意図的に収集することはありません。法律上の完全な権利能力年齢が18歳となっている法域（トルコを含む）では、17歳のユーザーはアプリを使用する前に保護者の同意が必要です。

**ポリシーの変更。**当社の取り組みが変更された場合、このページを更新します。上記の「最終更新」日付は最新の改訂を反映しています。

---

<span class="section-label">お問い合わせ</span>
## 連絡先

| 件名 | 連絡先 |
|-------|---------|
| プライバシーリクエスト、データ削除、権利 | privacy@safescribe.dev |
| セキュリティの脆弱性 | security@safescribe.dev |
| 一般サポート | support@safescribe.dev |

---


</div>
