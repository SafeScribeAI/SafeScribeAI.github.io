---
layout: default
title: SafeScribe — Veri Koruma Etki Degerlendirmesi
description: SafeScribe'in ses transkripsiyon hizmeti icin GDPR ve KVKK kapsaminda resmi risk degerlendirmesi.
lang: tr
---

<div class="lang-bar">
  <a href="../en/dpia">English</a> · <strong>Turkce</strong>
</div>

<div class="page-content">

# Veri Koruma Etki Degerlendirmesi (DPIA)

<div class="summary-box">
  <strong>Sade dille ozet:</strong> Bu degerlendirme SafeScribe'in ses transkripsiyon hizmetinin gizlilik risklerini degerlendirir. Temel bulgu: ses ucucu bellekte islendigi ve aninda silindigi, isleme sonrasi sunucularimizda kisisel veri saklanmadigi icin, tum tanimlanan riskler azaltma onlemleri uygulandiktan sonra <strong>Dusuk</strong> duzeye indirilmistir.
</div>

**SafeScribe — Yapay Zeka Ses Transkripsiyon Hizmeti**

| Alan | Deger |
|------|-------|
| Surum | 1.1 |
| Tarih | Mart 2026 |
| Sonraki Inceleme | Mart 2027 |
| Durum | Aktif |

---

## 1. Isleme Tanimi

### 1.1 Islemenin Niteligu

SafeScribe, kullanicilarin yukledigi ses dosyalarini kendi barindirdigi konusma tanima yapay zekasi ile isleyerek metin transkriptleri olusturur. Isleme akisi:

1. Kullanici mobil cihazinda bir ses dosyasi kaydeder veya secer.
2. Ses cihazda yerel olarak on-islenir (ses normalizasyonu, gurultu azaltma).
3. On-islenmis ses, sertifika sabitleme ile sifreli baglantilar uzerinden SafeScribe sunucularina yuklenir.
4. Sunucu sesi RAM'de kendi barindirdigi konusma tanima yapay zekasi ile isler (ucuncu taraf API cagrisi yok).
5. Olusturulan transkript butunluk dogrulamasi ile istemciye dondurulur.
6. Istemci alimi onaylar; sunucu transkript ve sesi bellekten siler.
7. Transkript cihazda AES-256 sifreli depolamada yerel olarak saklanir.

### 1.2 Isleme Kapsami

| Veri Kategorisi | Toplaniyor | Sunucuda Saklama | Istemcide Saklama |
|-----------------|------------|------------------|-------------------|
| Ses dosyalari | Evet | Yalnizca RAM — transkripsiyon + onay sonrasi siliniyor | Yukleme sonrasi siliniyor |
| Transkriptler | Uretiliyor | Istemci onayina kadar (~saniyeler) | Sifreli yerel depolama (kullanici kontrolunde) |
| Takma adli kullanici kimligi | OIDC oznenin SHA-256 ozeti | Hesap silinene kadar | Saklanmiyor |
| Hesap bakiyesi (USD) | Evet | Hesap silinene kadar | Saklanmiyor |
| Kalan ucretsiz dakika | Evet | Hesap silinene kadar | Saklanmiyor |
| Is basina kayitlar | Evet | Hesap silinene kadar | Saklanmiyor |
| E-posta adresi | Yalnizca iletim (OIDC) | Sunucuda saklanmiyor | Istemcide saklanmiyor |
| Satin alma makbuzlari | Evet (IAP) | Muhasebe kaydi | Saklanmiyor |
| Cokme raporlari | Istege bagli (Sentry) | Sentry saklama politikasi | Saklanmiyor |
| IP adresleri | Yalnizca iletim | Gunluge kaydedilmiyor | Saklanmiyor |

**Is basina kayitlar** sunlari icerir: ses suresi (saniye), dosya boyutu (bayt), kelime sayisi, tahsil edilen ucret (USD) ve isleme zaman damgalari (yukleme, baslama, tamamlanma, teslim, onaylama). Ses icerigi, transkript metni veya kullanici tanimlanabilir veri dahil degildir.

### 1.3 Isleme Baglami

- **Veri sahipleri:** Son kullanicilar (genel halk, 17+ yas derecesi)
- **Iliski:** Dogrudan (B2C), kullanicilar ilk kullanimdan once 4 kartli onay ekrani uzerinden ayrintili bilgilendirilmis onay verir
- **Teknoloji:** YZ/ML konusma tanima (kendi barindirilan cikarsama, ucuncu taraf veri paylasimi yok)
- **Veri hacmi:** Bireysel ses dosyalari, kullanici basina isleme, toplu islem yok

### 1.4 Isleme Amaci

- **Birincil:** Kullanicinin kisisel kullanimi icin konusma sesini metne donusturme
- **Ikincil:** Faturalandirma (sure bazli fiyatlandirma, uygulama ici satin alma)
- **Ikincil:** Uygulama kararlilik izleme (KKV gizlenmis cokme raporlari, istege bagli)

---

## 2. Gereklilik ve Orantililik

### 2.1 Hukuki Dayanak

| Isleme Faaliyeti | Hukuki Dayanak (GDPR) | KVKK Dayanagi | Onay Karti |
|------------------|-----------------------|---------------|------------|
| Ses transkripsiyonu | Mad. 6(1)(b) Sozlesme ifasi | Acik riza | Ses Isleme (zorunlu) |
| Saklanan veriler (bakiye, kullanim istatistikleri) | Mad. 6(1)(b) Sozlesme ifasi | Acik riza | Saklanan Veriler (zorunlu) |
| Kimlik dogrulama | Mad. 6(1)(b) Sozlesme ifasi | Sozlesme ifasi | — |
| Faturalandirma/IAP | Mad. 6(1)(b) Sozlesme ifasi | Sozlesme ifasi | — |
| Yas dogrulama (16+) | Mad. 8 GDPR / KVKK Mad. 6 | Yasal yukumluluk | Yas Dogrulama (zorunlu) |
| Cokme raporlama | Mad. 6(1)(a) Riza | Acik riza | Cokme Raporlari (istege bagli) |

### 2.2 Gereklilik

- Ses yukleme, sunucu tarafli YZ transkripsiyon icin kesinlikle gereklidir (gerekli kalitede cihaz uzerinde model mevcut degildir).
- Kimlik dogrulama, kullanici basina faturalandirma ve is izolasyonu icin gereklidir.
- Cokme raporlama, hizmet guvenilirligi icin gereklidir; iletimden once KKV gizlenir.

### 2.3 Orantililik

- Ses yalnizca RAM'de islenir — kalici depolamaya asla yazilmaz.
- Transkriptler istemci onayindan saniyeler icinde silinir.
- Model egitimi veya iyilestirme icin ses veya transkript verisi saklanmaz.
- Kullanicilar istedikleri zaman tum yerel verileri silebilir.

### 2.4 Veri Sahibi Haklari

| Hak | Uygulama |
|-----|----------|
| Erisim (Mad. 15 / KVKK Mad. 11) | Uygulama ici transkript listesi; sunucu isleme sonrasi kisisel veri tutmaz |
| Duzeltme (Mad. 16) | Kullanicilar transkriptleri yerel olarak duzenler; sunucu verisi gecicidir |
| Silme (Mad. 17) | Uygulama ici hesap silme; sunucu tarafli kaskad silme |
| Kisitlama (Mad. 18) | Aktif transkripsiyon isini iptal etme |
| Tasinabilirlik (Mad. 20) | Transkripti metin olarak paylasma/disa aktarma; Gizlilik Ayarlarindan veri disa aktarimi |
| Itiraz (Mad. 21) | Gizlilik ayarlarinda Sentry devre disi birakma |
| Onay geri cekme | Istediginiz zaman cikis yapma + hesap silme |

---

## 3. Risk Degerlendirmesi

### 3.1 Tanimlanan Riskler

| # | Risk | Olasilik | Siddet | Dogal Risk |
|---|------|----------|--------|------------|
| R1 | Ses hassas kisisel veri icerir (saglik, hukuk, finans) | Yuksek | Yuksek | Yuksek |
| R2 | Iletim sirasinda transkriptlere yetkisiz erisim | Dusuk | Yuksek | Orta |
| R3 | Sunucu tarafli ihlal — ses/transkript ifsa | Dusuk | Yuksek | Orta |
| R4 | Yerel sifreli depolamaya yetkisiz erisim | Dusuk | Orta | Dusuk |
| R5 | Cokme raporlari uzerinden KKV sizintisi | Dusuk | Orta | Dusuk |
| R6 | Yetersiz yargi alanina sinir otesi veri aktarimi | Orta | Orta | Orta |
| R7 | YZ'nin hassas icerigi yanlis yaziya dokmesi | Orta | Dusuk | Dusuk |

### 3.2 Azaltma Onlemleri

| # | Azaltma | Kontroller | Artik Risk |
|---|---------|------------|------------|
| R1 | Gecici isleme | Yalnizca RAM'de, kalici depolama yok, aninda silme | Dusuk |
| R2 | Iletim sifreleme + sabitleme | TLS 1.2+, sertifika sabitleme surum derlemelerinde zorunlu | Dusuk |
| R3 | Minimum saklama + erisim kontrolleri | Kalici ses depolamasi yok, kimlik dogrulamali API, kullanici basina is izolasyonu | Dusuk |
| R4 | Platform-yerel sifreleme | AES-256 sifreli kaplar, anahtar Keychain/Keystore'da | Dusuk |
| R5 | KKV gizleme boru hatti | E-posta, telefon, IP, belirtec icin oruntu tabanli temizleme | Dusuk |
| R6 | Onay tabanli aktarim | KVKK acik riza, GDPR SCC'ler | Dusuk |
| R7 | Otomatik karar mekanizmasi yok | Transkripsiyon yalnizca bilgilendirme amacli, kullanici ciktiyi inceler | Dusuk |

---

## 4. Danisma

- Kullanicilara ilk kullanimdan once 4 bagimsiz karttan olusan **ayrintili onay ekrani** sunulur:
  1. **Ses Isleme** (zorunlu) — yalnizca RAM'de isleme ve aninda silme aciklanir
  2. **Saklanan Veriler** (zorunlu) — hangi kalici verilerin tutuldugu aciklanir (bakiye, anonim kullanim istatistikleri)
  3. **Yas Dogrulama** (zorunlu) — kullanicinin 16 yasindan buyuk oldugunu onaylar
  4. **Cokme Raporlari** (istege bagli) — Sentry uzerinden anonim cokme raporlamasina katilim izni
- Her kart bagimsiz bir toggle'a sahiptir; zorunlu kartlar devam etmek icin kabul edilmelidir. Istege bagli cokme raporlama karti varsayilan olarak kapalidir ve Gizlilik Ayarlarindan istedigi zaman degistirilebilir.
- Kabul ve Reddet butonlari gorsel olarak esit onem tasir (CNIL 2025 uyumu).
- Kullanicilar Gizlilik Ayarlarindan istedikleri zaman onaylarini geri cekebilir ve hesaplarini silebilir.
- Bu DPIA yillik olarak veya onemli isleme degisikliklerinde gozden gecirilir.
- Seffaflik icin bu URL'de yayinlanmistir.

## 5. Karar

Yukaridaki degerlendirmeye dayanarak, azaltma onlemleri uygulandiktan sonra artik riskler **Dusuk** duzeydedir. Isleme, tanimlanan hukuki dayanaklarla ve belgelenen guvenlik onlemleriyle devam edebilir.

## 6. Inceleme Gunlugu

| Tarih | Surum | Degisiklikler |
|-------|-------|---------------|
| Mart 2026 | 1.1 | Onay ekrani yeniden tasarlandi: 4 bagimsiz onay karti (ses isleme, saklanan veriler, yas dogrulama, cokme raporlari). Is basina kayit alanlari belgelendi. Cokme raporlama hukuki dayanagi mesru menfaatten acik rizaya guncellendi. Gizlilik politikasi ayrintili veri dokumu ile guncellendi. |
| Mart 2026 | 1.0 | Ses transkripsiyon boru hattini kapsayan DPIA olusturuldu |

---

<div class="trust-footer">
  <div class="footer-links">
    <a href="./">Nasil Calisir</a>
    <a href="privacy">Gizlilik Politikasi</a>
    <a href="security">Guvenlik Mimarisi</a>
  </div>
  <p>privacy@safescribe.dev</p>
</div>

</div>
