## Research Methodology

### 1 Research design

This study follows a **qualitative, taxonomy-building design**. The goal is to synthesize a **framework-agnostic catalog of declarative UI code smells** across React, Flutter, Jetpack Compose, and SwiftUI, grounded in:

* classical code smell theory (e.g. Fowler, 1999; Moha et al., 2010; Haque et al., 2018)([Atlantis Press][1])
* recent **technology-specific smell catalogs** and **mobile/UI smell work** (e.g. Ferreira & Valente, 2023; Habchi, 2019; Blouin et al., 2017)([ScienceDirect][2])
* state-of-the-art **smell detection** literature using metrics and machine learning (e.g. Azeem et al., 2019; Ho & Bui, 2023; Hamouda et al., 2025; Yadav et al., 2024).([SCIRP][3])

Smells are treated as **domain-specific code/design smells**: recurring structural or behavioral patterns in declarative UI code that indicate violations of design principles and increase technical debt, while not necessarily being bugs.

---

### 2 Data collection

Data collection proceeded in **two main phases**: (1) baseline catalogs and foundational literature, and (2) LLM-assisted deep research on declarative UI frameworks.

#### 2.1 Phase 1 – Baseline catalogs and foundational literature

In the first phase, we identified **seed sources** that define smells and detection approaches:

1. **Technology-specific smell catalog**

   * Ferreira & Valente’s catalog of React-specific code smells and their empirical detection study in *Information and Software Technology* (IST)([ScienceDirect][2])
   * The accompanying GitHub repository *React-Code-Smells*, which provides machine-readable smell definitions and examples (e.g. Large Component, Prop Drilling, Direct DOM Manipulation).([ricerca.univaq.it][4])

2. **Foundational smell taxonomy & detection frameworks**

   * DECOR method and its domain-specific language for specifying and detecting code/design smells (Moha et al., 2010).([ResearchGate][5])
   * Surveys and SLRs on code smells and ML-based detection (Azeem et al., 2019; Haque et al., 2018; Yadav et al., 2024).([SCIRP][3])

3. **UI/mobile-specific smell work**

   * Habchi’s doctoral thesis on **mobile-specific code smells** and their performance impacts in Android/iOS apps.([ResearchGate][6])
   * Blouin et al.’s “Blob Listener” user interface design smell, which shows that UI layers can have their own smell types beyond classical OO smells.([arXiv][7])

From these sources, we extracted:

* smell name and definition,
* described **symptoms** (e.g. “large component,” “deep widget tree,” “event listener handles many commands”),
* **consequences** (maintainability, performance, fault-proneness), and
* involved **technologies/frameworks**.

Only smells that directly relate to **UI structure, UI logic, or UI performance** were retained as candidates for the declarative UI catalog.

#### 2.2 Phase 2 – LLM-assisted deep research on declarative UI frameworks

In the second phase, we used **ChatGPT (GPT-5.1 Thinking) with the Deep Research feature as a search assistant** to systematically explore academic digital libraries and practitioner resources. The LLM was employed to:

* generate and refine search queries,
* fetch candidate papers, blog posts, and documentation pages,
* summarize and cluster them by relevance.

**All inclusion/exclusion decisions and final coding were performed manually by the first author.** The LLM’s role was limited to *search support and summarization*.

##### (a) Targeted sources

The LLM-assisted search focused on:

* Academic databases: **ScienceDirect, ACM Digital Library, IEEE Xplore, MDPI**, and thesis repositories (e.g. Habchi, 2019).([ScienceDirect][2])
* Official and semi-official **framework documentation**:

  * Jetpack Compose performance best-practices by Android Developers.
  * Flutter performance and `setState` usage guidelines.([Flutter][8])
  * SwiftUI data flow sessions and docs (e.g. “Data Flow Through SwiftUI”, WWDC 2019).([Apple Developer][9])
  * React Hooks and Rules of Hooks documentation.([React][10])
* High-signal **technical blogs** for specific frameworks:

  * React: overuse of `useEffect` as a new code smell (Hamisi, 2025) and prop drilling as a code smell (Williams, 2024).([Medium][11])
  * Flutter: deep widget trees and common mistakes (e.g., “15 Common Mistakes in Flutter and Dart Development”).([DCM][12])

##### (b) Search strategies

The LLM was prompted with **families of queries**. Representative keyword groups:

Technology-specific smell catalogs:
`"Detecting code smells in React-based Web apps"`, `"React code smells catalog Ferreira"`, `"React-specific code smells prop drilling props in initial state"`

Declarative UI frameworks:
`"Flutter code smells anti-patterns deep widget trees"`, `"Flutter massive widget logic in widget"`.
`"Jetpack Compose performance best practices avoid expensive recomposition remember"`, `"Jetpack Compose code smells anti-patterns"`.
`"SwiftUI massive view controller code smell", "iOS Massive View Controller smell Swift"`.

ML / deep learning smell detection
`"DeepSmells CNN LSTM code smell detection"`, `"Fusion of deep convolutional and LSTM recurrent neural networks for automated detection of code smells"`. 
`"Smell-ML machine learning framework detecting rarely studied code smells"`. 
`"machine learning-based methods for code smell detection survey"` (for Yadav et al.). 

General smell frameworks & taxonomy
`"DECOR method specification detection of code and design smells taxonomy"`. 

Specific UI smell symptoms
`"prop drilling code smell React"`, `"overusing useEffect code smell"`, `"async calls in React components code smell"`. 
`"Flutter deep nested widgets performance"`, `"Flutter common mistakes excessive nesting"`, `"Flutter widget methods antipattern"`. 

Searches were iterated until no substantially new smell types or declarative-UI patterns emerged (theoretical saturation).

##### (c) Inclusion and exclusion criteria (for paper literatures)

A candidate source was **included** if it:

* was peer-reviewed (journal, conference, thesis) **or** a high-quality technical blog or official documentation;
* explicitly discussed:

  * code smells, design smells, **anti-patterns**, or
  * best practices in **React, Flutter, Jetpack Compose, or SwiftUI** that clearly labeled patterns as problematic;
* was published roughly between **2010–2025**, capturing evolution from DECOR to current ML-based detection and modern declarative UI frameworks.([ResearchGate][5])

A candidate source was **excluded** if it:

* was non-technical or opinion-only (e.g. short forum posts without argument),
* focused exclusively on **non-UI smells** without offering transferable concepts, or
* duplicated content from a higher-quality source.

##### (d) Final corpus

After screening, the corpus used for catalog construction consisted of:

* **Academic / research sources** (examples):
  Ferreira & Valente (React smells), Moha et al. (DECOR), Azeem et al. (ML smell detection SLR), Ho & Bui (DeepSmells), Hamouda et al. (Smell-ML), Yadav et al. (ML-based smell detection survey), Haque et al. (causes/impacts), Habchi (mobile-specific smells), Blouin et al. (Blob Listener).([ScienceDirect][2])
* **Practitioner & documentation sources** (examples):
  React Hooks / Rules of Hooks docs, Compose performance docs, Flutter performance docs, SwiftUI data flow docs, and technical articles on overusing `useEffect`, prop drilling, and Flutter deep widget trees.([React][10])

These sources collectively provide:

* **names and definitions** of framework-specific smells (e.g., Large Component, Prop Drilling, Massive View Controller, Blob Listener, overusing `useEffect`),
* **guidance** on what is considered an anti-pattern in declarative UI,
* and **evidence** that some patterns recur across multiple frameworks.

---

### 3 Data extraction and coding

For each included source, the first author extracted the following attributes into a structured table:

1. Smell name (original label in the source)
2. Smell type (code smell, design smell, mobile-specific smell, anti-pattern)
3. Short definition and key symptoms (e.g., “deeply nested widget trees”, “business logic inside view”, “list rendering without virtualization”)
4. Reported consequences (e.g., maintainability issues, performance problems, fault-proneness)
5. Target framework(s) (React, Flutter, Jetpack Compose, SwiftUI, other)
6. Any explicit links to **classical smells** (e.g., “Large Component similar to God Class / Large Class”) or to **domain-specific smells** (e.g., Blob Listener, Massive View Controller).([ScienceDirect][2])

Coding proceeded in **two passes**:

* **Open coding:** smell instances were labeled with keywords describing their core problem (e.g., “large component”, “nested view tree”, “blocking work in render”, “untracked state”, “prop drilling”, “misused effects”, “inefficient list”).
* **Axial coding:** related labels were grouped into **candidate smell families** (e.g., “Large Component / Massive View / Blob Listener” → *Large Component* family; “deep widget tree / excessive nesting” → *Nested View* family).

At this stage, **no constraint** from Fowler’s classic smells was imposed; those were brought in **later** for comparison, not as a starting taxonomy.

---

### 4 Taxonomy construction and refinement

The candidate smell families were refined into the final **nine declarative UI smell families** through three steps:

1. **Synonym merging and renaming**

   * Framework- or tool-specific labels that referred to the same conceptual problem were merged.
   * Examples:

     * React *Large Component*, iOS *Massive View Controller*, and SwiftUI “massive View” were merged into **Large Component**.([ScienceDirect][2])
     * “Deep widget trees” in Flutter and “excessive composable nesting” in Jetpack Compose were merged into **Nested View**.([DCM][12])

2. **Cross-framework generalization**
   For each family, we checked whether evidence existed in at least **two declarative UI frameworks** (React, Flutter, Jetpack Compose, SwiftUI):

   * If yes, it became a *cross-framework declarative UI smell* (e.g., **Large Component**, **Nested View**, **Business Logic in View**, **Inefficient List**, **Duplicate View**).([ScienceDirect][2])
   * If it appeared strongly in one framework but aligned well with the *declarative UI model* (e.g., **Prop Drilling**, **Misused Effects**, **Mutable View**, **Blocking View**), it was included with explicit notes on framework-specific manifestations (e.g., `useEffect` misuse in React; misuse of `@State` vs `@ObservedObject` in SwiftUI; misusing `setState` in Flutter).([Medium][11])

3. **Classic vs. domain-specific check**
   Guided by DECOR’s domain-specific smell tailoring and mobile-specific smell literature (Habchi, 2019; Moha et al., 2010), we checked whether each family:([ResearchGate][5])

   * is essentially a **specialization of a classical smell** (e.g., **Large Component** ~ Large Class/God Class, **Duplicate View** ~ Duplicated Code, **Inefficient List** ~ performance version of “Temporary Field / Data Clumps”), or
   * has no straightforward classical counterpart and is better treated as a **declarative UI-specific smell** (e.g., **Prop Drilling**, **Misused Effects**, **Mutable View** as “untracked UI state pattern”).

   This step is where **Fowler’s smells** and other classic taxonomies are referenced conceptually; the catalog itself remains grounded in declarative UI idioms.

Through iterative comparison and consolidation, this process converged on **nine smell families** that are both:

* **theoretically grounded** (linked to prior smell/design-smell concepts), and
* **practically observable** in modern declarative UI code across frameworks.

---

### 5 Construction of multi-framework examples

To make the catalog actionable, the authors created **minimal code examples** for each smell in:

* React (JSX + hooks),
* Flutter (Dart + widgets),
* Jetpack Compose (Kotlin composables),
* SwiftUI (Swift views).

A large language model (ChatGPT) was used to **draft** candidate snippets following natural usage of each framework’s constructs (e.g., `useEffect`, `setState`, `remember`, `@State`). These drafts were then:

1. **Manually reviewed and corrected** by the first author to ensure:

   * code compiles conceptually and uses idiomatic patterns,
   * each snippet isolates a **single smell** as clearly as possible;
2. **Simplified** to remove unnecessary complexity (e.g., no external libraries, minimal data models).

The final examples serve as **didactic illustrations** for each smell, not as a statistical sample.

---

### 6 Summary of resulting catalog (re-written result)

The methodology above yields a **cross-framework declarative UI catalog** consisting of nine smell families:

1. **Large Component** – monolithic UI components (widgets/composables/views) that handle too many responsibilities.
2. **Nested View** – excessively deep widget or view hierarchies (nested containers/composables/stacks).
3. **Mutable View** – UI that relies on mutable state not properly tracked by the framework’s state system (e.g., raw vars instead of `useState`, `remember`, `@State`, or localized `setState`).
4. **Blocking View** – heavy computations or I/O in render/composable/view bodies that block UI.
5. **Business Logic in View** – domain or data logic embedded directly in UI components rather than in view models or controllers.
6. **Prop Drilling** – passing data or callbacks through many intermediate components that do not use them, primarily in React but with analogous patterns in Flutter/Compose/SwiftUI.
7. **Duplicate View** – repeated UI structures instead of reusable components, leading to consistency and maintenance issues.
8. **Inefficient List** – lists implemented without lazy/virtualized mechanisms or with missing keys/reuse, causing scalability and performance issues.
9. **Misused Effects** – incorrect use of side-effect mechanisms (`useEffect`, `LaunchedEffect`, `onAppear`, etc.), leading to redundant work, leaks, or convoluted control flow.

Each family is:

* **mapped across frameworks** (how it appears in React, Flutter, Jetpack Compose, SwiftUI),
* **linked back** to classical smells where appropriate (e.g., Large Component ↔ Large Class/God Class; Duplicate View ↔ Duplicated Code), and
* **justified as declarative-UI-specific** when it relies on concepts such as reactive state, declarative rendering, or hooks/effect APIs.

This catalog is the basis for the GitHub artifact and subsequent empirical work (e.g., dataset annotation, detection techniques).

---

## References

Azeem, M. I., Palomba, F., Shi, L., & Wang, Q. (2019). Machine learning techniques for code smell detection: A systematic literature review and meta-analysis. *Information and Software Technology, 108*, 115–138. [https://doi.org/10.1016/j.infsof.2018.12.009](https://doi.org/10.1016/j.infsof.2018.12.009) ([SCIRP][3])

Blouin, A., Lelli, V., Baudry, B., & Coulon, F. (2017). User interface design smell: Automatic detection and refactoring of blob listeners. In *Proceedings of the IEEE/ACM International Conference on Automated Software Engineering (ASE 2017)*. [https://doi.org/10.1109/ASE.2017.8115685](https://doi.org/10.1109/ASE.2017.8115685) ([arXiv][7])

Fowler, M. (1999). *Refactoring: Improving the design of existing code*. Addison-Wesley. ([Atlantis Press][1])

Ferreira, F., & Valente, M. T. (2023). Detecting code smells in React-based web apps. *Information and Software Technology, 155*, 107111. [https://doi.org/10.1016/j.infsof.2022.107111](https://doi.org/10.1016/j.infsof.2022.107111) ([ScienceDirect][2])

Ferreira, F. (2022). *React code smells* [Source code repository]. GitHub. [https://github.com/fabiosferreira/React-Code-Smells](https://github.com/fabiosferreira/React-Code-Smells) ([ricerca.univaq.it][4])

Habchi, S. (2019). *Understanding mobile-specific code smells* (Doctoral dissertation, Université de Lille). [https://theses.fr/2019LILUI089](https://theses.fr/2019LILUI089) ([ResearchGate][6])

Haque, M. S., Carver, J. C., & Atkison, T. (2018). Causes, impacts, and detection approaches of code smell: A survey. In *Proceedings of the 2018 ACM Southeast Conference* (pp. 1–8). ACM. [https://doi.org/10.1145/3190645.3190697](https://doi.org/10.1145/3190645.3190697) ([ACM Digital Library][14])

Hamisi, A. (2025, July 20). Keep effects pure, or pay later: Why overusing useEffect in React 19 is the new code smell (and how to fix it). *Medium*. [https://medium.com/@ahamisi777/keep-effects-pure-or-pay-later-why-overusing-useeffect-in-react-19-is-the-new-code-smell-and-cf5d2d529377](https://medium.com/@ahamisi777/keep-effects-pure-or-pay-later-why-overusing-useeffect-in-react-19-is-the-new-code-smell-and-cf5d2d529377) ([Medium][11])

Hamouda, S., Kamimura, G., Chan, A., & Selakovic, M. (2025). Smell-ML: A machine learning framework for detecting rarely studied code smells. *IEEE Access*. [https://doi.org/10.1109/ACCESS.2025.3530927](https://doi.org/10.1109/ACCESS.2025.3530927) ([ResearchGate][15])

Ho, A., & Bui, A. M. T. (2023). Fusion of deep convolutional and LSTM recurrent neural networks for automated detection of code smells. In *Proceedings of the 27th International Conference on Evaluation and Assessment in Software Engineering (EASE ’23)*. ACM. [https://doi.org/10.1145/3593434.3593476](https://doi.org/10.1145/3593434.3593476) ([ResearchGate][13])

Moha, N., Guéhéneuc, Y.-G., Duchien, L., & Le Meur, A.-F. (2010). DECOR: A method for the specification and detection of code and design smells. *IEEE Transactions on Software Engineering, 36*(1), 20–36. [https://doi.org/10.1109/TSE.2009.50](https://doi.org/10.1109/TSE.2009.50) ([ResearchGate][5])

React Documentation. (n.d.). *Rules of hooks*. React. [https://react.dev/reference/rules/rules-of-hooks](https://react.dev/reference/rules/rules-of-hooks) ([React][10])

Tim J. Williams. (2024). Prop drilling is a code smell when used incorrectly. *Medium*. [https://timjwilliams.medium.com/prop-drilling-is-a-code-smell-when-used-incorrectly-247186eab2ee](https://timjwilliams.medium.com/prop-drilling-is-a-code-smell-when-used-incorrectly-247186eab2ee) ([Quality Coding][16])

Android Developers. (n.d.-a). *Follow best practices: Jetpack Compose performance best practices*. Google. [https://developer.android.com/develop/ui/compose/performance/bestpractices](https://developer.android.com/develop/ui/compose/performance/bestpractices)

Android Developers. (n.d.-b). *Performance best practices* (Flutter). Google. [https://docs.flutter.dev/perf/best-practices](https://docs.flutter.dev/perf/best-practices) ([Flutter][8])

Apple. (2019). *Data flow through SwiftUI* (WWDC 2019 Session 226). Apple Developer. [https://developer.apple.com/videos/play/wwdc2019/226/](https://developer.apple.com/videos/play/wwdc2019/226/) ([Apple Developer][9])

DCM. (2025, March 24). 15 common mistakes in Flutter and Dart development (and how to avoid them). *DCM*. [https://dcm.dev/blog/2025/03/24/fifteen-common-mistakes-flutter-dart-development/](https://dcm.dev/blog/2025/03/24/fifteen-common-mistakes-flutter-dart-development/) ([DCM][12])

Yadav, P. S., Rao, R. S., Mishra, A., & Gupta, M. (2024). Machine learning-based methods for code smell detection: A survey. *Applied Sciences, 14*(14), 6149. [https://doi.org/10.3390/app14146149](https://doi.org/10.3390/app14146149) ([MDPI][17])
