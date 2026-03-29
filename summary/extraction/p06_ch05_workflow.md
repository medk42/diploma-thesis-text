# Packet Evidence: P6

## Packet metadata
- `packet_id`: `P6`
- `source_files`: `ch05_user_workflow.tex`
- `source_sections`: `Preconditions and environment`; `System startup`; `Instantiate the module graph`; `Activation and calibration`; `Main view essentials`; `User story: weld`; `User story: pick-and-place`; `Save and load the program`
- `target_chapter`: Chapter 6 and Chapter 7
- `priority`: High

## A. Grounded claims
- [T] `GF-02`, `POS-06` The chapter documents the prototype as a control-plane workflow: the operator starts the runtime, instantiates the module graph, activates modules, calibrates the robot-mounted stereo camera, and then authors and executes task-specific commands through the web frontend. Source: `User Workflow` opening paragraph; `System startup`; `Instantiate the module graph`; `Activation and calibration`; `Main view essentials`.
- [T] `VAL-03` The workflow is tied to a specific hardware/software setup: Kassow robot, robot-mounted stereo camera, tracked pen over BLE, Charuco calibration board, and fiducial-tagged box objects. Source: `Preconditions and environment`.
- [T] `POS-07` The chapter distinguishes persistent setup state from authored program state: the system can save and later restore the module graph and module states, and separately save and load authored programs. Source: `Activation and calibration`; `Save and load the program`.
- [T] `GF-03` The evaluated tasks in this chapter are weld and pick-and-place, and each has its own command authoring flow in the frontend. Source: `User story: weld`; `User story: pick-and-place`.
- [T] `GF-04` The workflow is task-oriented rather than a general programming environment: the user creates predefined use-case commands rather than editing arbitrary low-level robot code. Source: `Instantiate the module graph`; `Main view essentials`; `User story: weld`; `User story: pick-and-place`.
- [T] `POS-01` The operator workflow depends on explicit module boundaries and input mapping, but the demonstrated configuration is simple enough that mappings are auto-filled when the compatible producer is unique. Source: `Instantiate the module graph`.
- [T] `POS-05`, `LIM-SENS-02` Calibration assumes the camera remains rigid with respect to the robot flange; if the mount is moved, loosened, or reassembled, calibration must be repeated. Source: `Activation and calibration`.
- [T] `LIM-UI-01` The frontend is a prototype-style control surface with dedicated views for setup, activation/calibration, and runtime operation rather than a production workflow shell. Source: `Instantiate the module graph`; `Activation and calibration`; `Main view essentials`.
- [T] `LIM-ROBOT-03` The chapter is written around live robot operation and explicitly warns that `Move To Position` will move the robot, so execution remains an operator-cautioned live workflow. Source: `Main view essentials`.

## B. What was actually demonstrated
- The system can be brought up from the installed layout by launching `core.exe modules data` and opening the local web frontend. Source: `System startup`.
- The operator can create the full runtime graph by adding the Kassow robot module, camera input, camera pose injector, stereo calibration, pen tracking, scene detection, weld use case, and pick-and-place use case modules. Source: `Instantiate the module graph`.
- The robot module is activated by providing the controller host and robot model, while the camera module is activated with camera parameters and the calibration module is run after collecting synchronized stereo-plus-flange samples. Source: `Activation and calibration`.
- The main view supports pose capture, trajectory capture, scene refresh, visualization reload, and a stored home pose action. Source: `Main view essentials`.
- For weld, the user first scans the scene, then draws a seam-following trajectory, then confirms the command, then starts execution. Source: `User story: weld`.
- For pick-and-place, the user captures a scene snapshot, teaches pick and place poses, confirms the command, then starts execution. Source: `User story: pick-and-place`.
- The chapter shows that the pen has two distinct capture modes: brief primary-button press for pose capture and press-and-hold for trajectory capture. Source: `Main view essentials`.
- The chapter shows that the secondary pen button is used for automatic loading of use-case parameters, which is part of the pick-and-place flow. Source: `Main view essentials`; `User story: pick-and-place`.
- The save/load workflow demonstrates that the prototype can preserve both setup state and authored program state across sessions, subject to hardware availability. Source: `Activation and calibration`; `Save and load the program`.

## C. Strong outcomes / positive findings
- `POS-06` The workflow is practical as a staged control flow: setup, activation, calibration, authoring, confirmation, and execution are cleanly separated, which makes the prototype understandable as an operator procedure rather than as an opaque backend. Source: `User Workflow` opening paragraph; `System startup`; `Activation and calibration`; `Main view essentials`.
- `POS-03` Pick-and-place demonstrates scene-adaptive behavior during execution: the command stores a box ID and relative pick pose, then recomputes the world pick pose from the box's current pose at run time. Source: `User story: pick-and-place`.
- `POS-04` Weld demonstrates trajectory-centric authoring: the user draws a seam-aligned path, and after confirmation the command becomes fixed world-frame poses for approach, weld, and depart. Source: `User story: weld`.
- `POS-02` The confirm/start separation is meaningful: the command is previewed and locked in at confirmation, then executed later with a distinct Start action. Source: `User story: weld`; `User story: pick-and-place`.
- `GF-02` The workflow validates the modular architecture at the operator level because the user is explicitly working through modules, activation, and orchestration rather than a monolithic app flow. Source: `Instantiate the module graph`; `Activation and calibration`; `Main view essentials`.
- `POS-05` The chapter gives a strong case that the chosen sensing setup is operationally usable in a real robot workflow, but only under stable calibration and rigid mounting assumptions. Source: `Activation and calibration`; `Main view essentials`.

## D. Limitations and weaknesses

### 1. Scope / concept-level limits
- [T] `LIM-SCOPE-01`, `LIM-SCOPE-02` The chapter is about a linear operator workflow for two predefined use cases; it does not describe branching, loops, or richer program logic. Source: `User Workflow` opening paragraph; `User story: weld`; `User story: pick-and-place`.
- [T] `LIM-SCOPE-03` The chapter exposes use-case-specific actions and a few generic utilities, but it does not describe a separate general-purpose tool-control workflow. Source: `Main view essentials`; `User story: weld`; `User story: pick-and-place`.

### 2. Sensing and calibration
- [T] `LIM-SENS-01` Pen and camera operation depend on a visible marker cube, BLE advertisement, and a working camera preview; the workflow is therefore sensitive to visibility and setup quality even before execution starts. Source: `Main view essentials`.
- [T] `LIM-SENS-02` Calibration quality depends on collecting at least 10 diverse, synchronized stereo-plus-flange samples with a visible Charuco board and varied robot poses. Source: `Activation and calibration`.
- [T] `LIM-SENS-02` If calibration fails, the chapter attributes the failure to insufficient image quality, lighting, field-of-view coverage, or pose diversity, which makes calibration a fragile part of the operator workflow. Source: `Activation and calibration`.
- [T] `LIM-SENS-02` The system requires the stereo rig to remain rigid relative to the flange, so calibration is not a one-time permanent property of the hardware if the mount changes. Source: `Activation and calibration`.

### 3. Scene understanding
- [T] `LIM-SENS-04` The scene model used in the workflow is fiducial-tagged box objects visible to the camera, which is intentionally narrow and object-form specific. Source: `Preconditions and environment`; `User story: weld`; `User story: pick-and-place`.
- [T] `LIM-SENS-04` Weld depends on a narrow seam definition: two boxes must touch and the seam is treated as a straight line segment or subsegment. Source: `User story: weld`.
- [T] `LIM-SENS-04` Pick-and-place depends on box selection from a short segment along the pick pose `+z` direction, so scene interpretation is simple and marker-based rather than general object reasoning. Source: `User story: pick-and-place`.

### 4. Robot execution and tooling
- [T] `LIM-ROBOT-01` The workflow warns that moving the robot is real motion and should be handled cautiously, which implies that execution safety remains an operator concern in the prototype. Source: `Main view essentials`.
- [T] `LIM-ROBOT-03` Pause is supported for weld but not for pick-and-place, showing that execution controls are use-case-specific rather than uniform. Source: `User story: weld`; `User story: pick-and-place`.
- [T] `LIM-ROBOT-02` The workflow goes directly from confirmation to `Start` execution, with no intermediate motion-validation or simulation step described in the chapter. Source: `User story: weld`; `User story: pick-and-place`.

### 5. UI / orchestration / visualization
- [T] `LIM-UI-01` The frontend is operationally busy: the user must manage module creation, input mappings, activation dialogs, calibration samples, and command authoring, which suggests a high orchestration burden for the operator. Source: `Instantiate the module graph`; `Activation and calibration`; `Main view essentials`.
- [T] `LIM-UI-02` The presence of `Scan Scene` and `Reload Visualization` utility actions indicates that visualization can become stale and may require manual refresh. Source: `Main view essentials`.
- [T] `LIM-UI-03` Saving and loading programs preserves confirmation state and visualization data, but reuse is conditional on the scene remaining unchanged for weld and on the relevant box still being present for pick-and-place. Source: `Save and load the program`; `User story: weld`; `User story: pick-and-place`.
- [T] `LIM-UI-03` Loading setup state can fail partially if robot or camera hardware is unavailable, so persistence is not fully hardware-agnostic. Source: `Activation and calibration`.

### 6. Evaluation boundary
- [T] `VAL-01` This chapter is a workflow description, not a controlled evaluation; it demonstrates operation but does not quantify performance or compare against baselines. Source: `User Workflow` opening paragraph; `Save and load the program`.
- [T] `VAL-02` The chapter only covers the two thesis use cases and the specific lab setup, so its conclusions should stay limited to representative prototype operation. Source: `Preconditions and environment`; `User story: weld`; `User story: pick-and-place`.

## E. Future work already supported by the text

### Sensing
- [I] `FW-SENS-01` A more robust calibration workflow is a natural next step because the current procedure depends on many good samples, stable lighting, and rigid mounting. Source: `Activation and calibration`.
- [I] `FW-SENS-01` The camera input path is parameterized enough that supporting other stereo MJPEG sources would be a reasonable extension of the current workflow. Source: `Activation and calibration`.

### Input / interaction
- [I] `FW-INPUT-01` The pen-capture interaction already distinguishes pose capture from trajectory capture, so richer authoring gestures or alternative tracked inputs could reuse the same operator model. Source: `Main view essentials`.
- [I] `FW-INPUT-01` The secondary-button auto-loading behavior in pick-and-place suggests that the workflow could be extended with more context-sensitive shortcuts. Source: `Main view essentials`; `User story: pick-and-place`.

### Robot interface / execution
- [I] `FW-ROBOT-01` Because pause is only partially available across use cases and execution is direct rather than planned, more uniform execution controls and validation are a plausible next step. Source: `User story: weld`; `User story: pick-and-place`; `Main view essentials`.
- [I] `FW-ROBOT-02` The `Set Position` / `Move To Position` utility suggests room for more structured robot setup or recovery actions around the main task flow. Source: `Main view essentials`.

### UI
- [I] `FW-UI-01` The manual `Scan Scene` and `Reload Visualization` actions imply that the frontend could benefit from more automatic synchronization and recovery. Source: `Main view essentials`.
- [I] `FW-UI-01` The separate setup and runtime views imply that a future UI could reduce orchestration burden by collapsing repeated setup steps into guided workflows. Source: `Instantiate the module graph`; `Activation and calibration`; `Main view essentials`.

### Use cases / applicability
- [I] `FW-EVAL-03` The chapter already shows two distinct task classes, so extending the same workflow to additional use cases is the obvious next applicability step. Source: `User story: weld`; `User story: pick-and-place`.
- [I] `FW-EVAL-03` The current save/load boundary makes pick-and-place more reusable across runs than weld, which suggests future work on better scene-change handling for run-and-execute tasks. Source: `Save and load the program`; `User story: weld`; `User story: pick-and-place`.

### Evaluation
- [I] `FW-EVAL-01` The chapter itself is a procedural walkthrough, so a next step would be to quantify setup time, authoring time, and failure frequency across the two workflows. Source: `User Workflow` opening paragraph; `User story: weld`; `User story: pick-and-place`.
- [I] `FW-EVAL-02` A comparison to conventional teaching workflows would be the natural follow-on evaluation because Chapter 5 already frames the prototype as an alternative operator workflow. Source: `User Workflow` opening paragraph; `Main view essentials`.

### Long-term research direction
- [I] `FW-INPUT-02` The chapter’s pen-based interaction model is compatible with future tracking alternatives, but the text here does not yet define a broader multimodal interface. Source: `Main view essentials`.

## F. Claims to avoid
- Do not say the prototype is production-ready; the chapter is explicitly a workflow demo around a real lab setup, not a deployment claim. Source: `User Workflow` opening paragraph; `Main view essentials`.
- Do not say the system has fully automatic recovery from calibration or visualization problems; the text shows manual re-capture and manual reload actions instead. Source: `Activation and calibration`; `Main view essentials`.
- Do not say weld and pick-and-place share identical execution semantics; weld is fixed at confirmation time, while pick-and-place recomputes the pick pose at execution time. Source: `User story: weld`; `User story: pick-and-place`.
- Do not say saved programs are universally reusable without caveats; weld depends on unchanged scene geometry, and pick-and-place depends on the relevant box still being present. Source: `Save and load the program`; `User story: weld`; `User story: pick-and-place`.
- Do not claim the UI is a fully polished operator product; the chapter shows a prototype with explicit refresh and setup actions. Source: `Main view essentials`; `Instantiate the module graph`; `Activation and calibration`.

## G. Questions for the author
- Should the discussion chapter treat the setup burden as an acceptable tradeoff for flexibility, or as a limitation to be softened?
- Should the chapter explicitly call out that pick-and-place is the stronger case for dynamic reuse, while weld is the stronger case for seam-centric one-off authoring?
- Should save/load be discussed as a usability strength, or should its scene-dependence be emphasized more strongly as a limitation?
- Do you want the discussion to mention that the current workflow is operator-heavy but still simpler than writing pendant programs, or keep that comparison out unless Chapter 2 already covers it tightly?

## H. Source index
- `GF-02`, `POS-06` -> `User Workflow` opening paragraph; `System startup`; `Instantiate the module graph`; `Activation and calibration`; `Main view essentials`
- `VAL-03`, `POS-05`, `LIM-SENS-02` -> `Preconditions and environment`; `Activation and calibration`
- `POS-03`, `LIM-SENS-04`, `LIM-ROBOT-03` -> `User story: pick-and-place`
- `POS-04`, `LIM-SENS-04`, `LIM-ROBOT-03` -> `User story: weld`
- `POS-07`, `LIM-UI-03`, `FW-EVAL-03` -> `Save and load the program`
- `POS-01`, `LIM-UI-01`, `FW-UI-01` -> `Instantiate the module graph`; `Activation and calibration`; `Main view essentials`
- `FW-INPUT-01`, `FW-ROBOT-02` -> `Main view essentials`
