---
layout: default
title: SafeScribe — Guvenlik Mimarisi
description: SafeScribe verilerinizi nasil koruyor — gizlilik odakli tasarimimizin teknik genel bakisi.
lang: tr
---

<div class="lang-bar">
  <a href="../en/security">English</a> · <strong>Turkce</strong>
</div>

<div class="page-content">

# Guvenlik Mimarisi

<div class="summary-box">
  <strong>Kisaca:</strong> SafeScribe sesinizi yalnizca ucucu sunucu belleginde (RAM) isler. Transkriptiniz teslim edildigi anda tum veriler kalici olarak silinir. Diske yazma yok, yedek yok, kopya yok — asla. Bu sayfa her koruma katmaninin nasil calistigini aciklar.
</div>

<p class="page-meta">Son guncelleme: Mart 2026</p>

---

## Tasarim Ilkesi: Isle, Teslim Et, Sil

Geleneksel transkripsiyon hizmetleri sesinizi diske yazar, isleme icin kuyruga alir ve suresiz olarak saklayabilir. SafeScribe tam tersi yaklasimi benimser:

<div class="flow-diagram">
Geleneksel:  Ses --> Disk --> Kuyruk --> Isle --> Disk --> Sakla --> Belki sil

SafeScribe:  Ses --> RAM --> Isle --> Teslim Et --> SIL (aninda)
</div>

Fark: Bir sunucu fiziksel olarak ele gecirilse bile, kurtarilacak ses veya transkript verisi olmaz — veriler yalnizca ucucu bellekte var olmustur.

---

<span class="section-label">Katman 1</span>
## Iletim Guvenligi

| Koruma | Onledigi Sey |
|--------|-------------|
| TLS 1.2+ sifreleme | Ag trafiginin dinlenmesi |
| Sertifika sabitleme | Ortadaki adam saldirilari, sahte sunucular |
| Butunluk dogrulamasi | Transkript bozulma veya kurcalama |

Uygulama, SafeScribe sunucu sertifikasinin kriptografik parmak izini icerir. Bir sertifika otoritesi ele gecirilse bile, uygulama gercek SafeScribe sunucusu disinda herhangi bir seye baglanmayi reddeder.

<div class="callout callout-green">
  <strong>Dogrulayabilirsiniz:</strong> Herhangi bir ag inceleme araci (ornegin Wireshark) kullanarak tum SafeScribe trafiginin TLS sifreli oldugunu onaylayabilirsiniz. Bir proxy ile trafigi kesmeye calismak basarisiz olur — sertifika sabitleme proxy'nin sertifikasini reddeder.
</div>

---

<span class="section-label">Katman 2</span>
## Yalnizca RAM'de Sunucu Islemesi

Bu, SafeScribe'in gizlilik tasariminin cekirdegi.

**Nasil calisir:** Sunucunun veri deposu, hicbir disk kaliciligi olmadan yalnizca bellek islemleri icin yapilandirilmistir. Her veri parcasinin guvenlik onlemi olarak otomatik suresi vardir. Bu su anlama gelir:

- Sunucu yeniden baslarsa, bellekteki tum veriler kalici olarak kaybolur (tasarim geregi)
- Sesinizi iceren hicbir disk dosyasi, yedek veya gunluk yoktur
- Sunucunun adli disk analizi sifir ses icerigi bulur

### Sunucunun gecici olarak tuttugu (RAM'de)

| Veri | Silinme Zamani |
|------|----------------|
| Ses baytlari | Transkripsiyon tamamlandiginda |
| Transkript metni | Alimi onayladiginizda |
| Is meta verileri | Alimi onayladiginizda |

### Sunucunun kalici olarak sakladigi (diskte)

| Veri | Amac | KKV iceriyor mu? |
|------|------|-----------------|
| Takma adli kullanici tanimlayicisi | Faturalandirma kaydi | Hayir — hesap kimliginizin tek yonlu ozeti, tersine cevrilemez |
| Sure ve maliyet | Mali kayit | Hayir |
| Zaman damgalari | Denetim izi | Hayir |

**Hicbir e-posta, isim, telefon numarasi veya IP adresi diske yazilmaz.**

<div class="callout callout-green">
  <strong>Dogrulayabilirsiniz:</strong> Bir transkripsiyon tamamlayip sonucu aldiktan sonra durum noktasini sorgulayiniz — 404 (bulunamadi) doner. Veri artik mevcut degildir. "Tekrar indir" secenegi yoktur.
</div>

---

<span class="section-label">Katman 3</span>
## Takma Adli Kimlik

SafeScribe, kimlik dogrulama icin Google ile Giris ve Apple ile Giris kullanir. Ancak kisisel bilgileriniz asla saklanmaz:

| Kimlik saglayicinin verdigi | Bizim sakladigimiz |
|----------------------------|-------------------|
| E-posta adresi | **Saklanmiyor** |
| Gorunen ad | **Saklanmiyor** |
| Hesap kimligiVeri | Yalnizca tek yonlu kriptografik ozet |

Sunucu e-posta adresinizi veya adinizi asla gormez veya saklamaz. Hesap tanimlayicinizin tek yonlu ozetini hesaplar:
- Kimliginizi ortaya cikarmak icin tersine cevrilemez
- Size ozgudur (faturalandirma icin)
- Sifir kisisel tanimlanabilir bilgi icerir

<div class="callout callout-green">
  <strong>Dogrulayabilirsiniz:</strong> Uygulamadan giden API trafigini inceleyin. Kimlik dogrulamadan sonra hicbir istek e-posta veya adinizi icermez — yalnizca sunucunun dahili olarak dogruladigi bir Bearer belirteci.
</div>

---

<span class="section-label">Katman 4</span>
## Yerel Sifreleme

Cihazinizda saklanan transkriptler su sekilde korunur:

| Koruma | Teknoloji |
|--------|-----------|
| Sifreleme | AES-256 |
| Anahtar depolama | Platform guvenli donanimi (iOS Keychain / Android Keystore) |
| Veritabani | Sifreli kaplar |

Birisi cihazinizin dosya sistemine erisse bile, transkript verileri sifreli ikili olarak gorunur — anahtar olmadan okunamaz. Sifreleme anahtari donanim destekli guvenli depolamada saklanir, uygulamanin dosyalarinda degil. Uygulamayi silmek anahtari kalici olarak yok eder.

---

<span class="section-label">Katman 5</span>
## Tanilama'da KKV Gizleme

Uygulama bir hatayla karsilastiginda, istege bagli bir cokme raporu gonderilebilir. Herhangi bir rapor cihazinizdan ayrilmadan once:

**Gizlenen:** E-posta adresleri, telefon numaralari, IP adresleri, dosya yollari, kimlik dogrulama belirtecleri, is tanimlayicilari

**Dahil edilen:** Hata turu ve yigin izleme (yalnizca teknik), cihaz modeli, isletim sistemi surumu, uygulama surumu

Cokme raporlamayi uygulamanin gizlilik ayarlarindan tamamen devre disi birakabilirsiniz.

---

<span class="section-label">Katman 6</span>
## Kaskad Silme

SafeScribe aninda kaskad silme uygular — her isleme adimi onceki adimin verilerinin silinmesini tetikler:

<div class="flow-diagram">
Yukleme       Ses RAM'e alinir
                |
Transkripsiyon  YZ sesi isler
                Ses RAM'den SILINIR
                |
Teslim        Transkript cihaziniza gonderilir
              Alimi onaylarsiniz
              Transkript RAM'den SILINIR
              Is meta verileri SILINIR
                |
Sonuc         Sunucuda SIFIR kisisel veri
</div>

Bu bir arka plan temizleme isi degildir. Silme, isleme boru hattinin bir parcasi olarak aninda gerceklesir — veri biriken bir pencere yoktur.

**Guvenlik onlemi:** Normal silme sureci basarisiz olsa bile (ag hatasi, uygulama cokmesi), sunucu bellegindeki her veri parcasinin otomatik suresi vardir. Veri ne olursa olsun kendini imha eder.

---

## Verinizin Yolculugu

<div class="flow-diagram">
Cihaziniz                    SafeScribe Sunucusu             Cihaziniz
---------                    ------------------              ---------

Ses kaydet/sec
    |
Yerel on-isleme
    |
Sifrele + yukle ---TLS--->   RAM'de al
                                   |
                               YZ transkripsiyon
                               (yalnizca RAM)
                                   |
                               Ses SILINDI
                                   |
Transkript al   <---TLS----   Transkript gonder
    |                              |
Butunluk dogrula               ACK bekle
    |                              |
Sifreli yerel    ACK gonder -->   Transkript SILINDI
depolama (AES-256)             Is meta verileri SILINDI
    |                              |
Tamam                          SIFIR veri kaldi
</div>

---

## Bagimsiz Dogrulama

Guvenlik arastirmacilarini ve gizlilik savunucularini iddialarimizi dogrulamaya tesvik ediyoruz:

- **Ag analizi:** Tum trafik sertifika sabitleme ile TLS sifrelidir
- **Teslim sonrasi sorgular:** Durum/transkript noktalari onay sonrasi 404 doner
- **Yayinlanan degerlendirmeler:** [Veri Koruma Etki Degerlendirmesi](dpia)
- **Sorumlu aciklama:** security@safescribe.dev

---

<div class="trust-footer">
  <div class="footer-links">
    <a href="./">Nasil Calisir</a>
    <a href="privacy">Gizlilik Politikasi</a>
    <a href="dpia">DPIA</a>
  </div>
  <p>privacy@safescribe.dev &middot; security@safescribe.dev &middot; support@safescribe.dev</p>
</div>

</div>
