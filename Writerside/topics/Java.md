# Questions sur Java

### Partie 1 : Fondamentaux et Fonctionnement (JVM)

#### 1. Q : Quelle est la différence entre JDK, JRE et JVM ?

##### Réponse {collapsible="true"}

- **JVM (Java Virtual Machine)** : Machine virtuelle qui exécute le bytecode Java.
- **JRE (Java Runtime Environment)** : Contient la JVM + les bibliothèques de classes standard pour *exécuter* un
  programme.
- **JDK (Java Development Kit)** : Contient le JRE + les outils de développement (compilateur `javac`, débogueur).

#### 2. Q : Java est-il un langage "pass-by-value" ou "pass-by-reference" ?

##### Réponse {collapsible="true"}

Java est strictement **pass-by-value** (passage par valeur). Pour les types primitifs, c'est la valeur réelle qui est
copiée. Pour les objets, c'est la **valeur de la référence** (l'adresse mémoire) qui est copiée, pas l'objet lui-même.

#### 3. Q : Quelle est la différence entre la mémoire Stack et la mémoire Heap ?

##### Réponse {collapsible="true"}

- **Stack (Pile)** : Stocke les variables locales, les appels de méthodes et les références aux objets. Mémoire
  temporaire, rapide, nettoyée à la fin du bloc/méthode.
- **Heap (Tas)** : Stocke les objets eux-mêmes (`new Object()`). Mémoire globale, gérée par le Garbage Collector.

#### 4. Q : Qu'est-ce que le Garbage Collector (GC) ?

##### Réponse {collapsible="true"}

C'est un processus automatique de la JVM qui libère la mémoire occupée par les objets qui ne sont plus référencés par le
programme (objets inaccessibles), évitant ainsi d'avoir à gérer la mémoire manuellement (`malloc`/`free`).

#### 5. Q : À quoi sert le mot-clé `static` ?

##### Réponse {collapsible="true"}

Il indique qu'un membre (attribut ou méthode) appartient à la **classe** et non à une instance spécifique. On peut
l'appeler sans créer d'objet (`Classe.methode()`). Il n'y a qu'une seule copie d'une variable statique partagée par
toutes les instances.

#### 6. Q : Que signifie le mot-clé `final` dans ses 3 contextes (variable, méthode, classe) ?

##### Réponse {collapsible="true"}

- **Variable** : Sa valeur (ou référence) ne peut plus être modifiée une fois initialisée (constante).
- **Méthode** : Elle ne peut pas être redéfinie (Overridden) dans une classe fille.
- **Classe** : Elle ne peut pas être héritée (`extends` interdit).

#### 7. Q : Qu'est-ce que l'Autoboxing et l'Unboxing ?

##### Réponse {collapsible="true"}

C'est la conversion automatique faite par le compilateur entre un type primitif (ex: `int`) et sa classe Wrapper
correspondante (ex: `Integer`).

- Autoboxing : `int` -> `Integer`.
- Unboxing : `Integer` -> `int`.

---

### Partie 2 : Programmation Orientée Objet (POO)

#### 8. Q : Expliquez la différence entre Surcharge (Overloading) et Redéfinition (Overriding).

##### Réponse {collapsible="true"}

- **Surcharge** : Même nom de méthode dans la même classe, mais signatures (paramètres) différentes. (Polymorphisme
  statique).
- **Redéfinition** : Même nom et même signature dans une classe fille pour changer le comportement hérité. (
  Polymorphisme dynamique).

#### 9. Q : Pourquoi Java ne supporte-t-il pas l'héritage multiple de classes ?

##### Réponse {collapsible="true"}

Pour éviter le "problème du diamant" (ambiguïté si deux classes parentes ont la même méthode). Java permet cependant
l'héritage multiple d'**interfaces** (ou l'implémentation multiple).

#### 10. Q : Quelle est la différence entre une Classe Abstraite et une Interface ?

##### Réponse {collapsible="true"}

- **Classe Abstraite** : Peut avoir un état (attributs), des constructeurs et des méthodes avec corps. Une classe ne
  peut en hériter qu'une seule.
- **Interface** : Contrat de méthodes (par défaut publiques et abstraites). Peut avoir des constantes (`static final`)
  et des méthodes par défaut (Java 8). Une classe peut en implémenter plusieurs.

#### 11. Q : À quoi sert le mot-clé `super` ?

##### Réponse {collapsible="true"}

Il permet d'accéder aux membres de la classe parente.

- `super.methode()` : Appelle la méthode du parent.
- `super()` : Appelle le constructeur du parent (doit être la première ligne du constructeur enfant).

#### 12. Q : Qu'est-ce que le polymorphisme ?

##### Réponse {collapsible="true"}

C'est la capacité d'un objet à prendre plusieurs formes. En Java, une variable de type `Animal` peut référencer une
instance de `Chien` ou `Chat`. La méthode exécutée sera celle de l'instance réelle (Chien ou Chat) au moment de
l'exécution.

#### 13. Q : Qu'est-ce que l'encapsulation ?

##### Réponse {collapsible="true"}

C'est le principe de masquer les détails internes d'une classe (attributs `private`) et de ne fournir l'accès que via
des méthodes publiques (Getters/Setters). Cela protège l'intégrité des données.

#### 14. Q : Quels sont les modificateurs d'accès en Java (du plus restrictif au plus ouvert) ?

##### Réponse {collapsible="true"}

1. `private` : Visible uniquement dans la classe.
2. (default / package-private) : Visible dans le même package.
3. `protected` : Visible dans le même package ET par les classes filles (même hors package).
4. `public` : Visible partout.

#### 15. Q : À quoi sert l'opérateur `instanceof` ?

##### Réponse {collapsible="true"}

Il permet de tester si un objet est une instance d'une classe spécifique ou d'une interface, souvent avant de faire un
cast explicite pour éviter une `ClassCastException`.

#### 16. Q : Qu'est-ce qu'une classe imbriquée statique (Static Nested Class) vs Classe interne (Inner Class) ?

##### Réponse {collapsible="true"}

- **Static Nested** : Associée à la classe externe, pas à une instance. Peut être instanciée sans instance de la classe
  externe.
- **Inner Class** : Associée à une *instance* de la classe externe. A accès aux membres de l'instance externe.

---

### Partie 3 : La classe Object et String

#### 17. Q : Quelle est la différence entre `==` et `.equals()` ?

##### Réponse {collapsible="true"}

- `==` : Compare les références mémoire (est-ce le même objet ?). Pour les primitifs, compare les valeurs.
- `.equals()` : Méthode à redéfinir pour comparer le contenu sémantique des objets (ex: deux Strings ayant le même
  texte).

#### 18. Q : Quel est le contrat entre `hashCode()` et `equals()` ?

##### Réponse {collapsible="true"}

Si deux objets sont égaux selon `.equals()`, ils **DOIVENT** avoir le même `hashCode()`. L'inverse n'est pas
obligatoire (collision). C'est crucial pour le bon fonctionnement des `HashMap` et `HashSet`.

#### 19. Q : Pourquoi la classe `String` est-elle immuable (Immutable) ?

##### Réponse {collapsible="true"}

Pour la sécurité, la mise en cache (String Pool), et la performance des HashCode. Une fois créée, une String ne peut pas
changer. Toute modification crée en réalité un nouvel objet String.

#### 20. Q : Qu'est-ce que le String Pool ?

##### Réponse {collapsible="true"}

C'est une zone spéciale de la mémoire Heap où Java stocke les littéraux de chaînes. Si on crée `String s1 = "Java"` et
`String s2 = "Java"`, s1 et s2 pointeront vers le même objet mémoire pour économiser de la place.

#### 21. Q : Quelle est la différence entre `StringBuilder` et `String` ?

##### Réponse {collapsible="true"}

`String` est immuable (concaténer crée beaucoup d'objets temporaires). `StringBuilder` est mutable : on peut modifier la
chaîne interne sans créer de nouveaux objets, ce qui est beaucoup plus performant pour les concaténations en boucle.

#### 22. Q : À quoi sert la méthode `toString()` ?

##### Réponse {collapsible="true"}

Elle retourne une représentation textuelle de l'objet. Par défaut, elle affiche `NomClasse@Hashcode`. Il est recommandé
de la redéfinir pour faciliter le débogage et le logging.

---

### Partie 4 : Gestion des Exceptions

#### 23. Q : Quelle est la hiérarchie de base des exceptions (Throwable) ?

##### Réponse {collapsible="true"}

`Throwable` est la racine. Elle a deux sous-classes :

- `Error` : Problèmes graves de la JVM (OutOfMemoryError), on ne les attrape généralement pas.
- `Exception` : Problèmes applicatifs qu'on peut gérer.

#### 24. Q : Quelle est la différence entre Checked et Unchecked Exceptions ?

##### Réponse {collapsible="true"}

- **Checked** (hérite de `Exception`) : Le compilateur oblige à les gérer (`try-catch` ou `throws`). Ex: `IOException`,
  `SQLException`.
- **Unchecked** (hérite de `RuntimeException`) : Le compilateur n'oblige rien. Indique souvent un bug de programmation.
  Ex: `NullPointerException`, `IndexOutOfBoundsException`.

#### 25. Q : Quelle est la différence entre `throw` et `throws` ?

##### Réponse {collapsible="true"}

- `throw` : Instruction utilisée pour lever explicitement une exception dans le code (`throw new Exception()`).
- `throws` : Déclaration dans la signature de la méthode indiquant qu'elle *peut* renvoyer tel type d'exception.

#### 26. Q : Le bloc `finally` s'exécute-t-il toujours ?

##### Réponse {collapsible="true"}

Oui, il s'exécute toujours après le `try` (et le `catch` éventuel), que l'exception soit levée ou non. Seule exception :
si `System.exit()` est appelé ou si la JVM crashe.

#### 27. Q : Qu'est-ce que le "Try-with-resources" (Java 7+) ?

##### Réponse {collapsible="true"}

C'est une syntaxe `try (Resource r = new Resource()) { ... }` qui ferme automatiquement les ressources (qui implémentent
`AutoCloseable`) à la fin du bloc, évitant d'avoir à écrire le `finally` et le `close()` manuellement.

---

### Partie 5 : Collections et Génériques

#### 28. Q : Qu'est-ce que les Génériques (Generics) et à quoi servent-ils ?

##### Réponse {collapsible="true"}

Ils permettent de paramétrer les types (ex: `List<String>`). Cela assure la sécurité de type à la compilation (on ne
peut pas mettre un `Integer` dans une liste de `String`) et évite les casts manuels à la lecture.

#### 29. Q : Quelle est la différence entre `ArrayList` et `LinkedList` ?

##### Réponse {collapsible="true"}

- `ArrayList` : Tableau dynamique. Accès rapide par index (O(1)), mais insertion/suppression lente au milieu (décalage
  de tableau).
- `LinkedList` : Liste doublement chaînée. Accès lent par index (O(n)), mais insertion/suppression rapide si on a la
  référence du nœud.

#### 30. Q : Comment fonctionne une `HashMap` en interne ?

##### Réponse {collapsible="true"}

Elle utilise un tableau de "buckets". Elle calcule le `hashCode()` de la clé pour trouver l'index. Si plusieurs clés ont
le même hash (collision), elles sont stockées sous forme de liste chaînée (ou arbre rouge-noir depuis Java 8) dans le
même bucket.

#### 31. Q : Quelle est la différence entre `Set` et `List` ?

##### Réponse {collapsible="true"}

- `List` (ex: ArrayList) : Collection ordonnée qui accepte les doublons.
- `Set` (ex: HashSet) : Collection non ordonnée (généralement) qui **interdit** les doublons.

#### 32. Q : Quelle est la différence entre `Comparable` et `Comparator` ?

##### Réponse {collapsible="true"}

- `Comparable` (interface) : Implémentée par la classe elle-même (`compareTo`), définit son "ordre naturel" (ex: tri
  alphabétique pour String).
- `Comparator` (interface) : Classe externe séparée (`compare`), permet de définir plusieurs stratégies de tri
  personnalisées sans modifier la classe de l'objet.

#### 33. Q : Qu'est-ce que l'effacement de type (Type Erasure) ?

##### Réponse {collapsible="true"}

C'est le fait que le compilateur Java supprime les informations de type générique après la compilation. Au runtime,
`List<String>` et `List<Integer>` sont vus comme des `List` brutes (raw type). C'est pour la rétrocompatibilité.

#### 34. Q : Qu'est-ce que `ConcurrentModificationException` (dans un contexte monothread) ?

##### Réponse {collapsible="true"}

Elle survient si on modifie la structure d'une collection (ajout/suppression via `list.remove()`) pendant qu'on est en
train de l'itérer avec un `Iterator` ou une boucle `for-each`. Il faut utiliser `iterator.remove()` pour le faire
proprement.

---

### Partie 6 : Java 8+ et Fonctionnel (Sans streams parallèles)

#### 35. Q : Qu'est-ce qu'une Expression Lambda ?

##### Réponse {collapsible="true"}

C'est une fonction anonyme concise qui permet d'implémenter une interface fonctionnelle.
Syntaxe : `(paramètres) -> expression`. Ex: `x -> x * 2`.

#### 36. Q : Qu'est-ce qu'une Interface Fonctionnelle ?

##### Réponse {collapsible="true"}

C'est une interface qui ne contient qu'une seule méthode abstraite. Elle peut être implémentée par une Lambda.
Exemples : `Runnable`, `Callable`, `Predicate`, `Function`. Annotée avec `@FunctionalInterface`.

#### 37. Q : Qu'est-ce que l'API Stream ?

##### Réponse {collapsible="true"}

C'est une abstraction permettant de traiter des séquences d'éléments (collections) de manière déclarative (style SQL).
Elle supporte les opérations comme `filter`, `map`, `reduce`. Un Stream ne stocke pas de données.

#### 38. Q : Quelle est la différence entre une opération intermédiaire et terminale sur un Stream ?

##### Réponse {collapsible="true"}

- **Intermédiaire** (ex: `filter`, `map`) : Retourne un nouveau Stream, est paresseuse (lazy), ne s'exécute pas tout de
  suite.
- **Terminale** (ex: `collect`, `forEach`, `count`) : Déclenche le traitement du pipeline et retourne un résultat ou
  void. Le stream est consommé.

#### 39. Q : À quoi sert la classe `Optional` ?

##### Réponse {collapsible="true"}

C'est un conteneur qui peut contenir ou non une valeur non-nulle. Elle vise à éviter les `NullPointerException` en
forçant le développeur à gérer explicitement le cas d'absence de valeur (`isPresent()`, `orElse()`, `ifPresent()`).

#### 40. Q : Qu'est-ce qu'une référence de méthode (`::`) ?

##### Réponse {collapsible="true"}

C'est une syntaxe raccourcie pour une lambda qui ne fait qu'appeler une méthode existante.
Ex: `System.out::println` est équivalent à `x -> System.out.println(x)`.

#### 41. Q : Que sont les méthodes par défaut (`default`) dans les interfaces ?

##### Réponse {collapsible="true"}

Depuis Java 8, on peut ajouter du code concret dans une interface avec le mot-clé `default`. Cela permet de faire
évoluer les interfaces sans casser les classes qui les implémentent déjà.

---

### Partie 7 : I/O, Sérialisation et Divers

#### 42. Q : Qu'est-ce que la Sérialisation ?

##### Réponse {collapsible="true"}

C'est le processus de conversion d'un objet en un flux d'octets pour le stocker (fichier) ou le transmettre (réseau). La
classe doit implémenter l'interface marqueur `Serializable`.

#### 43. Q : À quoi sert le mot-clé `transient` ?

##### Réponse {collapsible="true"}

Il s'utilise sur un attribut d'une classe pour indiquer qu'il ne doit **pas** être sérialisé. Lors de la
désérialisation, cet attribut prendra sa valeur par défaut (null, 0, false).

#### 44. Q : Qu'est-ce que `serialVersionUID` ?

##### Réponse {collapsible="true"}

C'est un identifiant unique de version pour une classe sérialisable. Il assure que l'objet sérialisé et la classe
chargée pour le désérialiser sont compatibles. S'ils diffèrent, une `InvalidClassException` est levée.

#### 45. Q : Quelle est la différence entre Byte Stream et Character Stream ?

##### Réponse {collapsible="true"}

- **Byte Stream** (ex: `FileInputStream`) : Manipule des octets bruts (8-bit). Pour les données binaires (images, son).
- **Character Stream** (ex: `FileReader`) : Manipule des caractères (16-bit Unicode). Pour les fichiers texte, gère
  l'encodage.

#### 46. Q : Qu'est-ce qu'une énumération (`enum`) en Java ?

##### Réponse {collapsible="true"}

C'est un type spécial de classe qui représente un ensemble fixe de constantes (ex: `JOURS_SEMAINE`). En Java, les enums
sont puissants : ils peuvent avoir des constructeurs, des attributs et des méthodes.

#### 47. Q : Qu'est-ce que le mot-clé `var` (Java 10+) ?

##### Réponse {collapsible="true"}

Il permet l'inférence de type pour les variables locales. Le compilateur devine le type selon la valeur assignée.
Ex: `var liste = new ArrayList<String>();` (liste est typée `ArrayList<String>`).

#### 48. Q : Qu'est-ce qu'un `Record` (Java 14+) ?

##### Réponse {collapsible="true"}

C'est une classe immuable concise destinée à stocker des données (Data Carrier). Le compilateur génère automatiquement
le constructeur, les accesseurs, `equals`, `hashCode` et `toString`.
Ex: `public record Point(int x, int y) {}`.

#### 49. Q : Qu'est-ce que la Réflexion (Reflection) ?

##### Réponse {collapsible="true"}

C'est une API qui permet à un programme d'inspecter et de modifier son propre comportement au runtime (ex: lister les
méthodes d'une classe, instancier un objet par son nom de classe, accéder à un champ privé). Très utilisé par les
frameworks, mais lent et dangereux.

#### 50. Q : Qu'est-ce que le bloc d'initialisation statique (`static { ... }`) ?

##### Réponse {collapsible="true"}

C'est un bloc de code dans une classe qui s'exécute une seule fois, au moment où la classe est chargée en mémoire par la
JVM (ClassLoader), avant même la création de toute instance. Utile pour initialiser des variables statiques complexes.