# Chapter 7 Draft Notes

## Purpose
- Internal drafting file for Chapter 7.
- Source-grounded from `summary/extraction/92_conclusion_evidence.md`, with truth-review softening applied.
- Use this as the main input for the final Conclusion and Future Work prose.

## 7.1 Conclusion

### Draft prose
This thesis explored whether frequently changing collaborative-robot tasks can be programmed with less friction by specifying spatial intent directly in the real workspace. To investigate that question, it delivered a modular end-to-end system with explicit interfaces between sensing, authoring, interpretation, and execution, and demonstrated it on a real Kassow robot using two representative use cases: pick-and-place and seam welding.

The clearest thesis-level result is the extensible system architecture itself. Rather than producing only a single pen-based prototype, the thesis established a shared runtime and control model in which different sensing methods, frontends, robot backends, and task-oriented use cases can reuse the same infrastructure. Within that framework, the two main demonstrations show complementary strengths: pick-and-place demonstrates scene-adaptive execution inside the current box-based model, while seam welding is the stronger fit for trajectory-centric spatial authoring. The most defensible overall conclusion is therefore that spatial authoring is viable for selected task-oriented workflows when supported by explicit modular boundaries, but that the current system remains a qualitative proof of concept rather than a validated industrial programming platform.

### Evidence to preserve
- [T] `GF-01` The thesis addresses programming friction for frequently changing collaborative-robot tasks through in-workspace spatial authoring.
  Sources: `introduction.tex` Motivation, High-level approach, Goals.
- [T] `GF-02` The main contribution is a modular end-to-end system with explicit interfaces between sensing, authoring, interpretation, and execution.
  Sources: `introduction.tex` High-level approach; `ch03_system_design.tex` System at a glance.
- [T] `GF-03` The system was demonstrated on a real Kassow robot with two representative use cases: pick-and-place and seam welding.
  Sources: `introduction.tex` Goals; `ch04_implementation.tex` Task-oriented use case modules; `ch05_user_workflow.tex` User story: weld, User story: pick-and-place.
- [T] `GF-04` The system is intentionally task-oriented, not a full robot programming language.
  Sources: `introduction.tex` High-level approach; `ch03_system_design.tex` UsecaseTree: from use case modules to executable programs.
- [T] `POS-01` The cleanest thesis-level result is the extensible modular architecture.
  Sources: `ch02_analysis.tex` Modular architecture; `ch03_system_design.tex` Module contract, Interface contracts.
- [T] `POS-03` Pick-and-place demonstrates scene-adaptive execution within the current box-based model.
  Sources: `ch04_implementation.tex` Pick-and-place use case; `ch05_user_workflow.tex` User story: pick-and-place.
- [T] `POS-04` Seam welding is the strongest trajectory-centric spatial-authoring result in the current prototype.
  Sources: `ch04_implementation.tex` Seam welding use case; `ch05_user_workflow.tex` User story: weld.
- [I] Safe high-level takeaway: the thesis establishes a workable foundation for task-oriented spatial robot authoring, but not a validated industrial programming platform.

## 7.2 Near-Term Future Work

### Draft prose
The most immediate future work follows directly from the current prototype boundaries. On the sensing side, the system would benefit from more robust calibration support, improved camera setups, IMU fusion for pen tracking, better timestamp alignment, and a cross-platform acquisition backend. On the scene-understanding side, the current box-only model should be extended toward richer object and environment representations, ideally with temporal stabilization and confidence information.

The execution layer also requires strengthening before broader deployment would be realistic. This includes a standardized tool-control abstraction for grippers and process tools, together with motion validation, collision checking, and a simulation-capable execution path. On the frontend side, the current control-plane UI should be refined to reduce setup burden and make visualization synchronization more robust.

### Evidence to preserve
- [T] `FW-SENS-01` Improve the sensing and calibration stack, including more robust camera setups and recalibration support.
  Sources: `ch02_analysis.tex` Camera trade-offs; `ch04_implementation.tex` Robot-mounted stereo camera calibration module.
- [T] Fuse IMU data into pen tracking and improve per-device pen calibration.
  Sources: `ch04_implementation.tex` Pen input device, Pen Tracking (Multi-Cam).
- [T] Add timestamp alignment or interpolation in the camera pose injector.
  Sources: `ch04_implementation.tex` Camera pose injector module.
- [T] Improve or replace the Windows-only camera acquisition backend with a cross-platform capture solution.
  Sources: `ch04_implementation.tex` Stereo camera acquisition module (Windows).
- [T] `FW-SENS-02` Move beyond the current box-only scene model toward richer object/scene representations.
  Sources: `ch02_analysis.tex` Scene detection; `ch03_system_design.tex` Scene detection interface; `ch04_implementation.tex` Scene detection module (fiducial boxes).
- [T] Add temporal stabilization and confidence outputs to scene detection.
  Sources: `ch03_system_design.tex` Scene detection interface; `ch04_implementation.tex` Scene detection module (fiducial boxes).
- [T] `FW-ROBOT-01` Add a standardized tool-control abstraction for grippers, welding tools, and other devices.
  Sources: `ch02_analysis.tex` Robot interface; `ch04_implementation.tex` Robot communication module.
- [T] `FW-ROBOT-02` Add motion validation, collision checking, or stronger execution planning.
  Sources: `ch02_analysis.tex` Robot interface; `ch04_implementation.tex` Pick-and-place use case, Seam welding use case.
- [T] Add a simulation-capable execution path.
  Sources: `ch04_implementation.tex` Task-oriented use case modules, Motion-primitive use cases.
- [I] `FW-UI-01` Improve the control-plane UX and reduce setup/orchestration burden.
  Basis: supported indirectly by the current UI framing and workflow burden in `ch02_analysis.tex` UI, `ch03_system_design.tex` UI orchestration module, `ch05_user_workflow.tex` operator procedure.
- [T] `FW-UI-02` Improve visualization synchronization and recovery beyond the current resync model.
  Sources: `ch03_system_design.tex` 3D visualization interface, UI orchestration module.

## 7.3 Longer-Term Directions

### Draft prose
Longer-term directions concern both broader interaction and stronger validation. The modular architecture keeps open the possibility of replacing the tracked pen with other 6DoF inputs such as hand tracking or VR/AR controllers, and the related-work positioning also points toward multimodal intent input that combines gesture with speech. Beyond interaction, the thesis would benefit from a stronger evaluation phase: a formal user study, a more quantitative workflow assessment, and controlled comparison against established robot-programming methods. Finally, the current prototype should be extended with more complex use cases so that the system can be evaluated beyond the initial two demonstrations.

### Evidence to preserve
- [T] `FW-INPUT-01` Support alternative 6DoF inputs such as hand tracking or VR/AR controllers.
  Sources: `ch01_background.tex` Positioning of this thesis; `ch02_analysis.tex` 6DoF input interface.
- [I] `FW-INPUT-02` Explore multimodal intent, especially gesture plus speech.
  Basis: motivated by `ch01_background.tex` Multimodal intent and the thesis positioning, but not stated as an explicit future-work commitment.
- [T] `FW-EVAL-03` Add more complex use cases beyond the two main thesis demos.
  Sources: `ch02_analysis.tex` Coverage of Additional Use Cases; `ch04_implementation.tex` Motion-primitive use cases.
- [I] `FW-EVAL-01` Run a formal user study or stronger quantitative evaluation.
  Basis: the thesis framing and current qualitative boundary imply this need, but it is not stated as a formal future-work promise in one section.
- [I] `FW-EVAL-02` Compare the workflow against teach-pendant or offline-programming approaches in a controlled setting.
  Basis: comparison is motivated by `introduction.tex` Motivation and `ch01_background.tex` Positioning of this thesis, but should stay inferential.

## Chapter 7 Guardrails
- Keep the conclusion shorter than Chapter 6.
- Keep the near-term engineering roadmap separate from longer-term research directions.
- Keep the final takeaway at `workable foundation plus clear next steps`.
- Do not let the chapter drift into claims of broad industrial superiority or production readiness.
