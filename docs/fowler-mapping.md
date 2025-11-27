# Mapping Declarative-UI Smells to Fowler’s Classic Smells

The table below summarizes how each declarative-UI smell in v1 relates to Fowler’s classic catalog.

| Declarative-UI Smell (DUIS) | Closest Fowler Smell(s) | Key Difference vs Classic Fowler Smell |
|---|---|---|
| **DUIS-01 – Large view / Component** (Monolithic UI Component) | Large Class, “God Class” | Classic Large Class is any oversized class/method; here the unit is specifically a **UI component** that is re-executed on every render/recomposition, mixing layout, navigation, state, and business logic. |
| **DUIS-02 – Nested View** (Deeply Nested View Tree) | Nested Conditional (deep nesting / complex conditionals)  | Focus is on the **depth of the layout tree** (nested widgets/composables/views), not just statement nesting. It directly affects both readability and layout/render overhead. |
| **DUIS-03 – Mutable View** (Mismanaged UI State in View) | Loosely related to Feature Envy, Inappropriate Intimacy, Divergent Change | Classic smells don’t model reactive state. Here the core issue is **state that is not observable or not managed according to the framework’s state model**, which breaks recomposition and leads to inconsistent UIs. |
| **DUIS-04 – Blocking View** (Blocking / Expensive View Declaration) | None (Fowler has no explicit performance smells) | The emphasis is on **expensive work placed in code that runs on every recomposition/render**, which is unique to declarative/reactive UIs. |
| **DUIS-05 – Business Logic in View** (Presentation–Logic Coupling) | Feature Envy, Inappropriate Intimacy | Same underlying idea (UI module doing domain work), but sharpened by the expectation that modern declarative views should be **pure projections of state** coming from ViewModels/use-cases. |
| **DUIS-06 – Prop Drilling** (Poor Data Flow) | Message Chains, Middle Man | Instead of call chains, data is threaded through a **component hierarchy**, with intermediate UI components acting as “prop pass-throughs”. The structure is tied to declarative component trees. |
| **DUIS-07 – Duplicate View** (Duplicated UI Structure) | Duplicate Code | Conceptually identical to Duplicate Code, but expressed as duplication of **UI subtrees** (repeated widget/composable/JSX structures) rather than arbitrary statement blocks. |
| **DUIS-08 – Inefficient Rendering & Lists** | No direct counterpart in Fowler | This is a **performance smell specific to incremental rendering models** (lazy lists, virtual DOM, recomposition). Fowler’s catalog predates these concerns. |
| **DUIS-09 – Misuse of Effects / Lifecycle APIs** | No direct counterpart in Fowler | Purely **reactive/declarative** concept: misuse of hooks/effect APIs with mount/unmount/dependency semantics that did not exist in Fowler’s OO refactoring context. |
