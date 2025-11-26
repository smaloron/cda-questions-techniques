# Questions sur React

Voici 50 questions techniques sur **React** (v18+), couvrant les fondamentaux, les Hooks, la gestion d'état, la
performance et l'écosystème moderne (Next.js, Server Components).

---

### Partie 1 : Les Fondamentaux et JSX

#### 1. Q : Qu'est-ce que React et en quoi diffère-t-il d'Angular ?

##### Réponse {collapsible="true"}

React est une **bibliothèque** JavaScript (librairie) pour créer des interfaces utilisateur, focalisée sur la couche "
Vue". Contrairement à Angular (Framework complet MVC), React est moins opiniâtre : il ne gère pas nativement le routing
ou les requêtes HTTP, laissant le choix des outils au développeur. Il repose sur le Virtual DOM.

#### 2. Q : Qu'est-ce que le JSX ?

##### Réponse {collapsible="true"}

JSX (JavaScript XML) est une extension syntaxique de JavaScript qui permet d'écrire du code ressemblant à du HTML à l'
intérieur du JS. Ce n'est pas du HTML valide : il est transpilé (par Babel/SWC) en appels de fonction
`React.createElement()`.

#### 3. Q : Pourquoi ne peut-on pas retourner plusieurs éléments adjacents sans parent en JSX ?

##### Réponse {collapsible="true"}

Parce que le JSX est converti en appel de fonction, et une fonction JS ne peut retourner qu'une seule valeur (un seul
objet racine). Pour contourner cela sans ajouter de `div` inutile, on utilise les **Fragments** (`<React.Fragment>` ou
la syntaxe courte `<>...</>`).

#### 4. Q : Quelle est la différence entre un Composant Fonctionnel et un Composant de Classe ?

##### Réponse {collapsible="true"}

- **Classe** : Utilise `class MyComp extends React.Component`, possède une méthode `render()` et gère l'état via
  `this.state` et les méthodes de cycle de vie (`componentDidMount`).
- **Fonctionnel** : C'est une simple fonction JS qui retourne du JSX. Depuis l'arrivée des Hooks (React 16.8), ils
  peuvent gérer l'état et les effets de bord, et sont devenus le standard moderne.

#### 5. Q : Qu'est-ce que le Virtual DOM ?

##### Réponse {collapsible="true"}

C'est une représentation légère du DOM réel en mémoire (un arbre d'objets JS). Quand l'état change, React met à jour le
Virtual DOM, le compare avec la version précédente (processus de "Diffing") et ne met à jour dans le DOM réel que les
nœuds qui ont effectivement changé (Réconciliation). C'est ce qui rend React rapide.

#### 6. Q : Quelle est la différence entre `state` et `props` ?

##### Réponse {collapsible="true"}

- **Props** (Propriétés) : Données passées du parent vers l'enfant. Elles sont **immuables** (lecture seule) pour
  l'enfant.
- **State** (État) : Données gérées **internement** par le composant. Elles sont **muables** (via `setState`) et
  provoquent un re-rendu du composant quand elles changent.

#### 7. Q : Pourquoi faut-il utiliser une clé (`key`) unique dans les listes (`map`) ?

##### Réponse {collapsible="true"}

La `key` aide React à identifier quels éléments d'une liste ont changé, été ajoutés ou supprimés. Cela permet à
l'algorithme de réconciliation de réutiliser les éléments DOM existants au lieu de tout recréer, optimisant les
performances. Il ne faut pas utiliser l'index du tableau si la liste peut changer d'ordre.

#### 8. Q : Qu'est-ce que le "One-Way Data Flow" (Flux de données unidirectionnel) ?

##### Réponse {collapsible="true"}

En React, les données circulent uniquement du haut vers le bas (Parent -> Enfant) via les props. Pour faire remonter une
info (Enfant -> Parent), le parent passe une fonction de callback via les props, que l'enfant exécutera.

#### 9. Q : Qu'est-ce qu'un "Controlled Component" (Composant contrôlé) ?

##### Réponse {collapsible="true"}

C'est un élément de formulaire (input, textarea) dont la valeur est contrôlée par l'état React (`value={state}`) et
modifiée uniquement via un gestionnaire d'événements (`onChange={setState}`). La source de vérité est le state React,
pas le DOM.

#### 10. Q : Qu'est-ce que `React.StrictMode` ?

##### Réponse {collapsible="true"}

C'est un wrapper qui aide à détecter les problèmes potentiels (méthodes obsolètes, effets de bord inattendus). En
développement, il a la particularité de **rendre les composants deux fois** pour s'assurer que les Hooks et le rendu
sont purs.

---

### Partie 2 : Les Hooks

#### 11. Q : Quelles sont les règles des Hooks ?

##### Réponse {collapsible="true"}

1. Ne les appeler qu'au **niveau supérieur** (Top Level) de la fonction : jamais dans des boucles, conditions ou
   fonctions imbriquées (pour garantir l'ordre d'exécution).
2. Ne les appeler que dans des **Fonctions React** (Composants ou Custom Hooks).

#### 12. Q : Comment fonctionne `useState` ?

##### Réponse {collapsible="true"}

Il déclare une variable d'état. Il retourne un tableau avec 2 éléments : la valeur actuelle et une fonction pour la
modifier (setter). Ex: `const [count, setCount] = useState(0)`. Appeler le setter déclenche un re-rendu.

#### 13. Q : À quoi sert `useEffect` et quand s'exécute-t-il ?

##### Réponse {collapsible="true"}

Il gère les effets de bord (appels API, abonnements, timers, modification manuelle du DOM).

- Sans dépendance : À chaque rendu.
- `[]` : Uniquement au montage (Mount).
- `[prop]` : Au montage et à chaque fois que `prop` change.
  Il peut retourner une fonction de nettoyage (Cleanup) exécutée avant le prochain effet ou au démontage (Unmount).

#### 14. Q : Quelle est la différence entre `useEffect` et `useLayoutEffect` ?

##### Réponse {collapsible="true"}

- `useEffect` est asynchrone et s'exécute **après** que le navigateur a peint l'écran.
- `useLayoutEffect` est synchrone et s'exécute **après** les mutations du DOM mais **avant** que le navigateur ne peigne
  l'écran. Utilisé pour mesurer le DOM sans "flickering" visuel.

#### 15. Q : À quoi sert `useRef` ?

##### Réponse {collapsible="true"}

Il a deux usages principaux :

1. Accéder directement à un élément du DOM (équivalent de `document.getElementById`).
2. Stocker une valeur mutable qui persiste entre les rendus **sans provoquer de re-rendu** quand elle change (
   contrairement à `useState`).

#### 16. Q : Quelle est la différence entre `useMemo` et `useCallback` ?

##### Réponse {collapsible="true"}

Les deux servent à l'optimisation (mémoïsation).

- `useMemo` : Mémoïse le **résultat** d'une fonction (valeur calculée) pour éviter de recalculer si les dépendances ne
  changent pas.
- `useCallback` : Mémoïse la **définition de la fonction** elle-même pour qu'elle garde la même référence mémoire entre
  les rendus (utile pour passer une fonction en prop à un composant enfant optimisé).

#### 17. Q : Quand utiliser `useReducer` plutôt que `useState` ?

##### Réponse {collapsible="true"}

Quand la logique d'état est complexe (plusieurs sous-valeurs) ou quand l'état suivant dépend de l'état précédent. Il
suit le pattern Redux (dispatch, action, reducer) et permet de centraliser la logique de mise à jour dans une fonction
pure.

#### 18. Q : Qu'est-ce qu'un Custom Hook ?

##### Réponse {collapsible="true"}

C'est une fonction JavaScript (commençant par `use...`) qui utilise d'autres Hooks à l'intérieur. Cela permet d'extraire
et de partager une logique d'état réutilisable entre plusieurs composants (ex: `useFetch`, `useWindowSize`).

#### 19. Q : Qu'est-ce que `useContext` ?

##### Réponse {collapsible="true"}

Il permet de consommer une valeur provenant d'un Contexte React (créé avec `createContext`) sans avoir besoin de passer
les props manuellement à travers tous les niveaux intermédiaires ("Prop Drilling").

#### 20. Q : Que se passe-t-il si vous mentez dans le tableau de dépendances de `useEffect` ?

##### Réponse {collapsible="true"}

L'effet utilisera des valeurs obsolètes ("stale closures") des variables ou fonctions qui n'ont pas été déclarées dans
les dépendances. Cela crée des bugs difficiles à tracer. Il faut toujours inclure toutes les variables externes
utilisées dans l'effet.

---

### Partie 3 : Gestion de l'État et Flux de Données

#### 21. Q : Qu'est-ce que le "Prop Drilling" et comment l'éviter ?

##### Réponse {collapsible="true"}

C'est le fait de passer des données d'un composant parent à un composant enfant très profond via de nombreux composants
intermédiaires qui n'ont pas besoin de ces données. On l'évite avec l'API Context, la Composition de composants (passing
components as props) ou un State Manager (Redux).

#### 22. Q : Qu'est-ce que "Lifting State Up" (Remonter l'état) ?

##### Réponse {collapsible="true"}

Si deux composants frères ont besoin de partager le même état, on ne peut pas passer l'état de l'un à l'autre
directement. On déplace (remonte) l'état vers leur ancêtre commun le plus proche, puis on le redescend via les props.

#### 23. Q : Expliquez le principe de Redux en 3 mots-clés.

##### Réponse {collapsible="true"}

1. **Store** : Source de vérité unique contenant tout l'état de l'application.
2. **Action** : Objet décrivant un événement ("Ce qu'il s'est passé").
3. **Reducer** : Fonction pure qui prend l'état précédent et une action, et retourne le nouvel état.

#### 24. Q : Pourquoi l'état doit-il être immuable dans React/Redux ?

##### Réponse {collapsible="true"}

Pour la détection de changement. React et Redux comparent les références d'objets (Shallow comparison) pour savoir s'il
faut re-rendre. Si on modifie l'objet directement (`obj.a = 1`), la référence ne change pas, donc pas de re-rendu. Il
faut créer un nouvel objet (`{...obj, a: 1}`).

#### 25. Q : Qu'est-ce que Redux Toolkit (RTK) ?

##### Réponse {collapsible="true"}

C'est la manière standard officielle d'écrire du Redux aujourd'hui. Il simplifie la configuration (configureStore),
réduit le boilerplate (createSlice) et permet d'écrire une logique "mutable" (grâce à Immer.js en interne) qui est
convertie en immuable.

#### 26. Q : Quelle est la différence entre Context API et Redux ?

##### Réponse {collapsible="true"}

- **Context** : Idéal pour des données globales qui changent peu (Thème, User Auth, Langue). Pas conçu pour des mises à
  jour fréquentes (problèmes de performance car tout re-rend).
- **Redux** : Idéal pour des états complexes, fréquents, avec besoin de débogage (DevTools) et de middleware.

#### 27. Q : Qu'est-ce que React Query (TanStack Query) ?

##### Réponse {collapsible="true"}

C'est une librairie de gestion d'état asynchrone (Server State). Elle gère le fetching, le cache, la synchronisation et
la mise à jour des données serveur dans l'app React, remplaçant souvent le besoin de mettre ces données dans
Redux/Context.

#### 28. Q : Qu'est-ce qu'un HOC (Higher-Order Component) ?

##### Réponse {collapsible="true"}

C'est un pattern avancé (moins utilisé avec les Hooks) où une fonction prend un composant et retourne un nouveau
composant enrichi (ex: avec des props supplémentaires ou une logique d'authentification). Ex: `withRouter`, `connect` (
Redux).

#### 29. Q : Qu'est-ce que le pattern "Render Props" ?

##### Réponse {collapsible="true"}

C'est une technique où une prop d'un composant est une fonction qui retourne un élément React. Cela permet au composant
de partager sa logique interne avec ce qui est rendu. Ex: `<Mouse render={({ x, y }) => ... } />`.

#### 30. Q : Qu'est-ce que `createPortal` ?

##### Réponse {collapsible="true"}

Il permet de rendre un enfant dans un nœud DOM qui existe en dehors de la hiérarchie DOM du composant parent (ex:
attacher une Modale ou une Tooltip directement sur `document.body` pour éviter les soucis de CSS `z-index` ou
`overflow`).

---

### Partie 4 : Performance et Rendu

#### 31. Q : Qu'est-ce qui déclenche un re-rendu dans React ?

##### Réponse {collapsible="true"}

1. Un changement d'état (`useState`, `useReducer`).
2. Un changement de props venant du parent.
3. Un changement de valeur de Contexte consommé.
4. Un re-rendu du composant parent (par défaut, si le parent re-rend, tous les enfants re-rendent).

#### 32. Q : À quoi sert `React.memo` ?

##### Réponse {collapsible="true"}

C'est un HOC qui empêche un composant fonctionnel de se re-rendre si ses props n'ont pas changé (Pure Component). Il
effectue une comparaison de surface des props. Utile pour optimiser les performances des composants enfants lourds.

#### 33. Q : Qu'est-ce que le "Code Splitting" et `React.lazy` ?

##### Réponse {collapsible="true"}

C'est la technique consistant à diviser le bundle JS final en petits morceaux chargés à la demande.
`React.lazy(() => import('./Comp'))` permet de charger un composant dynamiquement uniquement quand il doit être affiché,
réduisant le temps de chargement initial.

#### 34. Q : À quoi sert `<Suspense>` ?

##### Réponse {collapsible="true"}

Il permet d'afficher une interface de repli (fallback, ex: spinner) pendant qu'un composant enfant est en train de
charger (Lazy loading, ou fetching de données avec les frameworks modernes comme Next.js/RSC).

#### 35. Q : Qu'est-ce que la propriété `children` ?

##### Réponse {collapsible="true"}

C'est une prop spéciale qui contient tout ce qui est inclus entre les balises ouvrantes et fermantes d'un composant (
`<Card>...contenu...</Card>`). Cela permet de faire de la composition de composants (slots).

#### 36. Q : Qu'est-ce qu'une "Error Boundary" (Frontière d'erreur) ?

##### Réponse {collapsible="true"}

C'est un composant de classe (obligatoirement) qui implémente `componentDidCatch` ou `getDerivedStateFromError`. Il
capture les erreurs JS dans son arbre d'enfants, log l'erreur, et affiche une UI de repli au lieu de faire planter toute
l'application (écran blanc).

#### 37. Q : Qu'est-ce que le Batching automatique (React 18) ?

##### Réponse {collapsible="true"}

React regroupe (batch) plusieurs mises à jour d'état en un seul re-rendu pour optimiser les performances. Depuis React
18, cela fonctionne aussi dans les promesses, les timeouts et les gestionnaires d'événements natifs (Automatic
Batching).

#### 38. Q : Qu'est-ce que `forwardRef` ?

##### Réponse {collapsible="true"}

Il permet à un composant de transférer (forward) une `ref` qu'il reçoit vers l'un de ses enfants DOM. C'est nécessaire
si on veut pouvoir référencer un élément DOM situé à l'intérieur d'un composant enfant (ex: mettre le focus sur un input
custom).

#### 39. Q : Pourquoi ne faut-il pas définir un composant à l'intérieur d'un autre composant ?

##### Réponse {collapsible="true"}

Parce qu'à chaque rendu du parent, la fonction du composant enfant est redéfinie. Pour React, c'est un *nouveau*
composant. Il va donc détruire l'ancien, perdre son état et le focus, et recréer le nouveau. Très mauvais pour les perfs
et l'UX.

#### 40. Q : Qu'est-ce que la "Concurrency" (Mode Concurrent) dans React 18 ?

##### Réponse {collapsible="true"}

C'est une capacité du moteur React à interrompre un rendu en cours pour traiter une tâche plus urgente (ex: input
utilisateur), puis reprendre le rendu. Cela rend l'UI plus fluide (`useTransition`, `useDeferredValue`).

---

### Partie 5 : Architecture et Écosystème

#### 41. Q : Qu'est-ce que React Router ?

##### Réponse {collapsible="true"}

La librairie standard pour le routing côté client (SPA). Elle permet de synchroniser l'UI avec l'URL sans recharger la
page. Elle utilise `BrowserRouter`, `Routes`, `Route` et le composant `Link` (ou `useNavigate`).

#### 42. Q : Quelle est la différence entre `<a href>` et `<Link to>` ?

##### Réponse {collapsible="true"}

- `<a>` : Déclenche une navigation native du navigateur, recharge la page et réinitialise l'état JS (mauvais pour SPA).
- `<Link>` : Utilise l'API History du navigateur pour changer l'URL et rendre le nouveau composant sans recharger la
  page.

#### 43. Q : Qu'est-ce que le SSR (Server-Side Rendering) avec Next.js ?

##### Réponse {collapsible="true"}

Au lieu d'envoyer un HTML vide et de laisser le JS construire la page (CSR), le serveur exécute React, génère le HTML
complet et l'envoie au client. Le JS prend ensuite le relais ("Hydratation"). Avantages : SEO, affichage initial plus
rapide (FCP).

#### 44. Q : Qu'est-ce que les "React Server Components" (RSC) ?

##### Réponse {collapsible="true"}

Une nouvelle architecture (utilisée par défaut dans Next.js App Router). Les composants s'exécutent **uniquement** sur
le serveur, n'envoient pas de JS au client (0kb bundle size pour ces composants), et peuvent accéder directement à la
BDD. On les combine avec des "Client Components" (`'use client'`) pour l'interactivité.

#### 45. Q : Qu'est-ce que l'Hydratation (Hydration) ?

##### Réponse {collapsible="true"}

C'est le processus par lequel React "s'attache" au HTML statique généré par le serveur (SSR). Il injecte les écouteurs
d'événements et rend la page interactive.

#### 46. Q : Qu'est-ce que Testing Library (RTL) ?

##### Réponse {collapsible="true"}

C'est la librairie de test recommandée. Sa philosophie est de tester les composants comme l'utilisateur les utilise (en
trouvant les éléments par texte ou label) plutôt que de tester les détails d'implémentation (état interne, nom des
méthodes).

#### 47. Q : Comment tester un Hook personnalisé ?

##### Réponse {collapsible="true"}

On ne peut pas appeler un Hook en dehors d'un composant. On utilise `renderHook` de `@testing-library/react` qui crée un
composant de test invisible pour exécuter le Hook et vérifier ses retours.

#### 48. Q : Qu'est-ce que le "Snapshot Testing" ?

##### Réponse {collapsible="true"}

Un test qui prend une "photo" (dump texte du HTML généré) du composant et la compare avec la version précédente stockée.
Si ça change, le test échoue (soit régression, soit changement volontaire à valider).

#### 49. Q : Comment gérer les styles dans React ?

##### Réponse {collapsible="true"}

Plusieurs méthodes :

- CSS classique (`import './style.css'`).
- Modules CSS (`styles.button` -> class unique générée).
- CSS-in-JS (Styled Components, Emotion).
- Utility-first CSS (Tailwind CSS, très populaire).

#### 50. Q : Qu'est-ce que Create React App (CRA) vs Vite ?

##### Réponse {collapsible="true"}

- **CRA** : Outil historique basé sur Webpack. Lent, configuration lourde, et aujourd'hui considéré comme obsolète par
  l'équipe React.
- **Vite** : Outil de build moderne, extrêmement rapide (utilise ESModules natifs en dev), devenu le standard pour
  démarrer une SPA React.