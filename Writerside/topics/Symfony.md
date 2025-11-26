# Questions sur Symfony

---

### Partie 1 : Architecture et Fondamentaux

#### 1. Q : Qu'est-ce que Symfony et quels sont ses composants principaux ?

##### Réponse {collapsible="true"}

Symfony est un framework PHP open-source basé sur une architecture MVC (Modèle-Vue-Contrôleur). Il est constitué d'un
ensemble de composants découplés et réutilisables (ex: HttpFoundation, Routing, Console) qui peuvent être utilisés
indépendamment dans d'autres projets (comme Laravel ou Drupal).

#### 2. Q : Qu'est-ce que le Kernel (Noyau) ?

##### Réponse {collapsible="true"}

C'est le cœur de l'application. Il est responsable de l'initialisation du conteneur de services, du chargement des
bundles et de la gestion du flux requête/réponse (`handle()`). Il transforme une `Request` en `Response`.

#### 3. Q : Qu'est-ce que Symfony Flex ?

##### Réponse {collapsible="true"}

C'est un plugin Composer qui automatise l'installation et la configuration des packages Symfony. Lorsqu'on installe une
librairie (ex: `composer req mailer`), Flex exécute des "recettes" (recipes) qui créent automatiquement les fichiers de
configuration par défaut et modifient le `.env` si nécessaire.

#### 4. Q : À quoi sert le fichier `.env` ?

##### Réponse {collapsible="true"}

Il sert à définir les variables d'environnement spécifiques à l'instance (connexion BDD, clés API, mode APP_ENV). Ces
variables ne doivent pas être stockées en dur dans le code. Le fichier `.env.local` permet de surcharger ces valeurs
localement et ne doit pas être versionné sur Git.

#### 5. Q : Quelle est la structure de dossiers standard (Symfony 5+) ?

##### Réponse {collapsible="true"}

- `/bin` : Exécutables (console).
- `/config` : Configuration (routes, services, packages).
- `/public` : Point d'entrée web (index.php), assets (css/js/images).
- `/src` : Code source PHP (Contrôleurs, Entités, Services).
- `/templates` : Fichiers Twig.
- `/var` : Cache et Logs.
- `/vendor` : Librairies Composer.

#### 6. Q : Qu'est-ce qu'un Bundle ?

##### Réponse {collapsible="true"}

C'est un plugin ou un module qui encapsule une fonctionnalité (code, config, assets) pour la rendre réutilisable. Dans
les anciennes versions, tout était Bundle. Aujourd'hui, on développe l'application directement dans `/src`, et les
Bundles sont surtout utilisés pour les librairies tierces (ex: SecurityBundle, MakerBundle).

#### 7. Q : Qu'est-ce que le Profiler Symfony (Web Debug Toolbar) ?

##### Réponse {collapsible="true"}

C'est un outil de développement qui s'affiche en bas de page. Il permet d'analyser la requête courante : temps
d'exécution, requêtes SQL exécutées, services utilisés, données de session, emails envoyés, etc. Indispensable pour le
débogage.

---

### Partie 2 : Injection de Dépendances et Services

#### 8. Q : Qu'est-ce que le Conteneur de Services (Service Container) ?

##### Réponse {collapsible="true"}

C'est un objet global qui gère l'instanciation des objets (services) de l'application. Il stocke les services et gère
leurs dépendances. Au lieu de faire `new Mailer()`, on demande au conteneur de nous fournir le service
`MailerInterface`.

#### 9. Q : Qu'est-ce que l'Autowiring ?

##### Réponse {collapsible="true"}

C'est une fonctionnalité qui permet au conteneur de deviner automatiquement les dépendances à injecter dans le
constructeur d'un service en se basant sur le **type** (Type Hinting).
Ex: `public function __construct(UserRepository $repo)` -> Symfony injecte automatiquement l'instance de
`UserRepository`.

#### 10. Q : Qu'est-ce que l'Autoconfigure ?

##### Réponse {collapsible="true"}

C'est une fonctionnalité qui applique automatiquement des tags aux services en fonction de l'interface qu'ils
implémentent.
Ex: Une classe implémentant `Command` sera automatiquement taguée comme commande console, une implémentant
`EventSubscriberInterface` sera enregistrée comme écouteur d'événements.

#### 11. Q : Quelle est la différence entre `services.yaml` et `parameters` ?

##### Réponse {collapsible="true"}

- `services` : Définit les objets PHP (classes), leurs arguments et comment les instancier.
- `parameters` : Définit des valeurs scalaires (chaînes, entiers) statiques (ex: email de l'admin, dossier d'upload)
  qu'on peut injecter dans les services via `%nom_parametre%`.

#### 12. Q : Comment injecter une valeur scalaire (ex: une clé API) dans un service ?

##### Réponse {collapsible="true"}

On utilise l'attribut `#[Bind]` dans le constructeur (Symfony 6.1+) ou on configure l'argument dans `services.yaml` avec
`bind` ou `arguments` en utilisant la syntaxe `$nomArgument: '%valeur_parametre%'`.

#### 13. Q : Qu'est-ce qu'un service "Lazy" ?

##### Réponse {collapsible="true"}

C'est un service qui n'est instancié que lorsqu'on l'utilise réellement pour la première fois, et non au moment où il
est injecté. Cela permet d'économiser de la mémoire et d'accélérer le démarrage de l'application si le service est lourd
et pas toujours utilisé.

---

### Partie 3 : Contrôleurs et Routing

#### 14. Q : Comment définit-on une route dans Symfony moderne ?

##### Réponse {collapsible="true"}

On utilise les **Attributs** PHP 8 directement au-dessus de la méthode du contrôleur.
Ex: `#[Route('/blog/{slug}', name: 'blog_show', methods: ['GET'])]`.
(Les annotations `@Route` sont dépréciées, et le YAML est moins utilisé pour les routes de contrôleurs).

#### 15. Q : Qu'est-ce que l'objet `Request` ?

##### Réponse {collapsible="true"}

Il représente la requête HTTP entrante. Il contient toutes les informations superglobales (`$_GET`, `$_POST`,
`$_SERVER`, `$_COOKIE`) encapsulées en objet.
Ex: `$request->query->get('page')` pour `$_GET['page']`.

#### 16. Q : Qu'est-ce que le ParamConverter (ou `MapEntity` en moderne) ?

##### Réponse {collapsible="true"}

C'est un mécanisme qui convertit automatiquement un paramètre de route (ex: `{id}`) en entité Doctrine.
Si j'ai `public function show(Post $post)`, Symfony cherche le Post dont l'ID correspond à l'URL. Si non trouvé, il
renvoie une 404.

#### 17. Q : Quelle est la différence entre `render()` et `json()` dans un contrôleur ?

##### Réponse {collapsible="true"}

- `render()` : Génère une page HTML en utilisant un template Twig (`return $this->render('page.html.twig')`).
- `json()` : Renvoie une réponse JSON, sérialise automatiquement les données passées et met le bon Content-Type (utile
  pour les API).

#### 18. Q : Comment faire une redirection ?

##### Réponse {collapsible="true"}

En retournant une `RedirectResponse`. Le contrôleur abstrait fournit la méthode helper :
`return $this->redirectToRoute('nom_de_la_route', ['param' => 'valeur']);`.

#### 19. Q : À quoi sert la commande `bin/console debug:router` ?

##### Réponse {collapsible="true"}

Elle liste toutes les routes configurées dans l'application, avec leur nom, leur méthode HTTP (GET/POST), leur chemin (
path) et le contrôleur associé. Très utile pour vérifier qu'une route est bien prise en compte.

---

### Partie 4 : Doctrine (ORM)

#### 20. Q : Qu'est-ce qu'une Entité ?

##### Réponse {collapsible="true"}

C'est une classe PHP simple (POPO) qui représente une table dans la base de données. Chaque propriété est mappée à une
colonne via des attributs (`#[ORM\Column]`).

#### 21. Q : Qu'est-ce qu'un Repository ?

##### Réponse {collapsible="true"}

C'est une classe responsable de la récupération des données (SELECT). Elle contient des méthodes comme `find()`,
`findAll()`, `findBy()`. On y écrit aussi nos propres requêtes SQL/DQL personnalisées.

#### 22. Q : Qu'est-ce que DQL (Doctrine Query Language) ?

##### Réponse {collapsible="true"}

C'est un langage de requête orienté objet similaire au SQL, mais qui manipule des **objets** (Entités) et leurs
propriétés, pas des tables et des colonnes. Doctrine traduit ensuite le DQL en SQL natif optimisé pour la base utilisée.

#### 23. Q : Expliquez le rôle des Migrations (`make:migration` et `doctrine:migrations:migrate`).

##### Réponse {collapsible="true"}

- `make:migration` : Compare l'état actuel des Entités PHP avec la structure actuelle de la BDD et génère un fichier PHP
  contenant les requêtes SQL pour synchroniser les deux.
- `migrate` : Exécute ces fichiers SQL pour mettre à jour la base de données réelle. Cela permet de versionner la
  structure de la BDD.

#### 24. Q : Qu'est-ce que le QueryBuilder ?

##### Réponse {collapsible="true"}

C'est une interface fluide en PHP pour construire des requêtes DQL dynamiquement sans écrire de chaînes de caractères.
Ex: `$this->createQueryBuilder('p')->where('p.active = true')->getQuery()->getResult();`.

#### 25. Q : Quelle est la différence entre `persist()` et `flush()` ?

##### Réponse {collapsible="true"}

- `persist($entity)` : Dit à l'EntityManager de "surveiller" cet objet et de préparer son enregistrement (INSERT) lors
  de la prochaine transaction. Ne fait aucune requête SQL.
- `flush()` : Exécute réellement toutes les requêtes SQL en attente (INSERT, UPDATE, DELETE) dans une seule transaction.

#### 26. Q : Qu'est-ce que les DataFixtures ?

##### Réponse {collapsible="true"}

C'est un système permettant de charger des fausses données (dummy data) dans la base de données pour le développement ou
les tests. On utilise souvent la librairie `Faker` avec. Commande : `doctrine:fixtures:load`.

#### 27. Q : Qu'est-ce que le "Lazy Loading" des relations Doctrine ?

##### Réponse {collapsible="true"}

Par défaut, si je récupère un `User` qui a des `Posts`, Doctrine ne récupère pas les posts immédiatement (pour la
performance). Il ne fait la requête SQL pour les posts que si j'appelle `$user->getPosts()` dans mon code (ou Twig).
Attention au problème N+1.

#### 28. Q : Qu'est-ce qu'un événement de cycle de vie Doctrine (Lifecycle Callback) ?

##### Réponse {collapsible="true"}

Ce sont des méthodes dans l'entité qui s'exécutent automatiquement à certains moments : `#[PrePersist]` (avant
création), `#[PreUpdate]` (avant modif). Utile pour mettre à jour automatiquement des champs `createdAt` ou `updatedAt`.

---

### Partie 5 : Formulaires et Validation

#### 29. Q : Comment créer un formulaire dans Symfony ?

##### Réponse {collapsible="true"}

On utilise généralement la commande `bin/console make:form` pour créer une classe `FormType`. Cette classe définit les
champs (`add('nom', TextType::class)`) et la configuration. Dans le contrôleur, on utilise
`$this->createForm(MonFormType::class, $entity)`.

#### 30. Q : À quoi sert `$form->handleRequest($request)` ?

##### Réponse {collapsible="true"}

Cette méthode inspecte la requête HTTP (POST). Si elle contient des données correspondant au formulaire, elle remplit
l'objet lié (l'entité) avec ces données. Elle gère aussi la soumission (`isSubmitted()`).

#### 31. Q : Comment valider les données d'une entité ?

##### Réponse {collapsible="true"}

On utilise le composant Validator avec des attributs PHP sur les propriétés de l'entité.
Ex: `#[Assert\NotBlank]`, `#[Assert\Email]`, `#[Assert\Length(min: 5)]`. La validation est déclenchée automatiquement
lors de `$form->isValid()`.

#### 32. Q : Qu'est-ce qu'un Data Transformer ?

##### Réponse {collapsible="true"}

C'est une classe qui permet de transformer une donnée complexe (ex: un objet Entité `Tag`) en une donnée simple pour
l'affichage dans le formulaire (ex: une string "tag1, tag2") et inversement lors de la soumission.

#### 33. Q : Qu'est-ce que la protection CSRF dans les formulaires ?

##### Réponse {collapsible="true"}

Symfony ajoute automatiquement un champ caché (`_token`) dans chaque formulaire pour prévenir les attaques Cross-Site
Request Forgery. Le framework vérifie ce jeton lors de la soumission.

---

### Partie 6 : Twig (Moteur de Template)

#### 34. Q : Quelle est la différence entre `{{ ... }}` et `{% ... %}` ?

##### Réponse {collapsible="true"}

- `{{ variable }}` : Affiche le résultat d'une expression (echo).
- `{% if condition %}` : Exécute une logique de contrôle (boucles, conditions, définition de blocs).

#### 35. Q : À quoi sert l'héritage de template (`extends` et `block`) ?

##### Réponse {collapsible="true"}

Il permet de définir un layout de base (`base.html.twig`) contenant la structure commune (Header, Footer, CSS). Les
templates enfants étendent ce layout (`{% extends 'base.html.twig' %}`) et ne redéfinissent que le contenu des blocs (
`{% block body %}...{% endblock %}`).

#### 36. Q : Comment générer une URL dans Twig ?

##### Réponse {collapsible="true"}

Avec la fonction `path('nom_de_la_route', { param: 'valeur' })`. C'est l'équivalent de `$this->generateUrl()` côté PHP.

#### 37. Q : Qu'est-ce qu'un Filtre Twig et comment l'utiliser ?

##### Réponse {collapsible="true"}

Un filtre modifie l'affichage d'une variable. On utilise le pipe `|`.
Ex: `{{ 'bonjour' | upper }}` affiche "BONJOUR", `{{ date | date('d/m/Y') }}` formate la date.

#### 38. Q : Qu'est-ce que la variable globale `app` dans Twig ?

##### Réponse {collapsible="true"}

C'est une variable disponible partout qui donne accès au contexte global : `app.user` (utilisateur connecté),
`app.request` (requête courante), `app.session` (messages flash), `app.environment`.

---

### Partie 7 : Sécurité

#### 39. Q : Qu'est-ce que le fichier `security.yaml` ?

##### Réponse {collapsible="true"}

C'est le fichier central de configuration de la sécurité. Il définit :

- Les **User Providers** (d'où viennent les utilisateurs : BDD, mémoire, LDAP).
- Les **Firewalls** (quelles parties du site sont sécurisées, comment on se connecte).
- Le **Access Control** (règles d'accès par URL et Rôle).

#### 40. Q : Qu'est-ce qu'un Firewall dans Symfony ?

##### Réponse {collapsible="true"}

C'est une couche de sécurité qui intercepte la requête. Il gère l'authentification (Login form, API Token). Une
application a souvent un firewall `dev` (pas de sécu) et un `main` (site principal).

#### 41. Q : Qu'est-ce qu'un Voter ?

##### Réponse {collapsible="true"}

C'est une classe PHP qui permet de gérer des permissions complexes et dynamiques.
Ex: "Un utilisateur peut modifier un Post seulement s'il en est l'auteur".
On l'appelle via `$this->isGranted('EDIT', $post)`. Le Voter contient la logique métier de cette autorisation.

#### 42. Q : Comment hasher les mots de passe ?

##### Réponse {collapsible="true"}

On utilise l'interface `UserPasswordHasherInterface`. Dans le `security.yaml`, on configure l'algorithme (généralement
`auto`, qui choisit le meilleur dispo, ex: Bcrypt ou Sodium).

#### 43. Q : Qu'est-ce que la hiérarchie des rôles ?

##### Réponse {collapsible="true"}

Elle permet de définir que certains rôles héritent d'autres.
Ex: `ROLE_ADMIN: [ROLE_USER, ROLE_EDITOR]`. Si un user a `ROLE_ADMIN`, il a implicitement les droits des autres rôles.

---

### Partie 8 : Événements et Avancé

#### 44. Q : Qu'est-ce que l'EventDispatcher ?

##### Réponse {collapsible="true"}

C'est un composant qui implémente le pattern Observateur. Il permet à différentes parties de l'application de
communiquer sans se connaître. On "dispatch" un événement, et des "Listeners" écoutent et réagissent.

#### 45. Q : Quelle est la différence entre EventListener et EventSubscriber ?

##### Réponse {collapsible="true"}

- **Listener** : Classe simple configurée dans `services.yaml` pour écouter un événement précis.
- **Subscriber** : Classe qui "sait" quels événements elle écoute (via la méthode statique `getSubscribedEvents`).
  Symfony l'enregistre automatiquement. C'est la méthode recommandée car plus explicite.

#### 46. Q : Quels sont les principaux événements du Kernel (HttpKernel) ?

##### Réponse {collapsible="true"}

- `kernel.request` (au tout début).
- `kernel.controller` (le contrôleur est déterminé).
- `kernel.response` (la réponse est créée, avant envoi).
- `kernel.exception` (si une erreur survient, pour personnaliser la page d'erreur).

#### 47. Q : Qu'est-ce que le composant Messenger ?

##### Réponse {collapsible="true"}

Il permet d'envoyer des messages (objets) de manière asynchrone via des files d'attente (Queues) comme RabbitMQ, Redis
ou Doctrine. Très utile pour les tâches lourdes (envoi d'emails, traitement d'images) afin de ne pas bloquer
l'utilisateur.

#### 48. Q : Qu'est-ce que API Platform ?

##### Réponse {collapsible="true"}

C'est un framework construit au-dessus de Symfony. Il permet de générer une API REST et GraphQL complète (CRUD,
Pagination, Filtres, Doc Swagger) en quelques minutes, simplement en annotant les Entités Doctrine avec
`#[ApiResource]`.

#### 49. Q : Qu'est-ce que le Maker Bundle ?

##### Réponse {collapsible="true"}

C'est un outil de développement (`bin/console make:...`) qui génère du code squelette (boilerplate) pour gagner du
temps : créer des contrôleurs, des entités, des formulaires, des commandes, etc.

#### 50. Q : Comment tester une application Symfony ?

##### Réponse {collapsible="true"}

On utilise PHPUnit avec le `WebTestCase` de Symfony.

- **Tests Unitaires** : Testent une classe isolée (Service, Entité).
- **Tests Fonctionnels** : Simulent un navigateur (client HTTP), font des requêtes, cliquent sur des liens et vérifient
  le code HTML ou JSON de la réponse. `static::createClient()->request('GET', '/')`.