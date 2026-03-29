# Packet Evidence: P2 - Chapter 3 Contracts

## Packet metadata
- packet_id: `P2`
- source_files: `ch03_system_design.tex`
- source_sections: `System at a glance`; `Module contract`; `Roles and separation of responsibilities`; `Channel contract`; `Message delivery flow`; `Reflection and orchestration contract`; `Module lifecycle and implementer rules`; `Interface contracts`; `Activation interface`; `Use case interface`; `3D visualization interface`; `Robot execution interface`; `Scene detection interface`; `Supporting message formats`
- target_chapter: Chapter 6 and Chapter 7
- priority: High

## A. Grounded claims
- [T] The chapter explicitly frames the system as a separation between contracts and implementations: the module contract defines how modules interact with the runtime core, interface contracts define domain-level meaning on top of that transport, and concrete modules implement those contracts while the core provides one hosting/routing implementation. Source: `System at a glance`.
- [T] The module contract is intentionally core-implementation independent and exposes `IModule` and `ICore` as the two main roles, so modules can be developed against a stable interface without assuming a specific threading/process architecture. Source: `Roles and separation of responsibilities`.
- [T] The communication model combines publish/subscribe and request/response, with channel type identifiers acting as compatibility keys and with small headers plus optional shared blobs for large payloads. Source: `Module contract`, `Channel contract`, `Message structure: header and optional shared blobs`.
- [T] Large payloads are explicitly separated from small control messages through shared blobs/allocators, which lets producers share camera-rate or other large data without copying every time. Source: `Shared payload ownership and allocator contract`, `Allocation and shared payload management`.
- [T] The core assumes concurrent access from multiple module threads, so modules must treat callbacks as multi-threaded entry points and synchronize their own internal state. Source: `Roles and separation of responsibilities`, `Locking model and core usage constraints`.
- [T] Module discovery, creation, removal, save/load, and graph inspection are part of the reflection/orchestration API, which is meant mainly for UI and controller-style modules. Source: `Reflection and orchestration contract`.
- [T] The chapter deliberately distinguishes wrappers from the base module contract: wrappers implement `IModule` and translate protocol messages into direct calls on higher-level capabilities such as activation or use case execution. Source: `Interface contracts`, `Activation interface`, `Use case interface`.
- [T] Activation is a standardized module-level on/off/configuration protocol with parameter schemas, value editing, async activation/deactivation, progress reporting, cancellation, and gating of non-activation traffic while deactivated. Source: `Activation interface`.
- [T] Use cases are standardized as plugin-like modules with a command-construction phase and a command-execution phase, using a stable `task_id` for lifecycle control. Source: `Use case interface`.
- [T] The 3D visualization interface is a shared scene protocol with a registry, objects, and trajectories, using best-effort delta updates plus request/response full resync. Source: `3D visualization interface`.
- [T] The robot execution interface is robot-agnostic at the protocol level but, in this thesis, is used only for robot motion and basic feedback; tool control is explicitly not implemented. Source: `Robot execution interface`.
- [T] The scene-detection interface intentionally limits the scene model to simple boxes with 6DoF poses and no uncertainty/confidence output. Source: `Scene detection interface`.
- [T] Supporting message formats keep camera, calibration, and pen data modular and swappable as long as downstream modules keep consuming the same message types. Source: `Supporting message formats`.
- [I] The architecture is designed so that changing a sensing or UI module should not require rewriting the whole system, as long as the interface contract remains stable. This follows from the explicit contract/implementation split and the repeated emphasis on module replaceability. Source: `System at a glance`, `Interface contracts`, `Supporting message formats`.
- [I] The use of wrappers and capability queries indicates that the thesis prefers protocol normalization over exposing raw module internals to the UI. Source: `Interface contracts`, `Activation interface`, `Use case interface`.
- [I] The chapter-level design positions the UI as a control-plane orchestrator rather than as the owner of task semantics. Source: `Putting it together: UI orchestration and persistence`, `UI orchestration module`.

## B. What was actually demonstrated
- The system graph is not just conceptual: the chapter maps a concrete instantiated runtime configuration to the thesis requirements, including pen tracking, stereo-camera scene detection, robot execution, use-case plugins, and a web UI orchestrator. Source: `End-to-end system and requirement coverage`.
- The UI can instantiate and wire modules, configure activation, author use-case programs, aggregate visualization, and save/load both the setup and authored programs. Source: `UI orchestration module`, `End-to-end system and requirement coverage`.
- `UsecaseTree` turns a single use case module into a linear command list with explicit parameter editing, confirmation, sequential execution, and persistence. Source: `UsecaseTree: from use cases to programs`.
- The program model is explicitly linear: each command is confirmed into cached command JSON, execution proceeds sequentially, and parallel composition or branching are out of scope. Source: `UsecaseTree: from use cases to programs`.
- The visualization layer supports bootstrap resync via `READ_FULL` and subsequent delta updates, with an explicit UI action to reload the local scene mirror. Source: `3D visualization interface`, `UI orchestration module`.
- The robot interface supports motion primitives and feedback streams for long-running actions, including a `FINISHED` notification keyed by `action_id`. Source: `Robot execution interface`.
- Scene detection is used as an explicit queryable service: clients can fetch the registry once and request fresh scene data when needed. Source: `Scene detection interface`.
- The supporting message formats show the concrete sensing pipeline: stereo images, camera-plus-flange-pose augmentation, calibrated camera sets, and pen raw/intention messages. Source: `Supporting message formats`.

## C. Strong outcomes / positive findings
- The clearest architectural strength is the contract/implementation separation: the system can be discussed as a stable protocol layer plus swappable concrete modules, which is a real contribution independent of any one prototype module. Source: `System at a glance`, `Interface contracts`.
- `UsecaseTree` is a strong outcome because it gives a consistent, user-facing programming model without forcing every use case module to implement its own UI. Source: `UsecaseTree: from use cases to programs`, `UI orchestration module`.
- The split between `.aergo` system setup and `.paergo` program persistence is a useful design result because it separates environment configuration from authored task content. Source: `Persistence semantics`.
- The 3D visualization contract is a clean extensibility point because modules can contribute scene content without hard-coding rendering logic into the UI. Source: `3D visualization interface`, `UI orchestration module`.
- The robot and scene interfaces both expose small, domain-specific protocols rather than broad vendor APIs, which keeps use cases focused on task logic instead of backend-specific plumbing. Source: `Robot execution interface`, `Scene detection interface`.
- The supporting message formats make the sensing pipeline reusable across modules without coupling camera, calibration, and pen processing to the UI. Source: `Supporting message formats`.

## D. Limitations and weaknesses

### 1. Scope / concept-level limits
- [T] The system is deliberately not a full robot programming language. It only covers the task-oriented workflow needed by the thesis and explicitly leaves branching, parallel composition, and richer program logic out of scope. Source: `UsecaseTree: from use cases to programs`, `System at a glance`. `concept-level`
- [T] The base module contract stays application-agnostic by design, so any richer task semantics must be added on top through higher-level interfaces or wrappers. Source: `Interface contracts`. `concept-level`
- [T] The UI-oriented workflow is a concrete integration choice, not a universal programming model; the chapter says the same use case could be embedded into richer authoring environments or used standalone. Source: `UsecaseTree: from use cases to programs`. `concept-level`

### 2. Sensing and calibration
- [T] Shared sensing messages are modular, but the chapter itself does not claim uncertainty modeling, confidence, or temporal filtering in the scene-detection interface. Source: `Scene detection interface`, `Supporting message formats`. `prototype-specific`
- [T] The visualization/update protocol is best-effort and relies on re-sync via full scene queries rather than guaranteed delivery of every delta. Source: `3D visualization interface`, `UI orchestration module`. `prototype-specific`
- [T] The camera/calibration messages are structured to support the pipeline, but the chapter does not add a richer temporal or probabilistic model for calibration quality. Source: `Supporting message formats`. `prototype-specific`

### 3. Scene understanding
- [T] The scene model is intentionally limited to box objects and poses, which leaves out meshes, richer geometry, and object-specific shape parameters. Source: `Scene detection interface`. `concept-level`
- [T] The scene registry is intended to stay static for the module lifetime, so dynamic object-set changes are not modeled as a first-class scene-detection capability. Source: `Scene detection interface`. `concept-level`
- [T] Scene detection returns only object IDs and poses, so there is no standardized uncertainty or multi-hypothesis output. Source: `Scene detection interface`. `concept-level`

### 4. Robot execution and tooling
- [T] The robot interface is used only for motion and basic state feedback in this thesis; tool control is explicitly considered but not implemented. Source: `Robot execution interface`. `prototype-specific`
- [T] The robot protocol supports action lifecycle control, but the chapter does not claim motion planning, collision avoidance, or richer execution validation. Source: `Robot execution interface`. `concept-level`
- [T] Long-running robot actions depend on asynchronous feedback streams, and missing `FINISHED` messages would need recovery logic beyond the current protocol. Source: `Robot execution interface`. `prototype-specific`

### 5. UI / orchestration / visualization
- [T] The UI module is explicitly described as a prototype control plane rather than a reference frontend architecture. Source: `UI orchestration module`. `prototype-specific`
- [T] The 3D visualization protocol uses update deltas without monotonic update IDs, so dropped updates require a full re-sync. Source: `3D visualization interface`. `prototype-specific`
- [T] The `UsecaseTree` program persistence is intentionally scoped to the authored program, not to an in-flight execution or full system state. Source: `Persistence semantics`, `UsecaseTree: from use cases to programs`. `prototype-specific`

### 6. Evaluation boundary
- [T] The chapter is a design/architecture chapter; it describes the intended runtime configuration and control flow, not a formal benchmark or user study. Source: `End-to-end system and requirement coverage`, `UI orchestration module`. `prototype-specific`
- [I] Because the chapter foregrounds the concrete thesis configuration, its claims are bounded by the selected hardware and module set rather than by a broad universal deployment claim. Source: `End-to-end system and requirement coverage`, `Persistence semantics`. `prototype-specific`

## E. Future work already supported by the text
- `Activation interface` and `Scene detection interface` together suggest future extensions to richer activation inputs, broader scene models, and non-box object representations.
- The best-effort scene updates imply a future monotonic update-ID or stronger resync mechanism for visualization state recovery. Source: `3D visualization interface`.
- The robot interface’s explicit note that tool control is out of scope supports future work on grippers, welding tools, or other vendor/device abstractions. Source: `Robot execution interface`.
- The `UsecaseTree` scope note supports future work on parallel composition, branching, or richer program logic if the thesis later grows beyond a linear command model. Source: `UsecaseTree: from use cases to programs`.
- The persistence split supports future work on stronger coupling between setup state and program state only if needed, but the current design already keeps them intentionally separate. Source: `Persistence semantics`.
- The supporting message formats open the door to swapping camera, calibration, and pen-processing modules without changing the surrounding protocols. Source: `Supporting message formats`.
- The UI orchestration section supports future frontends or alternate control-plane integrations, since the chapter treats the web UI as one concrete implementation of the orchestration role. Source: `UI orchestration module`.

## F. Claims to avoid
- Do not say the thesis presents a full robot programming language; it explicitly does not. Source: `UsecaseTree: from use cases to programs`, `System at a glance`.
- Do not claim guaranteed or lossless visualization update delivery; the scene protocol is best-effort and resync-based. Source: `3D visualization interface`.
- Do not claim general tool-control support; the robot interface section says tool control is considered but not implemented. Source: `Robot execution interface`.
- Do not claim scene understanding beyond simple box objects with poses and a static registry. Source: `Scene detection interface`.
- Do not claim the UI chapter is a production frontend reference; it is explicitly a prototype control plane. Source: `UI orchestration module`.
- Do not overstate persistence as universal state capture; `.paergo` is a program artifact and `.aergo` is a system setup artifact, not the same thing. Source: `Persistence semantics`.

## G. Questions for the author
- Should Chapter 6 emphasize the contract-layer modularity first, or the `UsecaseTree` linear workflow first?
- Should the final discussion frame `UsecaseTree` as the main positive contribution, or as one orchestration outcome of the broader modular runtime?
- Is there any thesis-supported wording you want for the robot-interface limitation beyond “tool control is out of scope”?
- Do you want the discussion chapter to explicitly mention the best-effort visualization resync behavior as a limitation, or keep that detail in a more technical subsection?

## H. Source index
- `System at a glance` -> modularity split between contracts and implementations; concrete thesis framing.
- `Module contract` / `Roles and separation of responsibilities` / `Channel contract` / `Message structure` / `Message delivery flow` -> core messaging, wrappers, concurrency, shared blobs.
- `Reflection and orchestration contract` -> graph operations, save/load, and controller-facing core API.
- `Activation interface` -> module activation state machine, parameter handling, cancelable async activation.
- `Use case interface` -> plugin architecture, command construction/execution, linear lifecycle, persistence scope.
- `3D visualization interface` -> scene model, best-effort deltas, resync behavior, visualization extensibility.
- `Robot execution interface` -> motion primitives, feedback, explicit tool-control boundary.
- `Scene detection interface` -> registry/scene split, box-only model, no uncertainty.
- `Supporting message formats` -> camera/calibration/pen message pipeline and module swappability.
- `UI orchestration module` / `UsecaseTree` / `Persistence semantics` / `End-to-end system and requirement coverage` -> concrete operator workflow, program vs setup persistence, system instantiation.
