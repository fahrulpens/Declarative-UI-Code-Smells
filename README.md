# DUIS - Declarative UI Code Smell Catalog

This repository contains a unified catalog of **code smells specific to declarative UI frameworks**, such as **Flutter**, **React**, **Jetpack Compose**, and **SwiftUI**.

The catalog groups and refines smells that:

- Are **inspired by Fowler's classic code smells**, but instantiated at the **UI component / widget / composable** level.
- Capture **new problems that only appear (or become critical) in state-driven, declarative, reactive UIs**, such as mismanaged reactive state, expensive recomposition, and misuse of effect/lifecycle APIs.

The catalog is part of ongoing research on **code quality and smell detection for declarative, widget-based UI architectures**.

---

## Catalog overview (v1)

The current version defines **9 core declarative-UI smell**:

1. **Large view / Component (Monolithic UI Component)**  
   A single UI component (widget/composable/view) that is too large and takes too many responsibilities (layout, navigation, state, business logic, data fetching).

2. **Nested View (Deeply Nested View Tree)**  
   The UI is written as a very deep, highly-indented tree of nested widgets/composables/views, harming readability and sometimes layout performance.

3. **Mutable View (Mismanaged UI State in View)**  
   State is stored or mutated in a way that the framework cannot properly track (e.g. non-observable vars instead of `@State`/`remember`/`useState`, or writing shared state inside `build()` / `render()`).

4. **Blocking View (Blocking / Expensive View Declaration)**  
   Heavy or blocking work is performed during view declaration (e.g. sync I/O, heavy loops, JSON parsing in `build()` / `body` / render), which may be re-executed on every recomposition/re-render.

5. **Business Logic in View (Presentation–Logic Coupling)**  
   Business/domain logic (rules, API calls, DB queries) is embedded directly in UI code instead of in a separate ViewModel/use-case/domain layer.

6. **Prop Drilling (Poor Data Flow)**  
   Data and callbacks are passed through many intermediate components that do not use them, just to reach a deeply nested child, instead of lifting state or using context/DI mechanisms.

7. **Duplicate View (Duplicated UI Structure)**  
   Repeated UI structures (cards, rows, sections) are copy-pasted instead of being extracted into reusable widgets/components/composables, leading to inconsistency and harder maintenance.

8. **Inefficient Rendering & Lists**  
   UI is written in a way that defeats the framework’s incremental rendering optimizations (e.g. non-lazy lists, missing virtualization/memoization, or rebuilding huge trees for small changes).

9. **Misuse of Effects / Lifecycle APIs**  
   Effects or lifecycle hooks (`useEffect`, `LaunchedEffect`, `onAppear`, etc.) are used incorrectly (e.g. doing work that should be pure, missing clean-up, wrong dependency configuration), causing bugs and performance issues.

Full definitions with context, examples, and Fowler mapping are in:

- [`docs/catalog-v1.md`](docs/catalog-v1.md)
- [`docs/fowler-mapping.md`](docs/fowler-mapping.md)

---

## Relation to Fowler’s classic code smells

Many of these smells are **specializations** of Fowler’s classic smells (e.g. Large Class, Long Method, Duplicate Code, Feature Envy, Message Chains). Others are **strongly declarative-specific**, with no direct analogue in the original catalog (e.g. “Mismanaged UI State in View”, “Misuse of Effects / Lifecycle APIs”).

A detailed mapping is provided in [`docs/fowler-mapping.md`](docs/fowler-mapping.md).

---

## Examples

The `examples/` folder contains small snippets that illustrate each smell (starting with Flutter):

- `examples/flutter/duis01_monolithic_ui_component_bad.dart`
- `examples/flutter/duis02_nested_view_bad.dart`
- `...`

You can extend this with React, Jetpack Compose, and SwiftUI versions over time.

---

## Status

This catalog is **research work-in-progress**, but the 9 smell families in v1 are stable enough to:

- guide **manual code reviews** in declarative UI projects,
- inform **tool designers** implementing static analysis / detection rules,
- serve as a reference taxonomy in **empirical studies** on declarative UI code quality.

The catalog will be refined based on future empirical evaluations (e.g., developer surveys, annotated datasets, detection experiments).

---

## How to cite

If you use this catalog in academic work, please cite:

> Hardiansyah, F. F. (2025). *Declarative UI Code Smell Catalog (v1.0)*. GitHub repository.  
> Available at: \<GitHub URL\>

A machine-readable citation is also provided in [`CITATION.cff`](CITATION.cff).
You can use the “Cite this repository” button on GitHub to export a formatted citation.
