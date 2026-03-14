---
layout: default
title: SafeScribe — Datenschutzrichtlinie
---

[English](../en/privacy) · [Türkçe](../tr/privacy) · **Deutsch** · [Français](../fr/privacy) · [Español](../es/privacy) · [Português](../pt/privacy) · [العربية](../ar/privacy) · [中文](../zh/privacy) · [日本語](../ja/privacy) · [한국어](../ko/privacy)

# Datenschutzrichtlinie

**Letzte Aktualisierung:** März 2026

## 1. Einleitung

SafeScribe ist eine datenschutzorientierte KI-Transkriptions-App. Diese Richtlinie beschreibt, welche Daten wir erheben, wie wir sie verarbeiten und welche Rechte Sie in Bezug auf Ihre persönlichen Daten haben.

## 2. Erhobene Daten

| Kategorie | Daten | Zweck |
|-----------|-------|-------|
| Authentifizierung | Google/Apple-Konto-ID, E-Mail | Kontoidentität, API-Zugang |
| Audio | Hochgeladene Audiodateien | Transkriptionsverarbeitung |
| Transkripte | Generierter Text, Segmente | Zustellung an den Benutzer |
| Nutzung | Dauer, Kosten, Zeitstempel | Abrechnung und Auftragsverfolgung |
| Diagnose | Absturzberichte, Fehlerprotokolle | App-Stabilität |

Wir erheben **nicht**: Kontakte, Standort, Browserverlauf, Gerätekennungen für Werbung oder biometrische Daten.

## 3. Audioverarbeitung — Null-Festplatten-Richtlinie

- Audio wird **ausschließlich im RAM** (Arbeitsspeicher) auf unseren Servern verarbeitet.
- Audio wird in **keiner Phase** der Verarbeitung auf die Festplatte geschrieben.
- Alle Audiodaten werden **sofort aus dem Speicher gelöscht**, wenn die Transkription abgeschlossen ist oder fehlschlägt.
- Es werden keine Kopien, Backups oder Protokolle von Audioinhalten erstellt.

## 4. Lokale Speicherung

Alle lokalen Daten werden in **AES-256-verschlüsselten** Containern gespeichert. Der Verschlüsselungsschlüssel wird durch plattformnativen sicheren Speicher geschützt (Android Keystore / iOS Keychain).

**Auf Ihrem Gerät gespeicherte Daten (verschlüsselt):**

| Daten | Details | Aufbewahrung |
|-------|---------|-------------|
| Transkripte | Textinhalt, Zeitsegmente, Dateiname, Dauer, Kosten, erkannte Sprache, Datei-Hash | Bis Sie sie löschen oder automatische Bereinigung nach dem konfigurierten Aufbewahrungszeitraum |
| Offline-Warteschlange | Audiodateipfad, Dauer, Sprache | Temporär — nach erfolgreichem Hochladen entfernt |
| App-Einstellungen | Transkriptionssprache, UI-Sprache, Onboarding-Status, GDPR/Sentry-Einwilligung mit Zeitstempel | Bis Sie sich abmelden oder Ihr Konto löschen |
| Duplikaterkennung | Datei-Hash → Transkript-ID-Zuordnung | Automatisch mit Transkripten verwaltet |
| Unvollständiger Auftrag | Wiederherstellungsdaten für laufende Transkription | Gelöscht wenn der Auftrag abgeschlossen oder abgebrochen wird |

**In plattformnativem sicherem Speicher gespeicherte Daten (Keychain / Keystore):**

| Daten | Zweck |
|-------|-------|
| Hive-Verschlüsselungsschlüssel | Verschlüsselt alle lokalen Datenbankcontainer |
| Authentifizierungstoken | OIDC-Token von Google/Apple-Anmeldung |

- Es wird **kein Benutzerprofil** lokal gespeichert (kein Name, Foto, Telefonnummer oder Adresse).
- Audioaufnahmen werden nach dem Hochladen vom Gerät gelöscht.
- Alle lokalen Daten werden bei Kontolöschung dauerhaft gelöscht.

## 5. Authentifizierung

- Wir verwenden OpenID Connect (OIDC) über Google-Anmeldung und Apple-Anmeldung.
- Wir erhalten nur die für die Authentifizierung erforderlichen Informationen (Benutzer-ID, E-Mail, Anzeigename).
- Wir greifen nicht auf Ihre Kontakte, Kalender oder andere Kontodaten zu.

## 6. Zahlungsdaten

- In-App-Käufe werden vollständig von Apple App Store oder Google Play Store verarbeitet.
- SafeScribe **empfängt, speichert oder verarbeitet keine** Kreditkartennummern oder Zahlungsmitteldetails.
- Wir erhalten nur Kaufbelege zur Guthabenverifizierung.

## 7. Serverseitige Verarbeitung

- Audiodateien werden über TLS-verschlüsselte Verbindungen mit Certificate Pinning hochgeladen.
- Audio wird nur im RAM verarbeitet und **berührt niemals die Festplatte**.
- Transkripte werden vorübergehend zum Download bereitgehalten und **nach Bestätigung gelöscht**.

## 8. Fehlererfassung

- Wir verwenden Sentry für Absturzberichte und Fehlerüberwachung.
- Alle Protokolle werden vor der Übertragung von personenbezogenen Daten (PII) bereinigt.

## 9. Datenweitergabe

Wir **verkaufen, vermieten oder teilen** Ihre persönlichen Daten nicht mit Dritten zu Marketingzwecken.

Daten werden nur geteilt mit:
- **Transkriptionsservern** (unsere Infrastruktur) — für Audioverarbeitung
- **Sentry** — für Absturzberichte (PII-bereinigt)
- **Apple/Google** — für Authentifizierung und Zahlungsabwicklung

## 10. Benutzerrechte

Sie haben das Recht:
- Jederzeit auf Ihre lokal gespeicherten Transkripte **zuzugreifen**
- Einzelne Transkripte oder alle Daten aus der App zu **löschen**
- Transkripte über Teilen/Kopieren zu **exportieren**
- Sich jederzeit **abzumelden** und den API-Zugang zu widerrufen
- **Kontolöschung zu beantragen** — Ihre Anmeldeidentität, alle lokal gespeicherten Daten und das verbleibende Guthaben werden dauerhaft entfernt

## 11. Kontakt

Für Datenschutzanfragen oder Datenlöschungsanträge:

**E-Mail:** privacy@safescribe.dev

---

*Letzte Aktualisierung: März 2026*
