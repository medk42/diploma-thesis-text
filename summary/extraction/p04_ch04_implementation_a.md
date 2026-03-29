# Packet Evidence: P4

## Packet metadata
- `packet_id`: `P4`
- `source_files`: `ch04_implementation.tex`
- `source_sections`: Physical setup and calibration artifacts; Robot platform and execution backend; Stereo camera hardware; Pen input device; Workspace scene objects (fiducial boxes); Calibration artifacts; Compute platform; Module implementation overview; Sensing pipeline modules; Stereo camera acquisition module (Windows); Camera pose injector module; Robot-mounted stereo camera calibration module
- `target_chapter`: Chapter 6 and Chapter 7
- `priority`: High
- `author_note_status`: `source-grounded only`

## A. Grounded claims
- `[T]` The prototype is built around a physical setup that includes a Kassow collaborative robot, a robot-mounted stereo camera rig, a tracked pen, fiducial-tagged box objects, and Charuco calibration artifacts. This is the concrete hardware basis for the thesis implementation. Source: `Physical setup and calibration artifacts`.
- `[T]` The thesis-side runtime talks to the Kassow controller through a robot-side CBun component; the thesis-side `robot_module_kassow` exposes the shared `robot_interface` to the rest of the system. Source: `Robot platform and execution backend`.
- `[T]` The camera hardware is a compact stereo module with synchronized global-shutter sensors and a side-by-side 60 FPS stream. Source: `Stereo camera hardware`.
- `[T]` The pen is a custom tracked device with multiple fiducial markers and physical buttons; the current implementation uses camera observations for pose estimation and BLE only for button state. Source: `Pen input device`; `Pen Tracking (Multi-Cam)`.
- `[T]` The scene model is intentionally simple: fiducial-tagged boxes defined by a registry with marker ID, size, box dimensions, and marker-to-box transform. Source: `Workspace scene objects (fiducial boxes)`; `Scene detection module (fiducial boxes)`.
- `[T]` The sensing pipeline depends on a printed Charuco board for intrinsics, stereo calibration, and hand-eye calibration. Source: `Calibration artifacts`; `Robot-mounted stereo camera calibration module`.
- `[T]` The prototype is implemented in C++ and is intended to run on Windows and Linux, with most modules platform-neutral and the camera acquisition module currently Windows-only. Source: `Implementation note`; `Stereo camera acquisition module (Windows)`.
- `[T]` The downstream processing of camera messages is OS-agnostic because it consumes only the shared camera message formats. Source: `Stereo camera hardware`; `Stereo camera acquisition module (Windows)`.
- `[T]` The pen tracking module produces a continuous pen pose stream with button states, discrete intent events, and temporary visualization previews. Source: `Pen Tracking (Multi-Cam)`.
- `[T]` The scene detection module provides `READ_REGISTRY` and `READ_SCENE` requests, publishes the most recent detected boxes into 3D visualization, and returns only poses/IDs. Source: `Scene detection module (fiducial boxes)`.
- `[T]` The camera pose injector attaches the latest cached robot flange pose to each incoming camera frame and republishes the original image blob. Source: `Camera pose injector module`.
- `[T]` The robot-mounted stereo camera calibration module estimates intrinsics, stereo extrinsics, and a flange-to-camera hand-eye transform, then publishes a calibrated camera set for downstream use. Source: `Robot-mounted stereo camera calibration module`.
- `[T]` The two evaluated task-oriented use cases, pick-and-place and seam welding, both reuse the same sensing and authoring infrastructure and execute through the shared `robot_interface`. Source: `Task-oriented use case modules`.
- `[T]` The prototype does not support simulated-mode execution for these programs; simulated mode is rejected. Source: `Task-oriented use case modules`; `Motion-primitive use cases`.

## B. What was actually demonstrated
- The system demonstrates a full sensing-to-execution pipeline on a robot-mounted stereo setup, not just isolated sensing modules. Source: `Physical setup and calibration artifacts`; `Module implementation overview`.
- The pen tracking implementation demonstrates multi-camera marker tracking with candidate scoring, Ceres refinement, one-euro smoothing, and button-driven intent extraction. Source: `Pen Tracking (Multi-Cam)`.
- The scene detection implementation demonstrates request-driven snapshotting from a single stereo pair, with explicit matching, refinement, and visualization of the most recent scene state. Source: `Scene detection module (fiducial boxes)`.
- The calibration implementation demonstrates one-time calibration from a static Charuco target with robot motion diversity, then reuse of the resulting calibrated camera set by downstream modules. Source: `Robot-mounted stereo camera calibration module`.
- The robot execution layer demonstrates a real robot integration path through CBun, including status/finished streams and TCP-based requests. Source: `Robot communication module`.
- Pick-and-place demonstrates scene-adaptive execution: it stores an object ID plus a relative pick transform, then re-reads the scene at execution time and reconstructs the world pick pose. Source: `Pick-and-place use case`.
- Seam welding demonstrates trajectory-centric authoring: the authored trajectory is matched to a seam, then converted into a fixed approach-weld-depart plan at command creation time. Source: `Seam welding use case`.
- The motion-primitive use cases demonstrate that the shared use-case wrapper can support additional robot primitives beyond the two main demos. Source: `Motion-primitive use cases`.

## C. Strong outcomes / positive findings
- `[T]` The implementation shows that the architecture can hold together a complete real-robot workflow while keeping sensing, authoring, execution, and use-case logic separated into modules. Source: `Module implementation overview`; `Sensing pipeline modules`; `Authoring modules`; `Execution backend module`; `Task-oriented use case modules`.
- `[T]` The robot-mounted stereo choice is operationally meaningful because the calibration module can combine robot kinematics with camera observations into a common workspace frame. Source: `Robot platform and execution backend`; `Robot-mounted stereo camera calibration module`.
- `[T]` The pen tracking pipeline is not a trivial pose reader; it supports multi-marker, multi-camera candidate scoring, smoothing, and discrete intent extraction, which is enough to support workspace authoring instead of just raw tracking. Source: `Pen Tracking (Multi-Cam)`.
- `[T]` Pick-and-place is a strong positive example because the command is tied to a scene object ID and a relative pick transform, which makes the command reusable across scene changes until the expected object disappears. Source: `Pick-and-place use case`.
- `[T]` The presence of four motion-primitive use cases suggests the wrapper/interface design is reusable beyond the evaluated task demos. Source: `Motion-primitive use cases`.
- `[I]` The chapter supports the interpretation that the prototype is intentionally a research system with explicit contracts and reuse boundaries, not a monolithic one-off demo. Source: `Implementation note`; `Module implementation overview`; `Task-oriented use case modules`.

## D. Limitations and weaknesses

### 1. Scope / concept-level limits
- `[T]` `P4` does not show a general-purpose robot programming environment; the implementation is still built around a limited set of task-oriented use cases and motion primitives. This is concept-level. Source: `Task-oriented use case modules`; `Motion-primitive use cases`.
- `[T]` Simulated execution is not supported in the prototype, so the implementation is tied to a live robot backend. This is prototype-specific, but it narrows the practical scope. Source: `Task-oriented use case modules`; `Motion-primitive use cases`.

### 2. Sensing and calibration
- `[T]` The camera acquisition module is currently Windows-only, so one part of the sensing stack is not portable even though the rest of the runtime is intended to be cross-platform. This is prototype-specific. Source: `Implementation note`; `Stereo camera acquisition module (Windows)`.
- `[T]` The camera pose injector uses the latest cached flange pose without timestamp alignment or interpolation, so camera frames and robot pose are not synchronized in the general case. This is prototype-specific. Source: `Camera pose injector module`.
- `[T]` The calibration module assumes a static Charuco board, enough viewpoint diversity, and a rigid robot-mounted stereo rig; if the mount is disturbed, the calibration becomes invalid and must be redone. This is prototype-specific, but it is also a structural assumption of the approach. Source: `Robot-mounted stereo camera calibration module`.
- `[T]` The pen tracking module assumes fixed marker IDs and CAD-defined marker geometry, and it does not perform per-device geometric calibration. This is prototype-specific. Source: `Pen Tracking (Multi-Cam)`.
- `[T]` The pen tracking module does not fuse IMU data even though the firmware transmits it. This is prototype-specific and leaves sensor robustness on the table. Source: `Pen Tracking (Multi-Cam)`; `Pen input device`.
- `[T]` Tracking quality is sensitive to marker visibility, lighting, motion blur, and partial occlusions. Source: `Pen Tracking (Multi-Cam)`.

### 3. Scene understanding
- `[T]` Scene detection is limited to fiducial-tagged boxes defined in the registry; untagged objects and richer geometry are not supported. This is prototype-specific and also a deliberate scope limit. Source: `Scene detection module (fiducial boxes)`.
- `[T]` Scene detection uses only a single stereo pair per request and has no temporal stabilization or tracking across frames, so poses can be noisy. Source: `Scene detection module (fiducial boxes)`.
- `[T]` The scene response contains only poses and IDs, not confidence values or covariances. This is prototype-specific and limits downstream reasoning. Source: `Scene detection module (fiducial boxes)`.
- `[T]` Partial detections are ignored unless the marker is visible in both cameras. Source: `Scene detection module (fiducial boxes)`.

### 4. Robot execution and tooling
- `[T]` Tool/gripper/welding control is not standardized as a general interface; the current use cases simulate tool actions by fixed delays. This is prototype-specific and a major execution-layer limitation. Source: `Robot communication module`; `Pick-and-place use case`; `Seam welding use case`.
- `[T]` No collision checking is performed in the main task-oriented use cases, so the command paths assume a clear workspace. This is prototype-specific and important for discussion. Source: `Pick-and-place use case`; `Seam welding use case`.
- `[T]` The motion plans are executed directly as linear robot-control requests and do not include a more advanced planning or validation layer. Source: `Pick-and-place use case`; `Seam welding use case`.

### 5. UI / orchestration / visualization
- `[T]` The scene visualization always reflects only the most recent `READ_SCENE` request and is reset on each update, so it is best-effort rather than a persistent scene model. This is prototype-specific. Source: `Scene detection module (fiducial boxes)`.
- `[T]` The camera pose injector drops frames until a robot status message is available, so the downstream calibrated stream depends on robot connectivity. Source: `Camera pose injector module`.
- `[I]` Because visualization and calibration both depend on stationary capture windows, the current sensing workflow is best suited to setup and authored snapshots rather than continuous motion capture. Source: `Camera pose injector module`; `Robot-mounted stereo camera calibration module`. 

### 6. Evaluation boundary
- `[I]` Chapter 4 documents implementation behavior, not formal benchmark results, so it should not be used to claim quantitative performance beyond the described prototype behavior. Source: `Entire chapter`.

## E. Future work already supported by the text
- `[T]` Fuse IMU data into pen tracking to improve robustness and occlusion handling. Source: `Pen Tracking (Multi-Cam)`.
- `[T]` Add per-device geometric calibration for the pen instead of relying only on compiled marker-to-pen geometry. Source: `Pen Tracking (Multi-Cam)`.
- `[T]` Improve BLE discovery/connection handling on Linux, because the current sequence assumes Windows-style service exposure during scanning. Source: `Pen Tracking (Multi-Cam)`; `Implementation note`.
- `[T]` Add temporal stabilization or tracking across frames to scene detection so the system is less sensitive to single-frame noise. Source: `Scene detection module (fiducial boxes)`.
- `[T]` Add richer scene representations than simple tagged boxes and support untagged objects if the downstream use cases require it. Source: `Workspace scene objects (fiducial boxes)`; `Scene detection module (fiducial boxes)`.
- `[T]` Add confidence or covariance outputs to scene detection to support downstream quality checks. Source: `Scene detection module (fiducial boxes)`.
- `[T]` Add timestamp alignment or interpolation in the camera pose injector so camera and robot data are synchronized more accurately. Source: `Camera pose injector module`.
- `[T]` Recalibrate whenever the robot-mounted camera rig is disturbed, or add a more robust calibration workflow that can detect mount changes. Source: `Robot-mounted stereo camera calibration module`.
- `[T]` Replace the fixed-delay tool simulation with a standardized tool-control interface. Source: `Robot communication module`; `Pick-and-place use case`; `Seam welding use case`.
- `[T]` Add collision checking or a motion-validation layer before execution. Source: `Pick-and-place use case`; `Seam welding use case`.
- `[T]` Add a simulation-capable execution path for the use cases and motion primitives. Source: `Task-oriented use case modules`; `Motion-primitive use cases`.
- `[I]` Make the Windows-only camera acquisition module portable or replace it with a cross-platform capture backend. Source: `Implementation note`; `Stereo camera acquisition module (Windows)`.

## F. Claims to avoid
- Do not say the system has synchronized camera/robot timing; the implementation explicitly uses latest-sample association without timestamp alignment. Source: `Camera pose injector module`.
- Do not say the pen tracker fuses IMU data; the text explicitly says it does not. Source: `Pen Tracking (Multi-Cam)`.
- Do not say scene detection is general-purpose object understanding; it is fiducial-box based and limited to the registry. Source: `Scene detection module (fiducial boxes)`.
- Do not say the prototype supports simulation mode; the text explicitly says it does not. Source: `Task-oriented use case modules`; `Motion-primitive use cases`.
- Do not say tool control is standardized; the text explicitly says it is not. Source: `Robot communication module`; `Pick-and-place use case`; `Seam welding use case`.
- Do not say the implementation is platform-independent; the camera acquisition module is currently Windows-only. Source: `Implementation note`; `Stereo camera acquisition module (Windows)`.
- Do not overstate the calibration module as self-validating or resilient to rig disturbance; it assumes a rigid mount and invalidates on disturbance. Source: `Robot-mounted stereo camera calibration module`.

## G. Questions for the author
- Was the `READ_SCENE` single-frame design chosen purely for simplicity, or were there measured latency or robustness reasons behind it?
- Is there any informal accuracy characterization for the pen tracker, the stereo calibration, or the scene detector that could be cited later in Chapter 6?
- Was Linux BLE behavior actually tested beyond the note in the pen tracking section?
- Do you want Chapter 6 to explicitly mention that the current workflow is built around stationary capture windows because the camera pose injector and calibration module assume them?
- Should the discussion frame the motion-primitive use cases as evidence of extensibility, or keep them mostly out of the final chapter because they are not central to the thesis evaluation?

## H. Source index
- `Physical setup and calibration artifacts`: robot platform, stereo camera, pen, scene objects, calibration board, compute platform.
- `Robot platform and execution backend`: CBun integration, robot interface, hardware assumptions, and Windows/Linux portability note.
- `Stereo camera hardware`: sensor type, stream format, and Windows-only acquisition boundary.
- `Pen input device`: hardware design, BLE, IMU presence, and lack of IMU fusion.
- `Workspace scene objects (fiducial boxes)`: registry model and object geometry.
- `Calibration artifacts`: Charuco board role in intrinsics, stereo, and hand-eye calibration.
- `Sensing pipeline modules`: overall sensing-stage role.
- `Stereo camera acquisition module (Windows)`: capture modes, Windows limitation, frame publication.
- `Camera pose injector module`: latest-sample association and synchronization limits.
- `Robot-mounted stereo camera calibration module`: calibration procedure, rigid-mount assumption, invalidation conditions.
- `Pen Tracking (Multi-Cam)`: multi-camera pose estimation, button-driven intent, Linux BLE note, and IMU non-use.
- `Scene detection module (fiducial boxes)`: single-frame detection, registry limits, visualization reset, confidence absence.
- `Robot communication module`: robot-state reporting, status/finished streams, and tool-control gap.
- `Task-oriented use case modules`: main use-case boundary, scene-adaptive pick-and-place, trajectory-centric welding, and no simulation mode.
- `Pick-and-place use case`: object-ID binding, fresh scene read at execution, no collision checking, simulated tool action.
- `Seam welding use case`: seam matching heuristic, fixed command materialization, no collision checking, simulated tool action.
- `Motion-primitive use cases`: wrapper reuse, additional extensibility evidence, and simulation rejection.
