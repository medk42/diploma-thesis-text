# Chapter 6 Evidence Bank

## Metadata
- `source_files`: `summary/extraction/90_master_evidence.md`
- `target_chapter`: Chapter 6
- `author_note_status`: thesis-text grounded unless marked `I`

## 6.1 What the thesis achieved
- [T] `GF-01` The thesis addresses robot-programming friction for frequently changing tasks through in-workspace spatial authoring.
- [T] `GF-02` The main delivered result is a modular end-to-end system with explicit boundaries between sensing, authoring, interpretation, and execution.
- [T] `GF-03` The thesis demonstrates the system on two representative task families: pick-and-place and seam welding.
- [T] `GF-04` The contribution is intentionally task-oriented rather than a general programming language.
- [T] A full operator workflow exists end-to-end: graph creation, activation, calibration, authoring, confirmation, execution, visualization, and persistence.
Sources: `introduction.tex` Motivation, High-level approach, Goals, Thesis structure; `ch03_system_design.tex` UI orchestration module, Persistence semantics; `ch05_user_workflow.tex` System startup through Save and load the program.

## 6.2 Where the approach works well
- [T] `POS-01` The strongest outcome is the extensible modular system itself: contracts and implementations are separated cleanly enough that sensing, UI, robot, and use-case components can be replaced without rewriting the runtime.
- [T] `POS-02` `UsecaseTree` provides a usable control model for task-oriented programming: linear command list, confirmation before execution, sequential run, status, remove, and persistence.
- [T] `POS-06` The frontend acts as a clear control plane rather than a hidden orchestrator, which makes the prototype comprehensible as an operator procedure.
- [T] `POS-07` Splitting `.aergo` and `.paergo` is a practical design win because environment setup and authored task content are separated.
- [T] `POS-03` Pick-and-place is a positive case for scene-adaptive behavior: it stores a box ID and relative pick pose, then recomputes the world pick pose at execution.
- [T] `POS-04` Seam welding is the stronger trajectory-centric result: rough spatial input becomes a seam-aligned executable plan and then fixed world-frame poses.
- [I] The two main use cases should be discussed as complementary strengths, not only as one strong case and one weak case: welding shows the value of trajectory-centric spatial authoring, while pick-and-place shows that the architecture can still support scene-adaptive execution.
- [T] `POS-05` The robot-mounted stereo setup is a meaningful operational compromise because it addresses monocular depth instability while remaining feasible for the prototype.
Sources: `ch02_analysis.tex` Modular architecture, Camera trade-offs, Summary; `ch03_system_design.tex` UsecaseTree: from use case modules to executable programs, UI orchestration module, Persistence semantics; `ch04_implementation.tex` Pick-and-place use case, Seam welding use case; `ch05_user_workflow.tex` User story: pick-and-place, User story: weld.

## 6.3 Limitations and threats to validity

### Scope and concept limits
- [T] `LIM-SCOPE-01` The system is not a full robot programming language.
- [T] `LIM-SCOPE-02` The authored-program model is linear and sequential by design.
- [T] `LIM-SCOPE-03` Tool control is not generalized across robots/devices.
Sources: `introduction.tex` High-level approach; `ch03_system_design.tex` UsecaseTree: from use case modules to executable programs; `ch04_implementation.tex` Robot communication module.

### Sensing and calibration
- [T] `LIM-SENS-01` Marker-based tracking remains sensitive to visibility, lighting, blur, and occlusion.
- [T] `LIM-SENS-02` The sensing stack depends on rigid mounting and successful Charuco-based calibration; mount disturbance requires recalibration.
- [T] `LIM-SENS-03` The current pen implementation is vision-only for pose tracking; IMU data is not fused.
- [T] The camera pose injector uses latest-sample association rather than explicit synchronization.
- [T] The current acquisition backend is partly platform-bound because the camera capture module is Windows-only.
Sources: `ch02_analysis.tex` 6DoF input interface, Camera trade-offs; `ch04_implementation.tex` Pen input device, Pen Tracking (Multi-Cam), Camera pose injector module, Robot-mounted stereo camera calibration module, Stereo camera acquisition module (Windows); `ch05_user_workflow.tex` Activation and calibration.

### Scene understanding
- [T] `LIM-SENS-04` The scene model is intentionally narrow: registry-defined fiducial boxes only.
- [T] Scene detection uses single-frame request/response operation and does not expose confidence or temporal stabilization.
- [T] Weld relies on a narrow seam model, and pick-and-place relies on marker identity plus a box-based object model.
Sources: `ch03_system_design.tex` Scene detection interface; `ch04_implementation.tex` Scene detection module (fiducial boxes); `ch05_user_workflow.tex` User story: weld, User story: pick-and-place.

### Robot execution and tooling
- [T] `LIM-ROBOT-01` Tool actions are simulated by fixed delays rather than standardized device control.
- [T] `LIM-ROBOT-02` No collision checking is performed in the main demonstrated use cases.
- [T] `LIM-ROBOT-03` Simulation mode is not supported.
- [T] Execution controls differ by use case, so pause/stop behavior is not uniform.
Sources: `ch03_system_design.tex` Robot execution interface; `ch04_implementation.tex` Robot communication module, Pick-and-place use case, Seam welding use case, Task-oriented use case modules, Motion-primitive use cases; `ch05_user_workflow.tex` User story: weld, User story: pick-and-place.

### UI and orchestration
- [T] `LIM-UI-01` The UI is a prototype control plane rather than a production frontend.
- [T] `LIM-UI-02` Visualization updates are best-effort and recover through full snapshot reload rather than guaranteed ordered deltas.
- [T] `LIM-UI-03` Persistence is conditional on graph compatibility, hardware availability, and task semantics.
- [T] The workflow still carries significant setup burden: module graph setup, activation, calibration, scene refresh, and manual recovery actions are explicit.
Sources: `ch03_system_design.tex` 3D visualization interface, UI orchestration module, Persistence semantics; `ch05_user_workflow.tex` Instantiate the module graph, Activation and calibration, Main view essentials, Save and load the program.

### Threats to validity
- [T] `VAL-01` The thesis support is qualitative, not benchmark-based.
- [T] `VAL-02` The tasks are representative demos, not proof of broad industrial coverage.
- [T] `VAL-03` The results are tied to the thesis hardware and setup.
- [I] `VAL-04` Efficiency or usability claims should stay qualitative because there is no controlled user study or baseline comparison in the extracted text.
Sources: `introduction.tex` Thesis structure, High-level approach; `ch02_analysis.tex` Requirement-driven design decisions, Coverage of Additional Use Cases; `ch04_implementation.tex` Physical setup and calibration artifacts; `ch05_user_workflow.tex` Preconditions and environment.

## 6.4 Claims to avoid in Chapter 6
- [T] `AVOID-01` Do not describe the system as production-ready.
- [T] `AVOID-02` Do not imply industrial-grade safety, collision avoidance, or simulation support.
- [T] `AVOID-03` Do not claim general superiority over teach-pendant, offline, or other workflows.
- [T] `AVOID-04` Do not describe the system as a full programming language.
- [Q] Avoid promoting note-only implementation bugs unless they are added to the thesis text.
Sources: `introduction.tex` High-level approach, Motivation; `ch03_system_design.tex` UsecaseTree: from use case modules to executable programs, UI orchestration module; `ch04_implementation.tex` Pick-and-place use case, Seam welding use case, Task-oriented use case modules.
