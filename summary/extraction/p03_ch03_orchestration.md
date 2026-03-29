# Packet Evidence: P3

## Metadata
- `packet_id`: `P3`
- `source_files`: `ch03_system_design.tex`
- `source_sections`: `UsecaseTree: from use case modules to executable programs`; `UI orchestration module`; `User workflow state machine`; `Persistence semantics`; `End-to-end system instantiation and requirement coverage`
- `target_chapter`: Chapter 6 and Chapter 7
- `priority`: High
- `author_note_status`: thesis-text grounded; note-only ideas kept out unless explicitly marked `Q`

## A. Grounded Claims
- [T] The thesis turns a single use case module into a user-facing programming model through `UsecaseTree`, which organizes use cases into a linear command list with explicit parameter editing, per-command confirmation, sequential execution, and program persistence. Source: `UsecaseTree: from use case modules to executable programs`.
- [T] The programming model is intentionally orchestrator-driven: the UI does not react to a passive stream, but explicitly drives discovery, parameter editing, custom input capture, command creation, execution, and cleanup through directed requests and responses. Source: `UsecaseTree: from use case modules to executable programs`; `UI orchestration module`.
- [T] `UsecaseTree` separates three roles: the discovered use case catalog, the authored command list, and the executing program instance. The catalog describes what can be done, the command list captures what the user authored, and the program instance defines how the commands execute. Source: `UsecaseTree: from use case modules to executable programs`.
- [T] Program execution is linear and sequential: command `i` must finish before command `i+1` starts. Source: `UsecaseTree: from use case modules to executable programs`.
- [T] The optional `PROGRAM_PAUSE`, `PROGRAM_RESUME`, and `PROGRAM_STOP` operations are best-effort rather than hard requirements; if a module does not support them, the runtime still enforces deterministic behavior at command boundaries. Source: `UsecaseTree: from use case modules to executable programs`.
- [T] The UI module is a control-plane orchestrator, not just a renderer: it wires modules, drives activation, handles use case programming/execution, aggregates visualization, and exposes persistence workflows. Source: `UI orchestration module`.
- [T] The frontend is split into three operational views: `AddModuleUi` for graph construction, `ActivationUi` for graph configuration, and `MainVisualizationUi` for system operation. Source: `UI orchestration module`.
- [T] The UI uses `ICoreControl` for graph editing and dependency-aware removal, which means module instantiation and wiring are explicit user actions rather than implicit background behavior. Source: `UI orchestration module`.
- [T] Visualization is split into two channels: camera preview via subscribe, and 3D scene visualization via subscribe plus request/response with `READ_FULL` and `READ_SCENE`. Source: `UI orchestration module`; `3D visualization interface`.
- [T] The 3D visualization contract is designed for recoverability: if the UI misses deltas, it can resync by requesting a full scene snapshot. Source: `3D visualization interface`; `UI orchestration module`.
- [T] Persistence is intentionally split into two artifacts: core-owned system setup (`.aergo`) and UI-owned user program (`.paergo`). Source: `Persistence semantics`.
- [T] Loading a program depends on the referenced use case identifiers still being available in the current setup; if not, the UI cancels the load with a clear error. Source: `Persistence semantics`.
- [T] The instantiated runtime configuration maps the thesis requirements back to concrete modules: pen tracking for 6DoF input, scene detection for workspace context, robot execution for motion control, UI for orchestration, and use case modules for task-specific plugins. Source: `End-to-end system instantiation and requirement coverage`.

## B. What Was Actually Demonstrated
- The system demonstrates a complete workflow from graph setup to activation, authoring, confirmation, execution, and persistence. Source: `User workflow state machine`; `End-to-end system instantiation and requirement coverage`.
- The UI supports a linear program authoring flow in which each command can be edited, optionally acquire `CUSTOM` values, then be confirmed into cached executable JSON before execution. Source: `UsecaseTree: from use case modules to executable programs`; `UI orchestration module`.
- A confirmed program can be executed as a snapshot, and the run exposes progress, pause/resume/stop, and terminal status. Source: `UsecaseTree: from use case modules to executable programs`.
- The workflow distinguishes between environment setup and program content: the module graph and per-module state can be saved independently from the authored command list. Source: `Persistence semantics`; `User workflow state machine`.
- The UI can rebuild its scene mirror after missing incremental updates by requesting a full scene snapshot. Source: `UI orchestration module`; `3D visualization interface`.
- The runtime configuration shown in the chapter explicitly combines sensing, execution, task plugins, and UI orchestration into one end-to-end graph. Source: `End-to-end system instantiation and requirement coverage`.

## C. Strong Outcomes / Positive Findings
- The strongest architectural outcome is the separation between reusable infrastructure and task-specific use cases. That separation is not just conceptual: the UI, persistence, visualization, robot execution, and use case logic are all mediated by explicit contracts. Source: `UsecaseTree: from use case modules to executable programs`; `UI orchestration module`; `End-to-end system instantiation and requirement coverage`.
- The `UsecaseTree` model is a good discussion anchor because it shows how a single use case plugin can become a practical authoring experience without requiring a full programming language. Source: `UsecaseTree: from use case modules to executable programs`.
- The linear program model is a deliberate strength for the thesis scope: it keeps authoring and execution understandable, while leaving branching and parallel composition out of scope. Source: `UsecaseTree: from use case modules to executable programs`; `User workflow state machine`.
- The split between `.aergo` and `.paergo` is a useful practical result because it separates environment setup from authored task content. That makes the system easier to reason about in discussion: hardware/configuration state is not conflated with the actual program. Source: `Persistence semantics`.
- The visualization contract is robust by design because it supports a full snapshot recovery path in addition to incremental updates. This is a meaningful architectural strength for a modular UI. Source: `3D visualization interface`; `UI orchestration module`.
- The end-to-end instantiation section gives a strong thesis-level narrative: the system is not just a collection of modules, but a complete control plane that maps the Chapter 2 requirements back to concrete runtime components. Source: `End-to-end system instantiation and requirement coverage`.

## D. Limitations and Weaknesses

### 1. Scope / concept-level limits
- [T] The system is intentionally not a full robot programming language. It does not cover branching, loops, exception recovery, or rich sensor-driven logic. This is concept-level, not just a prototype bug. Source: `UsecaseTree: from use case modules to executable programs`.
- [T] The program model is linear and sequential by design. Parallel composition is out of scope in this chapter. Source: `UsecaseTree: from use case modules to executable programs`; `User workflow state machine`.
- [T] The use case protocol separates command construction from command execution, but it does not define the internal semantics of the command JSON. That boundary is deliberate, but it also means the wrapper cannot explain or validate the task logic itself. Source: `UsecaseTree: from use case modules to executable programs`; `Use case interface`.

### 2. UI / orchestration / visualization
- [T] The UI is explicitly described as a prototype intended to support the evaluation workflow, not as a reference frontend architecture. This makes UI roughness a prototype-specific limitation rather than a core concept flaw. Source: `UI orchestration module`.
- [T] Visualization updates are best-effort. If the UI misses `UPDATE` messages, it must resync via `READ_FULL` or `READ_SCENE`; the contract itself does not include update IDs. Source: `3D visualization interface`; `UI orchestration module`.
- [T] Because the delta stream has no IDs, dropped messages can leave stale objects visible or cause later updates to reference missing IDs until a resync occurs. Source: `3D visualization interface`.
- [T] The UI presents a single camera stream as the preview source. The chapter does not claim multi-camera preview orchestration at the UI layer. Source: `UI orchestration module`.
- [T] The orchestrator owns the authored program state externally. That is a clean boundary, but it also means the UI is responsible for keeping command drafts, confirmation state, and cached artifacts coherent. Source: `UsecaseTree: from use case modules to executable programs`; `Persistence semantics`.

### 3. Persistence boundary
- [T] Program save/load restores authored commands and derived artifacts, but not an in-flight execution. A loaded program must still be confirmed if the cache is stale. Source: `Persistence semantics`.
- [T] Loading a program fails if the referenced use case identifiers are not available in the current setup. That is a real usability constraint when the graph changes. Source: `Persistence semantics`.
- [T] Core persistence can reconstruct the graph, but module activation after load is module-defined. Some modules may require re-activation because external dependencies can no longer be assumed to be valid. Source: `Persistence semantics`.

### 4. Evaluation boundary
- [T] The chapter gives a workflow/state-machine description, not a formal benchmark or user-study result. Discussion claims about efficiency should therefore stay qualitative. Source: `User workflow state machine`; `UI orchestration module`.
- [I] Because the system is described as a concrete instantiation of requirements rather than a universal workflow, any claims about general usability should be bounded to the thesis setup and the demonstrated control plane. Source: `End-to-end system instantiation and requirement coverage`.

## E. Future Work Already Supported by the Text
- Better recovery for visualization updates, ideally with update IDs or explicit gap detection, because the current delta stream is best-effort. Source: `3D visualization interface`.
- Stronger UI-side resync and state reconciliation, since the current frontend relies on full snapshot reloads when the scene mirror may be stale. Source: `UI orchestration module`; `3D visualization interface`.
- Broader frontend integration, because the chapter explicitly frames the current UI as one control-plane implementation rather than the only possible frontend. Source: `UI orchestration module`.
- More expressive program models, if future work wants to extend the linear `UsecaseTree` model with parallel or branching execution. Source: `UsecaseTree: from use case modules to executable programs`.
- More robust persistence behavior around changing graphs, for example better handling when a saved program references a missing use case identifier. Source: `Persistence semantics`.
- More explicit restoration semantics for module activation after load, especially for modules that depend on external hardware or long reinitialization. Source: `Persistence semantics`.
- Stronger end-to-end validation of the runtime configuration, since the current chapter maps requirements to a concrete graph but does not evaluate it quantitatively. Source: `End-to-end system instantiation and requirement coverage`.

## F. Claims to Avoid
- Do not say the system is a full robot programming language. The text explicitly excludes branching, loops, exception recovery, and rich sensor-driven logic. Source: `UsecaseTree: from use case modules to executable programs`.
- Do not claim the UI is production-grade or a reference architecture. The chapter states that it is a prototype for the evaluation workflow. Source: `UI orchestration module`.
- Do not claim the visualization pipeline is lossless or fully synchronized. The contract is explicitly best-effort and depends on resync. Source: `3D visualization interface`.
- Do not claim program persistence is independent of the current runtime graph. It requires the same use case identifiers to exist when loading. Source: `Persistence semantics`.
- Do not claim pause/resume/stop are uniformly enforced across all use cases. They are best-effort at command boundaries when a module does not implement them. Source: `UsecaseTree: from use case modules to executable programs`.
- Do not overstate the end-to-end instantiation as a general proof of industrial readiness. It is a concrete thesis configuration tied to the described hardware and module set. Source: `End-to-end system instantiation and requirement coverage`.

## G. Questions for the Author
- Should Chapter 6 explicitly call out the linear program model as a deliberate scope choice, or leave that to Chapter 3?
- Do you want the final discussion to emphasize the UI/control-plane contribution more strongly, or keep the focus on the use case model and persistence split?
- Should the conclusion mention the `.aergo` versus `.paergo` split as a contribution, or keep it as implementation detail only?
- Do you want a stronger boundary statement about the UI being a prototype so readers do not misread it as a production frontend?
- Should the final Chapter 7 future work section mention visualization resync/update IDs as a near-term engineering item, or keep that in Chapter 6 only?

## H. Source Index
- `UsecaseTree: from use case modules to executable programs`
  - linear command model
  - confirm/start/status/remove lifecycle
  - best-effort pause/resume/stop semantics
  - program persistence boundary
  - scope limits on branching and parallel composition
- `UI orchestration module`
  - three-screen frontend decomposition
  - graph wiring and activation orchestration
  - use case program authoring/execution
  - camera preview and 3D scene aggregation
  - resync via full scene snapshot
  - UI prototype boundary
- `User workflow state machine`
  - end-to-end state progression
  - save/load at multiple stages
  - connection between setup, authoring, confirmation, and execution
- `Persistence semantics`
  - `.aergo` vs `.paergo`
  - graph persistence vs program persistence
  - load-time dependency on use case identifiers
  - activation restoration limits
- `End-to-end system instantiation and requirement coverage`
  - mapping from Chapter 2 requirements to concrete modules
  - the thesis runtime graph
  - the system-level contribution narrative
