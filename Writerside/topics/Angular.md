# Questions sur Angular


### Partie 1 : Architecture et Composants

#### 1. Q : Qu'est-ce qu'Angular et quelle est la différence avec AngularJS ?
##### Réponse {collapsible="true"}
Angular (v2+) est un **framework** complet basé sur des composants et écrit en TypeScript. AngularJS (v1) était basé sur JavaScript et une architecture MVC/Scope. Angular est plus performant, modulaire, utilise une hiérarchie de composants et l'injection de dépendances, et est surtout mobile-oriented.

#### 2. Q : Qu'est-ce qu'un Composant (Component) ?
##### Réponse {collapsible="true"}
C'est la brique de base d'une application Angular. Il contrôle une partie de l'écran (la Vue). Il est composé d'une classe (logique TS), d'un template (HTML) et de styles (CSS). Il est défini par le décorateur `@Component`.

#### 3. Q : Quelle est la différence entre le Constructor et `ngOnInit` ?
##### Réponse {collapsible="true"}
- `Constructor` : Fonction native de la classe ES6/TS. Utilisé uniquement pour l'injection de dépendances. Les Inputs (`@Input`) ne sont pas encore disponibles.
- `ngOnInit` : Hook du cycle de vie d'Angular. Appelé une fois que le composant est initialisé et que les Inputs sont liés. C'est ici qu'on met la logique d'initialisation (appels API).

#### 4. Q : Citez les principaux Lifecycle Hooks (Hooks de cycle de vie) dans l'ordre.
##### Réponse {collapsible="true"}
1. `ngOnChanges` (si inputs changent)
2. `ngOnInit` (init)
3. `ngDoCheck` (détection manuelle)
4. `ngAfterContentInit` / `ngAfterContentChecked` (projection de contenu)
5. `ngAfterViewInit` / `ngAfterViewChecked` (vue chargée)
6. `ngOnDestroy` (avant destruction)

#### 5. Q : Qu'est-ce que l'interpolation et quelle est sa syntaxe ?
##### Réponse {collapsible="true"}
C'est un mécanisme de liaison de données (Data Binding) unidirectionnel du composant vers la vue. La syntaxe est la double accolade `{{ variable }}`. Angular évalue l'expression à l'intérieur et l'insère dans le DOM.

#### 6. Q : Expliquez les 3 types de Data Binding.
##### Réponse {collapsible="true"}
1. **Source vers Vue** : Interpolation `{{}}`, Property Binding `[prop]="val"`.
2. **Vue vers Source** : Event Binding `(event)="handler()"`.
3. **Double sens (Two-Way)** : `[(ngModel)]="val"`. Modifie la variable si l'input change, et met à jour l'input si la variable change.

#### 7. Q : À quoi servent `@Input` et `@Output` ?
##### Réponse {collapsible="true"}
Ils permettent la communication entre composants parents et enfants.
- `@Input()` : Pour recevoir des données du parent (Parent -> Enfant).
- `@Output()` : Pour émettre des événements vers le parent (Enfant -> Parent), souvent via un `EventEmitter`.

#### 8. Q : Qu'est-ce que la projection de contenu (`ng-content`) ?
##### Réponse {collapsible="true"}
C'est un moyen d'insérer du contenu HTML dynamique à l'intérieur d'un composant depuis le parent (principe des "slots"). Le composant enfant utilise la balise `<ng-content></ng-content>` pour définir où le contenu externe s'affichera.

#### 9. Q : Qu'est-ce que `ViewChild` ?
##### Réponse {collapsible="true"}
C'est un décorateur qui permet au composant d'accéder à un élément enfant (autre composant ou élément HTML natif) ou à une directive présent dans son propre template.

#### 10. Q : Qu'est-ce qu'un "Standalone Component" (v14+) ?
##### Réponse {collapsible="true"}
C'est un composant qui n'a pas besoin d'être déclaré dans un `NgModule`. Il gère ses propres dépendances via la propriété `imports` du décorateur `@Component`. C'est la nouvelle norme recommandée pour simplifier l'architecture ("NgModules optional").

---

### Partie 2 : Directives et Pipes

#### 11. Q : Quelle est la différence entre une Directive Structurelle et une Directive d'Attribut ?
##### Réponse {collapsible="true"}
- **Structurelle** : Modifie la structure du DOM (ajoute ou supprime des éléments). Précédée d'un astérisque `*`. Ex: `*ngIf`, `*ngFor`.
- **Attribut** : Modifie l'apparence ou le comportement d'un élément existant. Ex: `ngClass`, `ngStyle`, `[disabled]`.

#### 12. Q : À quoi sert la directive `*ngIf` ?
##### Réponse {collapsible="true"}
Elle permet d'ajouter ou de supprimer (complètement) un élément du DOM selon une condition booléenne. Contrairement à `[hidden]` qui ne fait que masquer (CSS `display: none`), `*ngIf` détruit l'élément (gain de performance si le contenu est lourd).

#### 13. Q : Pourquoi utiliser `trackBy` avec `*ngFor` ?
##### Réponse {collapsible="true"}
Par défaut, si la liste change, `*ngFor` détruit et recrée tout le DOM de la liste. `trackBy` fournit une fonction pour identifier chaque élément de manière unique (ex: par ID). Ainsi, Angular ne redessine que les éléments qui ont réellement changé, améliorant les performances.

#### 14. Q : Qu'est-ce qu'un Pipe (`|`) ?
##### Réponse {collapsible="true"}
C'est une fonction simple utilisée dans les templates pour transformer l'affichage d'une donnée sans modifier la donnée source. Ex: `{{ date | date:'short' }}`, `uppercase`, `currency`.

#### 15. Q : Quelle est la différence entre un Pipe Pur et Impur ?
##### Réponse {collapsible="true"}
- **Pur** (Défaut) : Ne s'exécute que si la référence de la valeur d'entrée change (très performant).
- **Impur** : S'exécute à chaque cycle de détection de changement (ex: à chaque mouvement de souris). À utiliser avec précaution pour les perfs (ex: pipe de filtrage de liste).

#### 16. Q : À quoi sert le `AsyncPipe` (`| async`) ?
##### Réponse {collapsible="true"}
Il souscrit (subscribe) automatiquement à un Observable (ou une Promise) directement dans le template et retourne la valeur émise. Surtout, il **désouscrit (unsubscribe) automatiquement** lorsque le composant est détruit, évitant les fuites de mémoire.

---

### Partie 3 : Services et Injection de Dépendances (DI)

#### 17. Q : Qu'est-ce qu'un Service dans Angular ?
##### Réponse {collapsible="true"}
C'est une classe ayant un but précis (souvent la logique métier, l'accès aux données API, ou le partage d'état). Elle est décorée avec `@Injectable`. Les services sont des singletons par défaut dans la portée où ils sont fournis.

#### 18. Q : Qu'est-ce que l'Injection de Dépendances (DI) ?
##### Réponse {collapsible="true"}
C'est un design pattern où les dépendances d'une classe (ex: un Service HTTP) lui sont fournies de l'extérieur plutôt que créées par la classe elle-même. Dans Angular, on les déclare dans le constructeur : `constructor(private http: HttpClient) {}`.

#### 19. Q : Que signifie `providedIn: 'root'` ?
##### Réponse {collapsible="true"}
Cela indique que le service est disponible dans toute l'application (singleton global). Angular gère une seule instance de ce service partagée par tous les composants. Cela permet aussi le "Tree Shaking" (le service n'est pas inclus dans le build final s'il n'est pas utilisé).

#### 20. Q : Comment gérer les appels HTTP dans Angular ?
##### Réponse {collapsible="true"}
On utilise le `HttpClientModule` (ou `provideHttpClient` en Standalone). On injecte le service `HttpClient` et on utilise ses méthodes (`get`, `post`, `put`, `delete`) qui retournent des Observables.

---

### Partie 4 : Routing

#### 21. Q : À quoi sert `<router-outlet>` ?
##### Réponse {collapsible="true"}
C'est une directive (balise) qui agit comme un placeholder. C'est l'endroit où le Router va insérer dynamiquement le composant correspondant à l'URL active.

#### 22. Q : Qu'est-ce que le Lazy Loading et comment le mettre en place ?
##### Réponse {collapsible="true"}
C'est le chargement à la demande des modules/composants. Au lieu de charger toute l'app au démarrage, on ne charge le code d'une page que lorsque l'utilisateur y accède. On utilise `loadChildren` (ou `loadComponent`) dans la définition des routes.

#### 23. Q : À quoi servent les Guards (ex: `CanActivate`, `CanMatch`) ?
##### Réponse {collapsible="true"}
Ils servent à protéger les routes. Ils exécutent une logique (ex: vérifier si l'utilisateur est connecté ou a le bon rôle) avant d'autoriser la navigation vers une URL. Si le Guard retourne `false`, la navigation est annulée.

#### 24. Q : Comment récupérer un paramètre dans l'URL (ex: `/user/42`) ?
##### Réponse {collapsible="true"}
On utilise le service `ActivatedRoute`. On peut soit faire un snapshot (`this.route.snapshot.paramMap.get('id')`) soit souscrire à l'observable pour réagir aux changements (`this.route.paramMap.subscribe(...)`).

---

### Partie 5 : RxJS et Observables

#### 25. Q : Quelle est la différence entre un Observable et une Promise ?
##### Réponse {collapsible="true"}
- **Promise** : Gère une seule valeur, est impatiente (s'exécute dès la création), ne peut pas être annulée.
- **Observable** : Gère un flux de plusieurs valeurs dans le temps, est paresseux (ne s'exécute que si on `subscribe`), peut être annulé (`unsubscribe`) et dispose de puissants opérateurs de transformation.

#### 26. Q : Quelle est la différence entre un `Subject` et un `BehaviorSubject` ?
##### Réponse {collapsible="true"}
Les deux sont des Observables qui permettent aussi d'émettre des valeurs (`next()`).
- `Subject` : Les nouveaux abonnés ne reçoivent que les valeurs émises *après* leur souscription.
- `BehaviorSubject` : Possède une "valeur courante" (initiale obligatoire). Les nouveaux abonnés reçoivent immédiatement la dernière valeur émise.

#### 27. Q : Pourquoi faut-il "Unsubscribe" des observables ?
##### Réponse {collapsible="true"}
Si on ne se désabonne pas (manuellement ou via `async` pipe), la souscription reste active en mémoire même si le composant est détruit. Cela crée des fuites de mémoire (Memory Leaks) et des comportements inattendus.

#### 28. Q : Expliquez l'opérateur `map` de RxJS.
##### Réponse {collapsible="true"}
Il transforme chaque valeur émise par l'observable source selon une fonction de projection. C'est l'équivalent du `.map()` des tableaux mais pour un flux de données.

#### 29. Q : Expliquez l'opérateur `switchMap`.
##### Réponse {collapsible="true"}
Il est utilisé pour mapper une valeur vers un nouvel Observable. Sa particularité : si une nouvelle valeur arrive dans la source, il **annule** l'observable intérieur précédent et souscrit au nouveau. Très utile pour les recherches type "Typeahead" pour annuler les vieilles requêtes HTTP.

#### 30. Q : Qu'est-ce qu'une "Subscription" ?
##### Réponse {collapsible="true"}
C'est l'objet retourné par la méthode `.subscribe()`. Il représente l'exécution de l'observable. Il possède une méthode `.unsubscribe()` pour arrêter l'écoute et libérer les ressources.

---

### Partie 6 : Formulaires

#### 31. Q : Quelle est la différence entre "Template-driven Forms" et "Reactive Forms" ?
##### Réponse {collapsible="true"}
- **Template-driven** : Tout se gère dans le HTML (`ngModel`). Simple, bon pour les petits formulaires, mais moins testable.
- **Reactive Forms** : Tout se gère dans la classe (`FormControl`, `FormGroup`). Plus robuste, scalable, flux de données synchrone, et plus facile à tester unitairement.

#### 32. Q : Qu'est-ce qu'un `FormControl` ?
##### Réponse {collapsible="true"}
C'est l'unité de base des formulaires réactifs. Il suit la valeur et l'état de validation d'un seul champ de formulaire (input, checkbox, etc.).

#### 33. Q : Qu'est-ce qu'un `FormGroup` ?
##### Réponse {collapsible="true"}
C'est un groupe de `FormControl` (ex: un formulaire complet ou une partie d'adresse). Il permet de suivre la validité de l'ensemble du groupe (si un champ est invalide, le groupe est invalide).

#### 34. Q : Comment valider un champ de formulaire ?
##### Réponse {collapsible="true"}
On utilise des Validateurs.
- Synchrones : `Validators.required`, `Validators.email`, `Validators.minLength`.
- Asynchrones : Pour vérifier des données côté serveur (ex: unicité d'un email).
  On passe ces validateurs lors de la création du `FormControl`.

#### 35. Q : Comment mettre à jour la valeur d'un formulaire réactif (`setValue` vs `patchValue`) ?
##### Réponse {collapsible="true"}
- `setValue` : On doit fournir un objet correspondant *exactement* à la structure du formulaire (tous les champs). Erreur si structure différente.
- `patchValue` : On peut fournir un objet partiel pour ne mettre à jour que certains champs.

---

### Partie 7 : Performance et Avancé

#### 36. Q : Qu'est-ce que la détection de changement (Change Detection) ?
##### Réponse {collapsible="true"}
C'est le mécanisme par lequel Angular synchronise l'état des modèles (variables TS) avec la Vue (DOM). Zone.js intercepte les événements asynchrones (clics, timers, HTTP) pour déclencher la vérification.

#### 37. Q : Quelle est la différence entre `ChangeDetectionStrategy.Default` et `OnPush` ?
##### Réponse {collapsible="true"}
- `Default` : Angular vérifie tous les composants de l'arbre à chaque événement.
- `OnPush` : Angular ne vérifie le composant que si une référence d'Input a changé (`@Input`) ou si un événement est déclenché depuis ce composant. C'est beaucoup plus performant pour les applications complexes.

#### 38. Q : Qu'est-ce que Zone.js ?
##### Réponse {collapsible="true"}
C'est une librairie utilisée par Angular pour créer un contexte d'exécution ("Zone"). Elle "monkey-patch" les API asynchrones du navigateur pour savoir quand une opération (timeout, fetch) est terminée afin de dire à Angular de lancer la détection de changement. (Angular tend à s'en passer avec les Signals).

#### 39. Q : Qu'est-ce que l'AOT (Ahead-of-Time) vs JIT (Just-in-Time) compilation ?
##### Réponse {collapsible="true"}
- **JIT** : Compilation dans le navigateur au moment de l'exécution (utile en dev).
- **AOT** : Compilation lors du build, avant le déploiement. Le navigateur reçoit du code déjà compilé. C'est plus rapide au chargement, plus sécurisé et détecte les erreurs de template lors du build. C'est le standard en prod.

#### 40. Q : Qu'est-ce qu'un Interceptor HTTP ?
##### Réponse {collapsible="true"}
C'est un service qui permet d'intercepter toutes les requêtes HTTP sortantes et les réponses entrantes. Utile pour ajouter un Token d'authentification dans le header de chaque requête ou pour gérer les erreurs globales (ex: rediriger si 401 Unauthorized).

#### 41. Q : Qu'est-ce qu'un Module (`NgModule`) ?
##### Réponse {collapsible="true"}
C'était l'unité d'organisation principale avant la v14. Un `NgModule` regroupe des composants, directives, pipes et services liés (via `declarations`, `imports`, `providers`). `AppModule` est le module racine historique.

#### 42. Q : Comment partager des données entre deux composants sans lien de parenté ?
##### Réponse {collapsible="true"}
La méthode la plus propre est d'utiliser un **Service partagé** contenant un `BehaviorSubject` (State Management simple). Les composants souscrivent à ce sujet pour lire les données et appellent des méthodes du service pour les modifier. Sinon, utiliser un store comme NgRx.

#### 43. Q : Qu'est-ce que NgRx (ou un Store) ?
##### Réponse {collapsible="true"}
C'est une librairie de gestion d'état (State Management) inspirée de Redux. Elle utilise un Store unique (source de vérité), des Actions (événements), des Reducers (fonctions pures qui modifient l'état) et des Selectors (pour lire l'état). Utile pour les apps très complexes.

#### 44. Q : Qu'est-ce que les "Signals" (Angular v16+) ?
##### Réponse {collapsible="true"}
C'est une nouvelle primitive de réactivité qui permet de gérer l'état de manière granulaire sans dépendre de Zone.js.
Un Signal est une enveloppe autour d'une valeur qui notifie les consommateurs quand elle change.
Ex: `count = signal(0);` -> lecture `count()`, écriture `count.set(1)`.

#### 45. Q : Quelle est la différence entre un Signal et un Observable ?
##### Réponse {collapsible="true"}
- **Signal** : Synchrone, détient toujours une valeur courante, idéal pour la gestion d'état et le binding de template. Pas besoin de unsubscribe.
- **Observable** : Asynchrone, flux d'événements, idéal pour gérer des événements complexes (temps, réseaux).

#### 46. Q : Qu'est-ce que l'Hydration (SSR) ?
##### Réponse {collapsible="true"}
Dans le contexte du Server-Side Rendering (Angular Universal / SSR), l'hydratation permet de réutiliser le DOM généré par le serveur côté client, au lieu de le détruire et de le recréer. Cela améliore le LCP (Largest Contentful Paint) et évite le "flickering".

#### 47. Q : Qu'est-ce qu'un Resolver ?
##### Réponse {collapsible="true"}
C'est un service utilisé dans le Routing pour précharger des données **avant** que la route ne soit activée. Le composant n'est affiché que lorsque le Resolver a fini de récupérer les données (ex: l'objet User).

#### 48. Q : Comment déboguer une application Angular ?
##### Réponse {collapsible="true"}
- Utiliser l'extension Chrome "Angular DevTools" (pour voir l'arbre des composants et le profiler).
- Utiliser le `json` pipe dans le template `{{ data | json }}`.
- Les breakpoints classiques dans l'onglet Sources du navigateur.

#### 49. Q : Qu'est-ce que le fichier `angular.json` ?
##### Réponse {collapsible="true"}
C'est le fichier de configuration global du workspace Angular CLI. Il définit la structure des projets, les options de build, les assets à inclure, les styles globaux et les configurations par environnement (prod/dev).

#### 50. Q : Comment optimiser la taille du bundle Angular ?
##### Réponse {collapsible="true"}
1. Utiliser le Lazy Loading pour les routes.
2. Utiliser les Standalone Components (meilleur Tree Shaking).
3. Vérifier que la compression Gzip/Brotli est active sur le serveur.
4. Analyser le bundle avec `webpack-bundle-analyzer` pour repérer les grosses librairies inutiles.