---
layout: default
title: SafeScribe — Datenschutz-Folgenabschätzung
description: Formelle Risikoanalyse für SafeScribes Audiotranskriptionsdienst gemäß DSGVO und KVKK.
lang: de
---

<div class="page-content" markdown="1">

# Datenschutz-Folgenabschätzung

<div class="summary-box">
  <strong>Kernergebnis:</strong> Da Audio im flüchtigen Speicher verarbeitet und sofort gelöscht wird — und nach der Verarbeitung keine personenbezogenen Daten auf unseren Servern verbleiben — sind alle identifizierten Risiken nach Anwendung der Schutzmaßnahmen auf <strong>Niedrig</strong> reduziert. Die Verarbeitung kann unter den dokumentierten Rechtsgrundlagen und Schutzmaßnahmen erfolgen.
</div>

<p class="page-meta">SafeScribe KI-Audiotranskription · Version 1.0 · März 2026 · Vorbewertung vor dem Launch · Überprüfung fällig: 6 Monate nach Launch</p>

---

<span class="section-label">Abschnitt 1</span>
## Verarbeitungsbeschreibung

### Was wir verarbeiten und warum

| Zweck | Verarbeitete Daten | Rechtsgrundlage (DSGVO) | KVKK-Grundlage |
|-------|-------------------|------------------------|----------------|
| Audiotranskription | Audiodatei (nur RAM, nach Verarbeitung gelöscht) | Art. 6(1)(b) — Vertragserfüllung | Ausdrückliche Einwilligung |
| Konto & Abrechnung | Pseudonyme Benutzer-ID, Guthaben, Nutzungsmetadaten | Art. 6(1)(b) — Vertragserfüllung | Ausdrückliche Einwilligung |
| Authentifizierung | OIDC-Konto-ID (gehasht, Original verworfen) | Art. 6(1)(b) — Vertragserfüllung | Vertragserfüllung |
| In-App-Kauf | IAP-Beleg von App Store / Play Store | Art. 6(1)(b) — Vertragserfüllung | Vertragserfüllung |
| Altersbestätigung | Selbstdeklarierte Altersbestätigung (17+) | Art. 8 DSGVO / KVKK Art. 6 | Rechtliche Verpflichtung |
| Absturzberichte | Anonymisierte Fehlerberichte (Opt-in, PII-bereinigt) | Art. 6(1)(a) — Einwilligung | Ausdrückliche Einwilligung |

### Datenbestand

| Daten | Serveraufbewahrung |
|-------|-------------------|
| Audiodatei | Nur RAM — nach Transkription gelöscht |
| Transkripttext | Bis zur Client-Bestätigung (~Sekunden) |
| Pseudonyme Benutzer-ID | Bis zur Kontolöschung |
| Kontoguthaben + Nutzungsmetadaten | Bis zur Kontolöschung |
| E-Mail-Adresse | Nur Transit — **nicht gespeichert** |
| IP-Adressen | Nur Transit — **nicht protokolliert** |
| Absturzberichte (Opt-in) | Sentry-Aufbewahrungsrichtlinie |

<p>Vollständige Details zum Datenbestand finden Sie in der <a href="privacy#data-we-collect">Datenschutzerklärung § Daten, die wir erheben</a>.</p>

<div class="callout callout-info">
  <strong>Metadaten pro Auftrag</strong> umfassen: Audiodauer (Sekunden), Dateigröße (Bytes), Wortanzahl, Betrag (USD) und Verarbeitungszeitstempel. Sie enthalten keinen Audioinhalt, keinen Transkripttext und keine benutzerbezogenen Informationen.
</div>

<div class="callout callout-info">
  <strong>Backup-Aufbewahrung.</strong> Ein tägliches Backup der Kontodaten wird für die Dienstkontinuität aufbewahrt. Jedes Backup überschreibt das vorherige. Über die Kontolöschung gelöschte Daten werden sofort aus Live-Systemen entfernt und innerhalb von 24 Stunden aus dem Backup — danach verbleibt keine Kopie.
</div>

### Verarbeitungsablauf

<div class="flow-diagram">
1. Benutzer nimmt Audio auf dem Gerät auf oder wählt es aus
2. Audio wird geräteseitig vorverarbeitet (80-Hz-Hochpassfilter, Stille-Trimmen, Lautstärkenormalisierung auf -16 LUFS, Peak-Limiting, 16-kHz-Resampling, FLAC-Kodierung)
3. Verschlüsselter Upload zu SafeScribe-Servern (TLS + Certificate Pinning)
4. Server verarbeitet Audio im RAM — selbst gehostete Whisper-Modellgewichte via <a href="https://github.com/SYSTRAN/faster-whisper">faster-whisper</a> / CTranslate2, keine Drittanbieter-API-Aufrufe
5. Transkript wird mit SHA-256-Integritätsprüfsumme zurückgegeben
6. Client überprüft Prüfsumme, bestätigt Empfang
7. Server löscht Transkript und Audio sofort aus dem RAM
8. Transkript wird lokal auf dem Gerät in AES-256-verschlüsseltem Speicher gespeichert
</div>

---

<span class="section-label">Abschnitt 2</span>
## Erforderlichkeit und Verhältnismäßigkeit

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Audio-Upload ist erforderlich</strong><span class="item-desc">serverseitige KI-Verarbeitung liefert höhere Genauigkeit als aktuelle On-Device-Alternativen auf dem von SafeScribe geforderten Qualitätsniveau</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Authentifizierung ist erforderlich</strong><span class="item-desc">notwendig für benutzerbezogene Abrechnung und Auftragsisolierung</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Absturzberichte sind verhältnismäßig</strong><span class="item-desc">PII wird vor der Übertragung bereinigt; nur Opt-in</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Datenminimierung</strong><span class="item-desc">Audio wird nur im RAM verarbeitet, nie auf Festplatte geschrieben</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Minimale Aufbewahrung</strong><span class="item-desc">Transkripte werden innerhalb von Sekunden nach der Bestätigung gelöscht</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Keine Sekundärnutzung</strong><span class="item-desc">Audio wird nie für Modelltraining oder Analysen verwendet</span></span></li>
</ul>

### Betroffenenrechte

Alle DSGVO- und KVKK-Betroffenenrechte (Auskunft, Berichtigung, Löschung, Einschränkung, Datenübertragbarkeit, Widerspruch und Widerruf der Einwilligung) können in der App oder per E-Mail an privacy@safescribe.dev ausgeübt werden. Details finden Sie in unserer <a href="privacy#what-you-can-do">Datenschutzerklärung § Was Sie tun können</a>.

---

<span class="section-label">Abschnitt 3</span>
## Risikobewertung

### Identifizierte Risiken und Schutzmaßnahmen

| Risiko | Inhärent | Schutzmaßnahmen | Residual |
|--------|----------|-----------------|----------|
| Audio enthält sensible personenbezogene Daten (Gesundheit, Recht, Finanzen) | **Hoch** | Nur-RAM-Verarbeitung; sofortige Löschung; keine dauerhafte Speicherung; kein Drittanbieterzugriff | **Niedrig** |
| Unbefugter Zugriff auf Transkript während der Übertragung | Mittel | TLS 1.2+ mit Certificate Pinning; SHA-256-Integritätsprüfung | **Niedrig** |
| Serverseitiger Einbruch mit Offenlegung von Audio oder Transkripten | Mittel | Keine dauerhafte Audiospeicherung; authentifizierte API; Auftragsisolierung; TTL-Failsafe | **Niedrig** |
| Unbefugter Zugriff auf lokal verschlüsselten Speicher | Niedrig | AES-256-verschlüsselte Container; Schlüssel in iOS Keychain / Android Keystore | **Niedrig** |
| PII-Leck durch Absturzberichte | Niedrig | Musterbasierte Bereinigung von E-Mails, Telefonnummern, IPs, Tokens vor Sentry | **Niedrig** |
| Grenzüberschreitende Datenübertragung | Mittel | KVKK-ausdrückliche Einwilligung beim ersten Start; DSGVO-SCCs mit Unterauftragsverarbeitern | **Niedrig** |
| KI erzeugt ungenaues Transkript sensibler Inhalte | Niedrig | Transkription ist nur informativ; Benutzer prüft alle Ausgaben; keine automatisierten Entscheidungen | **Niedrig** |

<div class="callout callout-green">
  <strong>Alle Residualrisiken sind Niedrig.</strong> Der primäre Risikotreiber — sensible Audioinhalte — wird auf Architekturebene adressiert: Audio wird nie auf Festplatte geschrieben, nie über die Verarbeitung hinaus aufbewahrt und nie mit Dritten geteilt.
</div>

---

<span class="section-label">Abschnitt 4</span>
## Einwilligung und Transparenz

Benutzern wird vor der ersten Nutzung ein granularer Einwilligungsbildschirm mit vier unabhängigen Karten präsentiert:

<div class="infra-grid">
  <div class="infra-item">
    <div class="infra-icon">&#x1f3a4;</div>
    <h4>Audioverarbeitung <em style="font-weight:400;font-size:0.8rem;">(erforderlich)</em></h4>
    <p>Erklärt die Nur-RAM-Verarbeitung, sofortige Löschung und dass Audio nie auf Festplatte geschrieben oder mit Dritten geteilt wird.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f4ca;</div>
    <h4>Gespeicherte Daten <em style="font-weight:400;font-size:0.8rem;">(erforderlich)</em></h4>
    <p>Erklärt, welche dauerhaften Daten gespeichert werden: pseudonyme Konto-ID, Guthabenstand und anonyme Nutzungsmetadaten.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f9d2;</div>
    <h4>Altersbestätigung <em style="font-weight:400;font-size:0.8rem;">(erforderlich)</em></h4>
    <p>Bestätigt, dass der Benutzer 17 Jahre oder älter ist. Erforderliche Karten müssen akzeptiert werden, um fortzufahren.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f41b;</div>
    <h4>Absturzberichte <em style="font-weight:400;font-size:0.8rem;">(optional)</em></h4>
    <p>Ermöglicht das Opt-in für anonyme Absturzberichte. Standardmäßig deaktiviert. Jederzeit in den Datenschutzeinstellungen umschaltbar.</p>
  </div>
</div>

- Zustimmen- und Ablehnen-Schaltflächen haben gleiche visuelle Gewichtung (gemäß <a href="https://www.edpb.europa.eu/our-work-tools/our-documents/guidelines/guidelines-052020-consent-under-regulation-2016679_en">EDPB-Leitlinien</a> zu Dark Patterns)
- Benutzer können die Einwilligung jederzeit widerrufen und ihr Konto in den Datenschutzeinstellungen löschen
- Diese DSFA wird jährlich oder bei wesentlichen Verarbeitungsänderungen überprüft
- Unter dieser URL zur öffentlichen Transparenz veröffentlicht

---

<span class="section-label">Abschnitt 5</span>
## Entscheidung

<div class="callout callout-green">
  Auf Grundlage der obigen Bewertung sind alle Residualrisiken <strong>Niedrig</strong>. Die Verarbeitung kann unter den identifizierten Rechtsgrundlagen mit den dokumentierten Schutzmaßnahmen erfolgen. Eine vorherige Konsultation der Aufsichtsbehörde ist nicht erforderlich.
</div>

---

<span class="section-label">Überprüfungsprotokoll</span>
## Versionshistorie

| Datum | Version | Änderungen |
|-------|---------|------------|
| März 2026 | 1.0 | Initiale DSFA vor dem Launch für Audiotranskriptionspipeline, Einwilligungsbildschirmdesign, Risikobewertung und Rechtsgrundlagendokumentation |

---

</div>
