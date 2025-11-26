# Questions par compétences du REAC

## Activité Type 1 : Développer une application sécurisée

### Compétence 1 : Installer et configurer son environnement de travail en fonction du projet

Voici 20 questions techniques potentielles axées sur les outils, la gestion de version, l'OS et la configuration
initiale.

#### 1. Q : Quelle est la différence entre Git et GitHub (ou GitLab) ?

##### Réponse {collapsible="true"}

Git est le logiciel de gestion de versions (VCS) décentralisé installé localement qui gère l'historique du code et les
modifications. GitHub (ou GitLab) est une plateforme d'hébergement web pour stocker ces dépôts Git (remote), offrant des
fonctionnalités collaboratives (Pull Requests, Issues, CI/CD).

#### 2. Q : Pourquoi est-il important d'utiliser un fichier `.gitignore` et que mettez-vous dedans ?

##### Réponse {collapsible="true"}

Le `.gitignore` permet d'exclure certains fichiers du suivi de version pour ne pas polluer le dépôt ou compromettre la
sécurité. On y met les dossiers de dépendances lourds (ex: `node_modules`, `vendor`), les fichiers de
build/compilation (`.class`, `/dist`), les fichiers de configuration de l'IDE (`.idea`, `.vscode`) et surtout les
fichiers contenant des secrets ou variables d'environnement locales (`.env`).

#### 3. Q : Qu'est-ce qu'une variable d'environnement et pourquoi les utiliser plutôt que des valeurs "en dur" ?

##### Réponse {collapsible="true"}

Une variable d'environnement est une valeur dynamique nommée qui peut affecter la manière dont les processus en cours d'
exécution se comportent sur un ordinateur. On les utilise pour stocker des configurations sensibles (clés API, mots de
passe BDD) ou contextuelles (URL de l'API : localhost en dev, production.com en prod). Cela permet de changer la
configuration sans modifier le code source et évite de commiter des secrets sur Git.

#### 4. Q : Quelle est la différence entre un IDE (IntelliJ, VS Code) et un simple éditeur de texte ?

##### Réponse {collapsible="true"}

Un simple éditeur de texte permet d'éditer du code brut. Un IDE (Integrated Development Environment) intègre des outils
pour augmenter la productivité : autocomplétion intelligente, débogueur intégré, terminal, accès aux bases de données,
gestion de Git via interface graphique, et outils de refactoring.

#### 5. Q : À quoi sert un gestionnaire de paquets (npm, composer, maven, pip) ?

##### Réponse {collapsible="true"}

Il sert à automatiser le processus d'installation, de mise à jour, de configuration et de suppression des bibliothèques
tierces (dépendances) d'un projet. Il gère également les dépendances transitives (les dépendances de vos dépendances) et
assure que tous les développeurs utilisent les mêmes versions grâce aux fichiers de verrouillage (`package-lock.json`,
`composer.lock`).

#### 6. Q : Qu'est-ce que Docker et quel est son intérêt pour l'environnement de développement ?

##### Réponse {collapsible="true"}

Docker est une plateforme de conteneurisation qui permet d'empaqueter une application et ses dépendances (OS,
librairies) dans un conteneur isolé. En développement, cela garantit que "ça marche chez moi" signifie "ça marche
partout", car l'environnement est identique pour tous les développeurs, peu importe leur OS hôte (Windows, Mac, Linux),
évitant les problèmes de versions (ex: version de PHP ou Node différente).

#### 7. Q : Expliquez la différence entre `git merge` et `git rebase`.

##### Réponse {collapsible="true"}

`git merge` fusionne deux branches en créant un nouveau "commit de fusion", préservant l'historique exact et
chronologique. `git rebase` réécrit l'historique en plaçant les commits de votre branche à la suite de la branche cible,
créant un historique linéaire plus propre mais modifiant l'historique (dangereux sur des branches partagées).

#### 8. Q : Vous lancez votre serveur local et obtenez une erreur "EADDRINUSE" (port déjà utilisé). Que faites-vous ?

##### Réponse {collapsible="true"}

Cela signifie qu'un autre processus utilise déjà le port (ex: 8080 ou 3000). Je peux soit identifier et tuer le
processus occupant (via `lsof -i :port` ou `netstat`), soit configurer mon application pour utiliser un autre port via
les variables d'environnement ou la configuration du serveur.

#### 9. Q : Qu'est-ce que le "Semantic Versioning" (SemVer) ?

##### Réponse {collapsible="true"}

C'est une convention de numérotation des versions sous la forme `MAJEUR.MINEUR.CORRECTIF` (ex: 2.1.4).

- MAJEUR : changements incompatibles (breaking changes).
- MINEUR : nouvelles fonctionnalités rétrocompatibles.
- CORRECTIF : correction de bugs rétrocompatibles.

#### 10. Q : Pourquoi utiliser un Linter (ESLint, SonarLint) dans son environnement ?

##### Réponse {collapsible="true"}

Un linter analyse le code statiquement pour détecter des erreurs de syntaxe, des problèmes de style ou des mauvaises
pratiques (variables non utilisées, complexité cyclomatique). Il assure une cohérence du code au sein de l'équipe et
prévient certains bugs avant l'exécution.

#### 11. Q : Quelle est la différence entre les fins de ligne CRLF et LF, et comment Git gère-t-il cela ?

##### Réponse {collapsible="true"}

Windows utilise CRLF (Carriage Return + Line Feed) pour les retours à la ligne, tandis que Linux/Mac utilisent LF (Line
Feed). Cela peut créer des diffs inutiles dans Git. On configure Git (`core.autocrlf`) pour normaliser les fichiers en
LF dans le dépôt, tout en les convertissant en CRLF localement si l'utilisateur est sous Windows.

#### 12. Q : Comment sécurisez-vous l'accès à vos dépôts distants (GitHub/GitLab) ?

##### Réponse {collapsible="true"}

En utilisant l'authentification à deux facteurs (2FA) sur la plateforme et en privilégiant l'utilisation de clés SSH
plutôt que HTTPS pour les opérations Git, ce qui évite de taper le mot de passe à chaque fois et sécurise la connexion
via cryptographie asymétrique.

#### 13. Q : Qu'est-ce qu'une branche "feature" dans le workflow Gitflow ?

##### Réponse {collapsible="true"}

Dans Gitflow, une branche "feature" est créée à partir de la branche `develop`. Elle sert à développer une
fonctionnalité spécifique de manière isolée. Une fois terminée et testée, elle est fusionnée (merged) dans `develop`.

#### 14. Q : À quoi sert un fichier `README.md` à la racine du projet ?

##### Réponse {collapsible="true"}

C'est le point d'entrée de la documentation technique. Il doit expliquer ce que fait le projet, les pré-requis
techniques, comment installer l'environnement (ex: `npm install`), comment lancer le projet et comment exécuter les
tests.

#### 15. Q : Que sont les "Pre-commit hooks" (avec Husky par exemple) ?

##### Réponse {collapsible="true"}

Ce sont des scripts qui s'exécutent automatiquement avant qu'un commit ne soit validé. On les utilise pour forcer le
passage des linters ou des tests unitaires. Si le script échoue (erreur de syntaxe), le commit est bloqué, garantissant
que le code versionné est toujours "propre".

#### 16. Q : Quelle est la différence entre une dépendance de production (`dependencies`) et de développement (

`devDependencies`) ?

##### Réponse {collapsible="true"}

Les `dependencies` sont les librairies nécessaires au fonctionnement de l'application en production (ex: React, Spring
Boot Starter). Les `devDependencies` sont les outils nécessaires uniquement pour développer, tester ou builder
l'application (ex: Jest, Webpack, ESLint), et ne sont pas installés sur le serveur de production.

#### 17. Q : Comment gérez-vous les versions de langage (Node, Java, PHP) sur votre poste si vous avez plusieurs projets différents ?

##### Réponse {collapsible="true"}

J'utilise des gestionnaires de versions de langages comme NVM (Node Version Manager), SDKMAN (Java) ou rbenv (Ruby). Ils
permettent d'installer plusieurs versions en parallèle et de switcher facilement de l'une à l'autre selon le projet
actif.

#### 18. Q : Qu'est-ce que l'encodage UTF-8 et pourquoi est-il standard ?

##### Réponse {collapsible="true"}

UTF-8 est un encodage de caractères universel capable de représenter quasiment tous les caractères de toutes les
langues (y compris émojis et alphabets non latins). Il est standard car il est rétrocompatible avec ASCII et évite les
problèmes d'affichage (les fameux caractères bizarres Ã©) lors du partage de fichiers entre systèmes internationaux.

#### 19. Q : Qu'est-ce qu'un "bouchon" ou un "Mock" lors de la configuration de l'environnement ?

##### Réponse {collapsible="true"}

Si le backend ou une API tierce n'est pas encore disponible, je peux configurer un Mock (avec des outils comme Postman
ou JSON Server) pour simuler les réponses de l'API. Cela me permet de continuer à développer et tester le frontend sans
dépendre de la disponibilité du service réel.

#### 20. Q : Comment assurez-vous la sauvegarde de votre travail en cours de journée ?

##### Réponse {collapsible="true"}

Je fais des commits fréquents et atomiques (petits changements logiques) localement. Je "push" régulièrement mon travail
sur le dépôt distant (au moins une fois par jour ou après chaque fonctionnalité complétée) pour éviter la perte de
données en cas de panne matérielle.

### Compétence 2 : Développer des interfaces utilisateur

Voici 20 questions axées sur le développement Frontend (Web et Mobile), l'accessibilité et les bonnes pratiques UI.

#### 1. Q : Quelle est la différence entre le HTML sémantique et le HTML classique (ex: `<div>` vs `<article>`) ?

##### Réponse {collapsible="true"}

Le HTML sémantique donne du sens au contenu pour les navigateurs et les lecteurs d'écran. Un `<div>` est un conteneur
générique sans sens particulier. Un `<article>` indique un contenu autonome, `<nav>` une navigation, etc. Cela améliore
l'accessibilité (a11y) et le référencement naturel (SEO).

#### 2. Q : Qu'est-ce que le DOM (Document Object Model) ?

##### Réponse {collapsible="true"}

Le DOM est une représentation structurée sous forme d'arbre du document HTML. C'est l'interface qui permet aux scripts (
JavaScript) d'accéder au contenu, à la structure et aux styles de la page pour les modifier dynamiquement (ajouter un
élément, changer une classe, écouter un clic).

#### 3. Q : Expliquez le concept de "Responsive Design" et comment le mettez-vous en œuvre ?

##### Réponse {collapsible="true"}

Le Responsive Design consiste à adapter l'affichage d'un site web à la taille de l'écran (mobile, tablette, desktop). On
le met en œuvre principalement avec les Media Queries CSS (`@media (max-width: 768px)`) et des unités relatives (%, rem,
vw/vh) plutôt que fixes (px). L'approche "Mobile First" est souvent privilégiée.

#### 4. Q : Quelle est la différence entre `localStorage`, `sessionStorage` et les Cookies ?

##### Réponse {collapsible="true"}

- `localStorage` : Stockage persistant dans le navigateur (ne s'efface pas à la fermeture).
- `sessionStorage` : Stockage temporaire, effacé à la fermeture de l'onglet.
- Cookies : Petites données envoyées au serveur à chaque requête HTTP (utile pour l'authentification). Les Storage
  restent côté client uniquement.

#### 5. Q : Qu'est-ce qu'une Single Page Application (SPA) ?

##### Réponse {collapsible="true"}

Une SPA est une application web qui charge une seule page HTML et met à jour dynamiquement le contenu via JavaScript (
AJAX/Fetch) sans recharger la page entière. Cela offre une expérience utilisateur plus fluide, proche d'une application
native (ex: React, Vue, Angular).

#### 6. Q : Qu'est-ce que l'accessibilité numérique (WCAG) et citez une règle simple à appliquer ?

##### Réponse {collapsible="true"}

C'est la pratique consistant à rendre les sites utilisables par tous, y compris les personnes en situation de handicap (
visuel, moteur, cognitif). Une règle simple : toujours fournir un texte alternatif (`alt=""`) pour les images
significatives, afin que les lecteurs d'écran puissent les décrire.

#### 7. Q : Dans un framework JS (React/Vue/Angular), qu'est-ce qu'un "Composant" ?

##### Réponse {collapsible="true"}

Un composant est un bloc de code réutilisable et indépendant qui encapsule sa propre structure (HTML), son style (CSS)
et sa logique (JS). Par exemple, un composant `Button` ou `Navbar`. Cela facilite la maintenance et la réutilisabilité
du code.

#### 8. Q : Quelle est la différence entre CSS Grid et Flexbox ?

##### Réponse {collapsible="true"}

Flexbox est conçu pour la mise en page unidimensionnelle (une ligne OU une colonne à la fois). CSS Grid est conçu pour
la mise en page bidimensionnelle (lignes ET colonnes en même temps). On utilise souvent Flexbox pour aligner des
éléments dans un composant, et Grid pour la structure globale de la page.

#### 9. Q : Qu'est-ce que le Cross-Site Scripting (XSS) et comment s'en prémunir côté Frontend ?

##### Réponse {collapsible="true"}

C'est une faille permettant d'injecter du script malveillant dans une page vue par d'autres utilisateurs. Pour s'en
prémunir, il faut toujours échapper (sanitize) les données affichées provenant de l'utilisateur. Les frameworks
modernes (React, Angular) le font automatiquement par défaut, mais il faut éviter d'utiliser des fonctions dangereuses
comme `innerHTML` ou `dangerouslySetInnerHTML` sans précaution.

#### 10. Q : À quoi sert l'attribut `aria-label` ?

##### Réponse {collapsible="true"}

Il sert à fournir une étiquette textuelle à un élément qui n'a pas de texte visible à l'écran, pour les technologies
d'assistance. Par exemple, un bouton avec seulement une icône "X" pour fermer : on met `aria-label="Fermer la fenêtre"`
pour que le lecteur d'écran lise l'action et non "image X".

#### 11. Q : Qu'est-ce qu'une PWA (Progressive Web App) ?

##### Réponse {collapsible="true"}

C'est une application web qui utilise des fonctionnalités modernes (Service Workers, Manifest) pour offrir une
expérience proche d'une app native : elle est installable sur l'écran d'accueil, peut fonctionner hors-ligne et envoyer
des notifications push.

#### 12. Q : Pourquoi utiliser des préprocesseurs CSS comme Sass ou Less ?

##### Réponse {collapsible="true"}

Ils ajoutent des fonctionnalités au CSS standard : variables, imbrication (nesting), mixins (fonctions), héritage. Cela
rend le CSS plus modulaire, plus facile à maintenir et plus DRY (Don't Repeat Yourself). Le code est ensuite compilé en
CSS standard pour le navigateur.

#### 13. Q : Expliquez le fonctionnement de `fetch` ou `Axios` pour consommer une API.

##### Réponse {collapsible="true"}

`fetch` (natif) et `Axios` (librairie) permettent de faire des requêtes HTTP asynchrones (GET, POST, etc.) vers un
serveur. Ils retournent des Promesses. On utilise souvent `async/await` pour gérer la réponse : on attend la réponse, on
la convertit en JSON, puis on met à jour l'état de l'interface avec les données reçues.

#### 14. Q : Qu'est-ce que le "Virtual DOM" (utilisé par React/Vue) ?

##### Réponse {collapsible="true"}

C'est une représentation légère du DOM réel en mémoire. À chaque changement d'état, le framework met à jour le Virtual
DOM, compare la nouvelle version avec l'ancienne (processus de "Diffing"), et ne met à jour dans le DOM réel (lent) que
les éléments qui ont effectivement changé. Cela optimise les performances de rendu.

#### 15. Q : Comment gérez-vous les formulaires complexes côté frontend ?

##### Réponse {collapsible="true"}

Je gère l'état de chaque champ (valeur, erreur, touché). J'implémente une validation côté client (regex pour email,
longueur min/max) pour un retour utilisateur immédiat, tout en sachant que la vraie validation de sécurité se fait côté
backend. J'utilise souvent des librairies (comme Formik ou React Hook Form) pour simplifier cette gestion.

#### 16. Q : Qu'est-ce que le "Lazy Loading" des images ou des modules ?

##### Réponse {collapsible="true"}

C'est une technique qui consiste à différer le chargement d'une ressource jusqu'au moment où elle est nécessaire (ex:
quand l'image arrive dans le viewport lors du scroll). Cela réduit le temps de chargement initial de la page et
économise la bande passante.

#### 17. Q : Quelle est la différence entre `em`, `rem` et `px` ?

##### Réponse {collapsible="true"}

- `px` : unité absolue, fixe.
- `em` : unité relative à la taille de police de l'élément parent.
- `rem` (root em) : unité relative à la taille de police de l'élément racine (`<html>`). `rem` est préférable pour
  l'accessibilité car il respecte les préférences de taille de police du navigateur de l'utilisateur.

#### 18. Q : Qu'est-ce que CORS (Cross-Origin Resource Sharing) ?

##### Réponse {collapsible="true"}

C'est une sécurité des navigateurs qui empêche par défaut un site (ex: `mon-site.com`) de faire des requêtes vers un
autre domaine (ex: `api.google.com`). Le serveur cible doit explicitement autoriser l'origine via des en-têtes HTTP (
`Access-Control-Allow-Origin`) pour que le navigateur accepte la réponse.

#### 19. Q : Comment optimiser les performances d'une application Frontend ?

##### Réponse {collapsible="true"}

On peut minifier les fichiers CSS/JS (réduire leur taille), compresser les images (WebP), utiliser le Lazy Loading,
mettre en cache les ressources statiques, réduire le nombre de requêtes HTTP et utiliser un CDN (Content Delivery
Network).

#### 20. Q : Quelle est la spécificité du développement mobile (React Native / Ionic / Flutter) par rapport au Web classique ?

##### Réponse {collapsible="true"}

Bien que les langages soient souvent les mêmes (JS/Dart), le développement mobile interagit avec les API natives du
téléphone (Caméra, Géolocalisation, Accéléromètre). L'interface n'utilise pas de HTML/CSS standard (pas de `div`, mais
des `View`), et le processus de déploiement passe par les Stores (Apple/Google) avec des contraintes de validation
spécifiques.

### Compétence 3 : Développer des composants métier

Ce bloc concerne le Backend, la logique serveur, les API et l'algorithmique.

#### 1. Q : Qu'est-ce qu'une API REST et quelles sont ses contraintes principales (Verbes HTTP) ?

##### Réponse {collapsible="true"}

REST (Representational State Transfer) est un style d'architecture pour les systèmes distribués. Elle utilise les verbes
HTTP standards pour effectuer des opérations sur des ressources :

- GET : Récupérer une ressource.
- POST : Créer une ressource.
- PUT : Mettre à jour une ressource complète.
- PATCH : Mettre à jour partiellement une ressource.
- DELETE : Supprimer une ressource.
  Elle est "stateless" (sans état), chaque requête doit contenir toute l'information nécessaire.

#### 2. Q : Qu'est-ce que l'injection de dépendances (Dependency Injection) et pourquoi l'utiliser ?

##### Réponse {collapsible="true"}

C'est un motif de conception où les objets ne créent pas eux-mêmes leurs dépendances, mais les reçoivent (généralement
via le constructeur) d'une source externe (un conteneur IoC). Cela permet de découpler les classes, rend le code plus
modulaire et facilite énormément les tests unitaires (on peut injecter des Mocks à la place des vrais services).

#### 3. Q : Expliquez la différence entre authentification et autorisation.

##### Réponse {collapsible="true"}

- Authentification (Qui suis-je ?) : Vérifier l'identité de l'utilisateur (ex: login/mot de passe).
- Autorisation (Qu'ai-je le droit de faire ?) : Vérifier si l'utilisateur identifié a les permissions nécessaires pour
  accéder à une ressource spécifique (ex: rôle Admin vs User).

#### 4. Q : Qu'est-ce qu'un JWT (JSON Web Token) et comment fonctionne-t-il ?

##### Réponse {collapsible="true"}

C'est un standard pour échanger des informations de manière sécurisée entre deux parties. Il est composé de 3 parties :
Header, Payload (données utilisateur), Signature. Le serveur génère le token lors du login, le signe avec une clé
secrète, et l'envoie au client. Le client le renvoie à chaque requête (Header Authorization). Le serveur vérifie la
signature pour valider l'identité sans avoir besoin de stocker une session en base.

#### 5. Q : Comment protégez-vous votre Backend contre les injections SQL ?

##### Réponse {collapsible="true"}

Je n'utilise jamais la concaténation de chaînes de caractères pour construire mes requêtes SQL avec des données
utilisateur. J'utilise toujours des requêtes préparées (Prepared Statements) ou un ORM (Hibernate, Entity Framework,
Doctrine) qui gère l'échappement des caractères spéciaux automatiquement.

#### 6. Q : Qu'est-ce qu'une architecture MVC (Modèle-Vue-Contrôleur) côté serveur ?

##### Réponse {collapsible="true"}

C'est un patron d'architecture qui sépare les responsabilités :

- Modèle : Gère les données et la logique métier (accès BDD).
- Vue : Gère l'affichage (HTML, JSON).
- Contrôleur : Reçoit la requête utilisateur, appelle le Modèle pour traiter, et renvoie la Vue appropriée.

#### 7. Q : Qu'est-ce qu'une Exception et comment doit-on les gérer proprement ?

##### Réponse {collapsible="true"}

Une exception est un événement qui perturbe le flux normal d'exécution (erreur). On doit les gérer avec des blocs
`try-catch`. Il ne faut jamais "avaler" une exception (catch vide). On doit soit la traiter (log, retry), soit la
relancer, soit renvoyer une erreur explicite et formatée à l'utilisateur (ex: HTTP 400/500) sans exposer la stack trace
technique en production.

#### 8. Q : Quelle est la complexité algorithmique (Big O) et pourquoi est-ce important ?

##### Réponse {collapsible="true"}

C'est une mesure de la performance d'un algorithme en fonction de la taille de l'entrée (n). Par exemple, O(n) est
linéaire (boucle simple), O(n²) est quadratique (boucle imbriquée). C'est important pour s'assurer que le code restera
performant même si le volume de données augmente considérablement (scalabilité).

#### 9. Q : Qu'est-ce que le chiffrement (hashing) des mots de passe et pourquoi utiliser `bcrypt` ou `Argon2` ?

##### Réponse {collapsible="true"}

On ne stocke jamais les mots de passe en clair. On utilise une fonction de hachage à sens unique. `bcrypt` ou `Argon2`
sont lents par design (pour contrer les attaques par force brute) et intègrent un "salt" (sel) aléatoire pour empêcher
les attaques par Rainbow Tables (tables de correspondance pré-calculées).

#### 10. Q : Qu'est-ce qu'un Middleware (dans Node.js/Express ou Laravel) ?

##### Réponse {collapsible="true"}

C'est une fonction qui s'exécute entre la réception de la requête et le traitement final par le contrôleur. On l'utilise
pour des tâches transverses : logger les requêtes, vérifier l'authentification (JWT), parser le corps de la requête (
JSON), ou gérer les erreurs globales.

#### 11. Q : Expliquez le concept de programmation asynchrone (Async/Await, Promises, Threads).

##### Réponse {collapsible="true"}

L'asynchrone permet d'exécuter des tâches longues (I/O, appels réseau, lecture fichier) sans bloquer le fil d'exécution
principal. Le programme continue de tourner et traite le résultat de la tâche longue une fois celle-ci terminée (via
callback, promesse ou await). Cela est crucial pour la réactivité des serveurs web.

#### 12. Q : Qu'est-ce qu'une transaction en base de données et pourquoi est-ce important pour le métier ?

##### Réponse {collapsible="true"}

Une transaction garantit l'intégrité des données via les propriétés ACID (Atomicité, Cohérence, Isolation, Durabilité).
Si une opération métier nécessite plusieurs écritures (ex: débiter compte A, créditer compte B), la transaction assure
que soit TOUT réussit, soit RIEN ne se fait (Rollback) en cas d'erreur, évitant des données incohérentes.

#### 13. Q : Qu'est-ce qu'un Singleton et dans quel cas l'utiliser ?

##### Réponse {collapsible="true"}

C'est un Design Pattern qui assure qu'une classe n'a qu'une seule instance et fournit un point d'accès global à
celle-ci. On l'utilise souvent pour des services comme la connexion à la base de données ou un gestionnaire de
configuration, pour éviter de multiplier les connexions inutiles.

#### 14. Q : Comment validez-vous les données reçues par votre API (DTO) ?

##### Réponse {collapsible="true"}

J'utilise des DTO (Data Transfer Objects) pour typer les données entrantes et des librairies de validation (ex: Bean
Validation en Java, Joi/Zod en JS, Symfony Validator). Je vérifie le type, le format (email, date), les contraintes
obligatoires avant même d'essayer de traiter la logique métier.

#### 15. Q : Qu'est-ce que le principe DRY (Don't Repeat Yourself) ?

##### Réponse {collapsible="true"}

C'est un principe visant à éviter la duplication de code. Si une logique est répétée à deux endroits, on doit l'extraire
dans une fonction, une classe ou un composant commun. Cela facilite la maintenance : si la logique change, on ne modifie
le code qu'à un seul endroit.

#### 16. Q : Qu'est-ce que la sérialisation et la désérialisation ?

##### Réponse {collapsible="true"}

- La sérialisation est le processus de conversion d'un objet en mémoire en un format stockable ou transmissible (souvent
  JSON ou XML).
- La désérialisation est l'inverse : reconstruire un objet en mémoire à partir de la chaîne JSON/XML. C'est essentiel
  pour la communication API.

#### 17. Q : Quelle est la différence entre une classe abstraite et une interface ?

##### Réponse {collapsible="true"}

Une interface définit un contrat (méthodes à implémenter) sans fournir de code (sauf méthodes par défaut récentes). Une
classe peut implémenter plusieurs interfaces. Une classe abstraite peut fournir une implémentation partielle (code
commun) et forcer l'implémentation de certaines méthodes. Une classe ne peut hériter que d'une seule classe abstraite.

#### 18. Q : Qu'est-ce qu'un Webhook ?

##### Réponse {collapsible="true"}

C'est un mécanisme de callback HTTP inversé. Au lieu que mon application appelle régulièrement une API externe pour voir
s'il y a du nouveau (polling), l'API externe appelle une URL de mon application (endpoint) lorsqu'un événement se
produit (ex: Stripe notifie mon serveur qu'un paiement a réussi).

#### 19. Q : Comment gérez-vous les logs dans une application Backend ?

##### Réponse {collapsible="true"}

Je n'utilise pas `console.log` ou `print`. J'utilise une librairie de logging (Log4j, Winston, Monolog) qui permet de
définir des niveaux de sévérité (DEBUG, INFO, WARN, ERROR) et des formats de sortie (fichier, console, service externe
type ELK). Cela permet de filtrer les logs et de surveiller la production sans modifier le code.

#### 20. Q : Qu'est-ce que l'IDOR (Insecure Direct Object Reference) ?

##### Réponse {collapsible="true"}

C'est une faille de sécurité où un utilisateur peut accéder à des objets (fichiers, enregistrements BDD) en modifiant
simplement un identifiant dans l'URL (ex: `/user/123` vers `/user/124`). Pour la prévenir, il faut toujours vérifier
côté serveur que l'utilisateur connecté a le droit d'accéder à l'ID demandé.

### Compétence 4 : Contribuer à la gestion d’un projet informatique

Ce bloc concerne les méthodologies de travail, la collaboration, l'Agilité et les outils de suivi.

#### 1. Q : Qu'est-ce que la méthode Agile (ex: Scrum) et en quoi diffère-t-elle du cycle en V ?

##### Réponse {collapsible="true"}

La méthode Agile est itérative et incrémentale. Au lieu de livrer tout le produit à la fin (Cycle en V), on découpe le
projet en cycles courts (Sprints) de 2 à 3 semaines, avec des livraisons fonctionnelles régulières. Cela permet de
s'adapter rapidement aux changements de besoins du client et d'obtenir du feedback plus tôt.

#### 2. Q : Quels sont les rôles principaux dans une équipe Scrum ?

##### Réponse {collapsible="true"}

- **Product Owner (PO)** : Définit la vision du produit, gère le Backlog et priorise les fonctionnalités.
- **Scrum Master** : Facilite le processus, lève les obstacles (bloquants) et protège l'équipe.
- **Équipe de développement (Dev Team)** : Réalise techniquement le produit (conception, dév, test).

#### 3. Q : Qu'est-ce qu'un "Stand-up Meeting" (ou Daily Scrum) ?

##### Réponse {collapsible="true"}

C'est une réunion quotidienne courte (15 min max), debout, où chaque membre répond à 3 questions :

1. Ce que j'ai fait hier.
2. Ce que je vais faire aujourd'hui.
3. Est-ce que j'ai des points bloquants ?
   L'objectif est la synchronisation de l'équipe, pas le reporting détaillé.

#### 4. Q : Qu'est-ce qu'un Kanban Board (ex: Trello, Jira) et comment l'utilisez-vous ?

##### Réponse {collapsible="true"}

C'est un tableau visuel pour gérer le flux de travail. Il est divisé en colonnes (ex: "À faire", "En cours", "À
tester", "Fait"). Chaque tâche est une carte que l'on déplace de gauche à droite. Cela permet de visualiser l'avancement
en temps réel et de limiter le travail en cours (WIP) pour éviter les goulots d'étranglement.

#### 5. Q : Qu'est-ce qu'une "User Story" et quel est son format typique ?

##### Réponse {collapsible="true"}

C'est une description simple d'une fonctionnalité du point de vue de l'utilisateur. Le format standard est :
"En tant que [rôle utilisateur], je veux [action/fonctionnalité], afin de [bénéfice/valeur métier]."
Elle est accompagnée de critères d'acceptation pour valider qu'elle est "finie".

#### 6. Q : Qu'est-ce que le "Poker Planning" (ou Planning Poker) ?

##### Réponse {collapsible="true"}

C'est une technique d'estimation collective utilisée en Agile. L'équipe utilise des cartes avec des suites de
Fibonacci (1, 2, 3, 5, 8...) pour estimer la complexité (Story Points) d'une tâche. Tout le monde vote en même temps
pour éviter les biais d'influence. Si les estimations divergent, on en discute pour s'aligner sur la compréhension de la
tâche.

#### 7. Q : Qu'est-ce que le MVP (Minimum Viable Product) ?

##### Réponse {collapsible="true"}

C'est la version la plus minimaliste d'un produit qui permet quand même de le lancer sur le marché pour tester l'idée et
recueillir les premiers retours utilisateurs. On se concentre uniquement sur les fonctionnalités "Core" (essentielles),
en laissant le "Nice to have" pour plus tard.

#### 8. Q : Qu'est-ce qu'une "Code Review" (Revue de code) et à quoi sert-elle ?

##### Réponse {collapsible="true"}

C'est une étape où un ou plusieurs développeurs relisent le code d'un pair (souvent via une Pull Request) avant de le
fusionner. Cela sert à détecter des bugs, vérifier le respect des standards de codage, partager la connaissance du
projet et améliorer la qualité globale du code (et apprendre des autres).

#### 9. Q : Comment gérez-vous la dette technique ?

##### Réponse {collapsible="true"}

La dette technique est le coût futur engendré par le choix d'une solution facile/rapide maintenant au lieu d'une
meilleure approche qui prendrait plus de temps. Il faut l'accepter consciemment (pour livrer vite), mais prévoir du
temps dans les sprints suivants pour "rembourser" cette dette (refactoring) avant qu'elle ne devienne ingérable.

#### 10. Q : Qu'est-ce que le versioning sémantique et pourquoi est-ce important pour la gestion de projet ?

##### Réponse {collapsible="true"}

(Déjà vu en Compétence 1 mais pertinent ici). C'est important pour communiquer clairement l'impact des changements aux
autres équipes ou utilisateurs de l'API/Librairie. Un changement de version MAJEURE signale qu'il faut prévoir du temps
pour la migration car il y a des risques de casse.

#### 11. Q : Qu'est-ce que la Definition of Done (DoD) ?

##### Réponse {collapsible="true"}

C'est une liste de critères communs à l'équipe qui doit être validée pour qu'une tâche soit considérée comme "terminée".
Exemples : Code écrit, Tests unitaires passés, Code review validée, Documentation mise à jour, Déployé en environnement
de recette.

#### 12. Q : Comment réagissez-vous si vous réalisez que vous ne pourrez pas finir votre tâche dans les temps (Sprint) ?

##### Réponse {collapsible="true"}

Je communique immédiatement (au Daily Scrum) le problème au Scrum Master et à l'équipe. Je n'attends pas la fin du
sprint. On peut alors décider ensemble : soit quelqu'un m'aide (Pair Programming), soit on réduit le périmètre de la
tâche, soit on accepte que la tâche sera reportée au sprint suivant. La transparence est clé.

#### 13. Q : Qu'est-ce que l'intégration continue (CI) ?

##### Réponse {collapsible="true"}

C'est une pratique qui consiste à fusionner le code de tous les développeurs dans une branche principale plusieurs fois
par jour. Chaque fusion déclenche une construction automatique (build) et des tests automatisés pour détecter les
erreurs d'intégration le plus tôt possible ("Fail Fast").

#### 14. Q : Qu'est-ce qu'un cahier des charges fonctionnel ?

##### Réponse {collapsible="true"}

C'est un document qui décrit de manière exhaustive les besoins du client, les fonctionnalités attendues, les contraintes
techniques et les cas d'utilisation, sans nécessairement entrer dans le détail de l'implémentation technique (le "Quoi"
et non le "Comment").

#### 15. Q : Quelle est la différence entre Scrum et Kanban ?

##### Réponse {collapsible="true"}

- Scrum fonctionne par itérations fixes (Sprints de 2 semaines), avec des rôles définis et un engagement sur un
  périmètre au début du sprint.
- Kanban est un flux continu (pas de sprints fixes), on prend les tâches au fil de l'eau, on limite le travail en cours,
  et c'est souvent plus adapté à la maintenance ou au support.

#### 16. Q : Qu'est-ce qu'une rétrospective de Sprint ?

##### Réponse {collapsible="true"}

C'est une réunion qui a lieu à la toute fin du sprint. L'équipe analyse comment s'est déroulé le sprint (processus,
outils, relations humaines) pour identifier ce qui a bien fonctionné et ce qui doit être amélioré. On en tire un plan
d'action pour le prochain sprint (Amélioration continue).

#### 17. Q : Qu'est-ce que le Pair Programming ?

##### Réponse {collapsible="true"}

C'est une technique où deux développeurs travaillent sur le même poste de travail. L'un écrit le code ("Driver"),
l'autre observe, réfléchit à la stratégie, aux cas limites et relit en temps réel ("Navigator"). Ils échangent
régulièrement les rôles. Cela améliore la qualité du code et le partage de connaissances, bien que cela coûte plus cher
en temps-homme à court terme.

#### 18. Q : Comment estimez-vous la charge de travail d'une tâche ?

##### Réponse {collapsible="true"}

Je décompose la tâche en sous-tâches plus petites et plus claires. J'évalue la complexité technique, les incertitudes et
l'effort requis. Je compare avec des tâches similaires déjà réalisées. En Agile, on préfère l'estimation relative (
Points) à l'estimation en temps (Jours/Heures) car elle est plus fiable collectivement.

#### 19. Q : Qu'est-ce qu'un "Burndown Chart" ?

##### Réponse {collapsible="true"}

C'est un graphique utilisé en Scrum qui montre la quantité de travail restant à faire (axe Y) en fonction du temps (axe
X) dans un sprint. Idéalement, la courbe descend linéairement vers 0 à la fin du sprint. Cela permet de voir si l'équipe
est en avance ou en retard.

#### 20. Q : Comment gérez-vous les conflits techniques avec un collègue ?

##### Réponse {collapsible="true"}

Je reste factuel et professionnel. Je cherche à comprendre son point de vue technique. On débat sur les avantages et
inconvénients objectifs (performance, maintenabilité, sécurité) de chaque solution. Si on ne trouve pas d'accord, on
peut demander l'avis d'un tiers (Lead Dev) ou faire un prototype rapide (POC) pour tester les deux approches. L'objectif
est la meilleure solution pour le projet, pas d'avoir raison.

## Activité Type 2 : Concevoir et développer une application sécurisée organisée en couches

### Compétence 5 : Analyser les besoins et maquetter l’application

Ce bloc concerne la compréhension du besoin, la spécification et le design UX/UI.

#### 1. Q : Quelle est la différence entre un besoin fonctionnel et non-fonctionnel ?

##### Réponse {collapsible="true"}

- **Fonctionnel** : Décrit ce que le système doit faire (ex: "Le système doit permettre à l'utilisateur de se
  connecter", "Calculer le panier").
- **Non-fonctionnel** : Décrit comment le système doit se comporter (ex: Performance "La page doit charger en < 2s",
  Sécurité "Les mots de passe doivent être hachés", Disponibilité 99.9%).

#### 2. Q : Qu'est-ce qu'un Diagramme de Cas d'Utilisation (Use Case Diagram) en UML ?

##### Réponse {collapsible="true"}

C'est un diagramme qui représente les fonctionnalités du système du point de vue des acteurs (utilisateurs externes). Il
montre "Qui fait Quoi". Il permet de définir le périmètre fonctionnel de l'application (la frontière du système).

#### 3. Q : Qu'est-ce qu'un Wireframe ?

##### Réponse {collapsible="true"}

C'est une maquette "basse fidélité" (souvent en noir et blanc, fil de fer). Il sert à définir la structure de la page,
la hiérarchie de l'information et le placement des éléments (zoning) sans se soucier du design graphique (couleurs,
polices, images). C'est l'étape avant le maquettage haute fidélité.

#### 4. Q : Quelle est la différence entre UX (User Experience) et UI (User Interface) ?

##### Réponse {collapsible="true"}

- **UI (Interface)** : C'est ce que l'utilisateur voit (Couleurs, typographie, boutons, mise en page). C'est le côté
  visuel.
- **UX (Expérience)** : C'est ce que l'utilisateur ressent et vit (Facilité d'utilisation, fluidité du parcours,
  accessibilité, satisfaction). Une belle UI peut avoir une mauvaise UX si elle est inutilisable.

#### 5. Q : À quoi sert un outil comme Figma ou Adobe XD ?

##### Réponse {collapsible="true"}

Ce sont des outils de prototypage vectoriel collaboratifs. Ils permettent de créer des maquettes haute fidélité, de
définir des "Design Systems" (composants réutilisables) et de créer des prototypes interactifs (cliquables) pour simuler
la navigation avant même d'écrire une ligne de code.

#### 6. Q : Qu'est-ce qu'un "Persona" en phase d'analyse ?

##### Réponse {collapsible="true"}

C'est un personnage fictif archétypal représentant un groupe d'utilisateurs cibles. On lui donne un nom, une photo, une
biographie, des objectifs et des frustrations. Cela permet à l'équipe de concevoir l'application avec de l'empathie pour
des utilisateurs "réels" plutôt que pour eux-mêmes.

#### 7. Q : Qu'est-ce qu'un diagramme de séquence UML et quand l'utilisez-vous ?

##### Réponse {collapsible="true"}

C'est un diagramme comportemental qui montre les interactions entre les objets (ou composants) selon un ordre
chronologique pour un scénario précis. Je l'utilise pour détailler la logique complexe d'une fonctionnalité (ex: le
processus d'authentification : Utilisateur -> Frontend -> API -> BDD -> Réponse).

#### 8. Q : Comment recueillez-vous les besoins auprès d'un client qui n'est pas technique ?

##### Réponse {collapsible="true"}

J'utilise un langage clair sans jargon technique. Je pose beaucoup de questions ouvertes ("Pourquoi ?", "Comment
faites-vous aujourd'hui ?"). Je reformule ce que j'ai compris pour validation. J'utilise des schémas ou des maquettes
rapides pour visualiser ses propos, car un dessin vaut souvent mieux qu'un long discours.

#### 9. Q : Qu'est-ce qu'une "User Journey" (Parcours utilisateur) ?

##### Réponse {collapsible="true"}

C'est la visualisation du chemin qu'emprunte un utilisateur type pour atteindre un objectif spécifique dans
l'application (ex: de l'arrivée sur la home page jusqu'à la confirmation de commande). Cela permet d'identifier les
points de friction et d'optimiser le flux.

#### 10. Q : Qu'est-ce que la règle des "3 clics" (mythe ou réalité) ?

##### Réponse {collapsible="true"}

C'est une vieille règle ergonomique disant que l'utilisateur doit trouver l'information en moins de 3 clics. C'est
aujourd'hui considéré comme un mythe ou une simplification excessive. Ce qui compte, ce n'est pas le nombre de clics,
mais la sensation d'effort. L'utilisateur accepte de faire 5 clics si chaque clic est évident et le rapproche de son
but ("Scent of information").

#### 11. Q : Qu'est-ce que le "Mobile First" en conception ?

##### Réponse {collapsible="true"}

C'est une approche de conception où l'on commence par designer l'interface pour les petits écrans (mobiles) avant de
l'adapter aux écrans plus larges (desktop). Cela force à prioriser le contenu essentiel et à simplifier l'interface, car
l'espace est limité.

#### 12. Q : Qu'est-ce qu'un Dictionnaire de Données ?

##### Réponse {collapsible="true"}

C'est un document (ou tableau) qui liste et décrit toutes les données élémentaires manipulées par l'application (Nom,
Type, Format, Description, Contraintes). C'est une étape préalable essentielle avant de concevoir la base de données (
MCD).

#### 13. Q : Comment assurez-vous l'accessibilité (a11y) dès la phase de maquettage ?

##### Réponse {collapsible="true"}

Je vérifie les contrastes de couleurs (pour les malvoyants), je prévois des tailles de police lisibles, je ne base pas
l'information uniquement sur la couleur (ex: erreur = rouge ET icône), et je définis l'ordre de tabulation logique pour
la navigation au clavier.

#### 14. Q : Qu'est-ce qu'un Diagramme d'Activités UML ?

##### Réponse {collapsible="true"}

Il ressemble à un organigramme (flowchart). Il modélise le flux de contrôle ou de données d'un processus métier. Il est
utile pour décrire des algorithmes complexes ou des processus avec des conditions (Si/Sinon), des boucles et du
parallélisme.

#### 15. Q : Qu'est-ce que le prototypage rapide ?

##### Réponse {collapsible="true"}

C'est la création rapide d'une version non finalisée de l'interface pour tester une hypothèse. On peut le faire sur
papier (Paper Prototyping) ou avec des outils logiciels. L'objectif est d'échouer vite et à moindre coût si l'idée n'est
pas bonne.

#### 16. Q : Qu'est-ce qu'une "Charte Graphique" ?

##### Réponse {collapsible="true"}

C'est un document de référence qui contient les règles fondamentales de l'identité visuelle de l'entreprise ou du
projet : logo (et ses déclinaisons), palette de couleurs (codes Hex/RGB), typographies autorisées, iconographie,
espacements.

#### 17. Q : Qu'est-ce que la Loi de Fitts en ergonomie ?

##### Réponse {collapsible="true"}

C'est un modèle du mouvement humain qui prédit que le temps nécessaire pour atteindre une cible (ex: un bouton) dépend
de la distance à parcourir et de la taille de la cible. En résumé : les boutons importants doivent être gros et
proches (ou faciles à atteindre, comme les coins de l'écran).

#### 18. Q : Qu'est-ce qu'un "Happy Path" ?

##### Réponse {collapsible="true"}

C'est le scénario idéal où tout se passe comme prévu, sans erreur ni exception (l'utilisateur remplit tout correctement,
le paiement passe du premier coup). En analyse, on commence par définir le Happy Path, puis on gère tous les cas
d'erreurs (Edge cases).

#### 19. Q : Pourquoi faire des tests utilisateurs sur des maquettes ?

##### Réponse {collapsible="true"}

Pour valider l'ergonomie et la compréhension de l'interface avant d'investir du temps dans le développement. Il est
beaucoup moins coûteux de modifier une maquette Figma qu'une application déjà codée. On observe l'utilisateur réaliser
des tâches sans l'aider pour voir où il bloque.

#### 20. Q : Qu'est-ce que l'atomic design ?

##### Réponse {collapsible="true"}

C'est une méthodologie de conception d'interfaces (créée par Brad Frost) qui découpe l'UI en 5 niveaux :

1. Atomes (label, input, bouton)
2. Molécules (groupe d'atomes : un champ de recherche)
3. Organismes (groupe de molécules : un header)
4. Templates (structure de page)
5. Pages (contenu réel)
   Cela favorise la modularité et la création de systèmes de composants.

### Compétence 6 : Définir l’architecture logicielle de l’application

Ce bloc se concentre sur la conception objet, les patrons de conception (Design Patterns) et l'architecture globale (
Clean Architecture, Hexagonale, etc.).

#### 1. Q : Qu'est-ce qu'une architecture en couches (Layered Architecture) et quel est son intérêt ?

##### Réponse {collapsible="true"}

C'est une organisation du code où les responsabilités sont séparées horizontalement (ex: Présentation, Métier/Service,
Accès aux données). Chaque couche ne peut communiquer qu'avec la couche adjacente (souvent celle du dessous). Cela
réduit le couplage et facilite la maintenance : on peut changer la base de données (couche Data) sans impacter
l'interface (couche Présentation).

#### 2. Q : Qu'est-ce que le diagramme de classes UML ?

##### Réponse {collapsible="true"}

C'est un diagramme structurel statique qui décrit la structure du système en montrant les classes, leurs attributs,
leurs méthodes et les relations entre elles (Héritage, Association, Agrégation, Composition). C'est le "plan" du code
objet.

#### 3. Q : Expliquez les principes SOLID (au moins le S et le O).

##### Réponse {collapsible="true"}

- **S (Single Responsibility)** : Une classe ne doit avoir qu'une seule raison de changer (une seule responsabilité).
- **O (Open/Closed)** : Une entité doit être ouverte à l'extension mais fermée à la modification (on ajoute une
  fonctionnalité en créant une nouvelle classe qui hérite/implémente, pas en modifiant le code existant).

#### 4. Q : Qu'est-ce que le Design Pattern "Factory" (Fabrique) ?

##### Réponse {collapsible="true"}

C'est un pattern de création qui permet de déléguer l'instanciation d'objets à une classe dédiée (la Fabrique). Le
client ne fait pas `new MaClasse()`, il demande à la fabrique de lui fournir une instance. Cela permet de changer la
classe concrète instanciée sans changer le code client (couplage faible).

#### 5. Q : Qu'est-ce que le Design Pattern "Observer" (Observateur) ?

##### Réponse {collapsible="true"}

C'est un pattern comportemental où un objet (le Sujet) maintient une liste d'objets dépendants (les Observateurs) et les
notifie automatiquement de tout changement d'état. C'est la base de l'événementiel (ex: `addEventListener` en JS, ou le
pattern Publish/Subscribe).

#### 6. Q : Qu'est-ce que l'Architecture Hexagonale (ou Ports & Adapters) ?

##### Réponse {collapsible="true"}

C'est une architecture qui vise à isoler le cœur métier (domaine) de l'infrastructure (BDD, API, UI). Le domaine est au
centre. Il définit des interfaces (Ports) pour communiquer avec l'extérieur. L'extérieur implémente ces interfaces via
des Adaptateurs. Cela rend le métier totalement indépendant des technologies utilisées.

#### 7. Q : Quelle est la différence entre Composition et Héritage ? Lequel privilégier ?

##### Réponse {collapsible="true"}

- **Héritage ("Est un")** : Une classe enfant récupère le comportement de son parent. Lien fort et rigide.
- **Composition ("A un")** : Une classe contient une instance d'une autre classe pour utiliser ses fonctionnalités. Lien
  souple.
  On préfère généralement la Composition ("Favor composition over inheritance") car elle est plus flexible et évite les
  hiérarchies complexes et fragiles.

#### 8. Q : Qu'est-ce qu'une Interface (au sens Programmation Orientée Objet) ?

##### Réponse {collapsible="true"}

C'est un contrat qui définit un ensemble de méthodes qu'une classe doit obligatoirement implémenter. Elle ne contient
pas d'implémentation (sauf méthodes par défaut récentes). Elle permet le polymorphisme : on peut manipuler des objets
différents de la même manière s'ils implémentent la même interface.

#### 9. Q : Qu'est-ce que le couplage (Coupling) et la cohésion (Cohesion) ?

##### Réponse {collapsible="true"}

- **Couplage** : Degré de dépendance entre les modules. On cherche un couplage **faible** (pour modifier un module sans
  casser les autres).
- **Cohésion** : Degré auquel les éléments d'un module appartiennent ensemble. On cherche une cohésion **forte** (une
  classe fait une chose et la fait bien).

#### 10. Q : Qu'est-ce que le Design Pattern "Strategy" ?

##### Réponse {collapsible="true"}

C'est un pattern comportemental qui permet de définir une famille d'algorithmes, de les encapsuler chacun dans une
classe, et de les rendre interchangeables. Cela permet de changer l'algorithme utilisé dynamiquement (ex: changer le
mode de paiement Carte vs Paypal, ou le mode de tri).

#### 11. Q : Qu'est-ce qu'un Microservice vs Monolithe ?

##### Réponse {collapsible="true"}

- **Monolithe** : Toute l'application est un seul bloc déployable. Simple à développer au début, mais difficile à scaler
  et à maintenir quand ça grossit.
- **Microservices** : L'application est découpée en petits services indépendants qui communiquent via réseau (API). Plus
  complexe à gérer (DevOps, latence), mais permet de scaler indépendamment chaque service et d'utiliser des technos
  différentes.

#### 12. Q : Qu'est-ce que l'UML (Unified Modeling Language) ?

##### Réponse {collapsible="true"}

C'est un langage graphique standardisé pour visualiser, spécifier, construire et documenter les systèmes logiciels. Il
n'est pas une méthode de développement, mais une notation (la "grammaire" des diagrammes).

#### 13. Q : Qu'est-ce que le polymorphisme ?

##### Réponse {collapsible="true"}

C'est la capacité d'objets de types différents à répondre au même appel de méthode, chacun à sa manière. Ex: Une liste
contient des formes (`Cercle`, `Carré`). J'appelle `.dessiner()` sur chaque élément. Le code appelant ne sait pas de
quelle forme il s'agit, mais la bonne méthode `.dessiner()` (celle du cercle ou du carré) sera exécutée.

#### 14. Q : Qu'est-ce que l'Inversion de Contrôle (IoC) ?

##### Réponse {collapsible="true"}

C'est un principe de conception où le flux d'exécution d'un programme est inversé par rapport à la programmation
procédurale traditionnelle. Ce n'est pas mon code qui appelle une librairie, c'est le framework (ex: Spring, Angular,
Symfony) qui appelle mon code (loi d'Hollywood : "Ne nous appelez pas, on vous appellera"). L'injection de dépendance
est une forme d'IoC.

#### 15. Q : Pourquoi rendre les attributs d'une classe `private` (Encapsulation) ?

##### Réponse {collapsible="true"}

Pour empêcher l'accès direct et la modification incontrôlée de l'état interne de l'objet depuis l'extérieur. On force le
passage par des méthodes publiques (Getters/Setters ou méthodes métier) qui peuvent inclure de la validation ou de la
logique. Cela protège l'intégrité de l'objet.

#### 16. Q : Qu'est-ce qu'une classe immuable (Immutable) ?

##### Réponse {collapsible="true"}

C'est une classe dont les instances ne peuvent pas être modifiées après leur création (ex: `String` en Java, ou les
objets Value Objects). Si on veut changer une valeur, on doit créer une nouvelle instance. Cela simplifie la gestion de
la concurrence (Thread-safe) et évite les effets de bord.

#### 17. Q : Qu'est-ce que le pattern "Repository" ?

##### Réponse {collapsible="true"}

C'est une couche d'abstraction entre la logique métier et la couche d'accès aux données. Le Repository présente une
interface "collection-like" (add, remove, getById) pour manipuler les objets du domaine, masquant la complexité des
requêtes SQL ou de l'ORM sous-jacent.

#### 18. Q : Qu'est-ce que la surcharge (Overloading) vs la redéfinition (Overriding) ?

##### Réponse {collapsible="true"}

- **Surcharge** : Avoir plusieurs méthodes avec le même nom dans la même classe, mais avec des paramètres différents (
  signature différente).
- **Redéfinition** : Une classe enfant réécrit une méthode héritée de son parent (même signature) pour en changer le
  comportement.

#### 19. Q : Qu'est-ce que le diagramme de déploiement UML ?

##### Réponse {collapsible="true"}

C'est un diagramme qui montre l'architecture physique du système : les nœuds matériels (serveurs, postes clients) et les
composants logiciels (artefacts) qui y sont déployés/exécutés.

#### 20. Q : Qu'est-ce qu'un DTO (Data Transfer Object) et pourquoi ne pas utiliser directement les entités BDD ?

##### Réponse {collapsible="true"}

Un DTO est un objet simple utilisé uniquement pour transporter des données d'un processus à un autre (ex: de l'API vers
le Frontend). On l'utilise pour découpler la structure de la base de données (Entités) de la vue exposée à l'extérieur.
Cela permet de cacher certains champs sensibles (mot de passe), d'agréger des données, ou de changer la BDD sans casser
l'API.

### Compétence 7 : Concevoir et mettre en place une base de données relationnelle

Ce bloc concerne la modélisation des données (Merise, UML) et le SQL (DDL).

#### 1. Q : Quelle est la différence entre MCD (Modèle Conceptuel de Données) et MLD (Modèle Logique de Données) ?

##### Réponse {collapsible="true"}

- **MCD** : Représentation abstraite et métier. On parle d'Entités, de Relations (Associations) et de Cardinalités (
  0,n - 1,1). Indépendant du SGBD.
- **MLD** : Traduction du MCD vers une structure relationnelle (tables). Les associations deviennent des clés étrangères
  ou des tables de jointure. On se rapproche de l'implémentation technique.

#### 2. Q : Qu'est-ce qu'une Clé Primaire (Primary Key) ?

##### Réponse {collapsible="true"}

C'est un champ (ou un groupe de champs) qui permet d'identifier de manière unique chaque enregistrement (ligne) dans une
table. Elle ne peut pas être `NULL` et doit être unique. Souvent un ID auto-incrémenté ou un UUID.

#### 3. Q : Qu'est-ce qu'une Clé Étrangère (Foreign Key) ?

##### Réponse {collapsible="true"}

C'est un champ dans une table qui fait référence à la Clé Primaire d'une autre table. Elle sert à matérialiser la
relation entre deux tables et garantit l'intégrité référentielle (on ne peut pas lier une commande à un client qui
n'existe pas).

#### 4. Q : Expliquez la cardinalité 1,n (Un à Plusieurs) et comment elle se traduit en base de données.

##### Réponse {collapsible="true"}

Exemple : Un Client peut passer plusieurs Commandes (1,n), et une Commande appartient à un seul Client (1,1).
Traduction : On ajoute une clé étrangère `client_id` dans la table `Commande`. La clé migre toujours du côté du "n".

#### 5. Q : Expliquez la cardinalité n,n (Plusieurs à Plusieurs) et comment elle se traduit en base de données.

##### Réponse {collapsible="true"}

Exemple : Un Étudiant suit plusieurs Cours, un Cours est suivi par plusieurs Étudiants.
Traduction : On ne peut pas mettre de clé étrangère directement. On doit créer une **table de jointure** (ou table
d'association) intermédiaire (ex: `Inscription`), qui contient les deux clés étrangères (`etudiant_id`, `cours_id`)
formant une clé primaire composite.

#### 6. Q : Qu'est-ce que la Normalisation (1FN, 2FN, 3FN) ?

##### Réponse {collapsible="true"}

C'est un processus pour organiser les données afin de réduire la redondance et éviter les anomalies de mise à jour.

- 1FN : Valeurs atomiques (pas de liste dans une case).
- 2FN : Tout champ non-clé dépend de toute la clé primaire.
- 3FN : Tout champ non-clé dépend *uniquement* de la clé primaire (pas de dépendance transitive).

#### 7. Q : Qu'est-ce qu'un Index et pourquoi l'utiliser ?

##### Réponse {collapsible="true"}

C'est une structure de données supplémentaire (souvent un B-Tree) qui permet au moteur de base de données de trouver les
lignes rapidement sans scanner toute la table. On met des index sur les colonnes souvent utilisées dans les clauses
`WHERE`, `JOIN` et `ORDER BY`. Attention, les index ralentissent les écritures (INSERT/UPDATE).

#### 8. Q : Quelle est la différence entre `DELETE` et `TRUNCATE` ?

##### Réponse {collapsible="true"}

- `DELETE` : Supprime les lignes une par une (ou par lot), peut avoir une clause `WHERE`, déclenche les triggers, et est
  transactionnel (on peut rollback).
- `TRUNCATE` : Vide toute la table instantanément en réinitialisant les structures de données. Plus rapide, mais pas de
  `WHERE`, pas de trigger ligne par ligne, et réinitialise souvent l'auto-incrément.

#### 9. Q : Qu'est-ce que l'Intégrité Référentielle ?

##### Réponse {collapsible="true"}

C'est une règle imposée par le SGBD qui assure la cohérence des relations. Si je définis une contrainte de clé
étrangère, le SGBD m'empêchera de supprimer un parent si des enfants y sont encore liés (ou fera une suppression en
cascade si configuré ainsi), évitant les enregistrements orphelins.

#### 10. Q : Qu'est-ce qu'une Vue (View) SQL ?

##### Réponse {collapsible="true"}

C'est une "table virtuelle" définie par une requête SQL enregistrée. Elle ne stocke pas de données elle-même (sauf vue
matérialisée). Elle permet de simplifier des requêtes complexes (jointures multiples) pour les utilisateurs ou de
restreindre l'accès à certaines colonnes pour des raisons de sécurité.

#### 11. Q : Quelle est la différence entre SQL (Relationnel) et NoSQL (Non-Relationnel) ?

##### Réponse {collapsible="true"}

- **SQL (MySQL, PostgreSQL)** : Structuré, Schéma rigide (Tables), Relations fortes, ACID, Scalabilité verticale.
- **NoSQL (MongoDB, Redis)** : Flexible (Documents JSON, Clé-Valeur), Schéma dynamique, Scalabilité horizontale facile,
  souvent BASE (consistance éventuelle) plutôt que ACID strict. Adapté au Big Data ou données non structurées.

#### 12. Q : Qu'est-ce qu'une contrainte `UNIQUE` ?

##### Réponse {collapsible="true"}

Elle assure que toutes les valeurs d'une colonne sont distinctes. Contrairement à la clé primaire, on peut avoir
plusieurs colonnes `UNIQUE` dans une table, et selon les SGBD, elle peut accepter la valeur `NULL` (parfois une seule
fois). Ex: L'email d'un utilisateur doit être unique.

#### 13. Q : Comment choisir le bon type de données pour une colonne (VARCHAR vs TEXT, INT vs BIGINT) ?

##### Réponse {collapsible="true"}

Il faut choisir le type le plus petit possible capable de contenir toutes les valeurs futures pour optimiser le stockage
et la performance.

- `VARCHAR(255)` pour des textes courts indexables (Nom, Email). `TEXT` pour du contenu long non indexé.
- `INT` suffit généralement (jusqu'à 2 milliards). `BIGINT` pour des ID massifs ou des données
  financières/scientifiques.

#### 14. Q : Qu'est-ce qu'un Diagramme Entité-Association (Entity-Relationship Diagram) ?

##### Réponse {collapsible="true"}

C'est l'équivalent anglo-saxon du MCD (Modèle Conceptuel de Données). Il utilise une notation légèrement différente (
boîtes, losanges, pattes de corbeau/crow's foot) pour représenter la même chose : la structure logique des données.

#### 15. Q : À quoi sert la commande `ALTER TABLE` ?

##### Réponse {collapsible="true"}

Elle sert à modifier la structure d'une table existante : ajouter une colonne, supprimer une colonne, changer le type
d'une colonne ou ajouter/supprimer des contraintes (Index, Clé étrangère).

#### 16. Q : Qu'est-ce qu'une procédure stockée (Stored Procedure) ?

##### Réponse {collapsible="true"}

C'est un ensemble d'instructions SQL précompilées et stockées sur le serveur de base de données. Elle peut prendre des
paramètres et contenir de la logique (boucles, conditions). Elle réduit le trafic réseau (un seul appel exécute beaucoup
de logique) et centralise la logique métier complexe côté données (bien que cela soit parfois déconseillé pour la
maintenabilité).

#### 17. Q : Qu'est-ce que le "Soft Delete" (Suppression logique) ?

##### Réponse {collapsible="true"}

Au lieu de supprimer physiquement une ligne (`DELETE`), on ajoute une colonne `is_deleted` (booléen) ou `deleted_at` (
date). On met à jour ce champ pour marquer la suppression. Les données restent en base pour l'historique ou la
restauration, mais l'application filtre pour ne pas les afficher.

#### 18. Q : Qu'est-ce qu'une "Migration" de base de données (avec Doctrine, Liquibase, Flyway) ?

##### Réponse {collapsible="true"}

C'est un fichier script (code ou SQL) qui décrit une modification du schéma de la base de données. Les outils de
migration permettent d'appliquer ces changements de manière séquentielle et versionnée sur tous les environnements (Dev,
Test, Prod), assurant que la structure de la BDD est synchronisée avec le code.

#### 19. Q : Comment gérez-vous les mots de passe dans la conception de la base ?

##### Réponse {collapsible="true"}

Je prévois une colonne de type chaîne de caractères assez longue (ex: `VARCHAR(255)` ou `CHAR(60)`) pour stocker le *
*hash** du mot de passe. Je ne stocke jamais le mot de passe en clair. Le champ ne doit pas être trop court car les
hashs sont longs.

#### 20. Q : Qu'est-ce que le problème N+1 dans les requêtes (souvent lié aux ORM) ?

##### Réponse {collapsible="true"}

C'est un problème de performance. Pour récupérer une liste de N objets et leurs relations (ex: Liste des articles et
leur auteur), l'ORM fait 1 requête pour la liste, puis N requêtes supplémentaires pour récupérer l'auteur de chaque
article. Cela tue les performances. La solution est de faire une jointure (`JOIN`) ou un "Eager Loading" (chargement
immédiat) pour tout récupérer en 1 ou 2 requêtes max.

### Compétence 8 : Développer les composants d’accès aux données

Ce bloc concerne l'interaction entre le code (Backend) et la base de données (SQL, ORM, DAO).

#### 1. Q : Qu'est-ce qu'un ORM (Object-Relational Mapping) comme Hibernate, Doctrine ou TypeORM ?

##### Réponse {collapsible="true"}

C'est une couche logicielle qui fait le pont entre le monde Objet (Classes, Attributs) et le monde Relationnel (Tables,
Colonnes). Il permet de manipuler la base de données en utilisant des objets du langage de programmation au lieu
d'écrire du SQL brut, automatisant le CRUD et la conversion des types.

#### 2. Q : Qu'est-ce que le pattern DAO (Data Access Object) ?

##### Réponse {collapsible="true"}

C'est un patron de conception qui isole la couche d'accès aux données. Pour chaque entité (ex: `User`), on crée une
classe `UserDAO` qui contient les méthodes techniques (`find`, `save`, `delete`). Le reste de l'application appelle ces
méthodes sans savoir si derrière c'est du SQL, un fichier XML ou une API externe.

#### 3. Q : Quelle est la différence entre `Statement` et `PreparedStatement` (en JDBC/Java ou équivalent PHP PDO) ?

##### Réponse {collapsible="true"}

- `Statement` : La requête SQL est compilée à chaque exécution. Risque d'injection SQL si on concatène des variables.
- `PreparedStatement` : La structure de la requête est précompilée par le SGBD avec des "placeholders" (`?` ou `:name`).
  Les valeurs sont injectées séparément. C'est plus performant (cache du plan d'exécution) et **sécurisé contre les
  injections SQL**.

#### 4. Q : Qu'est-ce qu'une transaction managée (ex: `@Transactional` en Spring ou équivalent) ?

##### Réponse {collapsible="true"}

C'est une gestion déclarative des transactions. Au lieu d'écrire `begin`, `commit`, `rollback` manuellement, on annote
une méthode. Le framework ouvre une transaction au début de la méthode et fait un commit à la fin si tout va bien, ou un
rollback automatique si une exception est levée.

#### 5. Q : Comment un ORM gère-t-il les relations (OneToMany, ManyToOne) ?

##### Réponse {collapsible="true"}

Il utilise des annotations (ou fichiers de mapping) pour lier les objets. Par exemple, une classe `User` aura une liste
`List<Order> orders` annotée `@OneToMany`. L'ORM générera automatiquement les jointures SQL nécessaires ou fera des
requêtes différées (Lazy Loading) quand on accédera à la liste.

#### 6. Q : Qu'est-ce que le Lazy Loading vs Eager Loading ?

##### Réponse {collapsible="true"}

- **Lazy Loading** (Paresseux) : Les données liées (ex: les commandes d'un client) ne sont chargées depuis la BDD que
  lorsqu'on accède explicitement à la propriété dans le code. Économise la mémoire si on n'en a pas besoin, mais risque
  de "N+1 select".
- **Eager Loading** (Impatient) : Les données liées sont chargées immédiatement avec la requête principale (via `JOIN`).
  Utile si on sait qu'on va utiliser les données liées.

#### 7. Q : Qu'est-ce qu'un Pool de Connexions (Connection Pool) ?

##### Réponse {collapsible="true"}

Ouvrir une connexion à une BDD est coûteux en temps. Un pool maintient un ensemble de connexions ouvertes et prêtes à
l'emploi. Quand l'application a besoin d'accéder à la base, elle "emprunte" une connexion du pool, l'utilise, et la "
rend" au lieu de la fermer. Cela améliore considérablement les performances.

#### 8. Q : Comment faites-vous une requête complexe (aggrégation, reporting) avec un ORM ?

##### Réponse {collapsible="true"}

Les ORM ont souvent un langage de requête objet (HQL, JPQL, DQL) ou un "Query Builder". Cependant, pour des requêtes
très complexes ou optimisées, il est parfois préférable d'utiliser du **SQL Natif** (Native Query) via l'ORM, tout en
mappant le résultat sur un DTO spécifique.

#### 9. Q : Qu'est-ce que le mapping Objet-Relationnel (les fichiers XML ou Annotations) ?

##### Réponse {collapsible="true"}

C'est la configuration qui dit à l'ORM : "La classe `User` correspond à la table `t_users`, l'attribut `firstName`
correspond à la colonne `first_name`". Aujourd'hui, on utilise majoritairement les annotations directement dans le code
des entités (`@Entity`, `@Table`, `@Column`).

#### 10. Q : Comment gérez-vous les conflits de concurrence (Optimistic Locking) ?

##### Réponse {collapsible="true"}

On ajoute une colonne de version (`@Version` version number) dans l'entité. Lors d'une mise à jour, l'ORM vérifie si la
version en base est la même que celle de l'objet en mémoire. Si oui, il met à jour et incrémente la version. Si non (
quelqu'un a modifié entre temps), il lève une `OptimisticLockException`.

#### 11. Q : Qu'est-ce qu'une injection SQL de second ordre ?

##### Réponse {collapsible="true"}

C'est quand une donnée malveillante est stockée en base de données (injection réussie une première fois), puis est
utilisée plus tard dans une autre requête SQL sans être vérifiée, déclenchant l'attaque à ce moment-là. D'où l'
importance de toujours utiliser des requêtes préparées, même avec des données venant de sa propre BDD.

#### 12. Q : Qu'est-ce que JDBC (Java) ou PDO (PHP) ?

##### Réponse {collapsible="true"}

Ce sont des interfaces de programmation (API) bas niveau fournies par le langage pour se connecter aux bases de données
relationnelles de manière standardisée, quel que soit le fournisseur (MySQL, Oracle, etc.), en utilisant des drivers
spécifiques.

#### 13. Q : Pourquoi utiliser des interfaces pour vos Repository/DAO ?

##### Réponse {collapsible="true"}

Pour découpler la couche métier de la couche de données. Le service métier dépend de l'interface `IUserRepository`. Cela
permet de changer l'implémentation (passer de SQL à Mongo, ou utiliser un Mock pour les tests unitaires) sans toucher
une seule ligne du code métier.

#### 14. Q : Comment protéger les données sensibles (ex: cryptage de colonne) ?

##### Réponse {collapsible="true"}

Certaines données (données bancaires, santé) doivent être chiffrées au repos. On peut le faire au niveau du SGBD (TDE -
Transparent Data Encryption) ou au niveau applicatif (l'ORM chiffre la donnée avant l'INSERT et la déchiffre après le
SELECT) via des convertisseurs ou listeners.

#### 15. Q : Qu'est-ce que le pattern Active Record ?

##### Réponse {collapsible="true"}

C'est une approche (utilisée par Laravel Eloquent, Ruby on Rails) où l'entité porte elle-même les méthodes d'accès aux
données. Ex: `user.save()`, `User.find(1)`. C'est simple et rapide pour des projets CRUD, mais cela couple fortement
l'objet métier à la base de données, ce qui viole le principe de responsabilité unique (SRP).

#### 16. Q : Qu'est-ce que le "Hydration" (Hydratation) d'un objet ?

##### Réponse {collapsible="true"}

C'est le processus par lequel l'ORM prend les données brutes retournées par la base de données (un tableau de lignes et
colonnes) et remplit (popule) les instances d'objets correspondantes avec ces valeurs.

#### 17. Q : Quelle est la différence entre `INNER JOIN` et `LEFT JOIN` ?

##### Réponse {collapsible="true"}

- `INNER JOIN` : Retourne les lignes seulement s'il y a une correspondance dans les deux tables. (Intersection).
- `LEFT JOIN` : Retourne toutes les lignes de la table de gauche, même s'il n'y a pas de correspondance dans la table de
  droite (les colonnes de droite seront `NULL`).

#### 18. Q : Comment paginer les résultats d'une requête ?

##### Réponse {collapsible="true"}

Côté SQL, on utilise `LIMIT` et `OFFSET`. Côté ORM/Code, on utilise des objets `Pageable` ou `Paginator`. On demande la
page X avec Y éléments. L'ORM génère deux requêtes : une pour compter le total (pour savoir combien de pages il y a) et
une pour récupérer les données de la page actuelle.

#### 19. Q : Qu'est-ce qu'une projection (dans un contexte JPA/Hibernate) ?

##### Réponse {collapsible="true"}

C'est le fait de ne récupérer qu'une partie des colonnes d'une entité, ou un sous-ensemble de données, souvent mappé
directement dans une interface ou un DTO, pour optimiser les performances (éviter de charger tout l'objet User si on
veut juste afficher son Nom).

#### 20. Q : Que faites-vous si une requête est trop lente ?

##### Réponse {collapsible="true"}

1. J'analyse la requête générée (logs).
2. J'utilise `EXPLAIN` sur le SGBD pour voir le plan d'exécution.
3. Je vérifie si les index sont utilisés.
4. Je regarde si je ne fais pas un N+1 ou si je ne charge pas trop de données inutiles.
5. J'optimise la requête ou j'ajoute les index manquants.

## Activité Type 3 : Préparer le déploiement d’une application sécurisée

### Compétence 9 : Préparer et exécuter les plans de tests d’une application

Ce bloc concerne la qualité logicielle, les tests automatisés et la stratégie de test.

#### 1. Q : Quelle est la différence entre Test Unitaire, Test d'Intégration et Test End-to-End (E2E) ?

##### Réponse {collapsible="true"}

- **Unitaire** : Teste une petite partie du code (fonction, classe) de manière isolée, sans dépendances externes (
  mocks). Très rapide.
- **Intégration** : Teste comment plusieurs modules ou composants interagissent ensemble (ex: Service + Base de
  données).
- **E2E** : Teste l'application complète du point de vue de l'utilisateur final (clics dans le navigateur, scénarios
  complets). Lent et fragile.

#### 2. Q : Qu'est-ce que le TDD (Test Driven Development) ?

##### Réponse {collapsible="true"}

C'est une méthode de développement où l'on écrit le test **avant** le code. Le cycle est "Red - Green - Refactor" :

1. Écrire un test qui échoue (Red).
2. Écrire le code minimum pour le faire passer (Green).
3. Améliorer le code sans changer le comportement (Refactor).

#### 3. Q : Qu'est-ce que la couverture de code (Code Coverage) ?

##### Réponse {collapsible="true"}

C'est un indicateur (pourcentage) qui mesure la quantité de code source exécutée lors du lancement des tests
automatisés. Bien qu'utile pour repérer les zones non testées, un taux de 100% ne garantit pas l'absence de bugs,
seulement que chaque ligne a été exécutée au moins une fois.

#### 4. Q : Qu'est-ce qu'un Mock et un Stub ?

##### Réponse {collapsible="true"}

Ce sont des doublures de test.

- **Stub** : Simule un objet qui renvoie des données pré-définies (état) pour que le test puisse s'exécuter.
- **Mock** : Simule un objet et permet de vérifier que certaines méthodes ont bien été appelées (comportement), avec
  quels arguments et combien de fois.

#### 5. Q : Pourquoi automatiser les tests ?

##### Réponse {collapsible="true"}

Pour détecter les régressions (bugs introduits dans du code qui fonctionnait avant) rapidement et systématiquement. Cela
permet de refactorer le code en toute confiance et sert de documentation vivante sur le fonctionnement attendu du
système.

#### 6. Q : Qu'est-ce que la pyramide des tests ?

##### Réponse {collapsible="true"}

C'est un concept qui préconise d'avoir **beaucoup** de tests unitaires (base large, rapides, peu coûteux), **moyennement
** de tests d'intégration, et **peu** de tests E2E (sommet étroit, lents, coûteux à maintenir).

#### 7. Q : Qu'est-ce qu'un test de non-régression ?

##### Réponse {collapsible="true"}

C'est un test qui vise à vérifier qu'une nouvelle modification (ajout de fonctionnalité ou correction de bug) n'a pas "
cassé" les fonctionnalités existantes. L'ensemble de la suite de tests automatisés constitue le harnais de
non-régression.

#### 8. Q : Comment testez-vous une API REST ?

##### Réponse {collapsible="true"}

J'utilise des outils comme Postman (pour les tests manuels) ou des frameworks comme REST Assured, Supertest ou PHPUnit (
tests d'intégration). J'envoie des requêtes HTTP (GET, POST...) et je vérifie le Code Statut (200, 404...), le format du
Body (JSON) et les valeurs retournées.

#### 9. Q : Qu'est-ce que Cypress ou Selenium ?

##### Réponse {collapsible="true"}

Ce sont des outils pour réaliser des tests End-to-End (E2E) sur des applications web. Ils pilotent un vrai navigateur (
Chrome, Firefox) pour simuler les actions d'un utilisateur (cliquer, saisir du texte) et vérifier que l'interface réagit
correctement.

#### 10. Q : Qu'est-ce qu'un cas de test (Test Case) ?

##### Réponse {collapsible="true"}

C'est un ensemble de conditions sous lesquelles un testeur détermine si une application satisfait aux exigences. Il
comprend : un ID, une description, des pré-conditions, les étapes à reproduire, le résultat attendu et le résultat
obtenu.

#### 11. Q : Qu'est-ce que le BDD (Behavior Driven Development) avec Cucumber ?

##### Réponse {collapsible="true"}

C'est une pratique qui vise à combler le fossé entre les développeurs et le métier. On écrit les tests dans un langage
naturel compréhensible par tous (Gherkin : "Given... When... Then..."). Ces scénarios sont ensuite exécutés par le code
de test.

#### 12. Q : Comment testez-vous une fonction asynchrone ?

##### Réponse {collapsible="true"}

Les frameworks de test modernes gèrent l'asynchrone. En JS (Jest), on peut retourner la Promesse dans le test, ou
utiliser `async/await`. On doit s'assurer que le test attend bien la fin de l'exécution asynchrone avant de faire les
assertions.

#### 13. Q : Qu'est-ce qu'un test de charge (Load Testing) ?

##### Réponse {collapsible="true"}

C'est un test de performance qui consiste à simuler une charge importante d'utilisateurs simultanés sur le système pour
voir comment il se comporte (temps de réponse, utilisation mémoire/CPU) et identifier les goulots d'étranglement.
Outils : JMeter, Gatling, K6.

#### 14. Q : Qu'est-ce qu'une assertion ?

##### Réponse {collapsible="true"}

C'est l'instruction clé d'un test qui vérifie si le résultat obtenu correspond au résultat attendu. Si l'assertion est
vraie, le test passe. Sinon, il échoue. Ex: `expect(result).toBe(4);` ou `assertTrue(isValid);`.

#### 15. Q : Qu'est-ce que l'analyse statique de code (SonarQube) ?

##### Réponse {collapsible="true"}

C'est une analyse automatique du code source sans l'exécuter. Elle détecte les bugs potentiels, les failles de sécurité,
la complexité cyclomatique, la duplication de code et le non-respect des conventions de codage.

#### 16. Q : Qu'est-ce qu'un "Smoke Test" ?

##### Réponse {collapsible="true"}

C'est un ensemble minimal de tests exécutés sur une nouvelle version (build) pour vérifier que les fonctionnalités
critiques fonctionnent (ex: l'application démarre, on peut se connecter). Si le smoke test échoue, on rejette le build
sans aller plus loin.

#### 17. Q : Comment gérer les données de test en base de données ?

##### Réponse {collapsible="true"}

Pour les tests d'intégration, il faut un état connu et reproductible. On utilise souvent une base de données dédiée (ou
in-memory comme H2/SQLite). Avant chaque test (ou suite de tests), on vide la base et on insère des données de test (
Fixtures/Seeders).

#### 18. Q : Qu'est-ce qu'un test "boîte noire" vs "boîte blanche" ?

##### Réponse {collapsible="true"}

- **Boîte noire** : On teste les fonctionnalités sans connaître le code interne (point de vue utilisateur).
- **Boîte blanche** : On teste en connaissant la structure interne du code (chemins d'exécution, branches), point de vue
  développeur.

#### 19. Q : Qu'est-ce que les tests de sécurité (Pentesting / DAST) ?

##### Réponse {collapsible="true"}

Ce sont des tests visant à identifier les vulnérabilités de l'application. Le DAST (Dynamic Application Security
Testing) attaque l'application de l'extérieur pendant qu'elle tourne (comme un hacker) pour trouver des failles XSS,
SQLi, etc. (Outils : OWASP ZAP).

#### 20. Q : Que faire si un test est "Flaky" (instable, passe parfois, échoue parfois) ?

##### Réponse {collapsible="true"}

C'est le pire ennemi de la CI. Il faut l'isoler et le réparer immédiatement. Souvent dû à des problèmes de timing (
attente asynchrone mal gérée), de dépendance à un ordre d'exécution, ou de données partagées. Si on ne peut pas le
réparer, il vaut mieux le supprimer que de perdre confiance dans la suite de tests.


### Compétence 10 : Préparer et documenter le déploiement d’une application

Ce dernier bloc concerne le DevOps, la conteneurisation, le CI/CD et la documentation finale.

#### 1. Q : Qu'est-ce qu'une image Docker et quelle est la différence avec un conteneur ?

##### Réponse {collapsible="true"}

- **Image** : C'est le modèle (template) inerte, en lecture seule, qui contient le code, les librairies et l'OS de base.
  C'est ce qu'on construit (`docker build`).
- **Conteneur** : C'est l'instance en cours d'exécution d'une image. C'est ce qui tourne réellement (`docker run`). On
  peut lancer plusieurs conteneurs à partir de la même image.

#### 2. Q : Expliquez le fonctionnement d'un pipeline CI/CD (Continuous Integration / Continuous Deployment).

##### Réponse {collapsible="true"}

C'est une chaîne automatisée d'étapes qui se déclenche à chaque modification du code :

1. **CI** : Récupération du code -> Installation dépendances -> Build -> Tests automatisés -> Analyse qualité.
2. **CD** : Création de l'artefact (image Docker, jar) -> Déploiement automatique sur un environnement (Staging puis
   Production).

#### 3. Q : Qu'est-ce que le fichier `Dockerfile` ?

##### Réponse {collapsible="true"}

C'est un fichier texte contenant la recette pour construire une image Docker. Il contient des instructions comme
`FROM` (image de base), `COPY` (copier les fichiers), `RUN` (exécuter des commandes d'installation), `EXPOSE` (port
réseau) et `CMD` (commande de démarrage).

#### 4. Q : À quoi sert `docker-compose` ?

##### Réponse {collapsible="true"}

Il permet de définir et de faire tourner des applications multi-conteneurs. Dans un fichier YAML, on décrit les
services (ex: un conteneur App, un conteneur BDD), leurs réseaux et leurs volumes. Une seule commande
`docker-compose up` suffit à tout lancer.

#### 5. Q : Qu'est-ce qu'une variable d'environnement en production et comment la gérer en sécurité ?

##### Réponse {collapsible="true"}

En production, les variables d'environnement configurent l'application (URL BDD, Clés API). On ne doit JAMAIS les
commiter dans le code. On les injecte via le système de déploiement (CI/CD secrets, Kubernetes Secrets, Vault) ou un
fichier `.env` non versionné sur le serveur.

#### 6. Q : Qu'est-ce qu'un Reverse Proxy (ex: Nginx, Apache) et pourquoi en mettre un devant votre application ?

##### Réponse {collapsible="true"}

C'est un serveur qui se place devant les serveurs web (Node, Tomcat, Gunicorn). Il gère la terminaison SSL/HTTPS, la
compression Gzip, le cache statique, le load balancing et protège le serveur d'application des attaques directes.

#### 7. Q : Qu'est-ce que le déploiement "Blue/Green" ?

##### Réponse {collapsible="true"}

C'est une stratégie de déploiement pour réduire les interruptions (Downtime). On a deux environnements identiques :
Blue (Prod actuelle) et Green (Nouvelle version). On déploie sur Green, on teste. Si tout est OK, on bascule le
routeur/load balancer pour diriger le trafic de Blue vers Green. Le retour en arrière est instantané si problème.

#### 8. Q : Qu'est-ce que la documentation technique vs documentation utilisateur ?

##### Réponse {collapsible="true"}

- **Technique** : Destinée aux développeurs/admin sys. Explique l'architecture, comment installer, configurer, déployer
  et contribuer au projet (API Docs, Schémas BDD).
- **Utilisateur** : Destinée à l'utilisateur final. Explique comment utiliser les fonctionnalités de l'application (
  Guides, FAQ, Tutoriels), souvent avec des captures d'écran.

#### 9. Q : Pourquoi utiliser HTTPS (SSL/TLS) ?

##### Réponse {collapsible="true"}

Pour chiffrer les communications entre le client et le serveur. Cela protège la confidentialité des données (mots de
passe, bancaire) contre l'écoute (Man-in-the-middle) et garantit l'identité du serveur (certificat). C'est aujourd'hui
indispensable (et exigé par Google/Browsers).

#### 10. Q : Qu'est-ce qu'un Volume Docker et pourquoi est-ce crucial pour une base de données ?

##### Réponse {collapsible="true"}

Les conteneurs sont éphémères : si on les supprime, les données à l'intérieur sont perdues. Un Volume est un espace de
stockage persistant sur l'hôte, monté dans le conteneur. Pour une BDD, c'est obligatoire pour ne pas perdre les données
lors du redémarrage ou de la mise à jour du conteneur BDD.

#### 11. Q : Qu'est-ce que Swagger (ou OpenAPI) ?

##### Réponse {collapsible="true"}

C'est un standard pour décrire et documenter des API RESTful. Il permet de générer une documentation interactive où l'on
peut voir les endpoints disponibles, les formats de données attendus et même tester les requêtes directement depuis le
navigateur.

#### 12. Q : Comment assurez-vous la maintenabilité de votre application lors de la livraison ?

##### Réponse {collapsible="true"}

En fournissant un code propre et commenté, une documentation à jour, des tests automatisés (pour éviter les régressions
futures) et des scripts de déploiement automatisés. Je laisse aussi des logs clairs pour faciliter le débogage.

#### 13. Q : Qu'est-ce que le "Staging" (ou Pré-production) ?

##### Réponse {collapsible="true"}

C'est un environnement iso-prod (identique à la production) où l'on déploie l'application pour la tester dans des
conditions réelles avant la mise en production officielle. C'est la dernière étape de validation ("Recette").

#### 14. Q : Qu'est-ce qu'un fichier `README.md` de qualité ?

##### Réponse {collapsible="true"}

Il contient : le nom et la description du projet, les pré-requis, les commandes d'installation, comment lancer les
tests, comment lancer l'app en dev et en prod, les technologies utilisées, et les auteurs. C'est la vitrine du projet.

#### 15. Q : Comment gérez-vous les logs en production ?

##### Réponse {collapsible="true"}

Les logs ne doivent pas seulement s'afficher dans la console (qui peut être perdue). Ils doivent être agrégés et stockés
dans un système centralisé (ex: ELK Stack, Datadog, CloudWatch) pour pouvoir faire des recherches, des alertes et des
analyses post-mortem.

#### 16. Q : Qu'est-ce que Kubernetes (K8s) ?

##### Réponse {collapsible="true"}

C'est un orchestrateur de conteneurs. Il permet de gérer le déploiement, la mise à l'échelle (scaling) automatique et la
gestion des pannes de milliers de conteneurs Docker sur un cluster de serveurs. (C'est souvent "overkill" pour un petit
projet CDA, mais bon à connaître de nom).

#### 17. Q : Qu'est-ce qu'un build multi-stage dans Docker ?

##### Réponse {collapsible="true"}

C'est une technique pour optimiser la taille des images. On utilise une première étape (ex: image Maven/Node) pour
compiler/builder l'application (lourd), puis on copie uniquement l'artefact résultant (le .jar ou le dossier /dist) dans
une seconde image très légère (ex: JRE Alpine ou Nginx) pour l'exécution finale.

#### 18. Q : Qu'est-ce que le Semantic Release ?

##### Réponse {collapsible="true"}

C'est l'automatisation de la gestion des versions et de la publication. Basé sur les messages de commit (Conventionnal
Commits : `fix:`, `feat:`), l'outil détermine automatiquement le prochain numéro de version (Patch, Minor, Major),
génère le Changelog et publie la release.

#### 19. Q : Comment mettre à jour une application sans couper le service (Zero Downtime Deployment) ?

##### Réponse {collapsible="true"}

Outre le Blue/Green, on peut faire du "Rolling Update". Si j'ai 3 instances de mon app derrière un load balancer, je les
mets à jour une par une. Je coupe la 1, je mets à jour, je rallume. Pendant ce temps, les 2 et 3 gèrent le trafic. Puis
je passe à la suivante.

#### 20. Q : Qu'est-ce que l'Infrastructure as Code (IaC) avec Terraform ou Ansible ?

##### Réponse {collapsible="true"}

C'est la pratique de gérer et provisionner l'infrastructure (serveurs, réseaux, BDD) via des fichiers de configuration (
code) plutôt que manuellement via une interface web. Cela permet de versionner l'infra, de la reproduire à l'identique
et d'éviter les erreurs humaines ("ClickOps").

