---
layout: default
title: SafeScribe — Veri Koruma Etki Değerlendirmesi
description: SafeScribe'ın ses transkripsiyon hizmeti için GDPR ve KVKK kapsamında resmi risk değerlendirmesi.
lang: tr
---

<div class="page-content" markdown="1">

# Veri Koruma Etki Değerlendirmesi

<div class="summary-box">
  <strong>Temel bulgu:</strong> Ses geçici bellekte işlenip hemen silindiğinden ve işlem sonrasında sunucularımızda hiçbir kişisel veri kalmadığından, tüm tanımlanan riskler azaltma önlemleri uygulandıktan sonra <strong>Düşük</strong> düzeye indirilmiştir. İşleme, belgelenen hukuki dayanaklar ve güvenlik önlemleriyle sürdürülebilir.
</div>

<p class="page-meta">SafeScribe AI Ses Transkripsiyon · Sürüm 1.0 · Mart 2026 · Yayın öncesi değerlendirme · İnceleme tarihi: Yayından 6 ay sonra</p>

---

<span class="section-label">Bölüm 1</span>
## İşleme Açıklaması

### Ne işliyoruz ve neden

| Amaç | İşlenen Veri | Hukuki Dayanak (GDPR) | KVKK Dayanağı |
|------|-------------|----------------------|--------------|
| Ses transkripsiyonu | Ses dosyası (yalnızca RAM, işlem sonrası silinen) | Mad. 6(1)(b) — Sözleşme ifası | Açık rıza |
| Hesap ve faturalandırma | Takma adlı kullanıcı kimliği, bakiye, kullanım meta verisi | Mad. 6(1)(b) — Sözleşme ifası | Açık rıza |
| Kimlik doğrulama | OIDC hesap kimliği (karma, orijinal atılan) | Mad. 6(1)(b) — Sözleşme ifası | Sözleşme ifası |
| Uygulama içi satın alma | App Store / Play Store'dan IAP makbuzu | Mad. 6(1)(b) — Sözleşme ifası | Sözleşme ifası |
| Yaş doğrulama | Kullanıcı beyanıyla yaş onayı (17+) | Mad. 8 GDPR / KVKK Mad. 6 | Yasal yükümlülük |
| Kilitlenme raporlama | Anonimleştirilmiş hata raporları (katılım, KKV gizlenmiş) | Mad. 6(1)(a) — Rıza | Açık rıza |

### Veri envanteri

| Veri | Sunucuda Saklama |
|------|-----------------|
| Ses dosyası | Yalnızca RAM — transkripsiyon sonrası silinir |
| Transkript metni | İstemci onayına kadar (istemci onay vermezse 24 saatlik sunucu TTL güvenlik kilidi) |
| Takma adlı kullanıcı kimliği | Hesap silinene kadar |
| Hesap bakiyesi + kullanım meta verisi | Hesap silinene kadar |
| E-posta adresi | Yalnızca iletim — **saklanmıyor** |
| IP adresleri | Yalnızca iletim — **günlüğe kaydedilmiyor** |
| Kilitlenme raporları (katılım) | SafeScribe'ın kendi kilitlenme raporlama uç noktası — üçüncü taraflarla paylaşılmaz |

<p>Tam veri envanteri ayrıntıları için bkz. <a href="privacy#data-we-collect">Gizlilik Politikası § Topladığımız Veriler</a>.</p>

<div class="callout callout-info">
  <strong>İş başına meta veri</strong> şunları içerir: ses süresi (saniye), dosya boyutu (bayt), kelime sayısı, tahsil edilen ücret (USD) ve işleme zaman damgaları. Ses içeriği, transkript metni veya kullanıcıyı tanımlamaya elverişli bilgi içermez.
</div>

<div class="callout callout-info">
  <strong>Yedek saklama.</strong> Hizmet sürekliliği için hesap kayıtlarının tek günlük yedeği tutulmaktadır. Her yedek bir öncekinin üstüne yazılır. Hesap silme işlemiyle silinen veriler canlı sistemlerden hemen, yedekten ise 24 saat içinde kaldırılır — bu sürenin ötesinde hiçbir kopya kalmaz.
</div>

### İşleme akışı

<div class="flow-diagram">
1. Kullanıcı cihazında ses kaydeder veya seçer
2. Ses cihazda ön işlemden geçer (80 Hz yüksek geçişli filtre, baştaki sessizlik kırpma, -16 LUFS hedefli ses normalizasyonu (konuşma için optimize edilmiş) — tepe sınırlama, 16 kHz yeniden örnekleme, FLAC kodlama)
3. SafeScribe sunucularına şifreli yükleme (TLS 1.3)
4. Sunucu sesi RAM'de işler — kendi barındırılan, <a href="https://github.com/SYSTRAN/faster-whisper">faster-whisper</a> / CTranslate2 aracılığıyla Whisper ailesinden güçlü bir model, üçüncü taraf API çağrısı yok
5. Transkript SHA-256 bütünlük sağlamasıyla döndürülür
6. İstemci sağlamayı doğrular, teslimi onaylar
7. Sunucu transkripti ve sesi RAM'den hemen siler
8. Transkript cihazda AES-256 şifreli depoda saklanır
</div>

---

<span class="section-label">Bölüm 2</span>
## Gereklilik ve Orantılılık

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span> <strong>Ses yüklemesi zorunludur</strong> sunucu taraflı yapay zeka işlemesi, SafeScribe'ın gerektirdiği kalite düzeyinde mevcut cihaz üzerindeki alternatiflere göre daha yüksek doğruluk sağlar</li>
  <li><span class="check-mark">&#x2713;</span> <strong>Kimlik doğrulama zorunludur</strong> kullanıcı başına faturalandırma ve iş izolasyonu için gereklidir</li>
  <li><span class="check-mark">&#x2713;</span> <strong>Kilitlenme raporlama orantılıdır</strong> KKV iletimden önce gizlenir; yalnızca katılım ile etkindir</li>
  <li><span class="check-mark">&#x2713;</span> <strong>Veri en aza indirilmiştir</strong> ses yalnızca RAM'de işlenir, diske hiç yazılmaz</li>
  <li><span class="check-mark">&#x2713;</span> <strong>Saklama en aza indirilmiştir</strong> transkriptler onay üzerine anında silinir; istemci hiçbir zaman onay vermezse 24 saatlik sunucu TTL güvenlik kilidi devreye girer</li>
  <li><span class="check-mark">&#x2713;</span> <strong>İkincil kullanım yok</strong> ses hiçbir zaman model eğitimi veya analitikte kullanılmaz</li>
</ul>

### Veri sahibi hakları

Tüm GDPR ve KVKK veri sahibi hakları (erişim, düzeltme, silme, kısıtlama, taşınabilirlik, itiraz ve rızayı geri çekme) uygulama içinden veya privacy@safescribe.dev ile iletişime geçilerek kullanılabilir. Veri sahibi hakları ve bunların uygulanması <a href="privacy#what-you-can-do">Gizlilik Politikası § Yapabilecekleriniz</a> bölümünde ayrıntılı olarak ele alınmaktadır.

---

<span class="section-label">Bölüm 3</span>
## Risk Değerlendirmesi

### Tanımlanan riskler ve azaltma önlemleri

| Risk | Doğal | Azaltma | Artık |
|------|-------|---------|-------|
| Ses hassas kişisel veri içerir (sağlık, hukuk, finans) | **Yüksek** | Yalnızca RAM'de işleme; anında silme; kalıcı depolama yok; üçüncü taraf erişimi yok | **Düşük** |
| İletim sırasında transkripte yetkisiz erişim | Orta | Üretim derlemelerinde zorunlu TLS 1.3; SHA-256 bütünlük sağlaması | **Düşük** |
| Sunucu taraflı ihlal — ses veya transkript ifşası | Orta | Kalıcı ses depolaması yok; kimlik doğrulamalı API; kullanıcı başına iş izolasyonu; TTL güvenlik kilidi | **Düşük** |
| Yerel şifreli depolamaya yetkisiz erişim | Düşük | AES-256 şifreli kaplar; anahtar iOS Keychain / Android Keystore'da | **Düşük** |
| Kilitlenme raporları üzerinden KKV sızıntısı | Düşük | E-posta, telefon, IP ve token'ların örüntü tabanlı gizlenmesi, SafeScribe'ın kendi kilitlenme raporlama uç noktasına gönderilmeden önce | **Düşük** |
| Sınır ötesi veri aktarımı | Orta | İlk açılışta KVKK açık rızası; ilk açılışta GDPR Mad. 49(1)(a) açık bilgilendirilmiş rıza | **Düşük** |
| Yapay zekanın hassas içeriği yanlış yazıya dökmesi | Düşük | Transkripsiyon yalnızca bilgilendirme amaçlıdır; kullanıcı tüm çıktıyı inceler; otomatik karar yoktur | **Düşük** |

<div class="callout callout-green">
  <strong>Tüm artık riskler Düşük düzeydedir.</strong> Birincil risk etkeni — hassas ses içeriği — mimari düzeyde ele alınmıştır: ses hiçbir zaman diske yazılmaz, işlemenin ötesinde tutulmaz ve üçüncü taraflarla paylaşılmaz.
</div>

---

<span class="section-label">Bölüm 4</span>
## Onay ve Şeffaflık

Kullanıcılara ilk kullanımdan önce dört bağımsız karttan oluşan ayrıntılı bir onay ekranı sunulur:

<div class="infra-grid">
  <div class="infra-item">
    <div class="infra-icon">&#x1f3a4;</div>
    <h4>Ses İşleme <em class="u-label-light">(zorunlu)</em></h4>
    <p>Yalnızca RAM'de işleme, anında silme ve sesin hiçbir zaman diske yazılmadığı ya da üçüncü taraflarla paylaşılmadığı açıklanır.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f4ca;</div>
    <h4>Saklanan Veriler <em class="u-label-light">(zorunlu)</em></h4>
    <p>Hangi kalıcı verilerin tutulduğu açıklanır: takma adlı hesap kimliği, kredi bakiyesi ve anonim kullanım meta verisi.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f9d2;</div>
    <h4>Yaş Doğrulama <em class="u-label-light">(zorunlu)</em></h4>
    <p>Kullanıcının 17 yaşında veya daha büyük olduğunu doğrular. Zorunlu kartlar devam etmek için kabul edilmelidir.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f41b;</div>
    <h4>Kilitlenme Raporları <em class="u-label-light">(isteğe bağlı)</em></h4>
    <p>Anonim kilitlenme raporlamasına katılım seçeneği sunar. Varsayılan olarak kapalıdır. İstediğiniz zaman Gizlilik Ayarları'ndan değiştirilebilir.</p>
  </div>
</div>

- Kabul ve Reddet düğmeleri görsel olarak eşit ağırlık taşır (<a href="https://www.edpb.europa.eu/our-work-tools/our-documents/guidelines/guidelines-052020-consent-under-regulation-2016679_en">EDPB rıza kılavuzu</a> karanlık örüntüler hakkında)
- Kullanıcılar istedikleri zaman Gizlilik Ayarları'ndan onaylarını geri çekebilir ve hesaplarını silebilir
- Bu değerlendirme yıllık olarak veya önemli işleme değişikliklerinde gözden geçirilir
- Şeffaflık amacıyla bu URL'de kamuoyuyla paylaşılmıştır

---

<span class="section-label">Bölüm 5</span>
## Karar

<div class="callout callout-green">
  Yukarıdaki değerlendirmeye dayanarak, tüm artık riskler <strong>Düşük</strong> düzeydedir. İşleme, tanımlanan hukuki dayanaklar ve belgelenen güvenlik önlemleriyle sürdürülebilir. Denetim otoritesiyle ön danışma yapılmasına gerek yoktur.
</div>

---

<span class="section-label">İnceleme Günlüğü</span>
## Sürüm Geçmişi

| Tarih | Sürüm | Değişiklikler |
|-------|-------|--------------|
| Mart 2026 | 1.0 | Ses transkripsiyon süreci, onay ekranı tasarımı, risk değerlendirmesi ve hukuki dayanak belgelerini kapsayan ilk yayın öncesi değerlendirme |

---


</div>
