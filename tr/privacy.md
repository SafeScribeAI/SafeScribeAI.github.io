---
layout: default
title: SafeScribe — Gizlilik Politikasi
description: SafeScribe'in topladigi veriler, nasil isledigimiz ve haklariniz.
lang: tr
---

<div class="lang-bar">
  <a href="../en/privacy">English</a> · <strong>Turkce</strong> · <a href="../de/privacy">Deutsch</a> · <a href="../fr/privacy">Francais</a> · <a href="../es/privacy">Espanol</a> · <a href="../pt/privacy">Portugues</a> · <a href="../ar/privacy">&#x0627;&#x0644;&#x0639;&#x0631;&#x0628;&#x064a;&#x0629;</a> · <a href="../zh/privacy">&#x4e2d;&#x6587;</a> · <a href="../ja/privacy">&#x65e5;&#x672c;&#x8a9e;</a> · <a href="../ko/privacy">&#xd55c;&#xad6d;&#xc5b4;</a>
</div>

<div class="page-content">

# Gizlilik Politikasi

<div class="summary-box">
  <strong>Sade dille ozet:</strong> Sesinizi transkript olusturmak icin sunucu belleginde isliyor, ardindan hemen siliyoruz. Sesinizi diske kaydetmiyoruz, YZ egitimi icin kullanmiyoruz veya kimseyle paylasmiyoruz. Transkriptleriniz cihazinizda sifrelenir ve sizin kontrolunuzdedir. Yalnizca takma adli faturalandirma kayitlari tutuyoruz. Her seyi istediginiz zaman silebilirsiniz.
</div>

<p class="page-meta">Son guncelleme: Mart 2026</p>

---

## 1. Giris

SafeScribe, gizlilik oncelikli bir yapay zeka transkripsiyon uygulamasidir. Bu politika, hangi verileri topladigimizi, nasil isledigimizi ve kisisel bilgilerinize iliskin haklarinizi aciklar.

## 2. Topladigimiz Veriler

### Kalici Veriler (hesap silininceye kadar saklanir)

| Veri | Amac |
|------|------|
| Takma adli kullanici kimligi (Google/Apple hesap kimliginin SHA-256 ozeti) | Hesap kimligi |
| Hesap bakiyesi (USD) | Kredi yonetimi |
| Kalan ucretsiz transkripsiyon dakikasi | Hosgeldin bonusu takibi |
| Hesap olusturma ve son guncelleme zaman damgalari | Hesap yonetimi |

**Her is icin tutulan kayitlar (her transkripsiyon icin saklanir):**

| Veri | Amac |
|------|------|
| Ses suresi (saniye) | Hizmet analizi |
| Dosya boyutu (bayt) | Hizmet analizi |
| Kelime sayisi | Hizmet analizi |
| Tahsil edilen ucret (USD) | Faturalandirma kayitlari |
| Isleme zaman damgalari (yukleme, baslama, tamamlanma, teslim, onaylama) | Hizmet analizi |

### Gecici Veriler (isleme sonrasi silinir)

| Veri | Saklama | Amac |
|------|---------|------|
| Ses dosyalari | Yalnizca RAM — transkripsiyon sonrasi aninda silinir | Transkripsiyon |
| Transkriptler | Alimi onayladiginizda sunucudan silinir | Kullaniciya teslim |

### Istege Bagli Veriler (yalnizca onay ile)

| Veri | Amac |
|------|------|
| Cokme raporlari ve hata gunlukleri | Uygulama kararliligi (Sentry uzerinden, KKV gizlenmis) |

**Toplamadigimiz veya saklamadigimiz veriler:** e-posta adresleri, adlar, telefon numaralari, IP adresleri, kisiler, konum, tarama gecmisi, reklam tanimlayicilari veya biyometrik veriler.

## 3. Ses Isleme — Sifir Disk Politikasi

- Ses verileri sunucularimizda **yalnizca RAM'de** (ucucu bellek) islenir.
- Ses verileri **hicbir asamada diske yazilmaz**.
- Transkripsiyon tamamlandiginda veya basarisiz oldugunda tum ses verileri **bellekten aninda silinir**.
- Ses iceriginin hicbir kopyasi, yedegi veya gunluk kaydi olusturulmaz.
- Kendi YZ altyapimizi isletiyoruz — sesiniz **hicbir ucuncu taraf YZ hizmetine gonderilmez**.

## 4. Yerel Depolama

Cihazinizdaki tum veriler **AES-256 sifreli** kaplarda saklanir. Sifreleme anahtari telefonunuzun guvenli donanimi (iOS Keychain / Android Keystore) tarafindan korunur.

**Cihazinizda saklanan veriler (sifreli):**

| Veri | Saklama Suresi |
|------|----------------|
| Transkriptler (metin, segmentler, meta veriler) | Siz silene kadar |
| Cevrimdisi yukleme kuyrugu | Gecici — basarili yukleme sonrasi kaldirilir |
| Uygulama ayarlari ve onay kayitlari | Cikis yapana veya hesabi silene kadar |

**Platform guvenli deposunda saklanan veriler:**

| Veri | Amac |
|------|------|
| Sifreleme anahtari | Tum yerel verileri korur |
| Kimlik dogrulama belirtecleri | Oturumunuzu acik tutar |

- Yerel olarak kullanici profili saklanmaz (ad, fotograf, telefon numarasi veya adres yoktur).
- Ses kayitlari yukleme sonrasi cihazdan silinir.
- Hesabinizi sildiginizde tum yerel veriler kalici olarak silinir.

## 5. Kimlik Dogrulama

- Google ile Giris ve Apple ile Giris uzerinden OpenID Connect (OIDC) kullaniyoruz.
- Yalnizca kimlik dogrulama icin gereken minimum bilgileri aliyoruz (kullanici kimligi, e-posta).
- Kisilerinize, takvimlerinize veya diger hesap verilerinize erismiyoruz.
- E-postaniz yalnizca kimlik dogrulama icin kullanilir — **sunucularimizda saklanmaz**.

## 6. Odeme Verileri

- Odemeler tamamen Apple App Store veya Google Play Store tarafindan islenir.
- SafeScribe kredi karti numaralarini veya odeme bilgilerini **asla almaz, saklamaz veya islemez**.
- Yalnizca kredi bakiyesi dogrulamasi icin satin alma makbuzlari alinir.

## 7. Sunucu Tarafi Isleme

- Ses dosyalari, sertifika sabitleme ile sifreli baglantilar uzerinden yuklenir.
- Ses yalnizca RAM'de islenir ve **asla diske dokunmaz**.
- Transkriptler gecici olarak tutulur ve **alimi onayladiginizda silinir**.
- Kendi barindirdigimiz en gelismis konusma tanima yapay zekasini kullaniyoruz — sesinizle ucuncu taraf API cagrisi yapilmaz.

## 8. Hata Takibi

- Istege bagli cokme raporlama icin Sentry kullaniyoruz (uygulamadan devre disi birakabilirsiniz).
- Tum raporlar iletimden once kisisel tanimlanabilir bilgiler (KKV) icin temizlenir.
- Gizlenen veri turleri: e-posta adresleri, telefon numaralari, IP adresleri, dosya yollari, belirtecler ve is kimlikleri.

## 9. Veri Paylasimi

Kisisel verilerinizi pazarlama amaciyla ucuncu taraflarla **satmiyoruz, kiralamiyoruz veya paylasmiyoruz**.

Veriler yalnizca sunlarla paylasilir:
- **Transkripsiyon sunucularimiz** (kendi barindirdigimiz altyapi) — ses isleme icin
- **Sentry** — cokme raporlama icin (KKV gizlenmis, istege bagli)
- **Apple/Google** — kimlik dogrulama ve odeme isleme icin

## 10. Veri Saklama

| Veri | Sunucu Saklama | Cihaz Saklama |
|------|---------------|---------------|
| Ses | Transkripsiyon sonrasi aninda silinir | Yukleme sonrasi silinir |
| Transkriptler | Alimi onayladiginizda silinir | Siz silene kadar |
| Faturalandirma kayitlari | Takma adli, yasal gereklilikler icin tutulur | Saklanmaz |
| Cokme raporlari | Sentry saklama politikasina gore | Saklanmaz |

## 11. Haklariniz

Su haklara sahipsiniz:

| Hak | Nasil Kullanilir |
|-----|-----------------|
| Verilerinize **erisim** | Transkriptleri istediginiz zaman uygulamada goruntuleyiniz |
| Verilerinizi **silme** | Bireysel transkriptleri veya tum hesabinizi uygulamadan siliniz |
| Verilerinizi **disa aktarma** | Uygulamadaki paylasma/disa aktarma islevini kullaniniz veya Gizlilik Ayarlarindan veri disa aktarimi talep ediniz |
| Tanilama'dan **cikmak** | Gizlilik Ayarlarindan cokme raporlamayi kapatiniz |
| Onayi **geri cekmek** | Gizlilik Ayarlarindan cikis yapin ve hesabinizi siliniz |
| KVKK **basvurusu** | Gizlilik Ayarlarindan veri disa aktarimi talep ediniz |

Uygulama icerisinden yapilamayan gizlilik talepleri icin bizimle iletisime geciniz: **privacy@safescribe.dev**

## 12. Uluslararasi Aktarimlar

SafeScribe'i veri aktarimi kisitlamalarinin oldugu bir yargi alanindan kullaniyorsaniz (GDPR kapsaminda AB/AEA, KVKK kapsaminda Turkiye), ilk kullanima baslarken verdiginiz onay, isleme sunucularimiza sinir otesi aktarim icin yetkilendirme teskil eder.

## 13. Cocuklarin Gizliligi

SafeScribe 17+ olarak derecelendirilmistir ve 17 yasindan kucukler icin tasarlanmamistir. Kucuklerden bilerek veri toplamiyoruz.

## 14. Bu Politikadaki Degisiklikler

Uygulamalarimiz degistiginde bu sayfayi guncelleyecegiz. Ustteki "Son guncelleme" tarihi en son revizyonu yansitir.

## 15. Iletisim

Gizlilik sorulari, veri silme talepleri veya haklarinizi kullanmak icin:

**E-posta:** privacy@safescribe.dev

Guvenlik konulari icin:

**E-posta:** security@safescribe.dev

---

<div class="trust-footer">
  <div class="footer-links">
    <a href="./">Nasil Calisir</a>
    <a href="security">Guvenlik Mimarisi</a>
    <a href="dpia">DPIA</a>
  </div>
  <p>privacy@safescribe.dev</p>
</div>

</div>
