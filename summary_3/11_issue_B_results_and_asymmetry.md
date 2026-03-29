# Issue B: Results, Reusable Boundary, and Asymmetry

This pack isolates the parts of the thesis that support the strongest conceptual result, the strongest practical result, and the weld versus pick-and-place asymmetry. It is meant to support a rewrite of Chapters 6 and 7 that is much more integrated with the rest of the thesis than the current drafts.

## 1. Issue definition

The core problem is not that Chapters 6 and 7 are wrong. It is that they are too compressed relative to the rest of the thesis, so they understate the actual architectural contribution and the different weight of the two evaluated use cases.

The thesis itself frames the work as an end-to-end spatial authoring system with explicit goals for extensibility and real-robot demonstration, not as a pen-only prototype. That framing is already visible in the introduction and system chapters: `introduction.tex:8-8`, `introduction.tex:69-74`, `ch03_system_design.tex:18-37`, `ch03_system_design.tex:1415-1467`, `ch03_system_design.tex:1485-1606`.

The rewrite should therefore treat the final chapters as a synthesis of:
- what the thesis built,
- what the two use cases show,
- where the architecture is strongest,
- where the architecture is weaker,
- and why the conclusion is a prototype-level claim rather than an industrial deployment claim.

## 2. What the thesis built beyond a pen demo

The thesis is not just a tracked pen plus a visualization. It builds a reusable control plane around a modular runtime.

- The introduction already promises a modular, end-to-end system with explicit interfaces and task-oriented use cases, not only input capture: `introduction.tex:8-8`, `introduction.tex:35-43`, `introduction.tex:54-63`.
- Chapter 3 makes the modularity concrete by splitting the system into module contract, core implementation, interface contracts, and modules, then describing how those parts fit together: `ch03_system_design.tex:18-37`, `ch03_system_design.tex:1415-1467`, `ch03_system_design.tex:1485-1606`, `ch03_system_design.tex:1648-1666`.
- The UI is not an incidental frontend. It is the orchestrator that instantiates and wires the module graph, drives activation, runs use cases, and persists both setup and programs: `ch03_system_design.tex:1485-1545`, `ch03_system_design.tex:1555-1606`, `ch03_system_design.tex:1660-1663`.
- The use-case boundary is not ad hoc. `UsecaseTree` is described as a reusable implementation component that maintains a program-level view, a command list, command materialization, execution management, and program persistence: `ch03_system_design.tex:1415-1428`, `ch03_system_design.tex:1430-1467`.
- The workflow chapter shows the end-to-end operational story: graph setup, activation, calibration, authoring, confirmation, execution, and save/load: `ch05_user_workflow.tex:4-9`, `ch05_user_workflow.tex:55-102`, `ch05_user_workflow.tex:108-177`, `ch05_user_workflow.tex:182-215`, `ch05_user_workflow.tex:220-351`.

The right phrasing for Chapter 6 is therefore something like: the thesis produced a reusable spatial-authoring runtime and workflow, not just a single interaction prototype.

## 3. Strongest conceptual result

The strongest conceptual result is the combination of shared runtime, explicit interfaces, and a reusable use-case boundary.

- The system design chapter says the system is organized into four conceptual parts, with stable contracts and interchangeable implementations: `ch03_system_design.tex:7-40`.
- The module contract is explicit about message routing, lifecycle, and concurrency, so modules communicate only through the runtime core: `ch03_system_design.tex:54-90`.
- The interface contracts turn those generic channels into application-level protocols for activation, use cases, visualization, robot execution, and scene detection: `ch03_system_design.tex:849-867`, `ch03_system_design.tex:872-970`, `ch03_system_design.tex:974-1111`, `ch03_system_design.tex:1203-1360`.
- `UsecaseTree` is the key conceptual bridge between low-level protocol and user-facing programming. It gives the thesis a reusable programming model with discovery, composition, confirmation, execution, and persistence: `ch03_system_design.tex:1415-1467`.
- The discussion chapter already gestures at this, but too briefly. It says the thesis built a shared modular runtime with explicit interfaces, and that the two use cases are built on the same architectural backbone: `ch06_discussion.tex:7-11`, `ch06_discussion.tex:15-17`.

This is the concept to foreground in both Chapter 6 and Chapter 7. The result is not “we made a pen tracker.” It is “we built a modular, reusable authoring-and-execution architecture that can host different task families.”

## 4. Strongest practical result

The strongest practical result is seam welding, not pick-and-place.

- The introduction already marks seam welding as trajectory-centric and likely to need frequent re-teaching: `introduction.tex:58-63`.
- Chapter 4 implements weld as an interpretation of an authored trajectory against a detected seam, with fixed approach, weld, and depart poses resolved at command-creation time: `ch04_implementation.tex:541-628`.
- Chapter 5 shows the user experience: capture scene, draw the seam trajectory, confirm, then execute; the weld command is resolved at confirmation time into fixed world-frame poses: `ch05_user_workflow.tex:220-280`.
- Chapter 6 states directly that seam welding is the clearest practical fit, because it is trajectory-centric and because repeated re-teaching is a meaningful part of the programming cost: `ch06_discussion.tex:21-23`.
- Chapter 7 repeats the same conclusion in condensed form: `ch07_conclusion_future_work.tex:5-9`.

Why this is the practical high point:
- the authoring input maps naturally to the task,
- the program structure is simple enough to infer a valid robot procedure,
- and the task family matches the thesis motivation about frequent changeovers.

The thesis should say that explicitly. It should not bury weld behind a generic “both demos are complementary” statement.

## 5. Pick-and-place: what it proves and where it is weaker

Pick-and-place is valuable, but mainly as a proof that the architecture can combine authored intent with runtime scene information.

- The user story makes the asymmetry explicit: the command stores a selected box ID, a relative pick pose, and a fixed place pose; at execution time the system rescans the scene and recomputes the world pick pose from the current box pose: `ch05_user_workflow.tex:298-344`.
- The implementation does the same thing in code terms: it stores `box_id` and `T_box<-pick`, then re-reads the scene at execution, finds the box, reconstructs the world pick pose, and uses that for motion: `ch04_implementation.tex:452-535`.
- The command is therefore scene-coupled, but only through a narrow object model. That is an architectural win, because it shows the system is not just replaying frozen trajectories: `ch04_implementation.tex:481-523`, `ch06_discussion.tex:19-20`.

Where it is weaker:
- It relies on a narrow fiducial-box scene model and a fresh scene snapshot at execution time: `ch04_implementation.tex:331-377`, `ch04_implementation.tex:505-535`, `ch06_discussion.tex:31-33`.
- It does not solve generalized material handling, because the thesis itself says those tasks are often highly specific and usually integrated with conveyors, grippers, and dedicated sensing components: `ch06_discussion.tex:19-20`, `ch01_background.tex:11-13`, `ch01_background.tex:37-41`.
- The implementation does not include collision checking, tool abstraction, or simulation-mode execution: `ch04_implementation.tex:431-437`, `ch04_implementation.tex:531-535`.

The conclusion to draw is not “pick-and-place is bad.” The conclusion is: pick-and-place demonstrates reuse and runtime scene coupling, but it is not the clearest practical target for the current prototype.

## 6. Weld: why it is the clearest current fit

Weld fits the thesis better because the use-case structure and the interaction structure are aligned.

- The task is naturally trajectory-centric: the introduction says so, and the user story operationalizes it as drawing a trajectory along the intended seam: `introduction.tex:58-63`, `ch05_user_workflow.tex:230-280`.
- The implementation turns the user trajectory into a seam candidate, projects it, and resolves a fixed motion plan at creation time: `ch04_implementation.tex:570-604`.
- The execution path is then deterministic: approach, weld start, simulated start welding, weld end, simulated stop welding, depart: `ch04_implementation.tex:606-628`.
- The discussion chapter makes the thesis-level interpretation explicit: weld is the clearest practical fit because repeated re-teaching is a meaningful cost and because the workflow is direct in that setting: `ch06_discussion.tex:21-23`.

This is the place where the thesis can make a meaningful practical claim without overclaiming:
- the system is especially promising for welding-like tasks,
- especially where the task is frequently re-taught,
- and especially where a narrow, task-oriented use case is preferable to a general robot-programming environment.

The user’s broader intuition about one-off or highly variable welding is reasonable, but it should stay phrased as an inference or possible extension unless the thesis text explicitly supports it. The safe thesis-grounded claim is the smaller one already present in the text: frequent re-teaching and small-batch production.

## 7. How this differs from related work framing

The thesis should not present itself as “another AR interface paper.” The related work chapter already positions the contribution differently.

- ARRPS-like work is waypoint/path-centric, whereas the thesis is task-oriented and use-case-driven: `ch01_background.tex:23-27`, `ch01_background.tex:57-61`.
- PRogramAR-like work is rule-oriented and reactive, whereas the thesis emphasizes reusable use cases that infer internal motion structure from intent and scene context: `ch01_background.tex:29-33`.
- Offline authoring works are about transfer and calibration to reduce robot downtime, whereas this thesis chooses online authoring with a reusable acquisition/execution pipeline: `ch01_background.tex:35-41`.
- Hand-tracking work is a useful comparison point for input modality, but the thesis is not primarily an input-modalities paper. It is a system and workflow paper with a modular architecture: `ch01_background.tex:43-49`, `ch03_system_design.tex:1415-1467`, `ch03_system_design.tex:1485-1666`.
- Multimodal intent work is discussed as a future direction, not as the thesis’ core contribution: `ch01_background.tex:51-55`.

This matters because the final chapters should not sound like they are only about the pen. The actual thesis-level contribution is the task-oriented online spatial authoring system and its reusable runtime.

## 8. Claims that are safe

- The thesis built an end-to-end system for in-workspace spatial authoring of selected robot tasks: `ch06_discussion.tex:7-11`, `ch07_conclusion_future_work.tex:5-9`.
- The system is modular and uses explicit interfaces between sensing, authoring, interpretation, visualization, and execution: `ch03_system_design.tex:18-37`, `ch03_system_design.tex:1648-1666`.
- The system supports a reusable use-case boundary with a program model, confirmation step, sequential execution, and persistence: `ch03_system_design.tex:1415-1467`, `ch03_system_design.tex:1555-1606`.
- Pick-and-place proves the runtime can combine authored intent with runtime scene information: `ch04_implementation.tex:481-523`, `ch05_user_workflow.tex:301-344`, `ch06_discussion.tex:19-20`.
- Seam welding is the clearest practical fit for the current prototype: `ch06_discussion.tex:21-23`, `ch07_conclusion_future_work.tex:7-9`.
- The thesis remains a prototype-level or proof-of-concept result, not a validated industrial platform: `ch06_discussion.tex:37-39`, `ch07_conclusion_future_work.tex:9-9`.

## 9. Claims to avoid or qualify

- Avoid implying the thesis solved general robot programming. The thesis explicitly excludes branching, loops, exception recovery, and rich sensor-driven logic: `introduction.tex:54-56`, `ch06_discussion.tex:9-9`, `ch07_conclusion_future_work.tex:9-9`.
- Avoid implying production readiness. The thesis text explicitly says the current implementation is limited and prototype-level: `ch06_discussion.tex:31-37`, `ch07_conclusion_future_work.tex:9-9`.
- Avoid claiming broad industrial validation. The evaluation is qualitative and workflow-oriented, with limited physical trials: `ch06_discussion.tex:37-39`, `ch07_conclusion_future_work.tex:5-9`.
- Avoid claiming the system is generally robust across sensing conditions. The thesis itself notes sensitivity to visibility, blur, lighting, calibration, and the absence of IMU fusion: `ch04_implementation.tex:309-320`, `ch04_implementation.tex:349-377`, `ch06_discussion.tex:33-33`.
- Avoid over-selling pick-and-place as the headline success. It is useful, but the thesis itself says it is not the strongest practical target for the current prototype: `ch06_discussion.tex:19-20`.
- Avoid introducing vague new phrases like “scene-adaptive execution” unless immediately defined in concrete terms. Use the concrete thesis wording instead: “re-scans the scene at execution and recomputes the pick pose from the current box pose”: `ch05_user_workflow.tex:301-344`, `ch04_implementation.tex:505-523`.
- Avoid any implication that the system exports cleanly into a native robot-side program in the current prototype. The thesis says authored tasks run through the thesis runtime and export is future work or a deeper interface question: `ch06_discussion.tex:35-35`, `ch07_conclusion_future_work.tex:15-15`.

## 10. Suggested paragraph-level content

- Chapter 6 opening paragraph should return directly to the introduction question and answer it in thesis terms: the system shows that selected collaborative-robot tasks can be authored with less friction through spatial intent in the real workspace, but only inside a task-oriented, modular framework: `introduction.tex:6-8`, `ch06_discussion.tex:3-11`.
- The next paragraph should state the core result plainly: not a pen demo, but a reusable runtime with explicit interfaces and a full workflow from graph setup to persistence: `ch03_system_design.tex:1415-1467`, `ch03_system_design.tex:1485-1606`, `ch05_user_workflow.tex:4-9`.
- A following paragraph should explain the modular contribution in concrete terms, using the use-case wrapper, `UsecaseTree`, and the UI orchestration as the evidence chain: `ch03_system_design.tex:1415-1467`, `ch03_system_design.tex:1485-1545`, `ch03_system_design.tex:1555-1606`.
- Then the discussion should compare the two use cases in the right order: weld first as the clearest fit, pick-and-place second as the architectural proof that the runtime can combine authored intent with fresh scene data: `ch06_discussion.tex:19-23`, `ch04_implementation.tex:452-535`, `ch04_implementation.tex:541-628`.
- The limitations subsection should be split by type, not merged into one generic caveat paragraph. The most defensible split is scene understanding, sensing/calibration, execution/tooling, and evaluation boundary: `ch06_discussion.tex:29-39`, `ch04_implementation.tex:309-320`, `ch04_implementation.tex:349-377`, `ch04_implementation.tex:431-437`, `ch04_implementation.tex:531-535`, `ch04_implementation.tex:623-628`.
- Chapter 7 conclusion should be shorter than Chapter 6 and should explicitly close the three introduction goals before moving into future work: `introduction.tex:69-94`, `ch07_conclusion_future_work.tex:5-9`.
- Future work should be split into two blocks. The first block should be near-term engineering completion around sensing, execution, and cross-platform support; the second should be longer-term research directions around interaction, integration with existing workflows, formal evaluation, and broader task classes: `ch07_conclusion_future_work.tex:11-17`, `ch07_conclusion_future_work.tex:19-27`.

