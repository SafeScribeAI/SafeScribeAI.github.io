---
layout: default
title: SafeScribe — Politique de confidentialité
description: Les données que SafeScribe collecte, comment nous les traitons et vos droits.
lang: fr
---

<div class="page-content" markdown="1">

# Politique de confidentialité

<div class="summary-box">
  <strong>En clair :</strong> Nous traitons votre audio en mémoire serveur pour créer une transcription, puis le supprimons immédiatement. Nous ne stockons pas l'audio sur disque, ne l'utilisons pas pour entraîner des IA et ne le partageons avec personne. Vos transcriptions sont chiffrées sur votre appareil et sous votre contrôle. Nous conservons uniquement des enregistrements de facturation pseudonymes.
</div>

<p class="page-meta">Dernière mise à jour : Mars 2026</p>

---

<span class="section-label">Ce que nous ne faisons jamais</span>
## Données que nous ne collectons pas ou ne stockons pas
{: #no-collect}

<ul class="dont-list">
  <li><span class="x-mark">&#x2717;</span> Stocker l'audio sur disque — jamais</li>
  <li><span class="x-mark">&#x2717;</span> Stocker votre adresse e-mail ou votre nom</li>
  <li><span class="x-mark">&#x2717;</span> Enregistrer ou stocker les adresses IP</li>
  <li><span class="x-mark">&#x2717;</span> Utiliser les enregistrements pour entraîner des modèles d'IA</li>
  <li><span class="x-mark">&#x2717;</span> Partager des données avec des annonceurs ou des courtiers en données</li>
  <li><span class="x-mark">&#x2717;</span> Suivre le comportement entre les applications ou les sessions</li>
  <li><span class="x-mark">&#x2717;</span> Collecter des contacts, la localisation ou des données biométriques</li>
  <li><span class="x-mark">&#x2717;</span> Conserver des données après la suppression du compte</li>
</ul>

---

<span class="section-label">Ce que nous stockons</span>
## Données collectées

### Côté serveur (permanent jusqu'à la suppression du compte)

| Données | Finalité |
|---------|----------|
| Identifiant utilisateur pseudonyme (hachage SHA-256 de votre identifiant de compte) | Identité du compte — non réversible |
| Identifiant d'appareil pseudonyme (hachage SHA-256 des propriétés de l'appareil) | Prévention des abus — non réversible |
| Solde du compte (USD) | Gestion des crédits |
| Minutes de transcription gratuites restantes | Suivi du bonus de bienvenue |
| Horodatages de création et de dernière mise à jour du compte | Gestion du compte |

**Enregistrements par tâche** (stockés pour chaque transcription terminée) :

| Données | Finalité |
|---------|----------|
| Durée audio (secondes) | Analyse du service |
| Taille du fichier (octets) | Analyse du service |
| Nombre de mots | Analyse du service |
| Montant facturé (USD) | Enregistrement de facturation |
| Horodatages de traitement | Analyse du service |

<div class="callout callout-info">
  <strong>Les enregistrements par tâche ne contiennent jamais de contenu audio ni de texte de transcription.</strong> Ces enregistrements contiennent uniquement des métadonnées (chiffres et horodatages) — jamais ce que vous avez dit.
</div>

### Côté serveur (temporaire — supprimé après traitement)

| Données | Quand supprimées |
|---------|-----------------|
| Fichier audio | Immédiatement après la fin de la transcription |
| Texte de transcription | Après confirmation de réception |

### Sur votre appareil (chiffré)

| Données | Durée de conservation |
|---------|-----------------------|
| Transcriptions (texte, segments, métadonnées) | Jusqu'à ce que vous les supprimiez |
| File d'attente de téléchargement hors ligne | Supprimée après un téléchargement réussi |
| Paramètres de l'application et enregistrements de consentement | Jusqu'à la déconnexion ou la suppression du compte |
| Clé de chiffrement | Dans iOS Keychain / Android Keystore — supprimée avec l'application |

### Optionnel (sur acceptation uniquement)

| Données | Finalité |
|---------|----------|
| Rapports de plantage | Stabilité de l'application via le point de terminaison de rapport de plantage propre à SafeScribe — toutes les données personnelles supprimées avant transmission |
| Retours et signalements de problèmes | Amélioration du produit — une évaluation, un rapport de bug, une réclamation ou une suggestion que vous choisissez d'envoyer. Le texte libre est expurgé des DCP côté serveur avant stockage ; conservé uniquement avec votre hachage utilisateur pseudonyme (sans nom, e-mail ni adresse IP). Conservé jusqu'à 24 mois, puis purgé automatiquement. |

<div class="callout callout-green">
  <strong>Le serveur ne stocke jamais votre nom, votre adresse e-mail, votre adresse IP, le contenu audio ou le texte de transcription.</strong> Les seuls enregistrements persistants liés à votre compte sont un hachage utilisateur non réversible, un identifiant d'appareil pseudonyme, un solde de crédits, des statistiques d'utilisation (chiffres uniquement — aucun contenu, aucune identité) et tout retour que vous choisissez d'envoyer (expurgé des DCP). Si nous répondons à un signalement, la réponse ne vous parvient que sous la forme d'un message unique dans l'application, rattaché à votre hachage utilisateur — nous ne savons jamais qui vous êtes.
</div>

---

<span class="section-label">Suppression complète</span>
## Supprimer l'application vs. supprimer le compte

Ce sont deux actions distinctes avec des résultats différents :

| Action | Ce qui se passe | Votre solde |
|--------|----------------|------------|
| **Supprimer l'application** | Les transcriptions locales et la clé de chiffrement sont supprimées de votre appareil | Conservé sur le serveur — réinstaller et se connecter avec le même compte le restaure entièrement |
| **Supprimer le compte** | Chaque enregistrement côté serveur est définitivement supprimé — irréversible | Perdu |

<div class="callout callout-info">
  <strong>Réinstaller à tout moment.</strong> Si vous supprimez l'application sans supprimer votre compte, réinstaller et vous connecter avec le même compte Google ou Apple restaure votre solde complet et votre accès — sans aucune action requise.
</div>

### Suppression du compte — Rien ne subsiste qui vous identifie

Supprimer votre compte depuis les Paramètres de confidentialité supprime définitivement chaque enregistrement côté serveur lié à votre identité :

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Identifiant utilisateur pseudonyme</strong><span class="item-desc">supprimé définitivement</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Solde de crédits</strong><span class="item-desc">supprimé définitivement</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Minutes gratuites restantes</strong><span class="item-desc">supprimées définitivement</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Statistiques par tâche</strong><span class="item-desc">anonymisées immédiatement — rattachées au marqueur commun DELETED_USER, purgées automatiquement après 2 ans</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Identifiant d'appareil pseudonyme</strong><span class="item-desc">réduit à un hachage salé à sens unique conservé jusqu'à 2 ans — bloque les abus répétés du crédit de bienvenue, irréversible et impossible à relier à vous</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Sauvegarde quotidienne</strong><span class="item-desc">écrasée sous 24 heures — aucune copie identifiante ne subsiste nulle part</span></span></li>
</ul>

Tout lien avec votre identité est détruit au moment de la suppression. Deux catégories restreintes subsistent temporairement <em>sans aucun lien d'identité</em> : les enregistrements financiers (montants d'achat et d'utilisation) sont anonymisés vers le marqueur DELETED_USER et conservés 2 ans au titre de la prescription des litiges de consommation (TBK art. 146) ; un hachage d'appareil salé à sens unique est conservé jusqu'à 2 ans pour empêcher l'octroi répété de crédits gratuits (art. 6(1)(f) RGPD, intérêt légitime). Les deux sont purgés automatiquement à l'expiration. L'unique sauvegarde quotidienne est écrasée dans les 24 heures suivant la suppression.

La suppression via l'application constitue l'exercice formel de votre droit à l'effacement au titre de l'article 17 du GDPR et de l'article 11(e) du KVKK. Si vous ne pouvez pas accéder à votre compte, contactez **privacy@safescribe.dev** pour soumettre une demande de suppression par e-mail.

---

<span class="section-label">Traitement audio</span>
## Politique zéro disque
{: #zero-disk}

<div class="flow-diagram">
Votre audio :  Upload --> RAM --> Transcription IA --> Livraison --> SUPPRESSION
                                                                     (immédiate)

Notre disque :  Uniquement les enregistrements de solde — pas d'audio, pas de transcription, pas d'e-mail
</div>

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>RAM uniquement</strong><span class="item-desc">l'audio est traité exclusivement en mémoire volatile</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Jamais écrit sur disque</strong><span class="item-desc">pas même temporairement</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Pas d'entraînement IA</strong><span class="item-desc">votre audio n'est jamais utilisé pour améliorer des modèles</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>IA auto-hébergée</strong><span class="item-desc">aucun service IA tiers ne reçoit votre audio</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Garde-fou TTL</strong><span class="item-desc">les données s'autodétruisent même si le code de suppression échoue</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Verrouillage mémoire</strong><span class="item-desc">verrou au niveau du système d'exploitation empêchant l'audio d'être transféré sur disque</span></span></li>
</ul>

---

<span class="section-label">Authentification</span>
## Connexion via Google ou Apple
{: #sign-in}

Nous utilisons OpenID Connect (OIDC) via Google Sign-In et Sign in with Apple.

| Ce que le fournisseur nous envoie | Ce que nous en faisons |
|-----------------------------------|------------------------|
| Identifiant de compte | Haché (SHA-256 + sel) — l'original est rejeté |
| Adresse e-mail | Utilisée uniquement pour l'authentification — **non stockée** |
| Nom d'affichage | **Non stocké** |

Nous n'accédons pas à vos contacts, calendriers ou autres données de compte.

---

<span class="section-label">Paiements</span>
## Facturation via les App Stores
{: #billing}

Les paiements sont traités entièrement par Apple App Store ou Google Play Store. SafeScribe **ne reçoit, ne stocke ni ne traite** jamais les numéros de carte bancaire ou les détails de paiement. Nous recevons uniquement un reçu d'achat pour la vérification du solde.

<div class="callout callout-info">
  <strong>Les données de paiement conservées par Apple ou Google</strong> échappent au contrôle de SafeScribe et ne sont pas couvertes par le processus de suppression de compte de SafeScribe. Pour gérer ces données, contactez directement le <a href="https://support.apple.com">Support Apple</a> ou le <a href="https://support.google.com/googleplay">Support Google Play</a>.
</div>

---

<span class="section-label">Suivi des erreurs</span>
## Rapports de plantage (Optionnel)

Nous envoyons les rapports de plantage optionnels vers le point de terminaison de rapport de plantage propre à SafeScribe. Il est **désactivé par défaut** et peut être modifié à tout moment dans les Paramètres de confidentialité.

Avant la transmission de tout rapport, les éléments suivants sont automatiquement supprimés :

**Supprimés :** adresses e-mail · numéros de téléphone · adresses IP · chemins de fichiers · jetons d'authentification

**Conservés :** type d'erreur et trace de pile · modèle d'appareil · version du système d'exploitation · version de l'application

---

<span class="section-label">Tiers</span>
## Services tiers
{: #third-parties}

Nous utilisons les services suivants. Aucune information audio, contenu de transcription ou donnée personnelle au-delà de ce qui est indiqué n'est partagée avec des tiers.

| Service | Finalité | Données partagées | Politique de confidentialité |
|---------|----------|------------------|------------------------------|
| Google Sign-In | Authentification | Jeton OIDC uniquement | [policies.google.com/privacy](https://policies.google.com/privacy) |
| Apple Sign-In | Authentification | Jeton OIDC uniquement | [apple.com/legal/privacy](https://www.apple.com/legal/privacy/) |
| Apple App Store | Achats intégrés | Reçu d'achat uniquement | [apple.com/legal/privacy](https://www.apple.com/legal/privacy/) |
| Google Play Store | Achats intégrés | Reçu d'achat uniquement | [policies.google.com/privacy](https://policies.google.com/privacy) |
| Point de terminaison SafeScribe | Rapports de plantage (opt-in) | Rapport d'erreur anonyme — données personnelles supprimées | Exploité par SafeScribe, aucun tiers impliqué |

---

<span class="section-label">Base légale</span>
## Base légale du traitement

| Activité de traitement | Base GDPR | Base KVKK (Turquie) | Obligatoire ? |
|-----------------------|----------|----------|--------------|
| Transcription audio | Art. 6(1)(b) — Contrat | Consentement explicite | Obligatoire pour utiliser le service |
| Compte & facturation | Art. 6(1)(b) — Contrat | Exécution du contrat | Obligatoire pour utiliser le service |
| Authentification (OIDC) | Art. 6(1)(b) — Contrat | Exécution du contrat | Obligatoire pour utiliser le service |
| Achats intégrés | Art. 6(1)(b) — Contrat | Exécution du contrat | Obligatoire pour les achats |
| Rapports de plantage | Art. 6(1)(a) — Consentement | Consentement explicite | Optionnel |

La fourniture de données pour la transcription, l'authentification et la facturation est **obligatoire** pour utiliser SafeScribe. Les rapports de plantage sont **optionnels** — le service fonctionne entièrement sans eux.

---

<span class="section-label">Vos droits</span>
## Ce que vous pouvez faire
{: #your-rights}

<ul class="do-list">
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Accéder</strong><span class="item-desc">consulter toutes vos transcriptions dans l'application à tout moment</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Supprimer</strong><span class="item-desc">supprimer des transcriptions individuelles ou votre compte entier depuis les Paramètres de confidentialité ; la suppression du compte ne laisse aucune ligne dans aucune base de données</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Exporter</strong><span class="item-desc">partager ou exporter des transcriptions, ou demander un export complet des données depuis les Paramètres de confidentialité</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Refuser les diagnostics</strong><span class="item-desc">désactiver les rapports de plantage dans les Paramètres de confidentialité</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Retirer le consentement</strong><span class="item-desc">se déconnecter et supprimer votre compte à tout moment</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Opt-out CCPA</strong><span class="item-desc">activer « Ne pas vendre ou partager » dans les Paramètres de confidentialité</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Pas de décision automatisée</strong><span class="item-desc">nous ne prenons jamais de décisions automatisées vous concernant, y compris le profilage ayant des effets juridiques ou similaires (GDPR Art. 22)</span></span></li>
  <li><span class="check-mark">&#x2713;</span><span class="item-body"><strong>Déposer une plainte</strong><span class="item-desc">les résidents de l'UE/EEE peuvent contacter leur autorité de contrôle nationale (<a href="https://www.edpb.europa.eu/about-edpb/about-edpb/members_en">edpb.europa.eu</a>) ; les résidents de Turquie peuvent contacter la KVKK (<a href="https://www.kvkk.gov.tr">kvkk.gov.tr</a>)</span></span></li>
</ul>

Pour toute demande que vous ne pouvez pas effectuer dans l'application, contactez **privacy@safescribe.dev**.

---

<span class="section-label">Mentions légales</span>
## Informations complémentaires

**Responsable du traitement.** SafeScribe est exploité par un développeur indépendant basé en Turquie. Contact : privacy@safescribe.dev. Aucun délégué à la protection des données (DPO) n'a été désigné — le traitement n'est pas effectué à grande échelle et aucune donnée de catégorie spéciale n'est conservée de manière systématique (l'audio est traité de manière éphémère en RAM uniquement, jamais persisté sur disque).

**Sauvegardes.** Une sauvegarde quotidienne unique des données de compte (ID pseudonyme, solde, statistiques d'utilisation) est conservée pour la continuité du service. Chaque sauvegarde écrase la précédente. Les données supprimées lors de la suppression du compte sont retirées immédiatement des systèmes actifs et de la sauvegarde dans les 24 heures.

**Transferts internationaux.** Si vous utilisez SafeScribe depuis l'UE/l'EEE, vos données audio et de compte sont traitées sur des serveurs en Turquie. La Turquie ne dispose pas actuellement d'une <a href="https://commission.europa.eu/law/law-topic/data-protection/international-dimension-data-protection/adequacy-decisions_en">décision d'adéquation de l'UE</a> ; les transferts sont couverts par votre consentement explicite et éclairé lors du premier lancement (GDPR Art. 49(1)(a)). Pour les utilisateurs en Turquie (KVKK — loi turque sur la protection des données personnelles), le transfert transfrontalier est autorisé par le consentement explicite lors du premier lancement conformément à l'article 9 du KVKK.

**Enfants.** SafeScribe est classé 17+ sur l'App Store et Google Play et n'est pas destiné aux utilisateurs de moins de 17 ans. Nous ne collectons pas sciemment de données auprès de personnes de moins de 17 ans. Dans les pays où 18 ans est l'âge de la pleine capacité juridique (y compris la Turquie), les utilisateurs âgés de 17 ans nécessitent le consentement d'un parent ou tuteur avant d'utiliser l'application.

**Modifications de politique.** Nous mettrons à jour cette page lorsque nos pratiques changeront. La date de « Dernière mise à jour » ci-dessus reflète la révision la plus récente.

---

<span class="section-label">Contact</span>
## Nous contacter

| Sujet | Contact |
|-------|---------|
| Demandes de confidentialité, suppression de données, droits | privacy@safescribe.dev |
| Vulnérabilités de sécurité | security@safescribe.dev |
| Support général | support@safescribe.dev |

---


</div>
