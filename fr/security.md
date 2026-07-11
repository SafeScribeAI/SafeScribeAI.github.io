---
layout: default
title: SafeScribe — Architecture de Sécurité
description: Comment SafeScribe protège vos données audio — aperçu technique de notre approche Privacy by Design.
lang: fr
---

<div class="page-content" markdown="1">

# Architecture de Sécurité

<div class="summary-box">
  <strong>En résumé :</strong> SafeScribe traite vos données audio exclusivement dans la mémoire vive (RAM) du serveur. Dès que votre transcription est livrée, toutes les données sont définitivement supprimées. Aucune écriture sur disque, aucune sauvegarde, aucune copie — jamais. Cette page explique le fonctionnement de chaque couche de protection.
</div>

<p class="page-meta">Dernière mise à jour : mars 2026</p>

---

<span class="section-label">Vue d'ensemble</span>
## Six Couches de Protection

<div class="infra-grid">
  <div class="infra-item">
    <div class="infra-icon">&#x1f510;</div>
    <h4>Couche 1 — Transport</h4>
    <p>Chiffrement TLS 1.3 sur chaque connexion. Le trafic est chiffré de bout en bout, sans exception.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f9e0;</div>
    <h4>Couche 2 — RAM uniquement</h4>
    <p>L'audio ne touche jamais le disque. Traitement en mémoire volatile, suppression immédiate après transcription.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f464;</div>
    <h4>Couche 3 — Identité pseudonyme</h4>
    <p>Votre adresse e-mail et votre nom ne sont jamais stockés. Seul un hachage unidirectionnel de votre identifiant est conservé.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f512;</div>
    <h4>Couche 4 — Chiffrement local</h4>
    <p>Stockage AES-256 sur l'appareil. Clés uniquement dans le stockage sécurisé matériel (iOS Keychain / Android Keystore).</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f41b;</div>
    <h4>Couche 5 — Suppression des DCP</h4>
    <p>Les rapports de plantage sont purgés de toute donnée personnelle avant de quitter votre appareil.</p>
  </div>
  <div class="infra-item">
    <div class="infra-icon">&#x1f5d1;</div>
    <h4>Couche 6 — Suppression en cascade</h4>
    <p>Chaque étape de traitement supprime immédiatement les données de l'étape précédente. TTL de sécurité en secours.</p>
  </div>
</div>

---

<span class="section-label">Principe de conception</span>
## Traiter, Livrer, Supprimer

Les services de transcription classiques écrivent l'audio sur disque et peuvent le conserver indéfiniment. SafeScribe reçoit l'audio en RAM, le traite et le supprime dès que vous recevez votre transcription — aucun octet n'est écrit sur un stockage permanent. Le <a href="#your-datas-journey">schéma de flux des données</a> ci-dessous illustre l'ensemble du processus.

La différence fondamentale : même en cas de saisie physique du serveur, aucune donnée audio ou de transcription ne serait trouvée — elles n'existaient qu'en mémoire volatile.

---

<span class="section-label">Couche 1</span>
## Sécurité du Transport
{: #layer-1}

| Protection | Ce qui est empêché |
|------------|-------------------|
| Chiffrement TLS 1.3 | Écoute du trafic réseau |
| Somme de contrôle SHA-256 | Altération de la transcription en transit |

<div class="callout callout-green">
  <strong>Vérifiable :</strong> Wireshark permet de confirmer que tout le trafic SafeScribe est chiffré TLS.
</div>

---

<span class="section-label">Couche 2</span>
## Traitement Serveur en RAM uniquement
{: #layer-2}

C'est le cœur de la conception Privacy by Design de SafeScribe. Le serveur exécute les poids du modèle Whisper d'OpenAI via le moteur d'inférence auto-hébergé <a href="https://github.com/SYSTRAN/faster-whisper">faster-whisper</a> — aucun appel à une API tierce. Le stockage des données est configuré en mode purement volatile, sans aucune persistance sur disque.

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span> Un redémarrage du serveur efface définitivement toutes les données en mémoire — par conception</li>
  <li><span class="check-mark">&#x2713;</span> Aucun fichier, aucune sauvegarde ni aucun journal ne contient vos données audio</li>
  <li><span class="check-mark">&#x2713;</span> Une analyse forensique du serveur ne révélerait aucun contenu audio</li>
</ul>

**Stockage serveur temporaire (RAM uniquement) :**

| Données | Supprimées quand |
|---------|-----------------|
| Octets audio | Transcription terminée |
| Texte de la transcription | Réception confirmée |
| Métadonnées du traitement | Réception confirmée |

**Stockage serveur permanent (sur disque) :**

| Données | Finalité | Contient des DCP ? |
|---------|----------|--------------------|
| Identifiant pseudonyme | Preuve de facturation | Non — hachage unidirectionnel, non réversible |
| Durée et coût | Preuve financière | Non |
| Taille du fichier (octets) | Analyse du service | Non |
| Nombre de mots | Analyse du service | Non |
| Horodatage | Piste d'audit | Non |

<div class="callout callout-green">
  <strong>Par conception :</strong> Il n'existe aucune fonction « re-télécharger ». Une fois la réception confirmée, les données ont disparu — il n'y a plus rien à récupérer.
</div>

---

<span class="section-label">Couche 3</span>
## Identité Pseudonyme
{: #layer-3}

SafeScribe utilise Google Sign-In et Sign in with Apple. Vos données personnelles ne sont jamais stockées :

| Ce que le fournisseur d'authentification transmet | Ce que nous stockons |
|---------------------------------------------------|----------------------|
| Adresse e-mail | **Non stockée** |
| Nom d'affichage | **Non stocké** |
| Identifiant de compte | Hachage cryptographique unidirectionnel uniquement |

Le hachage unidirectionnel de votre identifiant :

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span> Ne peut pas être inversé pour révéler votre identité</li>
  <li><span class="check-mark">&#x2713;</span> Vous est propre — utilisé uniquement pour la facturation</li>
  <li><span class="check-mark">&#x2713;</span> Ne contient aucune information personnelle</li>
</ul>

<div class="callout callout-green">
  <strong>Vérifiable :</strong> Inspectez le trafic réseau de l'application. Après authentification, aucune requête ne contient votre e-mail ou votre nom — uniquement un token Bearer que le serveur valide en interne.
</div>

---

<span class="section-label">Couche 4</span>
## Chiffrement Local
{: #layer-4}

Les transcriptions stockées sur votre appareil sont protégées par :

| Protection | Technologie |
|------------|-------------|
| Chiffrement | AES-256 |
| Stockage des clés | iOS Keychain / Android Keystore |
| Base de données | Conteneurs chiffrés |

Même avec un accès direct au système de fichiers, les données de transcription apparaissent comme du binaire illisible. La clé est conservée dans un stockage sécurisé matériel, hors des fichiers de l'application. Désinstaller l'application détruit définitivement la clé.

---

<span class="section-label">Couche 5</span>
## Suppression des DCP dans les Diagnostics
{: #layer-5}

Si l'application rencontre une erreur, un rapport de plantage peut optionnellement être envoyé. Avant de quitter votre appareil, les éléments suivants sont automatiquement supprimés :

<div class="callout callout-info">
  <strong>Supprimés avant envoi :</strong> Adresses e-mail · Numéros de téléphone · Adresses IP · Chemins de fichiers · Tokens d'authentification
</div>

<div class="callout callout-green">
  <strong>Contenu du rapport :</strong> Type d'erreur et stack trace · Modèle d'appareil · Version du système d'exploitation · Version de l'application
</div>

Vous pouvez désactiver entièrement les rapports de plantage dans les paramètres de confidentialité de l'application.

---

<span class="section-label">Couche 6</span>
## Suppression en Cascade
{: #layer-6}

Chaque étape de traitement supprime immédiatement les données de l'étape précédente : l'audio est supprimé après la transcription, la transcription est supprimée après confirmation. Le <a href="#your-datas-journey">schéma de flux des données</a> présente l'ensemble du processus avec tous les points de suppression.

Ce n'est pas un processus de nettoyage en arrière-plan. La suppression intervient immédiatement dans le cadre du pipeline de traitement.

<div class="callout callout-info">
  <strong>Sécurité de secours :</strong> Même en cas d'échec du processus de suppression normal (erreur réseau, plantage de l'application), chaque élément de données en RAM serveur dispose d'une expiration automatique. Les données s'autodétruisent — quoi qu'il arrive.
</div>

---

<span class="section-label">Parcours complet</span>
## Parcours de vos Données
{: #your-datas-journey}

<div class="flow-diagram">
Votre Appareil               Serveur SafeScribe            Votre Appareil
--------------               ------------------            --------------

Enregistrer/sélectionner audio
    |
Prétraitement local
    |
Chiffrer+envoyer ----TLS---> Recevoir en RAM
                                   |
                               Transcription IA
                               (RAM uniquement)
                                   |
                               Audio SUPPRIMÉ
                                   |
Recevoir transcription <-TLS- Envoyer transcription
    |                              |
Vérifier intégrité             Attendre confirmation
    |                              |
Stocker chiffré  Confirmer --> Transcription SUPPRIMÉE
localement (AES-256)          Métadonnées SUPPRIMÉES
    |                              |
Terminé                        ZÉRO donnée restante
</div>

---

<span class="section-label">Transparence</span>
## Vérification Indépendante

Nous encourageons les chercheurs en sécurité et les défenseurs de la vie privée à vérifier nos affirmations :

<ul class="verify-steps">
  <li><span><strong>Analyse réseau</strong> Wireshark ou Charles Proxy permet de confirmer que tout le trafic SafeScribe est chiffré TLS.</span></li>
  <li><span><strong>Évaluations publiées</strong> Notre <a href="dpia">Analyse d'Impact sur la Protection des Données</a> présente l'analyse complète des risques et le registre des décisions.</span></li>
  <li><span><strong>Divulgation responsable</strong> Vous avez découvert une vulnérabilité ? Contactez <a href="mailto:security@safescribe.dev">security@safescribe.dev</a>.</span></li>
</ul>

</div>
