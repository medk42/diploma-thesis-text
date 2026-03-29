# Issue D: Evaluation Boundary, Threats to Validity, and Scope of Claims

## 1. Issue Definition

The core problem here is not that Chapters 6 and 7 are wrong. It is that they are too compressed relative to the rest of the thesis, so the evaluation boundary is easy to miss even though the thesis itself contains enough material to support a stronger discussion.

The rewrite needs to do three things at once:

- close the loop with the introduction goals explicitly,
- state what the prototype actually demonstrates, and
- state just as clearly what it does not demonstrate.

That framing is already anticipated by the thesis and by the user guidance in `summary_2/expert_description.txt:5`, which says the discussion should follow the introduction and focus on what was built, what the results are, what the system brings, and where the boundaries are. The prior review in this conversation reached the same conclusion: Chapter 6 is conceptually right but underdeveloped, and Chapter 7 is acceptable but too thin.

### Explicit evidence

- The introduction states that the thesis wants to “evaluate the benefits and limitations of spatial authoring” on two representative task families, not merely build the system (`introduction.tex:69-74`).
- The thesis structure explicitly says Chapter 6 is the qualitative evaluation and Chapter 7 summarizes contributions and future work (`introduction.tex:90-94`).
- Chapter 6 itself says its goal is to discuss what the built system actually shows, where it is useful, and where its current limits lie (`ch06_discussion.tex:3`).
- Chapter 7 explicitly says the prototype is a proof of concept, not a validated industrial programming platform (`ch07_conclusion_future_work.tex:5-9`).

### Inference

The discussion should not read like a second implementation chapter. It should read like a thesis-level interpretation of the prototype, anchored in the introduction goals and bounded by the limitations of the evaluation.

## 2. How the Thesis Itself Frames Evaluation

The thesis already gives you the raw material for a stronger evaluation section. The issue is mostly placement and emphasis.

### Explicit evidence

- Chapter 2 says the design comparisons are “qualitative engineering assessments” and that the ratings are not quantitative benchmarks (`ch02_analysis.tex:109-111`).
- Chapter 2 closes by saying the selections are made in the context of a prototype and that the modular architecture is meant to keep future improvements open (`ch02_analysis.tex:500-505`).
- Chapter 4 says the prototype was tested primarily in the REMII offline environment and later validated on a physical robot of model KR1205 (`ch04_implementation.tex:35-37`).
- Chapter 4 also makes several explicit “known limitations” statements for individual modules, including Windows-only camera acquisition, lack of IMU fusion, lack of temporal scene stabilization, and lack of collision checking/tool abstraction (`ch04_implementation.tex:164-166`, `ch04_implementation.tex:315-320`, `ch04_implementation.tex:373-377`, `ch04_implementation.tex:429-434`, `ch04_implementation.tex:531-535`, `ch04_implementation.tex:623-628`).
- Chapter 5 is presented as an operator workflow chapter, not an evaluation chapter; it documents how to start the system, activate modules, calibrate, author, and execute tasks (`ch05_user_workflow.tex:4-9`).
- Chapter 6 later says the evaluation boundary is “qualitative and workflow-oriented,” with most testing in simulation and only limited physical trials (`ch06_discussion.tex:37-39`).

### Inference

The thesis already frames its own evaluation as prototype-level and mostly qualitative. The rewrite should make that framing explicit early in Chapter 6 rather than leaving it implicit until the limitations paragraph.

## 3. What Was Actually Demonstrated

This is the most important positive section to preserve. The thesis did not just sketch an idea. It built and exercised a full workflow.

### Explicit evidence

- The introduction claims a modular end-to-end system for in-workspace spatial authoring using a 6DoF tracked pen, stereo sensing, and a shared runtime with explicit interfaces (`introduction.tex:8`).
- Chapter 4 describes the concrete prototype: Kassow robot, robot-mounted stereo camera, CBun backend, custom pen, fiducial-tagged boxes, and calibration artifacts (`ch04_implementation.tex:4-9`, `ch04_implementation.tex:35-45`, `ch04_implementation.tex:50-61`, `ch04_implementation.tex:76-79`, `ch04_implementation.tex:84-86`, `ch04_implementation.tex:97-101`).
- Chapter 4 states that the system was implemented in C++ and built on both Windows and Linux, even though some modules remain platform-specific (`ch04_implementation.tex:11-17`).
- Chapter 5 demonstrates the full operator workflow: graph construction, activation, calibration, main view operation, authoring, confirmation, execution, saving, and loading (`ch05_user_workflow.tex:40-49`, `ch05_user_workflow.tex:55-103`, `ch05_user_workflow.tex:108-177`, `ch05_user_workflow.tex:182-215`, `ch05_user_workflow.tex:220-351`).
- Chapter 5 shows the two evaluated use cases in concrete terms:
  - weld: scan the scene, draw a trajectory, confirm a fixed approach-weld-depart command, and execute it (`ch05_user_workflow.tex:230-280`);
  - pick-and-place: capture a scene snapshot, teach pick/place poses, confirm a command that stores a box ID and relative pick pose, and execute it against the refreshed scene (`ch05_user_workflow.tex:298-344`).
- Chapter 4 shows that the use cases are not isolated demos but wrappers over shared infrastructure, and that motion primitive use cases also exist on top of the same runtime (`ch04_implementation.tex:447-449`, `ch04_implementation.tex:634-690`).
- Chapter 6 says the system combines workspace sensing, spatial input, task-specific interpretation, and robot execution behind a shared modular runtime with explicit interfaces (`ch06_discussion.tex:7-11`).
- Chapter 7 says the system was exercised through two representative task families and limited trials on physical hardware (`ch07_conclusion_future_work.tex:5-9`).

### Inference

The thesis demonstrates a working platform for task-oriented spatial authoring, not just an interaction idea. That is the strongest defensible result, and Chapter 6 should say so plainly.

## 4. What Was Not Demonstrated

This section needs to be sharper in the rewrite. Right now, several important absences are spread across the thesis but not collected into one clear evaluation boundary.

### Explicit evidence

- There is no full robot programming language in the thesis design; the introduction explicitly excludes branching, loops, exception recovery, and rich sensor-driven logic (`introduction.tex:54-56`).
- Chapter 6 repeats that scope limit and says the system is narrower than a full robot programming environment (`ch06_discussion.tex:7-9`).
- Chapter 4 says generalized tool control is not standardized, and current use cases simulate tool actions with fixed delays (`ch04_implementation.tex:429-434`, `ch04_implementation.tex:531-535`, `ch04_implementation.tex:623-628`).
- Chapter 4 says collision checking is not performed (`ch04_implementation.tex:531-535`, `ch04_implementation.tex:623-628`).
- Chapter 4 says simulation mode is not supported for the evaluated use cases (`ch04_implementation.tex:449`, `ch04_implementation.tex:535`, `ch04_implementation.tex:628`, `ch04_implementation.tex:640`).
- Chapter 4 says the scene model is fiducial boxes only, with no richer geometry and no confidence or covariance output (`ch04_implementation.tex:373-377`).
- Chapter 4 says the pen tracking module does not fuse IMU data (`ch04_implementation.tex:78`, `ch04_implementation.tex:315-320`).
- Chapter 4 says camera acquisition is currently Windows-only, and BLE behavior differs on Linux (`ch04_implementation.tex:12-17`, `ch04_implementation.tex:61`, `ch04_implementation.tex:165-166`, `ch04_implementation.tex:308-310`).
- Chapter 6 states there was no formal user study, no controlled comparison against pendant-based programming, and no quantitative characterization of tracking accuracy (`ch06_discussion.tex:37-39`).

### Inference

The thesis does not demonstrate industrial maturity, broad task generality, or measurement-backed performance improvement. It demonstrates a prototype workflow, not a validated deployment platform.

## 5. Threats to Validity / Scope of Inference

This is the section that should make reviewers relax, because it shows the thesis knows exactly how far it can be read.

### Internal validity

- The sensing stack is marker-based, visibility-sensitive, and calibration-sensitive (`ch04_implementation.tex:315-320`, `ch04_implementation.tex:373-377`).
- The calibration pipeline assumes a rigid robot-mounted stereo rig and must be redone if the mount is disturbed (`ch04_implementation.tex:229-245`, `ch05_user_workflow.tex:149-160`).
- Pick-and-place depends on a fresh scene snapshot and a matching `box_id`; execution fails if the scene does not contain the expected box (`ch04_implementation.tex:505-535`, `ch05_user_workflow.tex:321-326`, `ch05_user_workflow.tex:341-344`).
- Welding depends on scene geometry staying unchanged after confirmation because the command is resolved into fixed world-frame poses (`ch04_implementation.tex:594-607`, `ch05_user_workflow.tex:274-279`).

### External validity

- The use cases are representative, but still deliberately narrow: pick-and-place and seam welding (`introduction.tex:58-63`, `ch06_discussion.tex:11`, `ch07_conclusion_future_work.tex:7`).
- Chapter 6 explicitly argues that pick-and-place is not the strongest practical target for this prototype, because industrial handling tasks are usually more specialized and integrated with dedicated sensing and grippers (`ch06_discussion.tex:19-23`).
- Chapter 6 explicitly argues that seam welding is the clearest practical fit because the task is trajectory-centric and re-teaching cost is meaningful (`ch06_discussion.tex:21-23`).

### Construct validity

- The thesis evaluates usefulness qualitatively through a working workflow, not through time savings or error rates (`ch02_analysis.tex:109-111`, `ch06_discussion.tex:37-39`).
- The thesis motivates “reduce friction” in the introduction, but it does not directly measure that friction reduction in a controlled experiment (`introduction.tex:4-6`, `introduction.tex:69-74`, `ch06_discussion.tex:37-39`).

### Conclusion validity

- The thesis explicitly says most testing was in simulation and only limited trials were performed on physical hardware (`ch06_discussion.tex:37-39`).
- The conclusion therefore can support “prototype works” and “direction is promising,” but not strong claims about robustness, superiority, or general productivity gains (`ch07_conclusion_future_work.tex:5-9`).

### Inference

The safest high-level inference is that the thesis establishes feasibility and design coherence for a narrow but practically interesting class of tasks. It does not establish universal usefulness or industrial readiness.

## 6. Statements That Are Defensible

These are the kinds of claims that the rewrite can make confidently.

- This thesis demonstrates a working end-to-end prototype for in-workspace spatial authoring (`introduction.tex:8`, `ch06_discussion.tex:7-11`).
- The prototype integrates sensing, authoring, interpretation, execution, visualization, and persistence in one modular runtime (`ch03_system_design.tex:18-37`, `ch03_system_design.tex:1410-1467`, `ch06_discussion.tex:7-9`).
- The system was exercised on two representative use cases with different task structures (`ch05_user_workflow.tex:220-344`, `ch06_discussion.tex:11`, `ch07_conclusion_future_work.tex:7`).
- The weld use case is the clearest current practical fit for the approach (`ch06_discussion.tex:21-23`).
- The pick-and-place use case shows scene-aware runtime recomputation, but it is less compelling as a general industrial target than welding (`ch04_implementation.tex:505-523`, `ch06_discussion.tex:19-23`).
- The thesis is a proof of concept, not a validated industrial platform (`ch07_conclusion_future_work.tex:5-9`).
- The thesis evaluation is qualitative and workflow-oriented (`ch06_discussion.tex:37-39`).

## 7. Statements That Would Overclaim

These are the phrases to avoid unless they are explicitly qualified.

- “The thesis proves that spatial authoring reduces programming effort.”  
  Why this is too strong: there is no formal user study or quantitative comparison (`ch06_discussion.tex:37-39`).

- “The system is industrial-ready.”  
  Why this is too strong: the thesis itself calls it a proof of concept and lists missing tool control, collision checking, simulation, and broad scene understanding (`ch07_conclusion_future_work.tex:5-9`, `ch04_implementation.tex:429-434`, `ch04_implementation.tex:531-535`, `ch04_implementation.tex:623-628`).

- “The approach generalizes to arbitrary robot tasks.”  
  Why this is too strong: the thesis explicitly excludes branching, loops, exception recovery, and rich sensor-driven logic (`introduction.tex:54-56`, `ch06_discussion.tex:9`).

- “The prototype is robust under broader deployment conditions.”  
  Why this is too strong: the sensing stack is marker-based, calibration-dependent, and only limited physical trials were done (`ch04_implementation.tex:315-320`, `ch04_implementation.tex:373-377`, `ch06_discussion.tex:33-39`).

- “Pick-and-place is broadly solved.”  
  Why this is too strong: the thesis itself argues the current prototype is not strongest for highly specific handling cells (`ch06_discussion.tex:19-23`).

- “The robot execution layer is complete.”  
  Why this is too strong: tool control, simulation, and collision checking are explicitly missing (`ch04_implementation.tex:429-434`, `ch04_implementation.tex:531-535`, `ch04_implementation.tex:623-628`).

## 8. Recommended Subsection Structure for Chapter 6

The current Chapter 6 has the right ingredients but too little separation. A stronger structure would make the evaluation boundary much easier to read.

### Recommended structure

1. `What the thesis built`
2. `What the results mean`
3. `Current limitations and validity boundary`
4. `Threats to validity / scope of inference`

### Why this structure works

- `What the thesis built` should close the introduction goals and identify the real thesis contribution as a system, not just an interaction technique (`introduction.tex:69-74`, `ch06_discussion.tex:7-11`).
- `What the results mean` should interpret the two use cases as evidence of different strengths, especially the weld vs. pick-and-place asymmetry (`ch06_discussion.tex:15-27`).
- `Current limitations and validity boundary` should collect the concrete prototype limits already distributed through Chapters 4 and 5 (`ch04_implementation.tex:164-166`, `ch04_implementation.tex:315-320`, `ch04_implementation.tex:373-377`, `ch04_implementation.tex:429-434`, `ch04_implementation.tex:531-535`, `ch04_implementation.tex:623-628`).
- `Threats to validity / scope of inference` should make the evidence level explicit: qualitative, workflow-oriented, limited physical hardware, no formal comparison (`ch06_discussion.tex:37-39`).

### Inference

The current three-section form can work if expanded, but the rewrite will be much stronger if it explicitly separates result interpretation from validity boundary.

## 9. Suggested Wording Blocks

The following blocks are not meant to be copied verbatim, but they are close enough to support a rewrite with the same tone as the rest of the thesis.

### A. Chapter 6 opening

This chapter returns to the thesis question: whether frequently changing collaborative-robot tasks can be programmed with less friction by specifying spatial intent directly in the real workspace. The aim is not to restate the implementation details, but to interpret what the built prototype demonstrates, where it is useful, and where its current limitations define the boundary of the result.

### B. Goal closure / what was built

The main result of the thesis is a working end-to-end prototype for in-workspace spatial authoring. It combines workspace sensing, spatial input, task-specific interpretation, and robot execution behind a shared modular runtime with explicit interfaces. In that sense, the thesis does more than explore a pen-based interaction technique: it demonstrates a complete workflow for graph setup, activation, calibration, authoring, confirmation, execution, visualization, and persistence.

### C. Interpretation of the two use cases

The two evaluated use cases are not interchangeable examples. Pick-and-place shows that the system can combine authored intent with fresh scene information at execution time, but it also exposes how task-specific and integration-heavy material-handling applications often are in practice. Seam welding, by contrast, is a better match for the current prototype because the task is trajectory-centric and the user intent maps naturally onto the final robot procedure.

### D. Evaluation boundary / validity

The present evaluation should be read as qualitative and workflow-oriented. The thesis demonstrates feasibility on representative tasks and on limited physical hardware, but it does not provide a formal user study, a controlled comparison against existing programming workflows, or a quantitative characterization of tracking accuracy. The claims that follow from this work are therefore claims about prototype feasibility and architectural coherence, not claims of industrial readiness or universal productivity gains.

### E. Conclusion bridge

Taken together, the results suggest that task-oriented spatial authoring is most promising for workflows in which the task changes often enough that repeated low-level reprogramming becomes the dominant cost, but the task structure is still narrow enough that a prepared use case can meaningfully interpret spatial intent. The prototype does not replace established robot-programming workflows in general, but it does identify a technically coherent direction for a narrower class of tasks.

### F. Sentence to avoid overclaiming

Avoid language that implies the system has been broadly validated or that it replaces existing industrial workflows. Prefer formulations such as “the prototype suggests,” “the thesis demonstrates,” “the most defensible conclusion is,” and “the current implementation remains limited by.”
