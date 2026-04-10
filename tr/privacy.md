---
layout: default
title: SafeScribe — Gizlilik Politikası
description: SafeScribe'ın hangi verileri topladığı, nasıl işlediği ve haklarınız.
lang: tr
---

<div class="page-content" markdown="1">

# Gizlilik Politikası

<div class="summary-box">
  <strong>Sade anlatım:</strong> Sesinizi sunucu belleğinde işleyip transkripti oluşturduktan sonra hemen siliyoruz. Sesi diske kaydetmiyoruz, yapay zeka eğitiminde kullanmıyoruz ve kimseyle paylaşmıyoruz. Transkriptleriniz cihazınızda şifrelenmiş olarak saklanır ve tamamen sizin kontrolünüzdedir. Yalnızca takma adlı faturalandırma kayıtları tutuyoruz.
</div>

<p class="page-meta">Son güncelleme: March 2026</p>

---

<span class="section-label">Yapmadıklarımız</span>
## Toplamadığımız veya Saklamadığımız Veriler
{: #data-we-dont-collect-or-store}

<ul class="dont-list">
  <li><span class="x-mark">&#x2717;</span> Sesi diske kaydetmek — hiçbir zaman</li>
  <li><span class="x-mark">&#x2717;</span> E-posta adresinizi veya adınızı saklamak</li>
  <li><span class="x-mark">&#x2717;</span> IP adreslerini kayıt altına almak veya saklamak</li>
  <li><span class="x-mark">&#x2717;</span> Kayıtları yapay zeka modeli eğitiminde kullanmak</li>
  <li><span class="x-mark">&#x2717;</span> Verileri reklamverenler ya da veri aracılarıyla paylaşmak</li>
  <li><span class="x-mark">&#x2717;</span> Uygulama veya oturumlar arasında davranışı izlemek</li>
  <li><span class="x-mark">&#x2717;</span> Kişi listesi, konum veya biyometrik veri toplamak</li>
  <li><span class="x-mark">&#x2717;</span> Hesap silindikten sonra veri tutmak</li>
</ul>

---

<span class="section-label">Topladıklarımız</span>
## İşlediğimiz Veriler

### Sunucu tarafında (hesap silinene kadar kalıcı)

| Veri | Amaç |
|------|------|
| Takma adlı kullanıcı kimliği (hesap kimliğinin SHA-256 karması) | Hesap tanımlaması — geri döndürülemez |
| Takma adlı cihaz tanımlayıcısı (cihaz özelliklerinin SHA-256 karması) | Kötüye kullanım önleme — geri döndürülemez |
| Hesap bakiyesi (USD) | Kredi yönetimi |
| Kalan ücretsiz transkripsiyon dakikası | Hoş geldin bonusu takibi |
| Hesap oluşturma ve son güncelleme zaman damgaları | Hesap yönetimi |

**İş başına kayıtlar** (her tamamlanan transkripsiyon için saklanır):

| Veri | Amaç |
|------|------|
| Ses süresi (saniye) | Hizmet analitiği |
| Dosya boyutu (bayt) | Hizmet analitiği |
| Kelime sayısı | Hizmet analitiği |
| Alınan ücret (USD) | Faturalandırma kaydı |
| İşleme zaman damgaları | Hizmet analitiği |

<div class="callout callout-info">
  <strong>İş başına kayıtlarda hiçbir zaman ses içeriği veya transkript metni bulunmaz.</strong> Bu kayıtlar yalnızca meta veri (sayılar ve zaman damgaları) içerir — söylediklerinizi asla içermez.
</div>

### Sunucu tarafında (geçici — işlem sonrası silinen)

| Veri | Ne Zaman Silinir |
|------|-----------------|
| Ses dosyası | Transkripsiyon tamamlanır tamamlanmaz |
| Transkript metni | Teslim aldığınızı onayladıktan sonra |

### Cihazınızda (şifrelenmiş)

| Veri | Saklama Süresi |
|------|---------------|
| Transkriptler (metin, segmentler, meta veri) | Siz silene kadar |
| Çevrimdışı yükleme kuyruğu | Başarılı yüklemeden sonra kaldırılır |
| Uygulama ayarları ve onay kayıtları | Çıkış veya hesap silinene kadar |
| Şifreleme anahtarı | iOS Keychain / Android Keystore'da — uygulama silindiğinde silinir |

### İsteğe bağlı (yalnızca kabul ile)

| Veri | Amaç |
|------|------|
| Kilitlenme raporları | SafeScribe'ın kendi kilitlenme raporlama uç noktası aracılığıyla uygulama kararlılığı — iletimden önce tüm PII temizlenir |

<div class="callout callout-green">
  <strong>Sunucu asla adınızı, e-posta adresinizi, IP adresinizi, ses içeriğinizi veya transkript metninizi saklamaz.</strong> Hesabınıza bağlı kalıcı kayıtlar yalnızca geri döndürülemez bir kullanıcı karması, takma adlı bir cihaz tanımlayıcısı, bir kredi bakiyesi ve kullanım istatistiklerinden (yalnızca sayılar — içerik yok, kimlik yok) oluşur.
</div>

---

<span class="section-label">Tam Silme</span>
## Uygulamayı Silmek ile Hesabı Silmek

Bunlar farklı sonuçları olan iki ayrı işlemdir:

| İşlem | Ne olur | Bakiyeniz |
|-------|---------|-----------|
| **Uygulamayı sil** | Yerel transkriptler ve şifreleme anahtarı cihazınızdan kaldırılır | Sunucuda korunur — uygulamayı yeniden yükleyip aynı hesapla giriş yaparak tam olarak geri kazanılır |
| **Hesabı sil** | Her sunucu taraflı kayıt kalıcı olarak silinir — geri alınamaz | Gider |

<div class="callout callout-info">
  <strong>İstediğiniz zaman yeniden yükleyin.</strong> Hesabınızı silmeden uygulamayı silerseniz, uygulamayı yeniden yükleyip aynı Google veya Apple hesabıyla giriş yaparak tam bakiyenize ve erişiminize kavuşursunuz — herhangi bir işlem gerekmez.
</div>

### Hesap Silme — Sıfır Veri Kalır

Gizlilik Ayarları'ndan hesabınızı silmek her sunucu taraflı kaydı kalıcı olarak kaldırır:

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Takma adlı kullanıcı kimliği</strong><span class="item-desc">kalıcı olarak silindi</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Takma adlı cihaz tanımlayıcısı</strong><span class="item-desc">kalıcı olarak silindi</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Kredi bakiyesi</strong><span class="item-desc">kalıcı olarak silindi</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Kalan ücretsiz dakikalar</strong><span class="item-desc">kalıcı olarak silindi</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Tüm iş başına istatistikler</strong><span class="item-desc">kalıcı olarak silindi</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Günlük yedek 24 saat içinde üstüne yazılır</strong><span class="item-desc"><strong>hiçbir yerde kopya kalmaz</strong></span></span></li>
</ul>

Bu işlem anonimleştirme değildir. Kayıtlarınız toplu veya değiştirilmiş biçimde varlığını sürdürmez — silinir. Tek günlük yedek, silme işleminin ardından 24 saat içinde üstüne yazılır; ardından verilerinizin hiçbir sistemde hiçbir kopyası kalmaz.

Uygulama içi silme işlemi, GDPR Art. 17 ve KVKK Mad. 11(e) kapsamındaki silme hakkınızın resmi kullanımı niteliğindedir. Hesabınıza erişemiyorsanız, e-posta yoluyla silme talebinde bulunmak için **privacy@safescribe.dev** adresiyle iletişime geçin.

---

<span class="section-label">Ses İşleme</span>
## Sıfır Disk Politikası

<div class="flow-diagram">
Sesiniz:  Yükleme --> RAM --> YZ Transkripsiyonu --> Teslim --> SİL
                                                             (anında)

Diskimiz: Yalnızca bakiye kayıtları — ses, transkript veya e-posta yok
</div>

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Yalnızca RAM</strong><span class="item-desc">ses yalnızca uçucu bellekte işlenir</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Diske hiç yazılmaz</strong><span class="item-desc">geçici olarak bile</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Yapay zeka eğitimi yok</strong><span class="item-desc">sesiniz modelleri iyileştirmek için asla kullanılmaz</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Kendi barındırılan yapay zeka</strong><span class="item-desc">hiçbir üçüncü taraf yapay zeka servisi sesinizi almaz</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>TTL güvenlik kilidi</strong><span class="item-desc">silme kodu başarısız olsa bile veri kendiliğinden yok olur</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Bellek kilidi</strong><span class="item-desc">işletim sistemi düzeyinde kilit, sesin diske taşınmasını önler</span></span></li>
</ul>

---

<span class="section-label">Kimlik Doğrulama</span>
## Google veya Apple ile Giriş

OpenID Connect (OIDC) aracılığıyla Google Sign-In ve Sign in with Apple kullanıyoruz.

| Sağlayıcının bize gönderdiği | Ne yaptığımız |
|-----------------------------|--------------|
| Hesap kimliği | Karma (SHA-256 + tuz) — orijinal hemen silinir |
| E-posta adresi | Yalnızca kimlik doğrulama için kullanılır — **saklanmaz** |
| Görünen ad | **Saklanmaz** |

Kişi listenize, takviminize veya diğer hesap verilerinize erişmiyoruz.

---

<span class="section-label">Ödemeler</span>
## Uygulama Mağazaları Üzerinden Faturalandırma

Ödemeler tamamen Apple App Store veya Google Play Store tarafından işlenir. SafeScribe kredi kartı numarası veya ödeme bilgisi hiçbir zaman **almaz, saklamaz veya işlemez**. Bakiye doğrulaması için yalnızca bir satın alma makbuzu alırız.

<div class="callout callout-info">
  <strong>Apple veya Google'ın tuttuğu ödeme kayıtları</strong> SafeScribe'ın kontrolü dışındadır ve SafeScribe'ın hesap silme sürecine dahil değildir. Bu kayıtları yönetmek için doğrudan <a href="https://support.apple.com">Apple Destek</a> veya <a href="https://support.google.com/googleplay">Google Play Destek</a> ile iletişime geçin.
</div>

---

<span class="section-label">Hata Takibi</span>
## Kilitlenme Raporları (İsteğe Bağlı)

İsteğe bağlı kilitlenme raporlarını SafeScribe'ın kendi kilitlenme raporlama uç noktasına gönderiyoruz. Varsayılan olarak **kapalıdır** ve istediğiniz zaman Gizlilik Ayarları'ndan değiştirilebilir.

Herhangi bir rapor iletilmeden önce şunlar otomatik olarak kaldırılır:

**Silinen:** e-posta adresleri · telefon numaraları · IP adresleri · dosya yolları · kimlik doğrulama token'ları · iş tanımlayıcıları

**Saklanan:** hata türü ve yığın izleme · cihaz modeli · işletim sistemi sürümü · uygulama sürümü

---

<span class="section-label">Üçüncü Taraflar</span>
## Üçüncü Taraf Hizmetler

Aşağıdaki hizmetleri kullanıyoruz. Belirtilen bilgilerin ötesinde ses, transkript içeriği veya kişisel bilgi herhangi bir üçüncü tarafla paylaşılmaz.

| Hizmet | Amaç | Paylaşılan veri | Gizlilik Politikası |
|--------|------|-----------------|---------------------|
| Google Sign-In | Kimlik doğrulama | Yalnızca OIDC token | [policies.google.com/privacy](https://policies.google.com/privacy) |
| Apple Sign-In | Kimlik doğrulama | Yalnızca OIDC token | [apple.com/legal/privacy](https://www.apple.com/legal/privacy/) |
| Apple App Store | Uygulama içi satın alma | Yalnızca satın alma makbuzu | [apple.com/legal/privacy](https://www.apple.com/legal/privacy/) |
| Google Play Store | Uygulama içi satın alma | Yalnızca satın alma makbuzu | [policies.google.com/privacy](https://policies.google.com/privacy) |
| SafeScribe kilitlenme uç noktası | Kilitlenme raporlama (isteğe bağlı) | Anonim hata raporu — PII temizlenmiş | SafeScribe tarafından işletilir, üçüncü taraf yoktur |

---

<span class="section-label">Hukuki Dayanak</span>
## İşlemenin Hukuki Dayanağı

| İşleme faaliyeti | GDPR Dayanağı | KVKK Dayanağı | Zorunlu mu? |
|-----------------|--------------|--------------|-------------|
| Ses transkripsiyonu | Art. 6(1)(b) — Sözleşme | Açık rıza | Hizmetin kullanımı için zorunlu |
| Hesap ve faturalandırma | Art. 6(1)(b) — Sözleşme | Sözleşme ifası | Hizmetin kullanımı için zorunlu |
| Kimlik doğrulama (OIDC) | Art. 6(1)(b) — Sözleşme | Sözleşme ifası | Hizmetin kullanımı için zorunlu |
| Uygulama içi satın alma | Art. 6(1)(b) — Sözleşme | Sözleşme ifası | Satın alma için zorunlu |
| Kilitlenme raporlama | Art. 6(1)(a) — Rıza | Açık rıza | İsteğe bağlı |

Transkripsiyon, kimlik doğrulama ve faturalandırma için veri sağlamak SafeScribe'ı kullanmak için **zorunludur**. Kilitlenme raporlama **isteğe bağlıdır** — hizmet onsuz tam olarak çalışır.

---

<span class="section-label">Haklarınız</span>
## Yapabilecekleriniz

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Erişim</strong><span class="item-desc">tüm transkriptlerinizi uygulama içinde istediğiniz zaman görüntüleyin</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Silme</strong><span class="item-desc">Gizlilik Ayarları'ndan tek tek transkripti veya tüm hesabı silin; hesap silme işlemi herhangi bir veritabanında sıfır kayıt bırakır</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Dışa Aktarma</strong><span class="item-desc">transkriptleri paylaşın veya Gizlilik Ayarları'ndan tam veri dışa aktarma isteyin</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Tanılamadan çekilme</strong><span class="item-desc">Gizlilik Ayarları'ndan kilitlenme raporlamayı kapatın</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Rızayı geri alma</strong><span class="item-desc">istediğiniz zaman çıkış yapıp hesabınızı silin</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>CCPA seçim hakkı</strong><span class="item-desc">Gizlilik Ayarları'ndan "Verilerimi Satma veya Paylaşma" seçeneğini kapatın</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Otomatik karar yok</strong><span class="item-desc">hakkınızda hukuki veya benzer önemli etkiler doğuran profilleme dahil hiçbir otomatik karar vermiyoruz (GDPR Art. 22)</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Şikayet başvurusu</strong><span class="item-desc">AB/AEA'daki kullanıcılar ulusal denetim otoritelerine (<a href="https://www.edpb.europa.eu/about-edpb/about-edpb/members_en">edpb.europa.eu</a>); Türkiye'deki kullanıcılar KVKK'ya (<a href="https://www.kvkk.gov.tr">kvkk.gov.tr</a>) başvurabilir</span></span></li>
</ul>

Uygulama içinde tamamlayamadığınız herhangi bir talep için **privacy@safescribe.dev** adresine yazın.

---

<span class="section-label">Hukuki Bilgiler</span>
## Ek Bilgiler

**Veri sorumlusu.** SafeScribe, Türkiye'de yerleşik bağımsız bir geliştirici tarafından işletilmektedir. İletişim: privacy@safescribe.dev. Veri Koruma Görevlisi (DPO) atanmamıştır — işleme büyük ölçekte yürütülmemekte ve özel kategori veri sistematik olarak tutulmamaktadır (ses yalnızca RAM'de geçici olarak işlenmekte, diske kaydedilmemektedir).

**Yedekler.** Hizmet sürekliliği için hesap kayıtlarının (takma adlı kimlik, bakiye, kullanım istatistikleri) tek günlük yedeği tutulmaktadır. Her yedek bir öncekinin üstüne yazılır. Hesap silme işlemiyle silinen veriler canlı sistemlerden hemen, yedekten ise 24 saat içinde kaldırılır.

**Uluslararası aktarımlar.** SafeScribe'ı AB/AEA'dan kullanıyorsanız, ses ve hesap verileriniz Türkiye'deki sunucularda işlenmektedir. Türkiye'nin halihazırda <a href="https://commission.europa.eu/law/law-topic/data-protection/international-dimension-data-protection/adequacy-decisions_en">AB yeterlilik kararı</a> bulunmamaktadır; aktarımlar, ilk açılışta verilen açık rızanıza dayanmaktadır (GDPR Art. 49(1)(a)). Türkiye'deki (KVKK) kullanıcılar için yurt dışı aktarım, KVKK Mad. 9 kapsamında ilk açılıştaki açık rızayla yetkilendirilmiştir.

**Çocuklar.** SafeScribe, App Store ve Google Play'de 17+ olarak derecelendirilmiştir ve 17 yaşın altındaki kullanıcılara yönelik değildir. 17 yaşın altındaki kişilerden bilerek veri toplamıyoruz. Türkiye dahil tam hukuki ehliyetin 18 yaşında kazanıldığı ülkelerde, 17 yaşındaki kullanıcıların uygulamayı kullanmadan önce ebeveyn veya vasi onayı alması gerekmektedir.

**Politika değişiklikleri.** Uygulamalarımız değiştiğinde bu sayfayı güncelleyeceğiz. Yukarıdaki "Son güncelleme" tarihi en son revizyonu yansıtır.

---

<span class="section-label">İletişim</span>
## Bizimle İletişime Geçin

| Konu | İletişim |
|------|---------|
| Gizlilik talepleri, veri silme, haklar | privacy@safescribe.dev |
| Güvenlik açıkları | security@safescribe.dev |
| Genel destek | support@safescribe.dev |

---


</div>
