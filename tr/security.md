---
layout: default
title: SafeScribe — Güvenlik Mimarisi
description: SafeScribe verilerinizi nasıl koruyor — gizlilik odaklı tasarımımızın teknik genel bakışı.
lang: tr
---

<div class="page-content" markdown="1">

# Güvenlik Mimarisi

<div class="summary-box">
  <strong>Kısaca:</strong> SafeScribe sesinizi yalnızca uçucu sunucu belleğinde (RAM) işler. Transkriptiniz teslim edildiği anda tüm veriler kalıcı olarak silinir. Diske yazma yok, yedek yok, kopya yok — asla. Bu sayfa her koruma katmanının nasıl çalıştığını açıklar.
</div>

<p class="page-meta">Son güncelleme: Mart 2026</p>

---

<span class="section-label">Genel Bakış</span>
## Altı Koruma Katmanı

<div class="infra-grid">
  <div class="infra-item">
    <div class="infra-icon">&#x1f510;</div>
    <h4>Katman 1 — Aktarım</h4>
    <p>Her bağlantıda TLS 1.2+ şifreleme ve sertifika sabitleme. Hiçbir proxy araya giremez.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f9e0;</div>
    <h4>Katman 2 — Yalnızca RAM</h4>
    <p>Ses hiçbir zaman diske dokunmaz. Uçucu bellekte işlenir ve transkripsiyon sonrası anında silinir.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f464;</div>
    <h4>Katman 3 — Takma Adlı Kimlik</h4>
    <p>E-posta ve adınız hiçbir zaman saklanmaz. Yalnızca hesap kimliğinizin tek yönlü karması tutulur.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f512;</div>
    <h4>Katman 4 — Yerel Şifreleme</h4>
    <p>Cihazda AES-256 şifreli depolama. Anahtarlar yalnızca donanım destekli güvenli depoda.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f41b;</div>
    <h4>Katman 5 — KKV Gizleme</h4>
    <p>Tüm kilitlenme raporları cihazınızdan ayrılmadan önce kişisel verilerden arındırılır.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f5d1;</div>
    <h4>Katman 6 — Kaskad Silme</h4>
    <p>Her işleme adımı önceki adımın verilerini anında siler. TTL güvenlik kilidi yedek olarak çalışır.</p>
  </div>
</div>

---

<span class="section-label">Tasarım İlkesi</span>
## İşle, Teslim Et, Sil

Geleneksel transkripsiyon hizmetleri sesinizi diske yazar, işleme için kuyruğa alır ve süresiz olarak saklayabilir. SafeScribe tam tersi yaklaşımı benimser:

Geleneksel hizmetler sesi diske yazar ve süresiz olarak saklayabilir. SafeScribe sesi RAM'e alır, işler ve transkriptinizi aldığınız anda siler. Aşağıdaki <a href="#your-datas-journey">tam veri yolculuğu diyagramına</a> bakınız.

Fark: Bir sunucu fiziksel olarak ele geçirilse bile, kurtarılacak ses veya transkript verisi olmaz — veriler yalnızca uçucu bellekte var olmuştur.

---

<span class="section-label">Katman 1</span>
## Aktarım Güvenliği

| Koruma | Önlediği Şey |
|--------|-------------|
| TLS 1.2+ şifreleme | Ağ trafiğinin dinlenmesi |
| Sertifika sabitleme | Ortadaki adam saldırıları, sahte sunucular |
| Bütünlük doğrulaması | Transkript bozulması veya kurcalanması |

Uygulama, SafeScribe sunucu sertifikasının kriptografik parmak izini içerir. Bir sertifika otoritesi ele geçirilse bile, uygulama gerçek SafeScribe sunucusu dışında herhangi bir şeye bağlanmayı reddeder.

<div class="callout callout-green">
  <strong>Doğrulayabilirsiniz:</strong> Herhangi bir ağ inceleme aracı (örneğin Wireshark) kullanarak tüm SafeScribe trafiğinin TLS şifreli olduğunu onaylayabilirsiniz. Bir proxy ile trafiği kesmeye çalışmak başarısız olur — sertifika sabitleme proxy'nin sertifikasını reddeder.
</div>

---

<span class="section-label">Katman 2</span>
## Yalnızca RAM'de Sunucu İşlemesi

Bu, SafeScribe'ın gizlilik tasarımının çekirdeğidir. Sunucu, kendi barındırılan <a href="https://github.com/SYSTRAN/faster-whisper">faster-whisper</a> çıkarım motoru aracılığıyla OpenAI'ın Whisper model ağırlıklarını çalıştırır — üçüncü taraf API çağrısı yoktur. Veri deposu, hiçbir disk kalıcılığı olmaksızın yalnızca bellek işlemleri için yapılandırılmıştır. Her veri parçasının güvenlik kilidi olarak otomatik süresi vardır.

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span> Sunucu yeniden başlarsa, bellekteki tüm veriler kalıcı olarak kaybolur — tasarım gereği</li>
  <li><span class="check-mark">&#x2713;</span> Sesinizi içeren hiçbir disk dosyası, yedek veya günlük yoktur</li>
  <li><span class="check-mark">&#x2713;</span> Sunucunun adli disk analizi sıfır ses içeriği bulur</li>
</ul>

**Sunucunun geçici olarak tuttuğu (RAM'de):**

| Veri | Silinme Zamanı |
|------|----------------|
| Ses baytları | Transkripsiyon tamamlandığında |
| Transkript metni | Alımı onayladığınızda |
| İş meta verileri | Alımı onayladığınızda |

**Sunucunun kalıcı olarak sakladığı (diskte):**

| Veri | Amaç | KKV içeriyor mu? |
|------|------|-----------------|
| Takma adlı kullanıcı tanımlayıcısı | Faturalandırma kaydı | Hayır — tek yönlü karma, tersine çevrilemez |
| Süre ve maliyet | Mali kayıt | Hayır |
| Dosya boyutu (bayt) | Hizmet analitiği | Hayır |
| Kelime sayısı | Hizmet analitiği | Hayır |
| Zaman damgaları | Denetim izi | Hayır |

<div class="callout callout-green">
  <strong>Tasarım gereği:</strong> "Tekrar indir" seçeneği yoktur. Teslimi onayladıktan sonra veri kalıcı olarak silinir — geri alınacak hiçbir şey kalmaz.
</div>

---

<span class="section-label">Katman 3</span>
## Takma Adlı Kimlik

SafeScribe, kimlik doğrulama için Google ile Giriş ve Apple ile Giriş kullanır. Kişisel bilgileriniz asla saklanmaz:

| Kimlik sağlayıcının verdikleri | Bizim sakladığımız |
|-------------------------------|-------------------|
| E-posta adresi | **Saklanmıyor** |
| Görünen ad | **Saklanmıyor** |
| Hesap kimliği | Yalnızca tek yönlü kriptografik karma |

Hesap tanımlayıcınızın tek yönlü karması:

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span> Kimliğinizi ortaya çıkarmak için tersine çevrilemez</li>
  <li><span class="check-mark">&#x2713;</span> Size özgüdür — yalnızca faturalandırma için</li>
  <li><span class="check-mark">&#x2713;</span> Sıfır kişisel tanımlanabilir bilgi içerir</li>
</ul>

<div class="callout callout-green">
  <strong>Doğrulayabilirsiniz:</strong> Uygulamadan giden API trafiğini inceleyin. Kimlik doğrulamadan sonra hiçbir istek e-posta veya adınızı içermez — yalnızca sunucunun dahili olarak doğruladığı bir Bearer belirteci.
</div>

---

<span class="section-label">Katman 4</span>
## Yerel Şifreleme

Cihazınızda saklanan transkriptler şu şekilde korunur:

| Koruma | Teknoloji |
|--------|-----------|
| Şifreleme | AES-256 |
| Anahtar depolama | Platform güvenli donanımı (iOS Keychain / Android Keystore) |
| Veritabanı | Şifreli kaplar |

Birisi cihazınızın dosya sistemine erişse bile, transkript verileri şifreli ikili olarak görünür — anahtar olmadan okunamaz. Şifreleme anahtarı donanım destekli güvenli depolamada saklanır, uygulamanın dosyalarında değil. Uygulamayı silmek anahtarı kalıcı olarak yok eder.

---

<span class="section-label">Katman 5</span>
## Tanılamada KKV Gizleme

Uygulama bir hatayla karşılaştığında, isteğe bağlı bir kilitlenme raporu gönderilebilir. Herhangi bir rapor cihazınızdan ayrılmadan önce şunlar otomatik olarak kaldırılır:

<div class="callout callout-info">
  <strong>Gönderilmeden önce silinen:</strong> E-posta adresleri · Telefon numaraları · IP adresleri · Dosya yolları · Kimlik doğrulama belirteçleri · İş tanımlayıcıları
</div>

<div class="callout callout-green">
  <strong>Dahil edilen:</strong> Hata türü ve yığın izleme (yalnızca teknik) · Cihaz modeli · İşletim sistemi sürümü · Uygulama sürümü
</div>

Kilitlenme raporlamayı uygulamanın Gizlilik Ayarları'ndan tamamen devre dışı bırakabilirsiniz.

---

<span class="section-label">Katman 6</span>
## Kaskad Silme

SafeScribe anında kaskad silme uygular — her işleme adımı önceki adımın verilerinin silinmesini tetikler:

Her işleme adımı önceki adımın verilerini anında siler: ses, transkripsiyon sonrası silinir; transkript, onay sonrası silinir. <a href="#your-datas-journey">Tam veri yolculuğu diyagramı</a> tüm silme noktalarıyla birlikte tam akışı göstermektedir.

Bu bir arka plan temizleme işi değildir. Silme, işleme sürecinin bir parçası olarak anında gerçekleşir — veri biriken bir pencere yoktur.

<div class="callout callout-info">
  <strong>Güvenlik kilidi:</strong> Normal silme süreci başarısız olsa bile (ağ hatası, uygulama çökmesi), sunucu belleğindeki her veri parçasının otomatik süresi vardır. Veri ne olursa olsun kendini imha eder.
</div>

---

<span class="section-label">Tam Yolculuk</span>
## Verinizin Yolculuğu
{: #your-datas-journey}

<div class="flow-diagram">
Cihazınız                    SafeScribe Sunucusu             Cihazınız
---------                    ------------------              ---------

Ses kaydet/seç
    |
Yerel ön işleme
    |
Şifrele + yükle ---TLS--->  RAM'e al
                                   |
                               YZ transkripsiyonu
                               (yalnızca RAM)
                                   |
                               Ses SİLİNDİ
                                   |
Transkripti al  <--TLS----  Transkripti gönder
    |                              |
Bütünlüğü doğrula              Alındı bildir bekle
    |                              |
Şifreli depola   ACK gönder -->   Transkript SİLİNDİ
(AES-256)                      İş meta verisi SİLİNDİ
    |                              |
Tamamlandı                     SIFIR veri kalır
</div>

---

<span class="section-label">Şeffaflık</span>
## Bağımsız Doğrulama

Güvenlik araştırmacılarını ve gizlilik savunucularını iddialarımızı doğrulamaya teşvik ediyoruz:

<ul class="verify-steps">
  <li><span><strong>Ağ analizi</strong> Wireshark veya Charles Proxy kullanarak trafiği inceleyin. Tüm SafeScribe bağlantıları TLS şifrelidir; proxy ile müdahale girişimi sertifika sabitleme tarafından engellenir.</span></li>
  <li><span><strong>Yayınlanan değerlendirmeler</strong> Tam risk analizi ve karar kaydı için <a href="dpia">Veri Koruma Etki Değerlendirmemizi</a> okuyun.</span></li>
  <li><span><strong>Sorumlu açıklama</strong> Bir güvenlik açığı mı buldunuz? <a href="mailto:security@safescribe.dev">security@safescribe.dev</a> adresine yazın.</span></li>
</ul>

---

</div>
