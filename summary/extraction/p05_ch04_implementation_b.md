# Packet P5 Evidence Note

## Packet metadata
- `packet_id`: P5
- `source_files`: `ch04_implementation.tex`
- `source_sections`: `Authoring modules`; `Pen Tracking (Multi-Cam)`; `Scene detection module (fiducial boxes)`; `Execution backend module`; `Robot communication module`; `Robot-mounted stereo camera calibration module`; `Task-oriented use case modules`; `Pick-and-place use case`; `Seam welding use case`; `Motion-primitive use cases`
- `target_chapter`: Chapter 6 and Chapter 7
- `priority`: High

## A. Grounded claims
- [T] The implementation is built around a shared execution backend: the thesis runtime talks to a robot-side CBun through `robot_interface`, which keeps use-case logic robot-agnostic. Source: `Execution backend module`, `Robot communication module`. Topic IDs: `POS-01`, `FW-ROBOT-01`.
- [T] The robot communication module publishes robot status and finished streams containing joint positions plus base, flange, and TCP world poses, which gives the UI and use cases a common runtime view of robot state. Source: `Robot communication module`.
- [T] Tool/gripper control is intentionally not standardized in the thesis; the current use cases simulate tool actions by fixed delays rather than through a dedicated tool-control interface. Source: `Robot communication module`, `Pick-and-place use case`, `Seam welding use case`. Topic IDs: `LIM-ROBOT-01`, `AVOID-02`.
- [T] The prototype is not set up for simulated execution: starting a program in simulated mode is rejected. Source: `Task-oriented use case modules`, `Pick-and-place use case`, `Seam welding use case`, `Motion-primitive use cases`. Topic IDs: `LIM-ROBOT-03`, `AVOID-02`.
- [T] The pen tracking module converts the calibrated camera stream into a continuous pen pose stream plus discrete intent events, and it emits temporary visualization previews during interaction. Source: `Pen Tracking (Multi-Cam)`. Topic ID: `GF-02`.
- [T] Pen tracking is vision-first: the pen firmware sends IMU samples, but the implementation uses only button flags and does not fuse IMU data. Source: `Pen Tracking (Multi-Cam)`. Topic IDs: `LIM-SENS-03`, `FW-SENS-01`.
- [T] Scene detection is request/response based and operates on a simple fiducial-box scene model; it exposes `READ_REGISTRY` and `READ_SCENE`, and `READ_SCENE` processes one calibrated stereo frame per request. Source: `Scene detection module (fiducial boxes)`. Topic IDs: `LIM-SENS-04`, `FW-SENS-02`.
- [T] The scene detection module expects exactly two calibrated camera images, so the current implementation is explicitly stereo-pair based rather than generic multi-camera scene inference. Source: `Scene detection module (fiducial boxes)`.
- [T] The task-oriented use cases are implemented as plugin modules behind a shared use case wrapper that standardizes command creation and execution control. Source: `Task-oriented use case modules`. Topic IDs: `POS-01`, `POS-02`.
- [T] Pick-and-place and seam welding reuse the same sensing/authoring infrastructure and the common `robot_interface`; this is presented as evidence for the extensibility goal. Source: `Task-oriented use case modules`. Topic IDs: `GF-02`, `GF-03`, `POS-01`.
- [T] Motion-primitive use cases mirror the robot execution interface and are explicitly described as minimal examples of adding new use case modules. Source: `Motion-primitive use cases`. Topic IDs: `POS-01`, `FW-EVAL-03`.
- [T] The prototype uses a robot-mounted stereo camera calibration module that publishes a calibrated stereo stream for downstream modules after one-time calibration. Source: `Robot-mounted stereo camera calibration module`. Topic IDs: `POS-05`, `LIM-SENS-02`.

## B. What was actually demonstrated
- The implementation demonstrates a full pipeline from calibrated sensing, through authored intent, to robot execution, with the same runtime handling both the evaluated task use cases and the simpler motion primitives. Source: `Task-oriented use case modules`, `Motion-primitive use cases`.
- Pick-and-place demonstrates that a command can be tied to a scene object by ID and then re-evaluated at execution time using a fresh scene read. Source: `Pick-and-place use case`. This is the strongest direct evidence that the system is not limited to fixed configuration-time poses.
- Pick-and-place also demonstrates a scene-adaptive transfer logic: it recomputes the world pick pose from the stored relative transform and the current object pose, then runs a fixed pick-lift-transfer-place sequence. Source: `Pick-and-place use case`. This supports `POS-03`.
- Seam welding demonstrates a trajectory-centric workflow where a user trajectory is matched to a seam candidate, projected onto it, and materialized into fixed world-frame poses at command creation. Source: `Seam welding use case`. This supports `POS-04`.
- The weld flow also demonstrates that the authored preview corresponds directly to the command that will be executed, because the returned preview shows the stored motion path and poses. Source: `Seam welding use case`.
- The motion-primitive use cases demonstrate that the wrapper architecture is reusable outside the two main demos: joint, linear, arc, and trajectory moves all ride on the same use case and robot interfaces. Source: `Motion-primitive use cases`. This is useful support for `POS-01` and `FW-EVAL-03`.
- The UI-facing execution semantics differ by use case: pick-and-place supports stop but not pause, while weld supports both pause and stop. Source: `Pick-and-place use case`, `Seam welding use case`. This is a concrete behavior difference that can inform discussion of workflow limits.

## C. Strong outcomes / positive findings
- The clearest positive implementation outcome is that the system does not collapse into a single demo-specific script: the same runtime and wrapper model supports task-oriented use cases plus generic motion primitives. Source: `Task-oriented use case modules`, `Motion-primitive use cases`. Topic IDs: `POS-01`, `POS-02`.
- Pick-and-place is a genuine strength case for scene-adaptive execution, because the command stores an object ID and relative pick transform, then re-reads the scene at execution and rebuilds the world pick pose from the current object pose. Source: `Pick-and-place use case`. Topic IDs: `POS-03`, `VERIFY-01`.
- Seam welding is the stronger proof of concept for trajectory-centric spatial authoring, because the user trajectory is turned into a seam-aligned motion plan at creation time and executed as a fixed approach-weld-depart sequence. Source: `Seam welding use case`. Topic IDs: `POS-04`.
- The motion-primitive use cases are not central evaluation results, but they are strong architectural evidence that new use cases can be added without changing the robot backend contract. Source: `Motion-primitive use cases`. Topic IDs: `POS-01`, `FW-EVAL-03`.
- The robot interface design keeps the use-case layer focused on task logic, while the robot module provides state and completion feedback needed for orchestration and visualization. Source: `Robot communication module`, `Task-oriented use case modules`. Topic IDs: `POS-06`.

## D. Limitations and weaknesses

### 1. Scope / concept-level limits
- [T] The implementation is intentionally not a full robot programming system: the task-oriented use cases are linear command flows behind a wrapper, and the thesis does not claim branching, looping, or rich sensor-driven execution. Source: `Task-oriented use case modules`, `Motion-primitive use cases`. Topic IDs: `LIM-SCOPE-01`, `LIM-SCOPE-02`.
- [T] Tool actions are not represented by a general cross-robot abstraction; instead, the current use cases simulate tool behavior with delays. Source: `Robot communication module`, `Pick-and-place use case`, `Seam welding use case`. Topic ID: `LIM-SCOPE-03`.

### 2. Sensing and calibration
- [T] Pen tracking depends on marker visibility and stable corner detection; lighting, motion blur, and partial occlusion are explicit failure factors. Source: `Pen Tracking (Multi-Cam)`. Topic IDs: `LIM-SENS-01`, `LIM-SENS-03`.
- [T] No IMU fusion is implemented even though IMU samples are available from the pen firmware. Source: `Pen Tracking (Multi-Cam)`. Topic IDs: `LIM-SENS-03`, `FW-SENS-01`.
- [T] The pen tracking implementation assumes fixed marker-to-pen geometry and performs no per-device geometric calibration. Source: `Pen Tracking (Multi-Cam)`. Topic ID: `LIM-SENS-03`.
- [T] The robot-mounted stereo calibration assumes a rigid mount; if the mount is disturbed, the extrinsics are considered invalid and calibration must be repeated. Source: `Robot-mounted stereo camera calibration module`. Topic IDs: `LIM-SENS-02`, `VAL-03`.

### 3. Scene understanding
- [T] Scene understanding is limited to fiducial-tagged boxes with a registry-driven model; it does not provide a general object representation. Source: `Scene detection module (fiducial boxes)`. Topic IDs: `LIM-SENS-04`, `FW-SENS-02`.
- [T] `READ_SCENE` is a single-frame request and only one request is processed at a time, so the scene pipeline is not a continuous multi-client tracker. Source: `Scene detection module (fiducial boxes)`.
- [T] The registry is loaded at startup and is not reloaded automatically at runtime. Source: `Scene detection module (fiducial boxes)`. This is a practical rigidity limit for changed object sets.

### 4. Robot execution and tooling
- [T] The robot layer exposes motion-state feedback, but not a standardized tool-control stack, so gripper/welder behavior remains simulated in the use cases. Source: `Robot communication module`, `Pick-and-place use case`, `Seam welding use case`. Topic IDs: `LIM-ROBOT-01`.
- [T] Pick-and-place assumes a clear transfer path and performs no collision checking. Source: `Pick-and-place use case`. Topic IDs: `LIM-ROBOT-02`, `AVOID-02`.
- [T] Seam welding also performs no collision checking and assumes a clear workspace for the approach, weld, and depart path. Source: `Seam welding use case`. Topic IDs: `LIM-ROBOT-02`, `AVOID-02`.
- [T] The robot backend is failure-prone in the ordinary integration sense: wrong host/port, missing CBun, or timeout causes immediate request failure and no motion command is executed. Source: `Robot communication module`.
- [T] Simulation mode is not supported for the prototype programs. Source: `Task-oriented use case modules`, `Pick-and-place use case`, `Seam welding use case`, `Motion-primitive use cases`. Topic ID: `LIM-ROBOT-03`.

### 5. UI / orchestration / visualization
- [T] The use case wrapper standardizes start/stop/status behavior, but the concrete pause/stop semantics still differ by use case, which limits uniformity at the interaction level. Source: `Task-oriented use case modules`, `Motion-primitive use cases`. Topic ID: `LIM-UI-01`.
- [I] The temporary intent previews in pen tracking and the shared 3D robot-state visualization imply that the runtime leans on transient visual feedback rather than a persistent, fully synchronized scene model. Source: `Pen Tracking (Multi-Cam)`, `Robot communication module`. Topic ID: `LIM-UI-02`.

### 6. Evaluation boundary
- [I] The implementation evidence is strongest for representative demos and weaker for broad industrial generalization, because the main use cases are pick-and-place, seam welding, and motion primitives only. Source: `Task-oriented use case modules`, `Motion-primitive use cases`. Topic IDs: `VAL-02`, `FW-EVAL-03`.

## E. Future work already supported by the text

### Sensing
- Better pen tracking through IMU fusion is directly suggested by the current omission of IMU use. Source: `Pen Tracking (Multi-Cam)`. Topic IDs: `FW-SENS-01`, `FW-SENS-02`.
- Better scene detection beyond fiducial boxes is supported by the current registry-driven single-frame model. Source: `Scene detection module (fiducial boxes)`. Topic ID: `FW-SENS-02`.
- The rigid robot-mounted calibration workflow suggests future work on more robust calibration or recalibration assistance. Source: `Robot-mounted stereo camera calibration module`. Topic ID: `FW-SENS-01`.

### Robot interface / execution
- A dedicated tool-control abstraction would be a natural extension because the current use cases only simulate tool actions. Source: `Robot communication module`, `Pick-and-place use case`, `Seam welding use case`. Topic IDs: `FW-ROBOT-01`, `FW-ROBOT-02`.
- Better motion validation or collision-aware execution would directly address the current no-collision-checking limitation. Source: `Pick-and-place use case`, `Seam welding use case`. Topic ID: `FW-ROBOT-02`.

### Use cases / applicability
- The motion-primitive use cases show a path to adding more task modules on the same infrastructure, so more complex use cases are a natural next step. Source: `Motion-primitive use cases`. Topic ID: `FW-EVAL-03`.
- Pick-and-place could be strengthened by more robust scene semantics, because its current selection logic still depends on object IDs and a simple box scene model. Source: `Pick-and-place use case`, `Scene detection module (fiducial boxes)`. Topic IDs: `FW-SENS-02`, `FW-EVAL-03`.

## F. Claims to avoid
- Do not say the current prototype provides a general tool abstraction or standardized gripper/welder support; the text explicitly says tool control is not standardized. Source: `Robot communication module`.
- Do not claim the system performs collision avoidance or path validation; the use cases explicitly state that no collision checking is performed. Source: `Pick-and-place use case`, `Seam welding use case`.
- Do not claim the system is simulation-ready; the prototype rejects simulated mode. Source: `Task-oriented use case modules`.
- Do not claim pen tracking uses IMU fusion or any per-device calibration; the implementation explicitly does neither. Source: `Pen Tracking (Multi-Cam)`.
- Do not claim scene understanding is general-purpose object detection; it is a fiducial-box registry model with single-frame requests. Source: `Scene detection module (fiducial boxes)`.
- Do not overstate pick-and-place as fully dynamic industrial programming. The implementation is adaptive to updated scene reads, but still depends on the stored box ID, registry, and a simple box-based scene model. Source: `Pick-and-place use case`, `Scene detection module (fiducial boxes)`.

## G. Questions for the author
- Should Chapter 6 treat pick-and-place primarily as evidence of scene-adaptive flexibility, or as a weaker task than welding because it still depends on a simple object registry?
- Should the discussion explicitly mention the motion-primitive use cases as architectural evidence, or keep them out of the main narrative to avoid diluting the two headline demos?

## H. Source index
- `Execution backend module`, `Robot communication module`: shared robot backend, state, and tool-control limits.
- `Pen Tracking (Multi-Cam)`: intent capture, vision-first tracking, IMU omission, marker-visibility limits.
- `Scene detection module (fiducial boxes)`: registry-driven scene model, single-frame scene reads, box-based limitations.
- `Task-oriented use case modules`: plugin wrapper model, use-case extensibility, simulated mode rejection.
- `Pick-and-place use case`: scene-adaptive execution, object-ID binding, no collision checking, simulated gripper actions.
- `Seam welding use case`: seam matching/projection, fixed pose materialization, no collision checking, simulated welding actions.
- `Motion-primitive use cases`: minimal extensibility examples, wrapper reuse, non-central but useful architectural evidence.
