# Chapter 6 Draft Notes

## Purpose
- Internal drafting file for Chapter 6.
- Source-grounded from `summary/extraction/91_discussion_evidence.md`, with truth-review softening applied.
- Use this as the main input for later thesis prose drafting.

## 6.1 What the thesis achieved

### Draft prose
This thesis addressed the problem of programming friction in collaborative-robot tasks that change frequently by exploring in-workspace spatial authoring as an alternative to teach-pendant, offline-programming, and hand-guiding workflows. The main delivered result is not only a single interaction technique, but a modular end-to-end system that connects workspace sensing, spatial authoring, task-specific interpretation, and robot execution through explicit interfaces. Within this framework, the thesis demonstrated two representative task families on a real robot platform: pick-and-place as a material-handling task and seam welding as a trajectory-centric process task. At the same time, the work deliberately stayed within the scope of task-oriented use cases rather than attempting to build a full robot programming language.

### Evidence to preserve
- [T] `GF-01` The thesis studies in-workspace spatial authoring as a way to reduce robot-programming friction for frequently changing tasks.
  Sources: `introduction.tex` Motivation, High-level approach, Goals.
- [T] `GF-02` The delivered artifact is a modular end-to-end system with explicit boundaries between sensing, authoring, interpretation, and execution.
  Sources: `introduction.tex` High-level approach; `ch02_analysis.tex` Modular architecture; `ch03_system_design.tex` System at a glance.
- [T] `GF-03` The approach is demonstrated on two representative task families: pick-and-place and seam welding.
  Sources: `introduction.tex` Goals; `ch04_implementation.tex` Task-oriented use case modules; `ch05_user_workflow.tex` User story: weld, User story: pick-and-place.
- [T] `GF-04` The system is intentionally task-oriented rather than a full robot programming language.
  Sources: `introduction.tex` High-level approach; `ch03_system_design.tex` UsecaseTree: from use case modules to executable programs.
- [T] A full operator workflow exists end-to-end: graph creation, activation, calibration, authoring, confirmation, execution, visualization, and persistence.
  Sources: `ch03_system_design.tex` UI orchestration module, Persistence semantics; `ch05_user_workflow.tex` System startup through Save and load the program.

## 6.2 Where the approach works well

### Draft prose
The strongest thesis-level outcome is the extensible system architecture itself. The runtime separates contracts from implementations strongly enough that sensing components, the UI, robot backends, visualization, and task-specific use cases can be changed without rewriting the entire system. This matters because the thesis does not only validate a pen-based prototype, but also a reusable framework for future spatial-authoring experiments and task plugins.

The user-facing programming model is also a meaningful result. `UsecaseTree` turns a use case plugin into a linear operator-facing workflow with explicit confirmation, execution, status, removal, and persistence semantics. That gives the system a practical control model without turning it into a full robot language, which fits the scope stated earlier in the thesis.

The two main use cases should be discussed as complementary strengths. Seam welding is the stronger demonstration of trajectory-centric spatial authoring: rough user input is aligned to a seam and materialized into an executable plan. Pick-and-place demonstrates a different strength, namely scene-adaptive execution within the current box-based model: the command stores object identity and a relative pick transform, then reconstructs the world pick pose when the program is run. This is an important positive result because it shows that the system is not limited to commands that become completely fixed at authoring time.

### Evidence to preserve
- [T] `POS-01` The strongest contribution is the separation between contracts and implementations, making sensing, UI, robot execution, and use-case components replaceable.
  Sources: `ch02_analysis.tex` Modular architecture; `ch03_system_design.tex` Module contract, Interface contracts.
- [T] `POS-02` `UsecaseTree` provides a usable linear control model with confirm/start/status/remove semantics.
  Sources: `ch03_system_design.tex` UsecaseTree: from use case modules to executable programs; UI orchestration module.
- [T] `POS-06` The frontend acts as an explicit control plane for graph setup, activation, authoring, visualization, and persistence.
  Sources: `ch03_system_design.tex` UI orchestration module; `ch05_user_workflow.tex` Instantiate the module graph, Activation and calibration, Main view essentials.
- [T] `POS-07` Separating `.aergo` and `.paergo` is a practical design win because environment setup and authored task content stay separate.
  Sources: `ch03_system_design.tex` Persistence semantics; `ch05_user_workflow.tex` Save and load the program.
- [T] `POS-03` Pick-and-place demonstrates scene-adaptive execution within the current box-based model.
  Sources: `ch04_implementation.tex` Pick-and-place use case; `ch05_user_workflow.tex` User story: pick-and-place.
- [T] `POS-04` Seam welding is the strongest trajectory-centric spatial-authoring result in the current prototype.
  Sources: `ch04_implementation.tex` Seam welding use case; `ch05_user_workflow.tex` User story: weld.
- [I] The two main use cases are best framed as complementary strengths rather than as one success and one failure.
  Basis: Chapter 4 and Chapter 5 describe different execution semantics and different benefits rather than a single shared criterion.
- [T] `POS-05` The robot-mounted stereo setup is a practical response to unstable monocular depth while keeping the prototype feasible.
  Sources: `ch02_analysis.tex` Camera trade-offs, Summary; `ch04_implementation.tex` Robot-mounted stereo camera calibration module.

## 6.3 Limitations and threats to validity

### Draft prose
The prototype also has clear limits that should be stated directly. At the scope level, the system is not a full programming language and intentionally uses a linear sequential command model. This keeps the authoring workflow manageable, but it also limits expressiveness compared with richer robot-programming environments. In addition, tool control is not abstracted in a general cross-robot way, so the current robot layer remains focused mainly on motion execution and basic status reporting.

The sensing stack is effective for the thesis prototype, but it remains tightly coupled to a specific physical setup. Marker-based tracking is sensitive to occlusion, blur, lighting, and calibration quality. The robot-mounted stereo workflow depends on a rigid mount and successful Charuco-based calibration, and the current pen tracking implementation does not fuse IMU data even though the device provides it. Scene understanding is deliberately narrow as well: the current model is box-based, uses single-shot detection, and does not expose richer confidence or uncertainty information.

Robot execution and orchestration also remain prototype-level. The main demonstrated use cases do not perform collision checking, tool actions are simulated by fixed delays rather than standardized device control, and simulation mode is not supported. On the UI side, the frontend is explicitly a control-plane prototype rather than a production interface. Visualization updates are best-effort rather than guaranteed, and persistence remains conditional on graph compatibility, hardware availability, and task semantics. This conditionality is especially visible in the difference between the two main use cases: weld programs depend on the scene staying unchanged after confirmation, while pick-and-place remains partly reusable because it refreshes the scene at execution time.

These limitations also define the validity boundary of the thesis. The evidence is qualitative and workflow-oriented rather than benchmark-based, the evaluated tasks are representative demos rather than a broad industrial sample, and the results are tied to the specific hardware and setup used in the prototype. For that reason, Chapter 6 should avoid claims of production readiness, broad industrial generality, or superiority over established robot-programming workflows.

### Evidence to preserve

#### Scope and concept limits
- [T] `LIM-SCOPE-01` The system is not a full robot programming language.
  Sources: `introduction.tex` High-level approach; `ch03_system_design.tex` UsecaseTree.
- [T] `LIM-SCOPE-02` The authored-program model is intentionally linear and sequential.
  Sources: `ch03_system_design.tex` UsecaseTree; User workflow state machine.
- [T] `LIM-SCOPE-03` Tool control is not generalized across robots/devices.
  Sources: `ch02_analysis.tex` Robot interface; `ch04_implementation.tex` Robot communication module.

#### Sensing and calibration
- [T] `LIM-SENS-01` Marker-based tracking remains sensitive to visibility, lighting, blur, and occlusion.
  Sources: `ch02_analysis.tex` 6DoF input interface; `ch04_implementation.tex` Pen Tracking (Multi-Cam).
- [T] `LIM-SENS-02` The sensing stack depends on rigid mounting and successful Charuco-based calibration.
  Sources: `ch04_implementation.tex` Robot-mounted stereo camera calibration module; `ch05_user_workflow.tex` Activation and calibration.
- [T] `LIM-SENS-03` The current pen implementation is vision-only for pose tracking; IMU data is not fused.
  Sources: `ch04_implementation.tex` Pen input device, Pen Tracking (Multi-Cam).
- [T] The camera pose injector uses latest-sample association rather than explicit synchronization.
  Sources: `ch04_implementation.tex` Camera pose injector module.
- [T] The current camera acquisition backend is Windows-only.
  Sources: `ch04_implementation.tex` Stereo camera acquisition module (Windows).

#### Scene understanding
- [T] `LIM-SENS-04` The scene model is intentionally narrow and registry-defined.
  Sources: `ch03_system_design.tex` Scene detection interface; `ch04_implementation.tex` Scene detection module (fiducial boxes).
- [T] Scene detection uses single-frame request/response operation and does not expose confidence or temporal stabilization.
  Sources: `ch03_system_design.tex` Scene detection interface; `ch04_implementation.tex` Scene detection module (fiducial boxes).
- [T] Weld relies on a narrow seam model, while pick-and-place relies on marker identity plus a box-based object model.
  Sources: `ch04_implementation.tex` Pick-and-place use case, Seam welding use case; `ch05_user_workflow.tex` User story: weld, User story: pick-and-place.

#### Robot execution and tooling
- [T] `LIM-ROBOT-01` Tool actions are simulated by fixed delays rather than standardized device control.
  Sources: `ch03_system_design.tex` Robot execution interface; `ch04_implementation.tex` Pick-and-place use case, Seam welding use case.
- [T] `LIM-ROBOT-02` No collision checking is performed in the main demonstrated use cases.
  Sources: `ch04_implementation.tex` Pick-and-place use case, Seam welding use case.
- [T] `LIM-ROBOT-03` Simulation mode is not supported.
  Sources: `ch04_implementation.tex` Task-oriented use case modules, Motion-primitive use cases.
- [T] Execution controls differ by use case, so pause/stop behavior is not uniform.
  Sources: `ch04_implementation.tex` Pick-and-place use case, Seam welding use case; `ch05_user_workflow.tex` User story: weld, User story: pick-and-place.

#### UI and orchestration
- [T] `LIM-UI-01` The UI is a prototype control plane rather than a production frontend.
  Sources: `ch03_system_design.tex` UI orchestration module; `ch05_user_workflow.tex` Main view essentials.
- [T] `LIM-UI-02` Visualization updates are best-effort and recover through full snapshot reload rather than guaranteed ordered deltas.
  Sources: `ch03_system_design.tex` 3D visualization interface, UI orchestration module.
- [T] `LIM-UI-03` Persistence is conditional on graph compatibility, hardware availability, and task semantics.
  Sources: `ch03_system_design.tex` Persistence semantics; `ch05_user_workflow.tex` Save and load the program.
- [T] The workflow still carries significant setup burden: module graph setup, activation, calibration, scene refresh, and manual recovery actions are explicit.
  Sources: `ch05_user_workflow.tex` Instantiate the module graph, Activation and calibration, Main view essentials, Save and load the program.
- [T] Saved programs have different reuse boundaries: weld assumes the scene remains unchanged, while pick-and-place remains practical across runs because it refreshes object pose at execution.
  Sources: `ch05_user_workflow.tex` User story: weld, User story: pick-and-place, Save and load the program.

#### Threats to validity
- [T] `VAL-01` The evidence is qualitative and workflow-oriented rather than benchmark-based.
  Sources: `introduction.tex` Thesis structure; `ch02_analysis.tex` Requirement-driven design decisions.
- [T] `VAL-02` The evaluated tasks are representative demos rather than proof of broad industrial coverage.
  Sources: `introduction.tex` High-level approach; `ch02_analysis.tex` Coverage of Additional Use Cases.
- [T] `VAL-03` The conclusions are bounded by the specific hardware and setup used in the thesis.
  Sources: `ch04_implementation.tex` Physical setup and calibration artifacts; `ch05_user_workflow.tex` Preconditions and environment.
- [I] `VAL-04` Efficiency and usability claims should stay qualitative because there is no controlled user study or baseline comparison in the extracted text.

## Chapter 6 Guardrails
- Do not present Chapter 6 as an experimental benchmark chapter.
- Do not add note-only bug lists unless you decide to explicitly write them into the thesis first.
- Keep the main contribution hierarchy stable:
  1. modular extensible system,
  2. end-to-end workflow demonstration,
  3. complementary use-case findings,
  4. honest limitations and validity bounds.
