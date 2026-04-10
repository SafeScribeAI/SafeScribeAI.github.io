---
layout: default
title: SafeScribe — プライバシー最優先のAI音声文字起こし
description: 他の文字起こしアプリはあなたの録音を何日も保持します。私たちは？ゼロ秒。RAM専用処理、AIボーカル分離による高精度、テキスト受信と同時に削除。
lang: ja
---

<div class="hero">
  <div class="hero-icon">&#x1f512;</div>
  <h1>SafeScribe</h1>
  <p class="hero-tagline">他の文字起こしアプリはあなたの録音を何日も保持します。<br>私たちは？ゼロ秒。</p>
  <p style="font-size:0.95rem;color:var(--color-text-secondary);margin:0 auto 1.5rem;max-width:520px;">RAM専用処理。AIボーカル分離による高精度。テキスト受信と同時に削除。</p>
  <p style="font-size:0.85rem;color:var(--color-text-secondary);margin:0 auto 0;max-width:600px;font-style:italic;">プライバシーとは私たちが従うポリシーではなく、私たちが構築した構造です。保存されなかったデータを召喚令状で取得することはできません。</p>
  <div class="cta-group">
    <a class="cta-btn cta-btn-primary" href="#pricing">&#x1f3a4; 料金を見る</a>
    <a class="cta-btn cta-btn-secondary" href="security">&#x1f6e1; データ保護の仕組み</a>
  </div>
  <p style="font-size:0.8rem;color:var(--color-text-secondary);margin-top:0.5rem;">App Store・Google Playで近日公開。</p>
</div>

---

<span class="section-label">違い</span>
## SafeScribe と他サービスの比較

<div class="comparison-table" markdown="0">
<table>
  <thead>
    <tr>
      <th>機能</th>
      <th>SafeScribe</th>
      <th>Otter.ai</th>
      <th>Fireflies</th>
      <th>Good Tape</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>RAM専用処理</td>
      <td class="yes">はい</td>
      <td class="no">いいえ</td>
      <td class="no">いいえ</td>
      <td class="no">いいえ</td>
    </tr>
    <tr>
      <td>音声の即時削除</td>
      <td class="yes">はい</td>
      <td class="no">30日間</td>
      <td class="no">手動</td>
      <td class="yes">はい</td>
    </tr>
    <tr>
      <td>サーバーから文字起こし削除</td>
      <td class="yes">はい</td>
      <td class="no">いいえ</td>
      <td class="no">いいえ</td>
      <td class="no">いいえ</td>
    </tr>
    <tr>
      <td>メールアドレスをサーバーに保存</td>
      <td class="yes">いいえ（ハッシュのみ）</td>
      <td class="no">はい</td>
      <td class="no">はい</td>
      <td class="no">はい</td>
    </tr>
    <tr>
      <td>AIボーカル分離</td>
      <td class="yes">はい</td>
      <td class="no">いいえ</td>
      <td class="no">いいえ</td>
      <td class="no">いいえ</td>
    </tr>
    <tr>
      <td>デバイス上での前処理</td>
      <td class="yes">はい</td>
      <td class="no">いいえ</td>
      <td class="no">いいえ</td>
      <td class="no">いいえ</td>
    </tr>
    <tr>
      <td>召喚令状で取得可能なデータ</td>
      <td class="yes">いいえ</td>
      <td class="no">はい</td>
      <td class="no">はい</td>
      <td class="partial">一部</td>
    </tr>
  </tbody>
</table>
</div>

---

<span class="section-label">仕組み</span>
## シンプルな3ステップ

<div class="steps">
  <div class="step">
    <div class="step-number">1</div>
    <div class="step-icon">&#x1f3a4;</div>
    <h3>録音またはファイルを選択</h3>
    <p>アプリ内で直接録音するか、デバイスから音声／動画ファイルを選択します。MP3、WAV、M4A、MP4などに対応。</p>
  </div>
  <div class="step">
    <div class="step-number">2</div>
    <div class="step-icon">&#x1f9e0;</div>
    <h3>AIがメモリ内で文字起こしを実行</h3>
    <p>最先端の音声認識AIがサーバー上で音声を処理します — すべてRAM内で完結。ディスクへの書き込みは一切ありません。</p>
  </div>
  <div class="step">
    <div class="step-number">3</div>
    <div class="step-icon">&#x1f4c4;</div>
    <h3>テキストを受け取り、データは即時削除</h3>
    <p>整合性検証を経てテキストがデバイスに届きます。サーバー上のすべてのデータは即座に完全消去されます。</p>
  </div>
</div>

---

<span class="section-label">私たちの約束</span>
## 14のプライバシー約束
{: #privacy-promises}

以下の各項目はポリシーだけでなく、コードによって強制されています。それぞれに技術的な根拠へのリンクがあります。

<span class="section-label">コアアーキテクチャ</span>

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>RAM専用処理</strong><span class="item-desc">音声は文字起こし中のみ揮発性メモリに存在します — ディスクには一切書き込まれません。 <a href="security#layer-2">詳しく →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>カスケード削除 + フェイルセーフ</strong><span class="item-desc">各ステップが前のステップのデータを削除します。コードが失敗した場合、データはTTLで自動消滅します。 <a href="security#layer-6">詳しく →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>自社ホスティングAI</strong><span class="item-desc">音声はOpenAI、Google、その他いかなる第三者サービスにも届きません。自社インフラを運用しています。 <a href="security#layer-2">詳しく →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>整合性検証</strong><span class="item-desc">すべての文字起こしはSHA-256チェックサムを持ち、改ざんなく届いたことを確認できます。 <a href="security#layer-1">詳しく →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>再ダウンロード不可</strong><span class="item-desc">文字起こしを受け取った後、サーバーには何も残りません。「もう一度ダウンロード」は存在しません。 <a href="security#layer-6">詳しく →</a></span></span></li>
</ul>

<span class="section-label">収集しないもの・しないこと</span>

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>メールアドレスや氏名 — 一切保存しません</strong><span class="item-desc">アカウントIDの一方向ハッシュのみ保持します。逆算してあなたの身元を特定することはできません。 <a href="privacy#sign-in">詳しく →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>IPアドレス — 一切記録しません</strong><span class="item-desc">レート制限のために一時的に（ハッシュとして）使用した後、破棄します。どのログにも記録されません。 <a href="privacy#zero-disk">詳しく →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>録音 — 学習に一切使用しません</strong><span class="item-desc">音声は文字起こし直後に削除されます。コピーなし、アーカイブなし、学習データセットなし。 <a href="privacy#zero-disk">詳しく →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>プロファイリングや自動判断なし</strong><span class="item-desc">スコアリング、ランク付け、自動判断を一切行いません。 <a href="privacy#your-rights">詳しく →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>行動追跡なし</strong><span class="item-desc">分析SDKはゼロ。Mixpanelなし、Firebase Analyticsなし、トラッカー一切なし。 <a href="privacy#third-parties">詳しく →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>連絡先・位置情報・生体情報なし</strong><span class="item-desc">マイクのアクセス許可のみ要求します — デバイスから他は何も。 <a href="privacy#no-collect">詳しく →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>支払い情報 — 私たちには見えません</strong><span class="item-desc">支払いはAppleまたはGoogleが全て処理します。購入レシートを受け取るだけです。 <a href="privacy#billing">詳しく →</a></span></span></li>
</ul>

<span class="section-label">転送データの保護方法</span>

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>AES-256 + ハードウェアバックの鍵</strong><span class="item-desc">デバイス上の文字起こしは暗号化されています。鍵はiOS KeychainまたはAndroid Keystoreに保存されます。 <a href="security#layer-4">詳しく →</a></span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>クラッシュレポート：デフォルトでオフ</strong><span class="item-desc">任意。有効にした場合、デバイスを離れる前に個人データが自動的に除去されます。 <a href="security#layer-5">詳しく →</a></span></span></li>
</ul>

---

<span class="section-label">こんな方に</span>
## 情報漏洩が許されない方のために

<div class="segment-cards">
  <div class="segment-card">
    <div class="segment-icon">&#x1f4f0;</div>
    <h4>ジャーナリスト</h4>
    <p>情報源は安全です — 約束するからではなく、アクセスできないからです。データ保持ゼロは強制開示リスクゼロを意味します。</p>
  </div>
  <div class="segment-card">
    <div class="segment-icon">&#x2696;&#xfe0f;</div>
    <h4>弁護士</h4>
    <p>弁護士・依頼者間秘匿特権レベルの文字起こし。サーバー上に発見可能なデータは一切ありません — 召喚対象も漏洩対象もありません。</p>
  </div>
  <div class="segment-card">
    <div class="segment-icon">&#x270a;</div>
    <h4>活動家</h4>
    <p>監視を寄せ付けない文字起こし。ログなし、プロファイルなし、痕跡なし。音声がテキストになり、あとは消えます。</p>
  </div>
  <div class="segment-card">
    <div class="segment-icon">&#x1f4bc;</div>
    <h4>ビジネスプロフェッショナル</h4>
    <p>高速・高精度で、すべてを忘れる文字起こし。会議メモ、インタビュー、口述 — 完全な安心感とともに。</p>
  </div>
</div>

---

<span class="section-label">信頼できる精度</span>
## 騒がしくても、正確に

すべての音声ファイルは最適化された処理パイプラインを通過します — デバイス上とサーバー上の両方で — — 最高の精度を実現します。

<div class="pipeline-steps">
  <div class="pipeline-step">
    <div class="pipeline-icon">&#x1f4f1;</div>
    <h4>デバイス上での最適化</h4>
    <p>ハイパスフィルタリング、先頭無音除去、LUFSラウドネス正規化（-16 LUFS、ASR向けに最適化）、ピークリミッティング、16 kHzリサンプリング — ロスレスFLACとしてエンコードしてからアップロード。</p>
  </div>
  <div class="pipeline-step">
    <div class="pipeline-icon">&#x1f3b5;</div>
    <h4>AIボーカル分離</h4>
    <p>音声分析がノイズや継続的なエネルギーを検出した場合に自動適用。背景音から音声を分離 — クリアな録音ではスキップされます。AI駆動の音源分離により、騒がしい環境での単語誤り率の大幅な削減が実証されています。</p>
  </div>
  <div class="pipeline-step">
    <div class="pipeline-icon">&#x1f6e1;</div>
    <h4>音声活動検出</h4>
    <p><a href="https://github.com/snakers4/silero-vad">Silero VAD</a>が音声区間を特定し、文字起こしを検出された音声区間のみに制限することで、無音部分でのAIハルシネーションを排除します。</p>
  </div>
</div>

<div class="callout callout-green">
  <strong>確立された標準に基づいています。</strong>当社のパイプラインは実績ある音声工学標準と査読済みの研究に基づいて構築されています — 任意のデフォルト値ではありません。その結果：困難な環境でも信頼できる文字起こし精度を実現します。
</div>

---

<span class="section-label">料金</span>
## シンプルな従量課金
{: #pricing}

サブスクリプションなし。隠れた料金なし。クレジットを購入して、いつでも使用できます。サブスクリプションサービスと異なり、使わない分に料金がかかることはありません。

<div class="pricing-grid">
  <div class="pricing-card">
    <div class="pricing-amount">$0.99</div>
    <div class="pricing-minutes">1時間</div>
    <div class="pricing-rate">$0.0165/分</div>
  </div>
  <div class="pricing-card popular">
    <div class="pricing-amount">$6.49</div>
    <div class="pricing-minutes">7時間</div>
    <div class="pricing-rate">$0.015/分</div>
  </div>
  <div class="pricing-card">
    <div class="pricing-amount">$12.99</div>
    <div class="pricing-minutes">15時間</div>
    <div class="pricing-rate">$0.014/分</div>
  </div>
  <div class="pricing-card">
    <div class="pricing-amount">$23.99</div>
    <div class="pricing-minutes">30時間</div>
    <div class="pricing-rate">$0.013/分</div>
  </div>
  <div class="pricing-card">
    <div class="pricing-amount">$44.99</div>
    <div class="pricing-minutes">60時間</div>
    <div class="pricing-rate">$0.012/分</div>
  </div>
  <div class="pricing-card">
    <div class="pricing-amount">$84.99</div>
    <div class="pricing-minutes">120時間</div>
    <div class="pricing-rate">$0.012/分</div>
  </div>
</div>


<div class="callout callout-info">
  <strong>当社のサーバー側の技術的なエラーにより文字起こしが完了しなかった場合、料金は一切かかりません。</strong>文字起こしが当社側で正常に完了した場合のみお支払いいただきます。決済はすべてApple App StoreまたはGoogle Playを通じて処理されます — お支払い情報を私たちが確認することはありません。
</div>

---

<span class="section-label">FAQ</span>
## よくある質問

<details class="faq-item">
  <summary>文字起こし後、音声はどうなりますか？</summary>
  <div class="faq-answer">完全に消えます。音声はサーバーのRAM（揮発性メモリ）内でのみ処理され、テキストが配信された瞬間に削除されます。ディスクコピーもバックアップも存在せず、復元する方法はありません。サーバーを物理的に押収しても、音声データは一切取得できません。</div>
</details>

<details class="faq-item">
  <summary>録音をAIの学習に使用しますか？</summary>
  <div class="faq-answer">一切使用しません。音声はテキストの生成という唯一の目的にのみ使用されます。保存、分析、モデルの学習や改善に使用されることは決してありません。独自のAIインフラを運用しており、データがサードパーティのAIサービスに送られることはありません。</div>
</details>

<details class="faq-item">
  <summary>お支払い情報やカード情報を確認できますか？</summary>
  <div class="faq-answer">できません。すべての決済はApple App StoreまたはGoogle Playを通じて処理されます。残高確認のための購入レシートのみを受け取ります — カード番号やお支払い詳細を確認、受け取り、保存することは一切ありません。</div>
</details>

<details class="faq-item">
  <summary>対応言語は？</summary>
  <div class="faq-answer">オープンソースの<a href="https://github.com/openai/whisper#available-models-and-languages">Whisper音声認識モデル</a>は100 の言語に対応し、自動言語検出機能を備えています。精度向上のため、文字起こし前に手動で言語を選択することも可能です。</div>
</details>

<details class="faq-item">
  <summary>どのファイル形式に対応していますか？</summary>
  <div class="faq-answer">MP3、WAV、FLAC、M4A、OGG、Opus、AAC、WMA、MP4、MOV。ファイルサイズは最大50 MB、長さは最大2時間まで。</div>
</details>

<details class="faq-item">
  <summary>データはどのように暗号化されますか？</summary>
  <div class="faq-answer">通信中：TLS 1.2+暗号化がデバイスとSafeScribeサーバー間のデータを保護します。デバイス上：文字起こしはAES-256暗号化コンテナに保存され、鍵はスマートフォンのセキュアハードウェア（iOS Keychain / Android Keystore）で保護されています。</div>
</details>

<details class="faq-item">
  <summary>すべてのデータを削除できますか？</summary>
  <div class="faq-answer">はい。アプリ内から個別の文字起こしまたはアカウント全体を削除できます。アカウント削除により、ログインID、すべてのローカルデータ、残りのクレジット残高が完全に削除されます。処理後にサーバーが個人データを保持しないため、サーバー側で削除するものはありません。</div>
</details>

<details class="faq-item">
  <summary>IPアドレスを記録していますか？</summary>
  <div class="faq-answer">記録しません。IPアドレスは保存またはログに記録されることはありません。当社のアーキテクチャはコードレベルでこれを強制しています — ログシステムはIPがログ出力に到達する前に削除するよう明示的に設定されています。内部操作にはすべて仮名識別子（ログインIDの一方向SHA-256ハッシュ）を使用します。このハッシュは逆算してお客様のIDを明らかにすることはできません。</div>
</details>

<details class="faq-item">
  <summary>プライバシーに関する主張をどう検証できますか？</summary>
  <div class="faq-answer">完全な<a href="security">セキュリティアーキテクチャ</a>と<a href="dpia">データ保護影響評価</a>を技術的な透明性のために公開しています。ネットワーク分析ツール（Wiresharkなど）を使用して、すべての通信がTLS暗号化されていること — メール、氏名、個人識別子がリクエストに含まれないこと — を確認することも可能です。</div>
</details>

<details class="faq-item">
  <summary>デバイス上の前処理はどのように精度を向上させますか？</summary>
  <div class="faq-answer">アップロード前に、SafeScribeはデバイス上でオーディオフィルターチェーンを適用します：200 Hzのハイパスフィルタリングでこもり音や背景ノイズを除去し、LUFSラウドネス正規化（-16 LUFS）でWhisper向けに音量を最適化し、ダイナミックレンジ圧縮で音量の変動を均一にします。サーバー上の音声活動検出と組み合わせることで、難しい録音からもクリーンで正確なテキストが得られます。</div>
</details>

---

<div class="callout callout-info" style="margin-top:1.5rem;">
  <p style="margin:0 0 0.5rem;"><strong>アプリストアのプライバシーラベル</strong> — App Store と Google Play のプライバシーラベルは、ここに記載された内容を正確に反映しています。</p>
  <p style="margin:0;"><strong>脆弱性の報告</strong> — セキュリティ上の問題を発見した場合は、<a href="mailto:security@safescribe.dev">security@safescribe.dev</a> までご連絡ください。</p>
</div>

<p style="font-size:0.8rem;color:var(--color-text-secondary);margin-top:1rem;">SafeScribeはOpenAIの<a href="https://github.com/openai/whisper">Whisper</a>モデルウェイトをオープンソースの<a href="https://github.com/SYSTRAN/faster-whisper">faster-whisper</a>ライブラリ（SYSTRAN、MITライセンス）経由で使用しています。SafeScribeはOpenAIと提携・推薦・後援関係にはありません。</p>

---

