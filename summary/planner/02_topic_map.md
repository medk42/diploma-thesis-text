# Topic Map

This is the canonical map for what extraction workers should look for.

## Legend

- `WRITE` = grounded enough to use in the chapter evidence bank.
- `MAYBE` = plausible thesis content, but should be kept softer or checked against surrounding text.
- `VERIFY` = derived from user notes or implementation memory, not yet grounded in the thesis text.

## A. Grounded thesis claims

| ID | Status | Topic | Best source sections |
|---|---|---|---|
| GF-01 | WRITE | The thesis studies in-workspace spatial authoring as a way to reduce robot programming friction in frequently changing tasks. | `introduction.tex` Motivation, High-level approach, Goals |
| GF-02 | WRITE | The system is modular and end-to-end: sensing, authoring, interpretation, and execution are connected through explicit interfaces. | `introduction.tex` High-level approach; `ch03_system_design.tex` System at a glance |
| GF-03 | WRITE | The evaluation focus is two representative task families: pick-and-place and seam welding. | `introduction.tex` High-level approach, Goals; `ch02_analysis.tex` Target tasks |
| GF-04 | WRITE | The thesis deliberately targets task-oriented use cases, not a full robot programming language. | `introduction.tex`; `ch02_analysis.tex`; `ch03_system_design.tex` UsecaseTree scope |
| GF-05 | WRITE | Chapter 6 is intended as a qualitative evaluation/discussion chapter. | `introduction.tex` Thesis structure; `ch06_discussion.tex` placeholder |
| GF-06 | WRITE | Chapter 7 is meant to summarize contributions and outline future work. | `introduction.tex` Thesis structure; `thesis.tex` chapter placement |

## B. Positive outcomes and strongest claims

| ID | Status | Topic | Best source sections |
|---|---|---|---|
| POS-01 | WRITE | The architecture cleanly separates contracts from implementations, which makes sensing/UI/robot/use-case components replaceable. | `ch03_system_design.tex` System at a glance; Module contract; Interface contracts |
| POS-02 | WRITE | The `UsecaseTree` model turns a use case plugin into a linear authoring workflow with confirm/start/status/remove semantics. | `ch03_system_design.tex` UsecaseTree; UI orchestration; Persistence |
| POS-03 | WRITE | Pick-and-place demonstrates scene-adaptive task behavior because the command is bound to a box ID and recomputed at execution time. | `ch04_implementation.tex` Pick-and-place use case; `ch05_user_workflow.tex` Pick-and-place story |
| POS-04 | WRITE | Seam welding demonstrates trajectory-centric spatial authoring and fixed pose materialization at confirmation time. | `ch04_implementation.tex` Seam welding use case; `ch05_user_workflow.tex` Weld story |
| POS-05 | WRITE | The robot-mounted stereo sensing setup is the thesis prototype choice because monocular depth was unstable and stereo gives better usable depth. | `ch02_analysis.tex` Camera trade-offs; `ch04_implementation.tex` hardware setup |
| POS-06 | WRITE | The UI orchestrates graph setup, module activation, program authoring, visualization, and persistence through explicit control-plane actions. | `ch03_system_design.tex` UI orchestration; workflow state machine |
| POS-07 | WRITE | The system supports separate persistence for the runtime graph and the authored program. | `ch03_system_design.tex` Persistence semantics |

## C. Limitations grounded in the thesis text

### Concept-level or scope limits

| ID | Status | Topic | Best source sections |
|---|---|---|---|
| LIM-SCOPE-01 | WRITE | The system is not a full programming language and does not cover branching, loops, exception recovery, or rich sensor-driven logic. | `introduction.tex`; `ch03_system_design.tex` UsecaseTree scope |
| LIM-SCOPE-02 | WRITE | The system is intentionally linear at the program level. | `ch03_system_design.tex` UsecaseTree scope and workflow |
| LIM-SCOPE-03 | WRITE | Tool control was considered but not implemented as a general cross-robot abstraction. | `ch02_analysis.tex` Robot interface; `ch03_system_design.tex` Robot execution interface |

### Sensing and calibration

| ID | Status | Topic | Best source sections |
|---|---|---|---|
| LIM-SENS-01 | WRITE | Camera-based marker tracking and monocular depth are sensitive to practical factors such as viewing angle, lighting, occlusion, and calibration quality. | `ch02_analysis.tex` 6DoF input interface; camera trade-offs |
| LIM-SENS-02 | WRITE | The robot-mounted stereo calibration assumes a rigid mount and stable calibration target conditions. | `ch04_implementation.tex` calibration module; `ch05_user_workflow.tex` calibration steps |
| LIM-SENS-03 | WRITE | The pen tracking pipeline currently does not fuse IMU data even though the pen firmware transmits it. | `ch04_implementation.tex` pen input device |
| LIM-SENS-04 | WRITE | The scene model is deliberately simple and box-based. | `ch02_analysis.tex` Scene detection; `ch03_system_design.tex` Scene detection interface; `ch04_implementation.tex` scene objects |

### Robot execution and tooling

| ID | Status | Topic | Best source sections |
|---|---|---|---|
| LIM-ROBOT-01 | WRITE | The prototype focuses on motion and basic feedback, not a full tool-control stack. | `ch02_analysis.tex` Robot interface; `ch03_system_design.tex` Robot execution interface |
| LIM-ROBOT-02 | WRITE | No collision checking is performed in the demonstrated use cases. | `ch04_implementation.tex` pick-and-place and weld use cases |
| LIM-ROBOT-03 | WRITE | Simulation mode is not supported for the prototype programs. | `ch04_implementation.tex`; `ch05_user_workflow.tex` |

### UI and orchestration

| ID | Status | Topic | Best source sections |
|---|---|---|---|
| LIM-UI-01 | WRITE | The UI is a prototype control plane, not a reference production frontend. | `ch03_system_design.tex` UI note |
| LIM-UI-02 | WRITE | Visualization updates are best-effort and the UI must occasionally resync from a full scene snapshot. | `ch03_system_design.tex` Visualization interface; UI orchestration |
| LIM-UI-03 | WRITE | Program persistence depends on the referenced use case identifiers still being present in the current setup. | `ch03_system_design.tex` Persistence semantics |

## D. Threats to validity

| ID | Status | Topic | Best source sections |
|---|---|---|---|
| VAL-01 | WRITE | The thesis is qualitative rather than a formal benchmark study. | `introduction.tex` thesis structure; `ch06_discussion.tex` placeholder |
| VAL-02 | WRITE | The evaluation covers representative tasks and prototype operation, not exhaustive industrial coverage. | `introduction.tex`; `ch02_analysis.tex` coverage discussion |
| VAL-03 | WRITE | The conclusions are tied to the thesis hardware and setup. | `ch04_implementation.tex`; `ch05_user_workflow.tex` |
| VAL-04 | MAYBE | There is no user study or controlled comparison in the text, so claims about user efficiency should stay cautious. | `introduction.tex`; `ch05_user_workflow.tex` |

## E. Future work grounded in the thesis text

| ID | Status | Topic | Best source sections |
|---|---|---|---|
| FW-SENS-01 | WRITE | Better sensing and calibration, including alternative camera setups and more robust spatial input sources. | `ch02_analysis.tex`; `ch03_system_design.tex` |
| FW-SENS-02 | WRITE | Richer scene detection than box-only fiducials. | `ch02_analysis.tex`; `ch03_system_design.tex` |
| FW-INPUT-01 | WRITE | Alternative 6DoF input sources such as hand tracking or VR controllers. | `ch02_analysis.tex`; `ch01_background.tex` |
| FW-INPUT-02 | WRITE | Multimodal intent input such as gesture plus speech. | `ch01_background.tex` |
| FW-ROBOT-01 | WRITE | Tool abstraction and broader robot/backend support. | `ch02_analysis.tex`; `ch03_system_design.tex` |
| FW-ROBOT-02 | WRITE | Better motion validation and execution support in the robot layer. | `ch02_analysis.tex`; `ch03_system_design.tex` |
| FW-UI-01 | WRITE | Alternative frontends and improved orchestration UX. | `ch02_analysis.tex`; `ch03_system_design.tex` |
| FW-UI-02 | WRITE | More robust visualization synchronization and update recovery. | `ch03_system_design.tex` |
| FW-EVAL-01 | WRITE | A formal user study and better quantitative evaluation. | `introduction.tex`; `ch06_discussion.tex` placeholder; chapter roadmap |
| FW-EVAL-02 | WRITE | Comparison against alternative robot-programming workflows. | `ch01_background.tex`; `ch02_analysis.tex` |
| FW-EVAL-03 | WRITE | More complex use cases beyond the two demos. | `ch02_analysis.tex`; `ch04_implementation.tex` |

## F. Claims to avoid unless later verified

| ID | Status | Topic | Why it should stay out unless confirmed |
|---|---|---|---|
| AVOID-01 | WRITE | Claiming the system is production-ready. | The thesis text frames it as a prototype. |
| AVOID-02 | WRITE | Claiming full industrial-grade safety or collision avoidance. | The demonstrated use cases do not include that. |
| AVOID-03 | WRITE | Claiming superiority over teach pendants, offline programming, or ROS in general. | The text supports motivation and qualitative positioning, not universal dominance. |
| AVOID-04 | WRITE | Claiming a full robot programming language. | The text explicitly excludes branching, loops, and rich sensor-driven logic. |
| AVOID-05 | VERIFY | Save/load freezes, visualization desync bugs, or other implementation defects mentioned in user notes. | These are not currently grounded in the thesis text. |
| AVOID-06 | VERIFY | Platform-specific BLE and camera issues from user notes if not written into the thesis text. | Keep them out unless a later source check confirms them. |

## G. Author-memory items to verify separately

These are useful context from the user notes, but they are not thesis evidence yet.

| ID | Status | Topic |
|---|---|---|
| VERIFY-01 | VERIFY | Pick-and-place shows dynamic scene-adaptive usability and not only fixed setup-time tasks. |
| VERIFY-02 | VERIFY | Welding is the best fit for the current prototype because it matches the one-time setup plus repeated task model. |
| VERIFY-03 | VERIFY | The platform would be especially useful for repetitive workbench tasks like robot-assisted welding or spray painting. |
| VERIFY-04 | VERIFY | Manual robot programming remains the right choice for highly repetitive industrial setups that rarely change. |
| VERIFY-05 | VERIFY | The main product contribution is the extensible system rather than any single use case. |
| VERIFY-06 | VERIFY | Current rough edges are mainly engineering debt rather than conceptual flaws. |

