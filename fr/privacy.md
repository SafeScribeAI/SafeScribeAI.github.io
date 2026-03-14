---
layout: default
title: SafeScribe — Politique de confidentialité
---

[English](../en/privacy) · [Türkçe](../tr/privacy) · [Deutsch](../de/privacy) · **Français** · [Español](../es/privacy) · [Português](../pt/privacy) · [العربية](../ar/privacy) · [中文](../zh/privacy) · [日本語](../ja/privacy) · [한국어](../ko/privacy)

# Politique de confidentialité

**Dernière mise à jour :** Mars 2026

## 1. Introduction

SafeScribe est une application de transcription IA axée sur la confidentialité. Cette politique décrit les données que nous collectons, comment nous les traitons et vos droits concernant vos informations personnelles.

## 2. Données collectées

| Catégorie | Données | Objectif |
|-----------|---------|----------|
| Authentification | ID de compte Google/Apple, e-mail | Identité du compte, accès API |
| Audio | Fichiers audio téléchargés | Traitement de transcription |
| Transcriptions | Texte généré, segments | Livraison à l'utilisateur |
| Utilisation | Durée, coût, horodatages | Facturation et suivi |
| Diagnostics | Rapports de plantage, journaux d'erreurs | Stabilité de l'application |

Nous ne collectons **pas** : contacts, localisation, historique de navigation, identifiants d'appareil à des fins publicitaires ou données biométriques.

## 3. Traitement audio — Politique zéro disque

- L'audio est traité **exclusivement en RAM** (mémoire temporaire) sur nos serveurs.
- L'audio n'est **jamais écrit sur le disque** à aucune étape du traitement.
- Toutes les données audio sont **immédiatement effacées de la mémoire** lorsque la transcription se termine ou échoue.
- Aucune copie, sauvegarde ou journal du contenu audio n'est créé.

## 4. Stockage local

Toutes les données locales sont stockées dans des conteneurs **chiffrés AES-256**. La clé de chiffrement est protégée par le stockage sécurisé natif de la plateforme (Android Keystore / iOS Keychain).

**Données stockées sur votre appareil (chiffrées) :**

| Données | Détails | Rétention |
|---------|---------|-----------|
| Transcriptions | Contenu texte, segments horodatés, nom de fichier, durée, coût, langue détectée, empreinte du fichier | Jusqu'à suppression par vous ou nettoyage automatique après la période de rétention configurée |
| File d'attente hors ligne | Chemin du fichier audio, durée, langue | Temporaire — supprimé après un envoi réussi |
| Paramètres de l'app | Langue de transcription, locale de l'interface, état d'intégration, consentement RGPD/Sentry avec horodatage | Jusqu'à déconnexion ou suppression du compte |
| Index de détection des doublons | Empreinte du fichier → ID de transcription | Géré automatiquement avec les transcriptions |
| État de tâche inachevée | Données de récupération de transcription en cours | Effacé à la fin ou à l'annulation de la tâche |

**Données dans le stockage sécurisé de la plateforme (Keychain / Keystore) :**

| Données | Objectif |
|---------|----------|
| Clé de chiffrement Hive | Chiffre tous les conteneurs de base de données locaux |
| Jetons d'authentification | Jetons OIDC de Google/Apple Sign-In |

- **Aucun profil utilisateur** n'est stocké localement (pas de nom, photo, numéro de téléphone ou adresse).
- Les enregistrements audio sont supprimés de l'appareil après l'envoi.
- Toutes les données locales sont définitivement effacées lors de la suppression du compte.

## 5. Authentification

- Nous utilisons OpenID Connect (OIDC) via Google Sign-In et Sign in with Apple.
- Nous ne recevons que les informations nécessaires à l'authentification.
- Nous n'accédons pas à vos contacts, calendriers ou autres données de compte.

## 6. Données de paiement

- Les achats intégrés sont traités entièrement par l'App Store d'Apple ou le Google Play Store.
- SafeScribe ne **reçoit, stocke ou traite pas** les numéros de carte de crédit ou les détails des moyens de paiement.

## 7. Traitement côté serveur

- Les fichiers audio sont téléchargés via des connexions chiffrées TLS avec épinglage de certificat.
- L'audio est traité uniquement en RAM et ne **touche jamais le disque**.
- Les transcriptions sont conservées temporairement pour le téléchargement et **supprimées après confirmation**.

## 8. Suivi des erreurs

- Nous utilisons Sentry pour les rapports de plantage et la surveillance des erreurs.
- Tous les journaux sont nettoyés des informations personnelles identifiables (PII) avant transmission.

## 9. Partage de données

Nous ne **vendons, louons ou partageons pas** vos données personnelles avec des tiers à des fins marketing.

## 10. Droits des utilisateurs

Vous avez le droit de :
- **Accéder** à vos transcriptions stockées localement à tout moment
- **Supprimer** des transcriptions individuelles ou toutes les données de l'application
- **Exporter** les transcriptions via la fonctionnalité partager/copier
- **Se déconnecter** et révoquer l'accès API à tout moment
- **Demander la suppression du compte** — votre identité de connexion, toutes les données stockées localement et le solde de crédit restant seront définitivement supprimés

## 11. Contact

Pour les questions de confidentialité ou les demandes de suppression de données :

**E-mail :** privacy@safescribe.dev

---

*Dernière mise à jour : Mars 2026*
