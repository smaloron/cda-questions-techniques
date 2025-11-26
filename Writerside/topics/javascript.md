# Questions sur Javascript

### Partie 1 : Les Bases, Types et Opérateurs

#### 1. Q : Quelle est la différence entre `var`, `let` et `const` ?

##### Réponse {collapsible="true"}

- `var` : Portée fonctionnelle (function scope), sujet au "hoisting" (hissage), réassignable. Obsolète en ES6+.
- `let` : Portée de bloc (block scope `{}`), pas de hoisting accessible (Zone Morte Temporaire), réassignable.
- `const` : Portée de bloc, doit être initialisé immédiatement, **non réassignable** (mais le contenu d'un objet/tableau
  reste mutable).

#### 2. Q : Quels sont les types primitifs en JS ?

##### Réponse {collapsible="true"}

Il y en a 7 : `string`, `number`, `boolean`, `null`, `undefined`, `symbol` (ES6) et `bigint` (ES2020). Tout le reste (
Arrays, Functions) est de type `object`.

#### 3. Q : Quelle est la différence entre `null` et `undefined` ?

##### Réponse {collapsible="true"}

- `undefined` : Une variable a été déclarée mais aucune valeur ne lui a été assignée. C'est le moteur JS qui le définit
  par défaut.
- `null` : C'est une assignation intentionnelle de "rien" ou "vide". C'est le développeur qui le définit.
  Note : `typeof null` retourne `'object'` (bug historique).

#### 4. Q : Expliquez la différence entre `==` et `===`.

##### Réponse {collapsible="true"}

- `==` (égalité lâche) : Tente de convertir les types avant de comparer (coercition). Ex: `'5' == 5` est Vrai.
- `===` (égalité stricte) : Compare la valeur ET le type sans conversion. Ex: `'5' === 5` est Faux. Toujours privilégier
  `===`.

#### 5. Q : Qu'est-ce que le "Hoisting" (Hissage) ?

##### Réponse {collapsible="true"}

C'est le comportement par défaut de JS qui déplace les déclarations de variables (`var`) et de fonctions nommées tout en
haut de leur portée avant l'exécution du code. Cela permet d'appeler une fonction avant de l'avoir déclarée dans le
code.

#### 6. Q : Qu'est-ce qu'une valeur "Falsy" ? Citez-en 5.

##### Réponse {collapsible="true"}

Une valeur qui se convertit en `false` dans un contexte booléen (`if`).
Les 6 principales sont : `false`, `0`, `""` (chaîne vide), `null`, `undefined`, et `NaN`.

#### 7. Q : Qu'est-ce que `NaN` et comment vérifier si une valeur est `NaN` ?

##### Réponse {collapsible="true"}

`NaN` signifie "Not a Number". C'est le résultat d'une opération mathématique invalide (ex: `'text' * 2`). Curieusement,
`typeof NaN` est `'number'`. On vérifie avec `Number.isNaN(valeur)`. Note : `NaN === NaN` est Faux.

#### 8. Q : Qu'est-ce que le mode strict (`"use strict"`) ?

##### Réponse {collapsible="true"}

C'est une directive qui active un mode plus rigoureux de JS. Il transforme certaines erreurs silencieuses en erreurs
bloquantes (ex: utiliser une variable non déclarée), empêche l'utilisation de mots réservés futurs et sécurise certains
comportements de `this`.

---

### Partie 2 : Fonctions et Portée (Scope)

#### 9. Q : Quelle est la différence entre une déclaration de fonction et une expression de fonction ?

##### Réponse {collapsible="true"}

- Déclaration : `function maFonction() {}`. Elle est "hoisted" (appelable avant définition).
- Expression : `const maFonction = function() {}`. Elle n'est pas "hoisted" (doit être définie avant appel).

#### 10. Q : Qu'est-ce qu'une "Closure" (Fermeture) ?

##### Réponse {collapsible="true"}

C'est une fonction qui "se souvient" de son environnement lexical (les variables déclarées autour d'elle) même
lorsqu'elle est exécutée en dehors de cet environnement. C'est la base des modules et de la confidentialité des
données (data privacy) en JS.

#### 11. Q : Qu'est-ce qu'une fonction fléchée (Arrow Function) et quelle est sa particularité avec `this` ?

##### Réponse {collapsible="true"}

Syntaxe ES6 courte : `const add = (a, b) => a + b`. Sa particularité majeure est qu'elle ne possède pas son propre
`this`. Elle hérite du `this` du contexte parent (lexical scoping), ce qui est très utile dans les callbacks ou les
classes.

#### 12. Q : Qu'est-ce qu'une IIFE (Immediately Invoked Function Expression) ?

##### Réponse {collapsible="true"}

C'est une fonction qui est exécutée dès qu'elle est définie.
Syntaxe : `(function() { ... })();`.
On l'utilisait historiquement pour créer une portée privée et éviter de polluer l'espace global (moins utile avec les
modules ES6).

#### 13. Q : À quoi servent `.call()`, `.apply()` et `.bind()` ?

##### Réponse {collapsible="true"}

Elles permettent de définir manuellement la valeur de `this` pour une fonction.

- `call(thisArg, p1, p2)` : Exécute la fonction immédiatement avec des arguments séparés.
- `apply(thisArg, [args])` : Exécute immédiatement avec un tableau d'arguments.
- `bind(thisArg)` : Retourne une **nouvelle fonction** avec le `this` fixé, sans l'exécuter tout de suite.

#### 14. Q : Qu'est-ce que l'argument `arguments` dans une fonction ?

##### Réponse {collapsible="true"}

C'est un objet "array-like" disponible dans les fonctions classiques (pas les fléchées) qui contient tous les paramètres
passés à la fonction, même s'ils n'ont pas été nommés dans la déclaration.

---

### Partie 3 : Tableaux et Objets

#### 15. Q : Quelle est la différence entre `.map()` et `.forEach()` ?

##### Réponse {collapsible="true"}

- `.forEach()` : Exécute une fonction sur chaque élément. Ne retourne rien (`undefined`). Utilisé pour les effets de
  bord.
- `.map()` : Crée et **retourne un nouveau tableau** contenant les résultats de la fonction appliquée à chaque élément.

#### 16. Q : Expliquez la méthode `.reduce()`.

##### Réponse {collapsible="true"}

Elle permet de réduire un tableau à une seule valeur (nombre, objet, string) en accumulant les résultats. Elle prend une
fonction callback `(accumulateur, valeurCourante)` et une valeur initiale optionnelle.

#### 17. Q : Quelle est la différence entre `.slice()` et `.splice()` ?

##### Réponse {collapsible="true"}

- `.slice(start, end)` : Retourne une copie d'une portion du tableau. **Ne modifie pas** le tableau original (Immuable).
- `.splice(start, count, items)` : Retire ou ajoute des éléments. **Modifie** le tableau original (Mutable).

#### 18. Q : Comment cloner un objet proprement (Deep copy vs Shallow copy) ?

##### Réponse {collapsible="true"}

- `const copy = { ...obj }` ou `Object.assign({}, obj)` fait une copie de surface (Shallow). Les sous-objets restent des
  références.
- Pour une copie profonde (Deep), on utilisait `JSON.parse(JSON.stringify(obj))` (avec des limitations). Aujourd'hui, on
  utilise la méthode native `structuredClone(obj)`.

#### 19. Q : Qu'est-ce que la déstructuration (Destructuring) ?

##### Réponse {collapsible="true"}

Une syntaxe ES6 pour extraire des valeurs de tableaux ou propriétés d'objets dans des variables distinctes.
Ex: `const { nom, age } = user;` ou `const [first, second] = monTableau;`.

#### 20. Q : À quoi sert l'opérateur Spread (`...`) ?

##### Réponse {collapsible="true"}

Il permet d'étendre un itérable (tableau, chaîne) en éléments individuels. Utile pour copier des tableaux (`[...arr]`),
fusionner des tableaux, ou passer les éléments d'un tableau comme arguments à une fonction.

#### 21. Q : Qu'est-ce qu'un Prototype en JS ?

##### Réponse {collapsible="true"}

JavaScript est un langage basé sur les prototypes. Chaque objet possède un lien interne vers un autre objet appelé son
prototype. Si on cherche une propriété qui n'existe pas sur l'objet, JS la cherche dans son prototype, et ainsi de
suite (Chaîne de prototypes).

#### 22. Q : Qu'est-ce que `this` en JavaScript ?

##### Réponse {collapsible="true"}

`this` fait référence à l'objet qui exécute la fonction courante. Sa valeur dépend de **comment** la fonction est
appelée (méthode d'objet, fonction simple, constructeur, event listener).

---

### Partie 4 : DOM et Événements

#### 23. Q : Quelle est la différence entre `document.getElementById` et `document.querySelector` ?

##### Réponse {collapsible="true"}

- `getElementById` : Sélectionne par ID, très rapide, retourne un élément ou null.
- `querySelector` : Sélectionne via un sélecteur CSS (ex: `.ma-class`, `#id`, `div > p`), plus polyvalent mais
  légèrement moins performant. Retourne le premier élément trouvé.

#### 24. Q : Qu'est-ce que le "Event Bubbling" (Bouillonnement) ?

##### Réponse {collapsible="true"}

Lorsqu'un événement (ex: click) se produit sur un élément, il se déclenche d'abord sur cet élément, puis remonte (
bulles) vers ses parents, puis grands-parents, jusqu'à `window`. C'est le comportement par défaut.

#### 25. Q : Qu'est-ce que la délégation d'événement (Event Delegation) ?

##### Réponse {collapsible="true"}

C'est une technique consistant à placer un écouteur d'événement sur un parent commun plutôt que sur chaque enfant
individuel. On utilise `event.target` pour savoir quel enfant a été cliqué. Cela économise la mémoire et gère les
éléments ajoutés dynamiquement.

#### 26. Q : Quelle est la différence entre `event.preventDefault()` et `event.stopPropagation()` ?

##### Réponse {collapsible="true"}

- `preventDefault()` : Empêche le comportement natif du navigateur (ex: soumission de formulaire, suivre un lien).
- `stopPropagation()` : Empêche l'événement de remonter (bubbling) vers les éléments parents.

#### 27. Q : Comment modifier le CSS d'un élément en JS ?

##### Réponse {collapsible="true"}

Soit via la propriété `style` (inline styles) : `element.style.color = 'red'`, soit, de préférence, en manipulant les
classes via `element.classList.add('active')` ou `.toggle()`.

#### 28. Q : Qu'est-ce que le DOM (Document Object Model) ?

##### Réponse {collapsible="true"}

C'est une représentation structurée du document HTML sous forme d'arbre d'objets. C'est l'interface qui permet à
JavaScript d'interagir avec la page web (lire, modifier, ajouter, supprimer du contenu et des styles).

#### 29. Q : Comment créer et ajouter un nouvel élément au DOM ?

##### Réponse {collapsible="true"}

1. Créer : `const div = document.createElement('div');`
2. Modifier : `div.textContent = 'Salut';`
3. Ajouter : `document.body.appendChild(div);` (ou `append`, `prepend`).

---

### Partie 5 : Asynchrone et Event Loop

#### 30. Q : Expliquez la différence entre Synchrone et Asynchrone.

##### Réponse {collapsible="true"}

- **Synchrone** : Les instructions sont exécutées l'une après l'autre. Une opération longue bloque la suite (blocking).
- **Asynchrone** : L'opération est lancée, le code continue son exécution sans attendre. Le résultat sera traité plus
  tard (callback, promise).

#### 31. Q : Qu'est-ce que l'Event Loop (Boucle d'événements) ?

##### Réponse {collapsible="true"}

JS est "single-threaded". L'Event Loop est le mécanisme qui permet de gérer l'asynchrone. Elle surveille la "Call
Stack" (pile d'exécution) et la "Callback Queue". Si la Stack est vide, elle prend la première tâche de la Queue et la
pousse dans la Stack pour exécution.

#### 32. Q : Qu'est-ce qu'une Promesse (Promise) et quels sont ses états ?

##### Réponse {collapsible="true"}

C'est un objet représentant la réussite ou l'échec éventuel d'une opération asynchrone.
3 états :

- **Pending** (En attente)
- **Fulfilled / Resolved** (Réussie)
- **Rejected** (Échouée)

#### 33. Q : Quelle est la différence entre `.then()` et `async/await` ?

##### Réponse {collapsible="true"}

`async/await` (ES2017) est du "sucre syntaxique" au-dessus des Promesses. Cela permet d'écrire du code asynchrone qui
ressemble à du code synchrone, le rendant plus lisible (`const res = await fetch(...)`) au lieu d'enchaîner les
`.then()`.

#### 34. Q : Qu'est-ce que le "Callback Hell" ?

##### Réponse {collapsible="true"}

C'est une situation où l'on imbrique de multiples callbacks les uns dans les autres (pyramide horizontale), rendant le
code illisible et difficile à maintenir. Les Promesses et Async/Await résolvent ce problème.

#### 35. Q : Que fait `Promise.all()` ?

##### Réponse {collapsible="true"}

Elle prend un tableau de Promesses et retourne une seule Promesse qui se résout quand **toutes** les promesses du
tableau sont résolues (parallélisme), ou échoue dès que l'une d'elles échoue.

#### 36. Q : Pourquoi `setTimeout(fn, 0)` ne s'exécute pas immédiatement ?

##### Réponse {collapsible="true"}

Parce que `setTimeout` est asynchrone. Même avec 0ms, la fonction callback est envoyée dans la "Task Queue". L'Event
Loop doit attendre que la "Call Stack" (le code synchrone en cours) soit totalement vide avant d'exécuter ce qui est
dans la Queue.

---

### Partie 6 : ES6+ et Fonctionnalités Modernes

#### 37. Q : Qu'est-ce qu'un Template Literal ?

##### Réponse {collapsible="true"}

C'est une chaîne de caractères délimitée par des backticks (`` ` ``). Elle permet l'interpolation de variables avec
`${var}`, le support multi-lignes sans échappement, et l'écriture plus lisible.

#### 38. Q : Comment définir des paramètres par défaut dans une fonction ?

##### Réponse {collapsible="true"}

Directement dans la signature : `function hello(name = 'Guest') { ... }`. Si l'argument est manquant ou `undefined`, la
valeur par défaut est utilisée.

#### 39. Q : Qu'est-ce qu'un Module ES6 (`import` / `export`) ?

##### Réponse {collapsible="true"}

C'est le standard officiel pour organiser le code JS en fichiers séparés.

- `export const a = 1;` ou `export default function() {}`
- `import { a } from './file.js'` ou `import func from './file.js'`
  Nécessite `type="module"` dans la balise script HTML.

#### 40. Q : Qu'est-ce qu'une `Class` en JS ?

##### Réponse {collapsible="true"}

C'est du sucre syntaxique introduit en ES6 pour faciliter la POO basée sur les prototypes. Elle offre une syntaxe plus
claire (`class`, `constructor`, `extends`, `super`) similaire à Java ou PHP, mais le fonctionnement interne reste
prototypal.

#### 41. Q : Qu'est-ce que `Map` et `Set` ?

##### Réponse {collapsible="true"}

- `Set` : Une collection de valeurs **uniques** (pas de doublons).
- `Map` : Une collection de paires clé-valeur où la clé peut être de n'importe quel type (même un objet ou une
  fonction), contrairement aux objets classiques où les clés sont des strings/symboles.

#### 42. Q : Qu'est-ce que l'Optional Chaining (`?.`) ?

##### Réponse {collapsible="true"}

Permet d'accéder à des propriétés profondes sans vérifier l'existence de chaque parent.
Ex: `user?.address?.street`. Si `address` est `null/undefined`, l'expression retourne `undefined` au lieu de planter (
Erreur "Cannot read property of undefined").

#### 43. Q : Qu'est-ce que le Nullish Coalescing Operator (`??`) ?

##### Réponse {collapsible="true"}

C'est un opérateur logique qui retourne l'opérande de droite si l'opérande de gauche est `null` ou `undefined` (et
seulement ceux-là).
Différent de `||` qui réagit à toutes les valeurs falsy (0, "").
Ex: `const score = 0 ?? 10` donne `0`. `const score = 0 || 10` donne `10`.

---

### Partie 7 : Web API et Divers

#### 44. Q : Comment fonctionne l'API `fetch` ?

##### Réponse {collapsible="true"}

C'est l'API moderne pour faire des requêtes HTTP (AJAX). Elle retourne une Promesse.
Ex: `fetch('/api').then(res => res.json()).then(data => console.log(data));`. Note : `fetch` ne rejette pas la promesse
sur les erreurs HTTP (404, 500), il faut vérifier `res.ok`.

#### 45. Q : Quelle est la différence entre `localStorage`, `sessionStorage` et les Cookies ?

##### Réponse {collapsible="true"}

- `localStorage` : Stockage persistant (~5-10Mo), ne s'efface pas.
- `sessionStorage` : Stockage temporaire, s'efface à la fermeture de l'onglet.
- Cookies : Petites données (~4Ko) envoyées au serveur à chaque requête HTTP.

#### 46. Q : Comment convertir une chaîne JSON en objet JS et inversement ?

##### Réponse {collapsible="true"}

- `JSON.parse(string)` : Convertit une chaîne JSON en objet JS.
- `JSON.stringify(object)` : Convertit un objet JS en chaîne JSON.

#### 47. Q : Qu'est-ce qu'une "Memory Leak" (Fuite de mémoire) en JS et comment l'éviter ?

##### Réponse {collapsible="true"}

C'est quand la mémoire allouée n'est pas libérée alors qu'elle n'est plus utilisée. Causes courantes : variables
globales, timers (`setInterval`) non nettoyés, event listeners non supprimés sur des éléments DOM supprimés. On évite
cela en nettoyant (removeEventListener, clearInterval).

#### 48. Q : Qu'est-ce que le Currying ?

##### Réponse {collapsible="true"}

C'est une technique de programmation fonctionnelle où une fonction prenant plusieurs arguments est transformée en une
séquence de fonctions prenant chacune un seul argument.
Ex: `add(a, b)` devient `add(a)(b)`.

#### 49. Q : Qu'est-ce qu'un Générateur (`function*` et `yield`) ?

##### Réponse {collapsible="true"}

C'est une fonction qui peut être mise en pause et reprise. Elle ne s'exécute pas d'un coup mais retourne un itérateur. À
chaque appel de `.next()`, elle s'exécute jusqu'au prochain `yield`.

#### 50. Q : Qu'est-ce que l'objet `window` ?

##### Réponse {collapsible="true"}

C'est l'objet global dans l'environnement du navigateur. Il représente la fenêtre du navigateur contenant le document
DOM. Toutes les variables globales et fonctions (`alert`, `setTimeout`) sont des propriétés de `window`. (En Node.js,
l'équivalent est `global`).