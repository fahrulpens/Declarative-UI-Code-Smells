# DUIS - Declarative UI Code Smell Catalog (v1)

This document defines version 1 of the **Declarative UI Code Smell Catalog**, grouped into 9 smell families. For each smell we provide:

- **ID and Name**
- **Intent**
- **Scope / Context**
- **Closest Fowler smell(s)**
- **What is specific to declarative UI**
- **Consequences**

For detailed examples, see the `examples/` folder.

---

## DUIS-01 – Large view / Component (Monolithic UI Component)

**Intent**  
A single UI component (widget/composable/view) doing too much: large layouts combined with navigation, business logic, and/or state handling.

**Scope / Context**  
Any declarative UI component: Flutter `Widget`, React component, Jetpack Compose `@Composable`, SwiftUI `View`.

**Closest Fowler smells**  
- Large Class  
- “God Class” (common in literature)

**Declarative-specific aspect**  
The component’s code is re-executed frequently by the framework’s render/recomposition engine, magnifying the cost of having one huge, multi-responsibility unit.

**Typical consequences**  
- Difficult to read, test, and maintain.  
- Small UI changes become risky.  
- Hard to reuse parts of the UI.  

---

## DUIS-02 – Nested View (Deeply Nested View Tree)

**Intent**  
The UI tree is overly deep and heavily nested, making the layout hard to read and reason about.

**Scope / Context**  
Widget/composable/view trees: nested `Column/Row/Container/Widget` chains in Flutter, nested composables in Compose, nested `VStack/HStack` in SwiftUI, deeply nested JSX in React.

**Closest Fowler smells**  
- nested conditional (deep nesting / complex conditionals) but it occurs in a different component (view instead of conditional).

**Declarative-specific aspect**  
The structure of the **layout tree** itself (indentation depth, number of nested layout nodes) is the main focus, not just number of lines or branches.

**Typical consequences**  
- Poor readability; changes are error-prone.  
- Overly complex layout hierarchy may hurt performance (layout passes, overdraw).

---

## DUIS-03 – Mutable View (Mismanaged UI State in View)

**Intent**  
State is stored or mutated in ways that the UI framework cannot properly track or that violate its state model.

**Scope / Context**  
Examples include:  
- using plain mutable variables instead of `@State` / `remember { mutableStateOf }` / `useState`,  
- mutating shared state inside `build()` / `render()`,  
- duplicating props into local state that then diverges.

**Closest Fowler smells**  
- Related to Feature Envy, Inappropriate Intimacy, Divergent Change, but none is a perfect match.

**Declarative-specific aspect**  
In declarative UIs, the framework relies on explicit, observable state to know when and what to re-render. Mismanaged state breaks this contract, causing missed updates, extra recompositions, or inconsistent UI.

**Typical consequences**  
- UI not updating or updating unexpectedly.  
- Hidden bugs due to multiple “sources of truth”.  
- Hard-to-debug lifecycle and recomposition issues.

---

## DUIS-04 – Blocking View (Blocking / Expensive View Declaration)

**Intent**  
Performing heavy or blocking work during view declaration, which may be re-executed frequently.

**Scope / Context**  
Examples:  
- synchronous I/O, network requests, or DB access in `build()` / `body` / React render,  
- heavy loops, large JSON parsing, image decoding inside composables.

**Closest Fowler smells**  
- none, classic Fowler catalog does not model performance smells.

**Declarative-specific aspect**  
Because view declarations can run on every recomposition/re-render, an expensive operation here can block the UI thread multiple times, causing jank and battery drain.

**Typical consequences**  
- Slow or janky UI under state changes.  
- Poor responsiveness on low-end devices.  
- Unnecessary energy consumption.

---

## DUIS-05 – Business Logic in View (Presentation–Logic Coupling)

**Intent**  
Embedding business/domain logic directly into UI code instead of delegating to a ViewModel/controller/domain layer.

**Scope / Context**  
Examples:  
- API calls, DB queries, complex rules inside Flutter `build()`, `@Composable` functions, SwiftUI `body`, or React components.

**Closest Fowler smells**  
- Feature Envy  
- Inappropriate Intimacy  

**Declarative-specific aspect**  
The view is supposed to be a projection of state. Mixing business logic into the view makes the reactive flow harder to reason about and harms testability and lifecycle management.

**Typical consequences**  
- Difficult unit testing (logic tied to UI).  
- Frequent UI changes when domain rules evolve.  
- More complex state and effect management.

---

## DUIS-06 – Prop Drilling (Poor Data Flow)

**Intent**  
Passing data/callbacks through many intermediate components that do not use them, just to reach a deeply nested child.

**Scope / Context**  
Occurs in any component tree with deep hierarchies: React props, Flutter constructor parameters, Compose/SwiftUI function parameters, etc.

**Closest Fowler smells**  
- Message Chains  
- Middle Man  

**Declarative-specific aspect**  
The problem appears along the **component tree**: intermediate components are “prop pass-throughs” rather than meaningful UI units. Modern frameworks provide context/DI mechanisms to avoid this pattern.

**Typical consequences**  
- Tight coupling across layers of the tree.  
- Brittle APIs: refactorings require parameter changes across many components.  
- Reduced reusability of intermediate components.

---

## DUIS-07 – Duplicate View (Duplicated UI Structure)

**Intent**  
Copy-pasted UI structures (layout + styling + behaviour) instead of reusable abstractions.

**Scope / Context**  
Repeated cards, list items, buttons, headers, etc. in widgets/composables/views/JSX.

**Closest Fowler smells**  
- Duplicate Code

**Declarative-specific aspect**  
Duplication occurs at the level of **UI subtrees**; it can be detected structurally (similar widget/composable trees), not just textually.

**Typical consequences**  
- Inconsistent look & feel when only some copies are updated.  
- More effort to implement design changes.  
- Larger codebases with more opportunities for bugs.

---

## DUIS-08 – Inefficient Rendering & Lists

**Intent**  
Writing UI code that defeats the framework’s incremental rendering optimizations.

**Scope / Context**  
Examples:  
- using non-lazy lists (e.g. building all children into a `Column` instead of `ListView.builder` / `LazyColumn` / virtualized lists),  
- missing memoization or stable keys, causing full rerenders.

**Closest Fowler smells**  
- No direct counterpart; this is a performance smell outside Fowler’s original catalog.

**Declarative-specific aspect**  
These frameworks rely heavily on lazy rendering, diffing, and recomposition. When developers ignore or misuse these mechanisms, performance degrades significantly.

**Typical consequences**  
- High memory usage, long rendering times.  
- Scroll jank and frame drops.  
- Scaling problems for large datasets.

---

## DUIS-09 – Misuse of Effects / Lifecycle APIs

**Intent**  
Using effect/lifecycle APIs incorrectly, leading to unnecessary work, leaks, or bugs.

**Scope / Context**  
Examples:  
- overusing React `useEffect` for logic that could be pure,  
- launching coroutines in Compose without scoping or cancellation,  
- using SwiftUI `onAppear` for heavy work that runs many times,  
- forgetting clean-up of subscriptions, timers, or controllers.

**Closest Fowler smells**  
- No direct match; only very loose connections to Divergent Change or Temporary Field.

**Declarative-specific aspect**  
Effects are core to modern reactive frameworks. Their semantics (run-on-mount, dependencies, cancellation) are specific to these UIs and were not present in the OO refactoring era.

**Typical consequences**  
- Memory leaks and resource leaks.  
- Logic running too often or not at all.  
- Hard-to-debug behaviour tied to subtle lifecycle semantics.
