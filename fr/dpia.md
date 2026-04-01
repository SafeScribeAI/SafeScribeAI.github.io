---
layout: default
title: SafeScribe — Analyse d'Impact sur la Protection des Données
description: Évaluation formelle des risques du service de transcription audio SafeScribe au titre du RGPD et du KVKK.
lang: fr
---

<div class="page-content" markdown="1">

# Analyse d'Impact sur la Protection des Données

<div class="summary-box">
  <strong>Conclusion principale :</strong> L'audio étant traité en mémoire volatile et immédiatement supprimé — aucune donnée personnelle ne subsistant sur nos serveurs après traitement — tous les risques identifiés sont réduits à <strong>Faible</strong> après application des mesures d'atténuation. Le traitement peut être effectué dans le cadre des bases légales et des garanties documentées.
</div>

<p class="page-meta">SafeScribe Transcription Audio IA · Version 1.0 · Mars 2026 · Évaluation pré-lancement · Révision prévue : 6 mois après le lancement</p>

---

<span class="section-label">Section 1</span>
## Description du Traitement

### Ce que nous traitons et pourquoi

| Finalité | Données traitées | Base légale (RGPD) | Base KVKK |
|----------|-----------------|-------------------|-----------|
| Transcription audio | Fichier audio (RAM uniquement, supprimé après traitement) | Art. 6(1)(b) — Exécution du contrat | Consentement explicite |
| Compte et facturation | Identifiant pseudonyme, solde, métadonnées d'utilisation | Art. 6(1)(b) — Exécution du contrat | Consentement explicite |
| Authentification | Identifiant OIDC (haché, original supprimé) | Art. 6(1)(b) — Exécution du contrat | Exécution du contrat |
| Achat intégré | Reçu IAP de l'App Store / Play Store | Art. 6(1)(b) — Exécution du contrat | Exécution du contrat |
| Confirmation d'âge | Confirmation d'âge déclarée (17+) | Art. 8 RGPD / Art. 6 KVKK | Obligation légale |
| Rapports de plantage | Rapports d'erreurs anonymisés (opt-in, DCP supprimées) | Art. 6(1)(a) — Consentement | Consentement explicite |

### Inventaire des données

| Données | Conservation serveur |
|---------|---------------------|
| Fichier audio | RAM uniquement — supprimé après transcription |
| Texte de la transcription | Jusqu'à confirmation du client (~secondes) |
| Identifiant pseudonyme | Jusqu'à suppression du compte |
| Solde du compte + métadonnées d'utilisation | Jusqu'à suppression du compte |
| Adresse e-mail | Transit uniquement — **non stockée** |
| Adresses IP | Transit uniquement — **non journalisées** |
| Rapports de plantage (opt-in) | Politique de rétention Sentry |

<p>Pour l'inventaire complet des données, voir <a href="privacy#data-we-collect">Politique de Confidentialité § Données que nous collectons</a>.</p>

<div class="callout callout-info">
  <strong>Métadonnées par traitement</strong> : durée audio (secondes), taille du fichier (octets), nombre de mots, montant facturé (USD) et horodatages de traitement. Elles ne contiennent aucun contenu audio, aucun texte de transcription ni aucune information permettant d'identifier l'utilisateur.
</div>

<div class="callout callout-info">
  <strong>Conservation des sauvegardes.</strong> Une sauvegarde quotidienne des données de compte est conservée pour la continuité du service. Chaque sauvegarde écrase la précédente. Les données supprimées via la suppression de compte sont retirées des systèmes actifs immédiatement et de la sauvegarde sous 24 heures — aucune copie ne persiste au-delà de cette fenêtre.
</div>

### Flux de traitement

<div class="flow-diagram">
1. L'utilisateur enregistre ou sélectionne de l'audio sur son appareil
2. Prétraitement audio côté appareil (filtre passe-haut 80 Hz, écrêtage du silence, normalisation de loudness à -16 LUFS, limitation de crête, rééchantillonnage 16 kHz, encodage FLAC)
3. Envoi chiffré vers les serveurs SafeScribe (TLS + certificate pinning)
4. Traitement audio en RAM côté serveur — poids du modèle Whisper auto-hébergés via <a href="https://github.com/SYSTRAN/faster-whisper">faster-whisper</a> / CTranslate2, aucun appel API tiers
5. Transcription retournée avec somme de contrôle d'intégrité SHA-256
6. Le client vérifie la somme de contrôle et confirme la réception
7. Le serveur supprime immédiatement la transcription et l'audio de la RAM
8. La transcription est stockée localement sur l'appareil dans un stockage chiffré AES-256
</div>

---

<span class="section-label">Section 2</span>
## Nécessité et Proportionnalité

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Le téléchargement audio est nécessaire</strong><span class="item-desc">le traitement IA côté serveur offre une précision supérieure aux alternatives actuelles sur appareil, au niveau de qualité requis par SafeScribe</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>L'authentification est nécessaire</strong><span class="item-desc">requise pour la facturation par utilisateur et l'isolation des traitements</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Les rapports de plantage sont proportionnés</strong><span class="item-desc">les DCP sont supprimées avant transmission ; opt-in uniquement</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Minimisation des données</strong><span class="item-desc">l'audio est traité uniquement en RAM, jamais écrit sur disque</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Conservation minimale</strong><span class="item-desc">les transcriptions sont supprimées en quelques secondes après confirmation</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Aucune utilisation secondaire</strong><span class="item-desc">l'audio n'est jamais utilisé pour l'entraînement de modèles ni pour des analyses</span></span></li>
</ul>

### Droits des personnes concernées

Tous les droits des personnes concernées au titre du RGPD et du KVKK (accès, rectification, effacement, limitation, portabilité, opposition et retrait du consentement) peuvent être exercés dans l'application ou en contactant privacy@safescribe.dev. Ces droits sont détaillés dans notre <a href="privacy#what-you-can-do">Politique de Confidentialité § Ce que vous pouvez faire</a>.

---

<span class="section-label">Section 3</span>
## Évaluation des Risques

### Risques identifiés et mesures d'atténuation

| Risque | Inhérent | Mesures d'atténuation | Résiduel |
|--------|----------|-----------------------|---------|
| L'audio contient des données personnelles sensibles (santé, juridique, financier) | **Élevé** | Traitement RAM uniquement ; suppression immédiate ; aucun stockage persistant ; aucun accès tiers | **Faible** |
| Accès non autorisé à la transcription en transit | Moyen | TLS 1.2+ avec certificate pinning ; somme de contrôle SHA-256 | **Faible** |
| Intrusion côté serveur exposant audio ou transcriptions | Moyen | Aucun stockage audio persistant ; API authentifiée ; isolation par traitement ; TTL de sécurité | **Faible** |
| Accès non autorisé au stockage local chiffré | Faible | Conteneurs chiffrés AES-256 ; clé dans iOS Keychain / Android Keystore | **Faible** |
| Fuite de DCP via les rapports de plantage | Faible | Suppression par motif des e-mails, téléphones, IP, tokens avant Sentry | **Faible** |
| Transfert de données transfrontalier | Moyen | Consentement explicite KVKK au premier lancement ; CCT RGPD avec sous-traitants | **Faible** |
| L'IA produit une transcription inexacte de contenu sensible | Faible | La transcription est purement informative ; l'utilisateur examine toutes les sorties ; aucune décision automatisée | **Faible** |

<div class="callout callout-green">
  <strong>Tous les risques résiduels sont Faibles.</strong> Le principal facteur de risque — le contenu audio sensible — est traité au niveau architectural : l'audio n'est jamais écrit sur disque, jamais conservé au-delà du traitement, et jamais partagé avec des tiers.
</div>

---

<span class="section-label">Section 4</span>
## Consentement et Transparence

Un écran de consentement granulaire est présenté aux utilisateurs avant la première utilisation, composé de quatre cartes indépendantes :

<div class="infra-grid">
  <div class="infra-item">
    <div class="infra-icon">&#x1f3a4;</div>
    <h4>Traitement Audio <em style="font-weight:400;font-size:0.8rem;">(obligatoire)</em></h4>
    <p>Explique le traitement RAM uniquement, la suppression immédiate et que l'audio n'est jamais écrit sur disque ni partagé avec des tiers.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f4ca;</div>
    <h4>Données Stockées <em style="font-weight:400;font-size:0.8rem;">(obligatoire)</em></h4>
    <p>Explique quelles données persistantes sont conservées : identifiant pseudonyme, solde de crédits et métadonnées d'utilisation anonymes.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f9d2;</div>
    <h4>Confirmation d'Âge <em style="font-weight:400;font-size:0.8rem;">(obligatoire)</em></h4>
    <p>Confirme que l'utilisateur a 17 ans ou plus. Les cartes obligatoires doivent être acceptées pour continuer.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f41b;</div>
    <h4>Rapports de Plantage <em style="font-weight:400;font-size:0.8rem;">(optionnel)</em></h4>
    <p>Permet l'opt-in aux rapports de plantage anonymes. Désactivé par défaut. Modifiable à tout moment depuis les Paramètres de Confidentialité.</p>
  </div>
</div>

- Les boutons Accepter et Refuser ont une importance visuelle égale (conformément aux <a href="https://www.edpb.europa.eu/our-work-tools/our-documents/guidelines/guidelines-052020-consent-under-regulation-2016679_en">lignes directrices EDPB</a> sur les dark patterns)
- Les utilisateurs peuvent retirer leur consentement et supprimer leur compte à tout moment depuis les Paramètres de Confidentialité
- Cette AIPD est révisée annuellement ou lors de modifications significatives du traitement
- Publiée à cette URL dans un souci de transparence publique

---

<span class="section-label">Section 5</span>
## Décision

<div class="callout callout-green">
  Sur la base de l'évaluation ci-dessus, tous les risques résiduels sont <strong>Faibles</strong>. Le traitement peut être effectué dans le cadre des bases légales identifiées avec les garanties documentées. Aucune consultation préalable d'une autorité de contrôle n'est requise.
</div>

---

<span class="section-label">Journal de révision</span>
## Historique des Versions

| Date | Version | Modifications |
|------|---------|--------------|
| Mars 2026 | 1.0 | AIPD initiale pré-lancement couvrant le pipeline de transcription audio, la conception de l'écran de consentement, l'évaluation des risques et la documentation des bases légales |

---

</div>
