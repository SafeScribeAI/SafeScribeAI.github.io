---
layout: default
title: SafeScribe — Datenschutzerklärung
description: Welche Daten SafeScribe erhebt, wie wir sie verarbeiten und Ihre Rechte.
lang: de
---

<div class="page-content" markdown="1">

# Datenschutzerklärung

<div class="summary-box">
  <strong>Kurz erklärt:</strong> Wir verarbeiten Ihr Audio im Serverarbeitsspeicher, um ein Transkript zu erstellen, und löschen es sofort danach. Wir speichern Audio nicht auf der Festplatte, verwenden es nicht für KI-Training und geben es an niemanden weiter. Ihre Transkripte werden verschlüsselt auf Ihrem Gerät gespeichert und stehen unter Ihrer Kontrolle. Wir bewahren nur pseudonyme Abrechnungsdaten auf.
</div>

<p class="page-meta">Zuletzt aktualisiert: März 2026</p>

---

<span class="section-label">Was wir nie tun</span>
## Daten, die wir nicht erheben oder speichern
{: #data-we-dont-collect-or-store}

<ul class="dont-list">
  <li><span class="x-mark">&#x2717;</span> Audio auf der Festplatte speichern — niemals</li>
  <li><span class="x-mark">&#x2717;</span> Ihre E-Mail-Adresse oder Ihren Namen speichern</li>
  <li><span class="x-mark">&#x2717;</span> IP-Adressen protokollieren oder speichern</li>
  <li><span class="x-mark">&#x2717;</span> Aufnahmen für KI-Modelltraining verwenden</li>
  <li><span class="x-mark">&#x2717;</span> Daten mit Werbetreibenden oder Datenbrokern teilen</li>
  <li><span class="x-mark">&#x2717;</span> Verhalten über Apps oder Sitzungen hinweg verfolgen</li>
  <li><span class="x-mark">&#x2717;</span> Kontakte, Standort oder biometrische Daten erfassen</li>
  <li><span class="x-mark">&#x2717;</span> Daten nach Kontolöschung aufbewahren</li>
</ul>

---

<span class="section-label">Was wir speichern</span>
## Erhobene Daten

### Serverseitig (dauerhaft bis zur Kontolöschung)

| Daten | Zweck |
|-------|-------|
| Pseudonyme Benutzer-ID (SHA-256-Hash Ihrer Konto-ID) | Kontoidentität — nicht umkehrbar |
| Pseudonymer Gerätebezeichner (SHA-256-Hash der Geräteeigenschaften) | Missbrauchsprävention — nicht umkehrbar |
| Kontoguthaben (USD) | Kreditverwaltung |
| Verbleibende kostenlose Transkriptionsminuten | Willkommensbonus-Tracking |
| Zeitstempel für Kontoerstellung und letzte Aktualisierung | Kontoverwaltung |

**Auftragsbezogene Datensätze** (für jede abgeschlossene Transkription gespeichert):

| Daten | Zweck |
|-------|-------|
| Audiodauer (Sekunden) | Dienstanalyse |
| Dateigröße (Byte) | Dienstanalyse |
| Wortanzahl | Dienstanalyse |
| Berechneter Betrag (USD) | Abrechnungsdatensatz |
| Verarbeitungs-Zeitstempel | Dienstanalyse |

<div class="callout callout-info">
  <strong>Auftragsbezogene Datensätze enthalten niemals Audioinhalte oder Transkripttext.</strong> Diese Datensätze enthalten nur Metadaten (Zahlen und Zeitstempel) — niemals das, was Sie gesagt haben.
</div>

### Serverseitig (vorübergehend — nach der Verarbeitung gelöscht)

| Daten | Wann gelöscht |
|-------|--------------|
| Audiodatei | Unmittelbar nach Abschluss der Transkription |
| Transkripttext | Nachdem Sie den Empfang bestätigt haben |

### Auf Ihrem Gerät (verschlüsselt)

| Daten | Aufbewahrungsdauer |
|-------|-------------------|
| Transkripte (Text, Segmente, Metadaten) | Bis Sie sie löschen |
| Offline-Upload-Warteschlange | Nach erfolgreichem Upload entfernt |
| App-Einstellungen und Einwilligungsdatensätze | Bis zur Abmeldung oder Kontolöschung |
| Verschlüsselungsschlüssel | Im iOS Keychain / Android Keystore — gelöscht mit der App |

### Optional (nur bei Zustimmung)

| Daten | Zweck |
|-------|-------|
| Absturzberichte | App-Stabilität über SafeScribes eigenen Absturzbericht-Endpunkt — alle personenbezogenen Daten vor der Übertragung entfernt |

<div class="callout callout-green">
  <strong>Der Server speichert niemals Ihren Namen, Ihre E-Mail-Adresse, Ihre IP-Adresse, Audioinhalte oder Transkripttexte.</strong> Die einzigen dauerhaften Datensätze, die mit Ihrem Konto verknüpft sind, bestehen aus einem nicht umkehrbaren Benutzer-Hash, einem pseudonymen Gerätebezeichner, einem Guthaben und Nutzungsstatistiken (nur Zahlen — keine Inhalte, keine Identität).
</div>

---

<span class="section-label">Vollständige Löschung</span>
## App löschen vs. Konto löschen

Dies sind zwei unterschiedliche Aktionen mit verschiedenen Folgen:

| Aktion | Was passiert | Ihr Guthaben |
|--------|-------------|-------------|
| **App löschen** | Lokale Transkripte und Verschlüsselungsschlüssel werden von Ihrem Gerät entfernt | Auf dem Server erhalten — erneute Installation und Anmeldung mit demselben Konto stellt es vollständig wieder her |
| **Konto löschen** | Jeder serverseitige Datensatz wird dauerhaft gelöscht — nicht rückgängig zu machen | Weg |

<div class="callout callout-info">
  <strong>Jederzeit neu installieren.</strong> Wenn Sie die App löschen, ohne Ihr Konto zu löschen, können Sie die App neu installieren und sich mit demselben Google- oder Apple-Konto anmelden, um Ihr vollständiges Guthaben und den Zugang wiederherzustellen — ohne weiteres Zutun.
</div>

### Kontolöschung — Null verbleibende Daten

Das Löschen Ihres Kontos aus den Datenschutzeinstellungen entfernt dauerhaft jeden serverseitigen Datensatz:

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Pseudonyme Benutzer-ID</strong><span class="item-desc">dauerhaft gelöscht</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Pseudonymer Gerätebezeichner</strong><span class="item-desc">dauerhaft gelöscht</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Guthabensaldo</strong><span class="item-desc">dauerhaft gelöscht</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Verbleibende Freiminuten</strong><span class="item-desc">dauerhaft gelöscht</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Alle auftragsbezogenen Statistiken</strong><span class="item-desc">dauerhaft gelöscht</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Tägliche Sicherung innerhalb von 24 Stunden überschrieben</strong><span class="item-desc"><strong>nirgendwo verbleibt eine Kopie</strong></span></span></li>
</ul>

Dies ist keine Anonymisierung. Ihre Datensätze bleiben nicht in aggregierter oder veränderter Form bestehen — sie werden gelöscht. Die tägliche Sicherung wird innerhalb von 24 Stunden nach der Löschung überschrieben, danach existiert keine Kopie Ihrer Daten in einem System.

Die In-App-Löschung gilt als formelle Ausübung Ihres Löschrechts gemäß GDPR Art. 17 und KVKK Art. 11(e). Falls Sie nicht auf Ihr Konto zugreifen können, kontaktieren Sie **privacy@safescribe.dev**, um einen Löschantrag per E-Mail zu stellen.

---

<span class="section-label">Audioverarbeitung</span>
## Null-Festplatten-Richtlinie

<div class="flow-diagram">
Ihr Audio:  Upload --> RAM --> KI-Transkription --> Zustellung --> LÖSCHEN
                                                                   (sofort)

Unsere Festplatte:  Nur Guthabenaufzeichnungen — kein Audio, kein Transkript, keine E-Mail
</div>

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Nur RAM</strong><span class="item-desc">Audio wird ausschließlich im flüchtigen Speicher verarbeitet</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Niemals auf die Festplatte geschrieben</strong><span class="item-desc">nicht einmal vorübergehend</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Kein KI-Training</strong><span class="item-desc">Ihr Audio wird niemals zur Modellverbesserung verwendet</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Selbst gehostete KI</strong><span class="item-desc">kein Drittanbieter-KI-Dienst erhält Ihr Audio</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>TTL-Sicherung</strong><span class="item-desc">Daten löschen sich selbst, auch wenn der Löschcode fehlschlägt</span></span></li>
</ul>

---

<span class="section-label">Authentifizierung</span>
## Anmeldung über Google oder Apple

Wir verwenden OpenID Connect (OIDC) über Google Sign-In und Sign in with Apple.

| Was der Anbieter uns sendet | Was wir damit machen |
|-----------------------------|---------------------|
| Konto-ID | Gehasht (SHA-256 + Salt) — Original wird verworfen |
| E-Mail-Adresse | Nur für Authentifizierung verwendet — **nicht gespeichert** |
| Anzeigename | **Nicht gespeichert** |

Wir greifen nicht auf Ihre Kontakte, Kalender oder andere Kontodaten zu.

---

<span class="section-label">Zahlungen</span>
## Abrechnung über App Stores

Zahlungen werden vollständig von Apple App Store oder Google Play Store verarbeitet. SafeScribe **empfängt, speichert oder verarbeitet** niemals Kreditkartennummern oder Zahlungsdetails. Wir erhalten nur einen Kaufbeleg zur Guthabenverifizierung.

<div class="callout callout-info">
  <strong>Von Apple oder Google gespeicherte Zahlungsdaten</strong> liegen außerhalb der Kontrolle von SafeScribe und werden nicht vom Kontolöschungsprozess von SafeScribe erfasst. Um diese Datensätze zu verwalten, wenden Sie sich direkt an den <a href="https://support.apple.com">Apple Support</a> oder den <a href="https://support.google.com/googleplay">Google Play Support</a>.
</div>

---

<span class="section-label">Fehlerverfolgung</span>
## Absturzberichte (Optional)

Wir senden optionale Absturzberichte an SafeScribes eigenen Absturzbericht-Endpunkt. Dies ist **standardmäßig deaktiviert** und kann jederzeit in den Datenschutzeinstellungen umgeschaltet werden.

Bevor ein Bericht übertragen wird, werden folgende Daten automatisch entfernt:

**Entfernt:** E-Mail-Adressen · Telefonnummern · IP-Adressen · Dateipfade · Authentifizierungstoken

**Behalten:** Fehlertyp und Stack-Trace · Gerätemodell · Betriebssystemversion · App-Version

---

<span class="section-label">Drittanbieter</span>
## Drittanbieterdienste

Wir verwenden folgende Dienste. Über das Angegebene hinaus werden keine Audio-, Transkriptinhalte oder personenbezogenen Informationen mit Dritten geteilt.

| Dienst | Zweck | Geteilte Daten | Datenschutzrichtlinie |
|--------|-------|---------------|----------------------|
| Google Sign-In | Authentifizierung | Nur OIDC-Token | [policies.google.com/privacy](https://policies.google.com/privacy) |
| Apple Sign-In | Authentifizierung | Nur OIDC-Token | [apple.com/legal/privacy](https://www.apple.com/legal/privacy/) |
| Apple App Store | In-App-Käufe | Nur Kaufbeleg | [apple.com/legal/privacy](https://www.apple.com/legal/privacy/) |
| Google Play Store | In-App-Käufe | Nur Kaufbeleg | [policies.google.com/privacy](https://policies.google.com/privacy) |
| SafeScribe-Absturzbericht-Endpunkt | Absturzberichte (opt-in) | Anonymer Fehlerbericht — personenbezogene Daten entfernt | Von SafeScribe betrieben, kein Drittanbieter |

---

<span class="section-label">Rechtsgrundlage</span>
## Rechtsgrundlage der Verarbeitung

| Verarbeitungsaktivität | GDPR-Grundlage | KVKK-Grundlage (Türkei) | Erforderlich? |
|----------------------|----------------|----------------|--------------|
| Audiotranskription | Art. 6(1)(b) — Vertrag | Ausdrückliche Einwilligung | Erforderlich zur Nutzung des Dienstes |
| Konto & Abrechnung | Art. 6(1)(b) — Vertrag | Vertragserfüllung | Erforderlich zur Nutzung des Dienstes |
| Authentifizierung (OIDC) | Art. 6(1)(b) — Vertrag | Vertragserfüllung | Erforderlich zur Nutzung des Dienstes |
| In-App-Käufe | Art. 6(1)(b) — Vertrag | Vertragserfüllung | Erforderlich für Käufe |
| Absturzberichte | Art. 6(1)(a) — Einwilligung | Ausdrückliche Einwilligung | Optional |

Die Bereitstellung von Daten für Transkription, Authentifizierung und Abrechnung ist zur Nutzung von SafeScribe **erforderlich**. Absturzberichte sind **optional** — der Dienst funktioniert vollständig ohne sie.

---

<span class="section-label">Ihre Rechte</span>
## Was Sie tun können

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Zugriff</strong><span class="item-desc">alle Ihre Transkripte jederzeit in der App anzeigen</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Löschen</strong><span class="item-desc">einzelne Transkripte oder Ihr gesamtes Konto aus den Datenschutzeinstellungen entfernen; die Kontolöschung hinterlässt keine einzige Zeile in einer Datenbank</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Exportieren</strong><span class="item-desc">Transkripte teilen oder exportieren, oder einen vollständigen Datenexport aus den Datenschutzeinstellungen anfordern</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Diagnose ablehnen</strong><span class="item-desc">Absturzberichte in den Datenschutzeinstellungen deaktivieren</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Einwilligung widerrufen</strong><span class="item-desc">sich jederzeit abmelden und Ihr Konto löschen</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>CCPA-Opt-out</strong><span class="item-desc">„Nicht verkaufen oder teilen" in den Datenschutzeinstellungen aktivieren</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Keine automatisierten Entscheidungen</strong><span class="item-desc">wir treffen niemals automatisierte Entscheidungen über Sie, einschließlich Profiling mit rechtlichen oder ähnlich bedeutsamen Auswirkungen (GDPR Art. 22)</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Beschwerde einreichen</strong><span class="item-desc">EU/EWR-Einwohner können ihre nationale Aufsichtsbehörde kontaktieren (<a href="https://www.edpb.europa.eu/about-edpb/about-edpb/members_en">edpb.europa.eu</a>); Einwohner der Türkei können die KVKK kontaktieren (<a href="https://www.kvkk.gov.tr">kvkk.gov.tr</a>)</span></span></li>
</ul>

Für Anfragen, die Sie nicht in der App erledigen können, wenden Sie sich an **privacy@safescribe.dev**.

---

<span class="section-label">Rechtliches</span>
## Weitere Informationen

**Verantwortlicher.** SafeScribe wird von einem unabhängigen Entwickler mit Sitz in der Türkei betrieben. Kontakt: privacy@safescribe.dev. Es wurde kein Datenschutzbeauftragter (DSB) ernannt — die Verarbeitung erfolgt nicht in großem Maßstab und es werden keine besonderen Kategorien personenbezogener Daten systematisch gespeichert (Audio wird nur flüchtig im RAM verarbeitet, nie auf Disk gespeichert).

**Backups.** Eine tägliche Sicherung der Kontodaten (pseudonyme ID, Guthaben, Nutzungsstatistiken) wird zur Aufrechterhaltung des Dienstes aufbewahrt. Jede Sicherung überschreibt die vorherige. Durch Kontolöschung gelöschte Daten werden sofort aus den Live-Systemen und innerhalb von 24 Stunden aus der Sicherung entfernt.

**Internationale Übertragungen.** Wenn Sie SafeScribe aus der EU/dem EWR nutzen, werden Ihre Audio- und Kontodaten auf Servern in der Türkei verarbeitet. Die Türkei verfügt derzeit über keinen <a href="https://commission.europa.eu/law/law-topic/data-protection/international-dimension-data-protection/adequacy-decisions_en">EU-Angemessenheitsbeschluss</a>; Übertragungen werden durch Ihre ausdrückliche informierte Einwilligung beim ersten Start abgedeckt (GDPR Art. 49(1)(a)). Für Nutzer in der Türkei (KVKK – türkisches Datenschutzgesetz) wird die grenzüberschreitende Übertragung durch die ausdrückliche Einwilligung beim ersten Start gemäß KVKK Art. 9 genehmigt.

**Kinder.** SafeScribe ist ab 17 Jahren eingestuft und nicht für Nutzer unter 17 Jahren bestimmt. Wir erfassen wissentlich keine Daten von Minderjährigen. In Ländern, in denen 18 Jahre das Volljährigkeitsalter ist (einschließlich der Türkei), benötigen Nutzer im Alter von 17 Jahren die Zustimmung eines Elternteils oder Erziehungsberechtigten, bevor sie die App nutzen.

**Richtlinienänderungen.** Wir werden diese Seite aktualisieren, wenn sich unsere Praktiken ändern. Das oben genannte Datum der letzten Aktualisierung gibt die neueste Überarbeitung an.

---

<span class="section-label">Kontakt</span>
## Kontaktieren Sie uns

| Thema | Kontakt |
|-------|---------|
| Datenschutzanfragen, Datenlöschung, Rechte | privacy@safescribe.dev |
| Sicherheitslücken | security@safescribe.dev |
| Allgemeiner Support | support@safescribe.dev |

---


</div>
