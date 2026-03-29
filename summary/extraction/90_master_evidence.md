# Master Evidence Bank

## Metadata
- `source_files`: `p01` through `p06`
- `target_chapter`: Chapter 6 and Chapter 7
- `author_note_status`: thesis-text grounded unless marked `I` or `Q`

## Safe Thesis-Level Claims
- [T] `GF-01` The thesis studies in-workspace spatial authoring as a way to reduce programming friction for frequently changing tasks. Sources: `introduction.tex` Motivation, High-level approach, Goals.
- [T] `GF-02` The main delivered artifact is a modular end-to-end system that connects sensing, authoring, interpretation, and execution through explicit interfaces. Sources: `introduction.tex` High-level approach; `ch02_analysis.tex` Modular architecture; `ch03_system_design.tex` System at a glance; `ch04_implementation.tex` Module implementation overview.
- [T] `GF-03` The thesis demonstrates the approach on two representative task families: pick-and-place and seam welding. Sources: `introduction.tex` Goals; `ch04_implementation.tex` Task-oriented use case modules; `ch05_user_workflow.tex` User story: weld, User story: pick-and-place.
- [T] `GF-04` The thesis deliberately targets task-oriented use cases rather than a full robot programming language. Sources: `introduction.tex` High-level approach; `ch03_system_design.tex` UsecaseTree: from use case modules to executable programs.
- [T] `GF-05` Chapter 6 is intended as a qualitative discussion/evaluation chapter. Sources: `introduction.tex` Thesis structure; `ch06_discussion.tex`.
- [T] `GF-06` Chapter 7 is intended to summarize contributions and future work. Sources: `introduction.tex` Thesis structure; `thesis.tex`.

## What Was Demonstrated
- [T] A complete operator workflow was built: startup, module-graph construction, activation, robot-mounted stereo calibration, authoring, confirmation, execution, visualization, and persistence. Sources: `ch03_system_design.tex` UI orchestration module, Persistence semantics; `ch05_user_workflow.tex` System startup through Save and load the program.
- [T] Pick-and-place demonstrates scene-adaptive execution: the command stores a box ID and relative pick transform, re-reads the scene at execution, and reconstructs the world pick pose from current object state. Sources: `ch04_implementation.tex` Pick-and-place use case; `ch05_user_workflow.tex` User story: pick-and-place.
- [T] Seam welding demonstrates trajectory-centric authoring: a user trajectory is matched to a seam candidate, projected, and materialized into a fixed approach-weld-depart plan at confirmation time. Sources: `ch04_implementation.tex` Seam welding use case; `ch05_user_workflow.tex` User story: weld.
- [T] The same runtime/wrapper model supports the two main demos and additional motion-primitive use cases, which is direct evidence for extensibility. Sources: `ch04_implementation.tex` Motion-primitive use cases; `ch03_system_design.tex` Use case interface.
- [T] Persistence is split into system setup (`.aergo`) and authored program (`.paergo`). Sources: `ch03_system_design.tex` Persistence semantics; `ch05_user_workflow.tex` Save and load the program.

## Strong Outcomes
- [T] `POS-01` The strongest contribution claim is the separation between contracts and implementations: sensing, UI, robot execution, visualization, and use-case logic are replaceable behind stable interfaces. Sources: `ch02_analysis.tex` Modular architecture; `ch03_system_design.tex` Module contract, Interface contracts.
- [T] `POS-02` `UsecaseTree` provides a consistent linear authoring workflow with confirm/start/status/remove semantics, so a use case plugin becomes a usable operator-facing program model without requiring a full language. Sources: `ch03_system_design.tex` UsecaseTree: from use case modules to executable programs; UI orchestration module.
- [T] `POS-03` Pick-and-place is a positive proof that the system can support dynamic scene-dependent behavior inside the current box-based model. Sources: `ch04_implementation.tex` Pick-and-place use case; `ch05_user_workflow.tex` User story: pick-and-place.
- [T] `POS-04` Seam welding is the strongest trajectory-authoring proof because the interface turns rough spatial input into a seam-aligned executable procedure. Sources: `ch04_implementation.tex` Seam welding use case; `ch05_user_workflow.tex` User story: weld.
- [T] `POS-05` The robot-mounted stereo sensing choice is grounded as a practical response to unstable monocular depth while still keeping the prototype feasible. Sources: `ch02_analysis.tex` Camera trade-offs, Summary; `ch04_implementation.tex` Robot-mounted stereo camera calibration module.
- [T] `POS-06` The UI is valuable as an explicit control plane: graph editing, activation, authoring, visualization, and persistence are all exposed as clear operator actions. Sources: `ch03_system_design.tex` UI orchestration module; `ch05_user_workflow.tex` Instantiate the module graph, Activation and calibration, Main view essentials.
- [T] `POS-07` Separating graph persistence from program persistence is a practical design win because environment configuration and authored task content are not conflated. Sources: `ch03_system_design.tex` Persistence semantics; `ch05_user_workflow.tex` Save and load the program.

## Limitations
- [T] `LIM-SCOPE-01` The system is not a full robot programming language. Sources: `introduction.tex` High-level approach; `ch03_system_design.tex` UsecaseTree.
- [T] `LIM-SCOPE-02` The authored-program model is intentionally linear and sequential. Sources: `ch03_system_design.tex` UsecaseTree; User workflow state machine.
- [T] `LIM-SCOPE-03` Tool control was recognized as important but not implemented as a general cross-robot abstraction. Sources: `ch02_analysis.tex` Robot interface; `ch04_implementation.tex` Robot communication module.
- [T] `LIM-SENS-01` Marker-based tracking is sensitive to visibility, lighting, blur, occlusion, and calibration quality. Sources: `ch02_analysis.tex` 6DoF input interface; `ch04_implementation.tex` Pen Tracking (Multi-Cam).
- [T] `LIM-SENS-02` The robot-mounted stereo workflow assumes a rigid mount and successful Charuco-based calibration; disturbance invalidates it. Sources: `ch04_implementation.tex` Robot-mounted stereo camera calibration module; `ch05_user_workflow.tex` Activation and calibration.
- [T] `LIM-SENS-03` The pen tracking implementation does not fuse IMU data. Sources: `ch04_implementation.tex` Pen input device, Pen Tracking (Multi-Cam).
- [T] `LIM-SENS-04` Scene understanding is intentionally narrow and box-based. Sources: `ch03_system_design.tex` Scene detection interface; `ch04_implementation.tex` Scene detection module (fiducial boxes).
- [T] `LIM-ROBOT-01` The robot layer is motion-centric and lacks a standardized tool-control stack; current use cases simulate tool actions by fixed delays. Sources: `ch03_system_design.tex` Robot execution interface; `ch04_implementation.tex` Pick-and-place use case, Seam welding use case.
- [T] `LIM-ROBOT-02` No collision checking is performed in the main demonstrated use cases. Sources: `ch04_implementation.tex` Pick-and-place use case, Seam welding use case.
- [T] `LIM-ROBOT-03` Simulation mode is not supported for the thesis programs. Sources: `ch04_implementation.tex` Task-oriented use case modules, Motion-primitive use cases.
- [T] `LIM-UI-01` The frontend is explicitly a prototype control plane, not a reference production UI. Sources: `ch03_system_design.tex` UI orchestration module; `ch05_user_workflow.tex` Main view essentials.
- [T] `LIM-UI-02` Visualization updates are best-effort; dropped deltas require recovery via a full scene snapshot. Sources: `ch03_system_design.tex` 3D visualization interface, UI orchestration module.
- [T] `LIM-UI-03` Program save/load is conditional on graph compatibility, hardware availability, and task semantics. Sources: `ch03_system_design.tex` Persistence semantics; `ch05_user_workflow.tex` Activation and calibration, Save and load the program.

## Threats to Validity
- [T] `VAL-01` The thesis evidence is qualitative and workflow-oriented rather than a formal benchmark study. Sources: `introduction.tex` Thesis structure; `ch02_analysis.tex` Requirement-driven design decisions.
- [T] `VAL-02` The evaluation covers representative prototype tasks rather than broad industrial coverage. Sources: `introduction.tex` High-level approach; `ch02_analysis.tex` Coverage of Additional Use Cases.
- [T] `VAL-03` The conclusions are bounded by the specific hardware and setup used in the thesis. Sources: `ch04_implementation.tex` Physical setup and calibration artifacts; `ch05_user_workflow.tex` Preconditions and environment.
- [I] `VAL-04` There is no controlled user study or baseline comparison in the extracted text, so efficiency claims should stay cautious and qualitative.

## Future Work
- [T] `FW-SENS-01` Improve sensing and calibration, including more robust camera setups and recalibration support. Sources: `ch02_analysis.tex` Camera trade-offs; `ch04_implementation.tex` Robot-mounted stereo camera calibration module.
- [T] `FW-SENS-02` Replace or extend the box-only scene model with richer scene detection. Sources: `ch02_analysis.tex` Scene detection; `ch03_system_design.tex` Scene detection interface; `ch04_implementation.tex` Scene detection module (fiducial boxes).
- [T] `FW-INPUT-01` Support alternative 6DoF input modalities such as hand tracking or VR/AR controllers. Sources: `ch01_background.tex` Positioning of this thesis; `ch02_analysis.tex` 6DoF input interface.
- [T] `FW-INPUT-02` Explore multimodal intent such as gesture plus speech. Sources: `ch01_background.tex` Multimodal intent.
- [T] `FW-ROBOT-01` Add a standardized tool-control abstraction for grippers, welding tools, and related devices. Sources: `ch02_analysis.tex` Robot interface; `ch04_implementation.tex` Robot communication module.
- [T] `FW-ROBOT-02` Add motion validation, collision checking, or a stronger execution-planning layer. Sources: `ch02_analysis.tex` Robot interface; `ch04_implementation.tex` Pick-and-place use case, Seam welding use case.
- [T] `FW-UI-01` Improve the frontend/orchestration UX and reduce manual recovery/setup burden. Sources: `ch02_analysis.tex` UI; `ch03_system_design.tex` UI orchestration module.
- [T] `FW-UI-02` Strengthen visualization synchronization beyond best-effort deltas. Sources: `ch03_system_design.tex` 3D visualization interface, UI orchestration module.
- [T] `FW-EVAL-01` Run a formal user study or stronger quantitative evaluation. Sources: `introduction.tex` Goals, Thesis structure; `ch02_analysis.tex` Requirement-driven design decisions.
- [T] `FW-EVAL-02` Compare the workflow against teach-pendant, offline-programming, or related alternatives in a controlled setting. Sources: `introduction.tex` Motivation; `ch01_background.tex` Positioning of this thesis.
- [T] `FW-EVAL-03` Add more complex use cases beyond the two main demos. Sources: `ch02_analysis.tex` Coverage of Additional Use Cases; `ch04_implementation.tex` Motion-primitive use cases.

## Claims to Avoid
- [T] `AVOID-01` Do not claim the system is production-ready.
- [T] `AVOID-02` Do not claim industrial-grade safety, collision avoidance, or simulation readiness.
- [T] `AVOID-03` Do not claim superiority over teach pendants, offline programming, ROS, or broader industrial workflows in general.
- [T] `AVOID-04` Do not claim a full robot programming language.
- [Q] Keep note-only bug claims separate unless they are added to the thesis text.

## Keep-Separate or Weakly Grounded Items
- [I] Pick-and-place can be framed positively as a dynamic-use-case result, but not as proof of broad industrial dynamic programming capability.
- [I] Seam welding can be framed as the stronger trajectory-authoring fit, but broader business/usefulness claims from user notes are not grounded in the thesis text yet.
