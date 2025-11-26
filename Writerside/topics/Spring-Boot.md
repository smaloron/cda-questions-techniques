# Questions sur Spring Boot

### Partie 1 : Fondamentaux et Architecture

#### 1. Q : Quelle est la différence principale entre Spring Framework et Spring Boot ?

##### Réponse {collapsible="true"}

Spring Framework est un conteneur IoC vaste nécessitant beaucoup de configuration (XML ou Java). Spring Boot est une
surcouche "opiniâtre" qui facilite l'utilisation de Spring en fournissant de l'auto-configuration et des serveurs
embarqués (Tomcat), permettant de créer des applications "stand-alone" prêtes pour la production rapidement.

#### 2. Q : Que fait l'annotation `@SpringBootApplication` ?

##### Réponse {collapsible="true"}

C'est une méta-annotation qui regroupe trois annotations clés :

1. `@Configuration` : Déclare la classe comme source de définition de beans.
2. `@EnableAutoConfiguration` : Active le mécanisme de configuration automatique de Spring Boot.
3. `@ComponentScan` : Scanne le package courant et ses sous-packages pour trouver des composants (`@Component`,
   `@Service`, etc.).

#### 3. Q : Qu'est-ce que l'Auto-Configuration ?

##### Réponse {collapsible="true"}

C'est un mécanisme intelligent qui configure automatiquement votre application Spring en fonction des dépendances
présentes dans le classpath. Par exemple, si `spring-boot-starter-web` est présent, Spring Boot configure
automatiquement Tomcat et Spring MVC.

#### 4. Q : Qu'est-ce qu'un "Starter" (ex: `spring-boot-starter-web`) ?

##### Réponse {collapsible="true"}

C'est un descripteur de dépendances (un pom.xml parent ou un groupe de libs). Il regroupe toutes les bibliothèques
nécessaires pour une fonctionnalité donnée (ex: Web, Data JPA, Security) afin d'éviter d'avoir à gérer les versions et
les conflits manuellement.

#### 5. Q : Qu'est-ce qu'un serveur embarqué (Embedded Server) ?

##### Réponse {collapsible="true"}

Au lieu de générer un fichier `.war` pour le déployer dans un serveur externe (Tomcat/JBoss), Spring Boot inclut le
serveur (Tomcat, Jetty ou Undertow) directement dans le `.jar` généré. L'application est autonome et se lance avec
`java -jar app.jar`.

#### 6. Q : Comment désactiver une auto-configuration spécifique ?

##### Réponse {collapsible="true"}

On peut utiliser l'attribut `exclude` de l'annotation principale :
`@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})`.

#### 7. Q : Qu'est-ce que le fichier `pom.xml` (ou `build.gradle`) et le "Spring Boot Maven Plugin" ?

##### Réponse {collapsible="true"}

Le `pom.xml` gère les dépendances. Le plugin Spring Boot permet de compiler le projet en un "Fat JAR" (JAR exécutable)
contenant toutes les dépendances et le serveur embarqué.

#### 8. Q : Qu'est-ce que Spring Initializr ?

##### Réponse {collapsible="true"}

C'est un outil web (start.spring.io) ou intégré aux IDE qui permet de générer rapidement la structure d'un projet Spring
Boot en sélectionnant la version de Java, le build tool (Maven/Gradle) et les dépendances souhaitées.

---

### Partie 2 : Configuration et Propriétés

#### 9. Q : Quelle est la différence entre `application.properties` et `application.yml` ?

##### Réponse {collapsible="true"}

Ce sont deux formats pour configurer l'application.

- `.properties` : Format clé=valeur standard, plat.
- `.yml` (YAML) : Format hiérarchique, plus lisible pour les configurations imbriquées, mais attention à l'indentation.
  Spring Boot supporte les deux par défaut.

#### 10. Q : Comment injecter une valeur de configuration dans une variable Java ?

##### Réponse {collapsible="true"}

On utilise l'annotation `@Value("${ma.propriete}")` sur un champ de la classe.

#### 11. Q : Qu'est-ce que `@ConfigurationProperties` ?

##### Réponse {collapsible="true"}

C'est une annotation qui permet de lier un groupe de propriétés (préfixées, ex: `app.mail.*`) à une classe Java (POJO).
Cela offre une validation de type et l'autocomplétion, contrairement à `@Value`.

#### 12. Q : Qu'est-ce qu'un "Profile" Spring (`@Profile`) ?

##### Réponse {collapsible="true"}

Les profils permettent de séparer la configuration selon l'environnement (Dev, Test, Prod). On peut définir
`application-dev.properties` et activer le profil avec `spring.profiles.active=dev`. Un Bean annoté `@Profile("dev")` ne
sera chargé que si ce profil est actif.

#### 13. Q : Quel est l'ordre de priorité de la configuration externe ?

##### Réponse {collapsible="true"}

Spring Boot lit la config dans un ordre précis (du plus prioritaire au moins prioritaire) :

1. Arguments de ligne de commande.
2. Propriétés Système Java (`-D`).
3. Variables d'environnement de l'OS.
4. Fichiers de config (`application.properties`) hors du jar.
5. Fichiers de config dans le jar.

---

### Partie 3 : IoC, DI et Beans

#### 14. Q : Qu'est-ce que l'Inversion de Contrôle (IoC) ?

##### Réponse {collapsible="true"}

C'est un principe où le contrôle de la création et de la gestion des objets est transféré du développeur au framework (
le conteneur Spring). Le développeur ne fait plus `new Service()`, c'est Spring qui le fait.

#### 15. Q : Qu'est-ce que l'Injection de Dépendances (DI) ?

##### Réponse {collapsible="true"}

C'est la mise en œuvre de l'IoC. Le conteneur injecte les dépendances requises (objets collaborants) dans un objet lors
de sa création.

#### 16. Q : Quels sont les types d'injection dans Spring et lequel est recommandé ?

##### Réponse {collapsible="true"}

1. Par **Constructeur** (Recommandé : rend les dépendances obligatoires et l'objet immuable).
2. Par **Setter** (Optionnel).
3. Par **Champ** (`@Autowired` sur le champ, déconseillé car difficile à tester unitairement).

#### 17. Q : Qu'est-ce qu'un Bean Spring ?

##### Réponse {collapsible="true"}

C'est un objet qui est instancié, assemblé et géré par le conteneur IoC de Spring.

#### 18. Q : Quelle est la différence entre `@Component`, `@Service`, `@Repository` et `@Controller` ?

##### Réponse {collapsible="true"}

Techniquement, ce sont tous des `@Component` (stéréotypes).

- `@Component` : Générique.
- `@Service` : Pour la couche métier.
- `@Repository` : Pour la couche d'accès aux données (capture les exceptions BDD).
- `@Controller` : Pour la couche Web (MVC).
  Cela aide à la lisibilité et permet des traitements spécifiques (AOP).

#### 19. Q : Quelle est la portée (Scope) par défaut d'un Bean ?

##### Réponse {collapsible="true"}

Par défaut, le scope est **Singleton** (une seule instance partagée par toute l'application). Il existe aussi *
*Prototype** (nouvelle instance à chaque demande), **Request**, **Session** (pour le web).

#### 20. Q : À quoi sert l'annotation `@Bean` ?

##### Réponse {collapsible="true"}

Elle s'utilise dans une classe `@Configuration` pour déclarer manuellement un bean. Utile pour configurer des classes
tierces (dont on n'a pas le code source pour mettre `@Component`).

#### 21. Q : Qu'est-ce que `@Qualifier` ?

##### Réponse {collapsible="true"}

Si plusieurs beans implémentent la même interface, Spring ne sait pas lequel injecter (
`NoUniqueBeanDefinitionException`). `@Qualifier("nomDuBean")` permet de spécifier lequel utiliser.

#### 22. Q : Qu'est-ce que `@PostConstruct` et `@PreDestroy` ?

##### Réponse {collapsible="true"}

Ce sont des annotations (JSR-250) pour définir des méthodes à exécuter juste après l'initialisation du bean (après
l'injection des dépendances) ou juste avant sa destruction.

---

### Partie 4 : Web et REST

#### 23. Q : Quelle est la différence entre `@Controller` et `@RestController` ?

##### Réponse {collapsible="true"}

- `@Controller` est utilisé pour le MVC traditionnel (retourne une vue HTML/JSP).
- `@RestController` est une combinaison de `@Controller` et `@ResponseBody`. Il retourne directement des données (
  JSON/XML) dans le corps de la réponse HTTP. Idéal pour les API REST.

#### 24. Q : Expliquez `@RequestMapping` et ses variantes (`@GetMapping`, etc.).

##### Réponse {collapsible="true"}

`@RequestMapping` mappe des requêtes HTTP sur des méthodes de contrôleur.
Les variantes raccourcies sont plus explicites : `@GetMapping`, `@PostMapping`, `@PutMapping`, `@DeleteMapping`,
`@PatchMapping`.

#### 25. Q : Quelle est la différence entre `@PathVariable` et `@RequestParam` ?

##### Réponse {collapsible="true"}

- `@PathVariable` extrait une valeur de l'URI elle-même (ex: `/users/{id}`).
- `@RequestParam` extrait une valeur des paramètres de requête (query string, ex: `/users?id=1`) ou des données de
  formulaire.

#### 26. Q : À quoi sert `@RequestBody` ?

##### Réponse {collapsible="true"}

Elle indique à Spring de désérialiser le corps de la requête HTTP (souvent du JSON) en un objet Java passé en paramètre
de la méthode du contrôleur.

#### 27. Q : Comment gérer les exceptions globalement dans une API REST ?

##### Réponse {collapsible="true"}

En utilisant `@ControllerAdvice` (ou `@RestControllerAdvice`) combiné avec `@ExceptionHandler`. Cela permet de capturer
des exceptions spécifiques partout dans l'application et de retourner une réponse HTTP formatée (ex: JSON d'erreur)
proprement.

#### 28. Q : Qu'est-ce que Jackson ?

##### Réponse {collapsible="true"}

C'est la librairie par défaut utilisée par Spring Boot pour sérialiser (Objet Java -> JSON) et désérialiser (JSON ->
Objet Java).

#### 29. Q : Comment valider les données entrantes (DTO) ?

##### Réponse {collapsible="true"}

On utilise l'API **Bean Validation** (Hibernate Validator). On annote les champs du DTO avec `@NotNull`, `@Size`, etc.
Dans le contrôleur, on ajoute `@Valid` devant le paramètre `@RequestBody`.

---

### Partie 5 : Accès aux Données (Data)

#### 30. Q : Qu'est-ce que Spring Data JPA ?

##### Réponse {collapsible="true"}

C'est une surcouche au-dessus de JPA (Hibernate) qui simplifie considérablement l'accès aux données. Elle permet de
créer des Repositories simplement en définissant des interfaces, sans écrire d'implémentation.

#### 31. Q : À quoi sert l'interface `JpaRepository` ?

##### Réponse {collapsible="true"}

En étendant cette interface (ex: `interface UserRepository extends JpaRepository<User, Long>`), on hérite
automatiquement de méthodes CRUD standards (`save`, `findAll`, `findById`, `delete`) sans écrire une ligne de code SQL.

#### 32. Q : Qu'est-ce qu'une "Derived Query Method" (Méthode dérivée) ?

##### Réponse {collapsible="true"}

C'est la capacité de Spring Data à générer la requête SQL à partir du nom de la méthode.
Ex: `findByLastNameAndFirstName(String last, String first)` générera automatiquement le
`SELECT ... WHERE last_name = ? AND first_name = ?`.

#### 33. Q : Qu'est-ce que `@Transactional` ?

##### Réponse {collapsible="true"}

Cette annotation définit les frontières d'une transaction de base de données. Si la méthode réussit, la transaction est
committée. Si une exception (runtime) est levée, la transaction est annulée (Rollback), garantissant l'intégrité des
données.

#### 34. Q : Qu'est-ce que H2 ?

##### Réponse {collapsible="true"}

C'est une base de données relationnelle écrite en Java, très rapide, qui peut tourner en mémoire. Spring Boot l'utilise
souvent par défaut pour le développement et les tests car elle ne nécessite aucune installation.

#### 35. Q : Comment activer la console H2 ?

##### Réponse {collapsible="true"}

Dans `application.properties`, il faut mettre `spring.h2.console.enabled=true`. Elle est ensuite accessible via
`/h2-console` dans le navigateur.

#### 36. Q : Qu'est-ce que `@Entity` et `@Id` ?

##### Réponse {collapsible="true"}

Ce sont des annotations JPA standard.

- `@Entity` marque une classe Java comme étant mappée à une table de base de données.
- `@Id` marque le champ qui sert de clé primaire.

---

### Partie 6 : Tests et Monitoring

#### 37. Q : Qu'est-ce que `@SpringBootTest` ?

##### Réponse {collapsible="true"}

C'est une annotation utilisée pour les tests d'intégration. Elle démarre le contexte d'application Spring complet (et
peut même démarrer le serveur web) pour tester l'application comme si elle tournait réellement.

#### 38. Q : À quoi sert `@MockBean` ?

##### Réponse {collapsible="true"}

Elle permet de créer un Mock (avec Mockito) pour un Bean Spring et de l'injecter dans le contexte à la place du vrai
Bean. Très utile pour isoler la couche testée (ex: tester un Service en mockant le Repository).

#### 39. Q : Qu'est-ce que Spring Boot Actuator ?

##### Réponse {collapsible="true"}

C'est un module (`spring-boot-starter-actuator`) qui fournit des endpoints prêts à l'emploi pour surveiller et gérer l'
application en production : état de santé (`/health`), infos (`/info`), métriques (`/metrics`), logs, dump mémoire, etc.

#### 40. Q : Qu'est-ce que Spring Boot DevTools ?

##### Réponse {collapsible="true"}

C'est un module de développement qui améliore l'expérience développeur. Sa fonctionnalité principale est le **LiveReload
** / Redémarrage automatique : dès qu'un fichier est modifié et compilé, l'application redémarre très vite.

---

### Partie 7 : Sécurité et AOP

#### 41. Q : Qu'est-ce que Spring Security ?

##### Réponse {collapsible="true"}

C'est le framework standard pour sécuriser les applications Spring. Il gère l'authentification (vérifier l'identité) et
l'autorisation (vérifier les droits d'accès) via une chaîne de filtres.

#### 42. Q : Comment sécuriser un endpoint spécifique ?

##### Réponse {collapsible="true"}

En configurant le `SecurityFilterChain` (Bean Java). On utilise des méthodes comme
`.requestMatchers("/admin/**").hasRole("ADMIN")` pour restreindre l'accès. On peut aussi utiliser l'annotation
`@PreAuthorize("hasRole('ADMIN')")` sur les méthodes.

#### 43. Q : Qu'est-ce que AOP (Aspect Oriented Programming) ?

##### Réponse {collapsible="true"}

C'est un paradigme permettant de séparer les préoccupations transverses (logging, sécurité, transactions) du code
métier. On définit un "Aspect" qui intercepte l'exécution des méthodes pour ajouter du comportement avant ou après.

#### 44. Q : Qu'est-ce qu'un Filtre (Filter) vs un Intercepteur (Interceptor) ?

##### Réponse {collapsible="true"}

- **Filtre** (Servlet Filter) : Fait partie de la spécification Servlet. Agit avant que la requête n'atteigne Spring (
  Sécurité, Encodage).
- **Intercepteur** (HandlerInterceptor) : Spécifique à Spring MVC. Agit juste avant/après le Contrôleur. A accès au
  contexte Spring.

#### 45. Q : Comment gérer le CORS (Cross-Origin Resource Sharing) ?

##### Réponse {collapsible="true"}

Soit globalement via une configuration `WebMvcConfigurer` (`addCorsMappings`), soit localement sur un contrôleur avec
l'annotation `@CrossOrigin`.

#### 46. Q : Qu'est-ce que le fichier `banner.txt` ?

##### Réponse {collapsible="true"}

Un fichier placé dans `src/main/resources` qui permet de personnaliser le logo ASCII art affiché dans la console au
démarrage de l'application.

#### 47. Q : Qu'est-ce que la couche "CommandLineRunner" ?

##### Réponse {collapsible="true"}

C'est une interface fonctionnelle. Si un Bean l'implémente, sa méthode `run()` sera exécutée automatiquement juste après
le démarrage complet de l'application. Utile pour initialiser des données ou lancer un script.

#### 48. Q : Qu'est-ce que le "Convention over Configuration" ?

##### Réponse {collapsible="true"}

C'est la philosophie de Spring Boot. Si vous respectez les conventions (noms de fichiers, emplacements, dépendances), le
framework configure tout seul. Vous ne configurez que ce qui diffère de la convention.

#### 49. Q : Comment packager une application Spring Boot pour Docker ?

##### Réponse {collapsible="true"}

On peut écrire un `Dockerfile` standard (FROM openjdk, COPY jar, ENTRYPOINT). Spring Boot propose aussi via Maven/Gradle
la construction d'images OCI directement avec Buildpacks (`mvn spring-boot:build-image`) sans Dockerfile.

#### 50. Q : Qu'est-ce que Swagger (ou OpenAPI) avec Spring Boot ?

##### Réponse {collapsible="true"}

En ajoutant une dépendance (comme `springdoc-openapi`), Spring Boot génère automatiquement la documentation de votre API
REST en scannant vos contrôleurs. Une interface web (Swagger UI) permet de tester les endpoints.