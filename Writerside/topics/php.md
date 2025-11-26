# Questions sur PHP


### Partie 1 : Les Bases et la Syntaxe

#### 1. Q : Quelle est la différence entre `echo` et `print` ?

##### Réponse {collapsible="true"}

La différence est minime. `echo` est une structure de langage (pas une fonction), ne retourne rien et peut prendre
plusieurs paramètres. `print` est aussi une structure de langage, mais retourne toujours `1` (donc peut être utilisé
dans une expression) et ne prend qu'un seul paramètre. `echo` est marginalement plus rapide.

#### 2. Q : Quelle est la différence entre `==` et `===` ?

##### Réponse {collapsible="true"}

`==` compare uniquement la valeur (avec conversion de type implicite, "Juggling"). Ex: `'1' == 1` est Vrai.
`===` compare la valeur ET le type. Ex: `'1' === 1` est Faux. Il faut toujours privilégier `===`.

#### 3. Q : Quelle est la différence entre `include` et `require` ?

##### Réponse {collapsible="true"}

Les deux incluent un fichier. Si le fichier est introuvable :

- `include` génère un avertissement (`E_WARNING`) mais le script continue.
- `require` génère une erreur fatale (`E_COMPILE_ERROR`) et arrête l'exécution du script.
  Il existe aussi `_once` (ex: `require_once`) pour empêcher l'inclusion multiple.

#### 4. Q : Qu'est-ce qu'une Superglobale ? Citez-en 3.

##### Réponse {collapsible="true"}

Ce sont des variables natives disponibles dans tous les contextes du script (portée globale). Exemples :

- `$_POST` (données de formulaire envoyées en POST).
- `$_GET` (paramètres d'URL).
- `$_SESSION` (variables de session).
- `$_SERVER` (infos serveur et headers).

#### 5. Q : Quelle est la différence entre `isset()`, `empty()` et `is_null()` ?

##### Réponse {collapsible="true"}

- `isset()` : Vrai si la variable existe et n'est pas NULL.
- `is_null()` : Vrai si la variable est strictement NULL.
- `empty()` : Vrai si la variable n'existe pas OU si elle est égale à "faux" (0, false, null, "", []).

#### 6. Q : Comment fonctionnent les guillemets simples `'` vs guillemets doubles `"` ?

##### Réponse {collapsible="true"}

- Guillemets simples `'` : Le contenu est traité littéralement. Les variables ne sont pas interprétées.
- Guillemets doubles `"` : PHP interprète les variables (`$var`) et les caractères d'échappement (`\n`) à l'intérieur.

#### 7. Q : Qu'est-ce que la portée (scope) d'une variable en PHP ?

##### Réponse {collapsible="true"}

C'est le contexte où une variable est définie. En PHP, une variable déclarée hors d'une fonction a une portée globale,
mais n'est **pas** accessible directement dans une fonction (sauf avec le mot-clé `global`). Une variable dans une
fonction est locale.

#### 8. Q : À quoi sert l'opérateur `<=>` (Spaceship operator) ?

##### Réponse {collapsible="true"}

Introduit en PHP 7, il compare deux expressions. Il retourne :

- `-1` si gauche < droite
- `0` si gauche == droite
- `1` si gauche > droite
  Très utile pour les fonctions de tri (`usort`).

#### 9. Q : Qu'est-ce que l'opérateur de coalescence nulle `??` ?

##### Réponse {collapsible="true"}

C'est un raccourci pour `isset()`. `$a = $b ?? 'default';` signifie : si `$b` existe et n'est pas null, `$a` prend la
valeur de `$b`, sinon `$a` prend `'default'`.

#### 10. Q : Comment définissez-vous une constante en PHP ?

##### Réponse {collapsible="true"}

Soit avec la fonction `define('NOM', 'valeur')` (global, runtime), soit avec le mot clé `const NOM = 'valeur'` (compile
time, utilisable dans les classes et namespaces).

---

### Partie 2 : Tableaux et Fonctions

#### 11. Q : Quelle est la différence entre un tableau indexé et un tableau associatif ?

##### Réponse {collapsible="true"}

- Indexé : Les clés sont des entiers numériques auto-incrémentés (`$tab[0]`).
- Associatif : Les clés sont des chaînes de caractères définies par le développeur (`$tab['nom']`). En PHP, tous les
  tableaux sont en réalité des cartes ordonnées (hash maps).

#### 12. Q : Comment parcourir un tableau en PHP ?

##### Réponse {collapsible="true"}

La boucle `foreach` est la plus adaptée : `foreach ($array as $key => $value) { ... }`. On peut aussi utiliser `for`,
`while` ou des fonctions comme `array_map`/`array_walk`.

#### 13. Q : Qu'est-ce qu'une fonction anonyme (Closure) ?

##### Réponse {collapsible="true"}

C'est une fonction sans nom, souvent utilisée comme callback. Elle peut capturer des variables du contexte parent avec
le mot clé `use`.
Ex: `$greet = function($name) use ($prefix) { return $prefix . $name; };`.

#### 14. Q : Qu'est-ce qu'une "Arrow Function" (Fonction fléchée) en PHP (`fn`) ?

##### Réponse {collapsible="true"}

Introduite en PHP 7.4, c'est une syntaxe plus courte pour les fonctions anonymes simples. Elle capture automatiquement
les variables du scope parent (pas besoin de `use`).
Ex: `fn($x) => $x + $y`.

#### 15. Q : Quelle est la différence entre le passage par valeur et par référence (`&`) ?

##### Réponse {collapsible="true"}

- Par valeur (défaut) : La fonction reçoit une copie de la variable. Modifier l'argument dans la fonction ne change pas
  la variable originale.
- Par référence (`&$arg`) : La fonction reçoit une référence vers la variable originale. La modifier impacte la variable
  originale hors de la fonction.

#### 16. Q : Expliquez `implode()` et `explode()`.

##### Réponse {collapsible="true"}

- `explode(separator, string)` : Coupe une chaîne en tableau selon un séparateur.
- `implode(separator, array)` : Rassemble les éléments d'un tableau en une chaîne jointe par un séparateur.

#### 17. Q : Qu'est-ce que le "Type Hinting" (Typage des arguments) ?

##### Réponse {collapsible="true"}

C'est le fait de spécifier le type attendu d'un argument ou le type de retour d'une fonction.
Ex: `function add(int $a, int $b): int { ... }`. Si le type strict est activé (`declare(strict_types=1);`), PHP lancera
une erreur en cas de non-respect.

---

### Partie 3 : Programmation Orientée Objet (POO)

#### 18. Q : Quelle est la différence entre `$this` et `self` ?

##### Réponse {collapsible="true"}

- `$this` fait référence à l'**instance** courante de l'objet (utilisé pour accéder aux propriétés/méthodes
  non-statiques).
- `self` fait référence à la **classe** elle-même (utilisé pour accéder aux constantes et aux propriétés/méthodes
  statiques).

#### 19. Q : Expliquez les modificateurs de visibilité (`public`, `private`, `protected`).

##### Réponse {collapsible="true"}

- `public` : Accessible de partout.
- `protected` : Accessible uniquement dans la classe elle-même et ses classes filles (héritage).
- `private` : Accessible uniquement dans la classe elle-même.

#### 20. Q : Qu'est-ce qu'une classe abstraite ?

##### Réponse {collapsible="true"}

Une classe qui ne peut pas être instanciée directement. Elle sert de base pour d'autres classes. Elle peut contenir des
méthodes avec du code et des méthodes abstraites (sans code) que les enfants *doivent* implémenter.

#### 21. Q : Qu'est-ce qu'une Interface ?

##### Réponse {collapsible="true"}

C'est un contrat. Elle ne contient que des signatures de méthodes (publiques) sans implémentation (pas de code). Une
classe qui implémente une interface s'engage à définir toutes ses méthodes. Une classe peut implémenter plusieurs
interfaces.

#### 22. Q : Qu'est-ce qu'un Trait ?

##### Réponse {collapsible="true"}

PHP ne supporte pas l'héritage multiple. Les Traits permettent de réutiliser des méthodes dans plusieurs classes
indépendantes (héritage horizontal). On utilise `use MonTrait;` dans la classe.

#### 23. Q : Qu'est-ce qu'une méthode statique ?

##### Réponse {collapsible="true"}

C'est une méthode qui appartient à la classe et non à une instance. On l'appelle avec `::` (ex: `User::getCount()`) sans
avoir besoin de faire `new User()`.

#### 24. Q : Qu'est-ce que le constructeur (`__construct`) ?

##### Réponse {collapsible="true"}

C'est une "méthode magique" appelée automatiquement lors de la création d'un nouvel objet (`new Class()`). On l'utilise
pour initialiser les propriétés de l'objet ou injecter des dépendances.

#### 25. Q : Qu'est-ce que l'injection de dépendances ?

##### Réponse {collapsible="true"}

C'est passer les objets dont une classe a besoin (dépendances) via son constructeur ou une méthode, plutôt que de les
créer à l'intérieur avec `new`. Cela découple le code et facilite les tests unitaires.

#### 26. Q : Qu'est-ce qu'un Namespace (Espace de noms) ?

##### Réponse {collapsible="true"}

C'est un moyen d'organiser les classes et d'éviter les collisions de noms (avoir deux classes `User` dans deux
bibliothèques différentes). On les déclare avec `namespace App\Model;` et on les utilise avec `use`.

#### 27. Q : Citez quelques méthodes magiques autres que le constructeur.

##### Réponse {collapsible="true"}

- `__toString()` : Appelé quand on essaie d'afficher l'objet comme une string.
- `__get($name)` / `__set($name, $val)` : Appelés quand on accède à une propriété inaccessible.
- `__invoke()` : Appelé quand on essaie d'utiliser l'objet comme une fonction.

#### 28. Q : Qu'est-ce que l'héritage et quel mot-clé utilise-t-on ?

##### Réponse {collapsible="true"}

C'est le mécanisme permettant à une classe fille de récupérer les propriétés et méthodes d'une classe mère. On utilise
le mot-clé `extends`. PHP supporte l'héritage simple uniquement.

#### 29. Q : Qu'est-ce que `parent::` ?

##### Réponse {collapsible="true"}

C'est un mot-clé permettant d'appeler une méthode ou un constructeur de la classe parente, souvent utilisé lors de la
redéfinition d'une méthode pour conserver le comportement d'origine (`parent::__construct()`).

#### 30. Q : Qu'est-ce que la "Constructor Promotion" (PHP 8) ?

##### Réponse {collapsible="true"}

C'est une syntaxe simplifiée pour déclarer et initialiser des propriétés directement dans la signature du constructeur.
Ex: `public function __construct(public int $id, private string $name) {}` remplace la déclaration des attributs +
l'assignation `$this->id = $id`.

---

### Partie 4 : Web, Sécurité et Base de données

#### 31. Q : Comment démarrer une session en PHP ?

##### Réponse {collapsible="true"}

Avec la fonction `session_start()`. Elle doit être appelée avant tout envoi de HTML (output). Elle permet d'accéder au
tableau `$_SESSION` pour stocker des données entre les pages.

#### 32. Q : Qu'est-ce que PDO ?

##### Réponse {collapsible="true"}

PDO (PHP Data Objects) est une extension définissant une interface légère et cohérente pour accéder aux bases de données
en PHP. Elle permet de changer de SGBD (MySQL, PostgreSQL) sans tout réécrire et supporte les requêtes préparées.

#### 33. Q : Comment se protéger contre les Injections SQL en PHP ?

##### Réponse {collapsible="true"}

En utilisant impérativement les **requêtes préparées** avec PDO (`prepare()` puis `execute()`). Les paramètres sont
envoyés séparément de la requête SQL, empêchant leur interprétation comme du code SQL.

#### 34. Q : Comment se protéger contre les failles XSS (Cross-Site Scripting) ?

##### Réponse {collapsible="true"}

Il faut échapper les données affichées dans le HTML. En PHP natif, on utilise
`htmlspecialchars($string, ENT_QUOTES, 'UTF-8')` qui convertit les caractères spéciaux (`<`, `>`, `&`) en entités HTML.
Les moteurs de templates (Twig, Blade) le font souvent automatiquement.

#### 35. Q : Comment hachez-vous un mot de passe de manière sécurisée ?

##### Réponse {collapsible="true"}

J'utilise `password_hash($pass, PASSWORD_DEFAULT)` (qui utilise Bcrypt ou Argon2) pour le stocker. Pour vérifier,
j'utilise `password_verify($input, $hash)`. Ne jamais utiliser MD5 ou SHA1 qui sont obsolètes.

#### 36. Q : Qu'est-ce que Composer ?

##### Réponse {collapsible="true"}

C'est le gestionnaire de dépendances standard de PHP. Il permet d'installer des bibliothèques (packages) tierces
déclarées dans un fichier `composer.json` et gère l'autoloading des classes.

#### 37. Q : Qu'est-ce que l'Autoloading (PSR-4) ?

##### Réponse {collapsible="true"}

C'est un mécanisme qui charge automatiquement les fichiers de classes lorsqu'on en a besoin, évitant les `require`
manuels partout. Composer fournit un autoloader performant qui suit la norme PSR-4 (mapping entre Namespaces et
dossiers).

#### 38. Q : Comment gérer l'upload d'un fichier en PHP ?

##### Réponse {collapsible="true"}

Il faut un formulaire avec `enctype="multipart/form-data"`. PHP remplit la superglobale `$_FILES`. On vérifie les
erreurs, la taille, et surtout le **type MIME** (ne pas se fier à l'extension). On déplace ensuite le fichier temporaire
avec `move_uploaded_file()`.

#### 39. Q : Qu'est-ce que la fonction `header()` ?

##### Réponse {collapsible="true"}

Elle permet d'envoyer un en-tête HTTP brut au client. On l'utilise pour les redirections (`header('Location: ...')`),
définir le type de contenu (`header('Content-Type: application/json')`) ou gérer le cache.

#### 40. Q : Comment lire et écrire dans un fichier JSON ?

##### Réponse {collapsible="true"}

- Lire : `file_get_contents('file.json')` puis `json_decode($json, true)`.
- Écrire : `json_encode($array)` puis `file_put_contents('file.json', $json)`.

---

### Partie 5 : PHP Moderne et Avancé

#### 41. Q : Qu'est-ce que le typage strict (`declare(strict_types=1);`) ?

##### Réponse {collapsible="true"}

Par défaut, PHP essaie de convertir les types (coercition). En mode strict (déclaré en haut du fichier), PHP lancera une
`TypeError` si le type passé à une fonction ne correspond pas exactement au type attendu (ex: passer une string "1"
alors qu'un int est attendu).

#### 42. Q : Qu'est-ce que l'expression `match` (PHP 8) ?

##### Réponse {collapsible="true"}

C'est une évolution du `switch`. `match` est une expression (elle retourne une valeur), elle fait une comparaison
stricte (`===`), ne nécessite pas de `break`, et est plus concise.

#### 43. Q : Que sont les Attributs (Attributes) en PHP 8 ?

##### Réponse {collapsible="true"}

C'est une manière native d'ajouter des métadonnées aux classes, méthodes ou propriétés (ex: `#[Route('/api')]`). Cela
remplace les annotations PHPDoc (commentaires) utilisées auparavant par des frameworks comme Symfony.

#### 44. Q : Qu'est-ce qu'un Générateur (`yield`) ?

##### Réponse {collapsible="true"}

C'est une fonction qui retourne un itérateur. Au lieu de retourner un tableau complet (gourmand en mémoire), elle
utilise `yield` pour retourner les valeurs une par une à la demande lors d'une boucle. Idéal pour traiter de très gros
fichiers (CSV, Logs).

#### 45. Q : Qu'est-ce que l'interface `JsonSerializable` ?

##### Réponse {collapsible="true"}

Si une classe implémente cette interface, elle doit définir la méthode `jsonSerialize()`. Cela permet de contrôler
exactement quelles données sont retournées lorsque l'objet est passé à `json_encode()`.

#### 46. Q : Qu'est-ce que le "Nullsafe Operator" `?->` (PHP 8) ?

##### Réponse {collapsible="true"}

Il permet d'enchaîner des appels de méthodes sans vérifier si chaque étape est null.
Ex: `$country = $user?->getAddress()?->getCountry();`. Si `getAddress()` renvoie null, la chaîne s'arrête et retourne
null sans planter.

#### 47. Q : Qu'est-ce que les "Named Arguments" (Arguments nommés) ?

##### Réponse {collapsible="true"}

Depuis PHP 8, on peut passer des arguments à une fonction en spécifiant le nom du paramètre, ce qui permet de ne pas
respecter l'ordre et de sauter des paramètres optionnels.
Ex: `setCookie(name: 'test', secure: true);`.

#### 48. Q : Qu'est-ce qu'une exception et comment la gérer (`try-catch-finally`) ?

##### Réponse {collapsible="true"}

Une exception est une erreur objet lancée (`throw`). On entoure le code à risque d'un `try`, on attrape l'erreur dans
`catch` pour la gérer, et le bloc `finally` (optionnel) s'exécute toujours (utile pour fermer des fichiers/connexions).

#### 49. Q : Qu'est-ce que les Union Types (PHP 8) ?

##### Réponse {collapsible="true"}

On peut spécifier qu'une variable ou un retour de fonction peut être de plusieurs types différents.
Ex: `private int|float $number;`.

#### 50. Q : Qu'est-ce qu'un serveur PHP intégré ?

##### Réponse {collapsible="true"}

PHP possède un serveur web interne pour le développement (pas pour la prod). On le lance en ligne de commande avec
`php -S localhost:8000`. Cela permet de tester rapidement sans installer Apache ou Nginx.