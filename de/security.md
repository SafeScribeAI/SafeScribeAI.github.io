---
layout: default
title: SafeScribe — Sicherheitsarchitektur
description: Wie SafeScribe Ihre Audiodaten schützt — technischer Überblick über unser Privacy-by-Design-Konzept.
lang: de
---

<div class="page-content" markdown="1">

# Sicherheitsarchitektur

<div class="summary-box">
  <strong>Kurz gesagt:</strong> SafeScribe verarbeitet Ihre Audiodaten ausschließlich im flüchtigen Arbeitsspeicher (RAM) des Servers. Sobald Ihr Transkript zugestellt wurde, werden alle Daten unwiederbringlich gelöscht. Kein Schreiben auf die Festplatte, keine Backups, keine Kopien — niemals. Diese Seite erklärt, wie jede Schutzebene funktioniert.
</div>

<p class="page-meta">Zuletzt aktualisiert: März 2026</p>

---

<span class="section-label">Überblick</span>
## Sechs Schutzebenen

<div class="infra-grid">
  <div class="infra-item">
    <div class="infra-icon">&#x1f510;</div>
    <h4>Ebene 1 — Transport</h4>
    <p>TLS 1.3 bei jeder Verbindung. Der Datenverkehr ist durchgehend verschlüsselt.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f9e0;</div>
    <h4>Ebene 2 — Nur RAM</h4>
    <p>Audio berührt niemals die Festplatte. Verarbeitung im flüchtigen Speicher, sofortige Löschung nach der Transkription.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f464;</div>
    <h4>Ebene 3 — Pseudonyme Identität</h4>
    <p>E-Mail-Adresse und Name werden nie gespeichert. Nur ein Einweg-Hash Ihrer Konto-ID wird aufbewahrt.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f512;</div>
    <h4>Ebene 4 — Lokale Verschlüsselung</h4>
    <p>AES-256 auf dem Gerät. Schlüssel ausschließlich in hardwaregesichertem Speicher (iOS Keychain / Android Keystore).</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f41b;</div>
    <h4>Ebene 5 — PII-Entfernung</h4>
    <p>Absturzberichte werden vor dem Verlassen Ihres Geräts vollständig von persönlichen Daten bereinigt.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f5d1;</div>
    <h4>Ebene 6 — Kaskadenlöschung</h4>
    <p>Jeder Verarbeitungsschritt löscht die Daten des vorherigen Schritts sofort. TTL-Sicherheitsnetz als Failsafe.</p>
  </div>
</div>

---

<span class="section-label">Designprinzip</span>
## Verarbeiten, Zustellen, Löschen

Klassische Transkriptionsdienste schreiben Audio auf Festplatten und können es unbegrenzt aufbewahren. SafeScribe empfängt Audio im RAM, verarbeitet es und löscht es, sobald Sie Ihr Transkript erhalten — kein Byte wird auf Dauerspeicher geschrieben. Den vollständigen Ablauf zeigt das <a href="#your-datas-journey">Datenflussdiagramm</a> unten.

Der entscheidende Unterschied: Selbst bei einer physischen Beschlagnahme des Servers wären keine Audio- oder Transkriptdaten vorhanden — sie existierten nur im flüchtigen Speicher.

---

<span class="section-label">Ebene 1</span>
## Transportsicherheit

| Schutzmaßnahme | Was verhindert wird |
|----------------|---------------------|
| TLS 1.3 Verschlüsselung | Abhören des Netzwerkverkehrs |
| SHA-256-Integritätsprüfung | Manipulationen am Transkript während der Übertragung |

<div class="callout callout-green">
  <strong>Überprüfbar:</strong> Mit Wireshark lässt sich bestätigen, dass der gesamte SafeScribe-Datenverkehr TLS-verschlüsselt ist.
</div>

---

<span class="section-label">Ebene 2</span>
## Nur-RAM-Serververarbeitung

Dies ist das Herzstück des SafeScribe-Datenschutzdesigns. Der Server führt OpenAIs Whisper-Modellgewichte über die selbst gehostete <a href="https://github.com/SYSTRAN/faster-whisper">faster-whisper</a>-Inferenzengine aus — keine Drittanbieter-API-Aufrufe. Der Datenspeicher ist für rein flüchtigen Betrieb ohne Festplattenpersistenz konfiguriert.

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span> Ein Serverneustart löscht alle In-Memory-Daten dauerhaft — by Design</li>
  <li><span class="check-mark">&#x2713;</span> Keine Datei, kein Backup und kein Protokoll enthält Ihre Audiodaten</li>
  <li><span class="check-mark">&#x2713;</span> Eine forensische Serveranalyse würde null Audioinhalte ergeben</li>
</ul>

**Temporäre Serverspeicherung (nur im RAM):**

| Daten | Gelöscht wann |
|-------|---------------|
| Audio-Bytes | Nach Abschluss der Transkription |
| Transkripttext | Nach Empfangsbestätigung |
| Auftragsmetadaten | Nach Empfangsbestätigung |

**Dauerhafte Serverspeicherung (auf Festplatte):**

| Daten | Zweck | Enthält personenbezogene Daten? |
|-------|-------|---------------------------------|
| Pseudonyme Benutzer-ID | Abrechnungsnachweis | Nein — Einweg-Hash, nicht umkehrbar |
| Dauer und Kosten | Finanznachweis | Nein |
| Dateigröße (Bytes) | Dienstanalyse | Nein |
| Wortanzahl | Dienstanalyse | Nein |
| Zeitstempel | Prüfpfad | Nein |

<div class="callout callout-green">
  <strong>By Design:</strong> Es gibt keine „Erneut herunterladen"-Funktion. Sobald Sie den Empfang bestätigen, sind die Daten verschwunden — es gibt nichts mehr abzurufen.
</div>

---

<span class="section-label">Ebene 3</span>
## Pseudonyme Identität

SafeScribe nutzt Google Sign-In und Sign in with Apple. Ihre persönlichen Daten werden nie gespeichert:

| Was der Authentifizierungsanbieter übermittelt | Was wir speichern |
|------------------------------------------------|-------------------|
| E-Mail-Adresse | **Nicht gespeichert** |
| Anzeigename | **Nicht gespeichert** |
| Konto-ID | Nur Einweg-kryptografischer Hash |

Der Einweg-Hash Ihrer Konto-ID:

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span> Kann nicht rückgängig gemacht werden, um Ihre Identität preiszugeben</li>
  <li><span class="check-mark">&#x2713;</span> Ist für Sie eindeutig — ausschließlich für die Abrechnung</li>
  <li><span class="check-mark">&#x2713;</span> Enthält keinerlei personenbezogene Informationen</li>
</ul>

<div class="callout callout-green">
  <strong>Überprüfbar:</strong> Überprüfen Sie den App-Netzwerkverkehr. Nach der Authentifizierung enthält keine Anfrage Ihre E-Mail oder Ihren Namen — nur einen Bearer Token, den der Server intern validiert.
</div>

---

<span class="section-label">Ebene 4</span>
## Lokale Verschlüsselung

Auf Ihrem Gerät gespeicherte Transkripte sind geschützt durch:

| Schutz | Technologie |
|--------|-------------|
| Verschlüsselung | AES-256 |
| Schlüsselspeicherung | iOS Keychain / Android Keystore |
| Datenbank | Verschlüsselte Container |

Selbst bei direktem Zugriff auf das Dateisystem erscheinen Transkriptdaten als unlesbares Binär. Der Schlüssel liegt in hardwaregesichertem Speicher — außerhalb der App-Dateien. Das Löschen der App zerstört den Schlüssel dauerhaft.

---

<span class="section-label">Ebene 5</span>
## PII-Entfernung in Diagnosedaten

Wenn die App auf einen Fehler stößt, kann optional ein Absturzbericht gesendet werden. Vor dem Verlassen Ihres Geräts werden folgende Daten automatisch entfernt:

<div class="callout callout-info">
  <strong>Vor dem Senden entfernt:</strong> E-Mail-Adressen · Telefonnummern · IP-Adressen · Dateipfade · Authentifizierungstoken
</div>

<div class="callout callout-green">
  <strong>Im Bericht enthalten:</strong> Fehlertyp und Stack-Trace · Gerätemodell · Betriebssystemversion · App-Version
</div>

In den App-Datenschutzeinstellungen können Sie Absturzberichte vollständig deaktivieren.

---

<span class="section-label">Ebene 6</span>
## Kaskadenlöschung

Jeder Verarbeitungsschritt löscht die Daten des vorherigen Schritts sofort: Audio wird nach der Transkription gelöscht, Transkript wird nach der Bestätigung gelöscht. Das <a href="#your-datas-journey">Datenflussdiagramm</a> zeigt den gesamten Ablauf mit allen Löschpunkten.

Dies ist kein Hintergrundjob. Die Löschung erfolgt unmittelbar als Teil der Verarbeitungspipeline.

<div class="callout callout-info">
  <strong>Failsafe:</strong> Selbst wenn der normale Löschprozess fehlschlägt (Netzwerkfehler, App-Absturz), verfügt jedes Datenelement im Server-RAM über ein automatisches Ablaufdatum. Daten löschen sich selbst — unabhängig davon.
</div>

---

<span class="section-label">Vollständiger Ablauf</span>
## Reise Ihrer Daten
{: #your-datas-journey}

<div class="flow-diagram">
Ihr Gerät                    SafeScribe Server             Ihr Gerät
---------                    -----------------             ---------

Audio aufnehmen/auswählen
    |
Lokal vorverarbeiten
    |
Verschlüsseln+hochladen -TLS-> Im RAM empfangen
                                   |
                               KI-Transkription
                               (nur RAM)
                                   |
                               Audio GELÖSCHT
                                   |
Transkript empfangen   <-TLS-  Transkript senden
    |                              |
Integrität prüfen              Auf Bestätigung warten
    |                              |
Verschlüsselt   Bestätigung --> Transkript GELÖSCHT
lokal speichern               Metadaten GELÖSCHT
    |                              |
Fertig                         NULL Daten verbleiben
</div>

---

<span class="section-label">Transparenz</span>
## Unabhängige Überprüfung

Wir laden Sicherheitsforscher und Datenschutzbeauftragte ein, unsere Aussagen zu überprüfen:

<ul class="verify-steps">
  <li><span><strong>Netzwerkanalyse</strong> Mit Wireshark oder Charles Proxy lässt sich bestätigen, dass der gesamte SafeScribe-Datenverkehr TLS-verschlüsselt ist.</span></li>
  <li><span><strong>Veröffentlichte Bewertungen</strong> Unsere <a href="dpia">Datenschutz-Folgenabschätzung</a> enthält die vollständige Risikoanalyse und Entscheidungsdokumentation.</span></li>
  <li><span><strong>Verantwortungsvolle Offenlegung</strong> Schwachstelle entdeckt? Schreiben Sie an <a href="mailto:security@safescribe.dev">security@safescribe.dev</a>.</span></li>
</ul>

</div>
