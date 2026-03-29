# Chapter 7 Evidence Bank

## Metadata
- `source_files`: `summary/extraction/90_master_evidence.md`
- `target_chapter`: Chapter 7
- `author_note_status`: thesis-text grounded unless marked `I`

## 7.1 Conclusion
- [T] `GF-01` The thesis addresses the problem of programming friction for frequently changing collaborative-robot tasks through in-workspace spatial authoring.
- [T] `GF-02` The main contribution is a modular end-to-end system with explicit interfaces between sensing, authoring, interpretation, and execution.
- [T] `GF-03` The system was demonstrated on a real Kassow robot with two representative use cases: pick-and-place and seam welding.
- [T] `GF-04` The system is intentionally task-oriented, not a full robot programming language.
- [T] `POS-01` The cleanest thesis-level result is the extensible modular architecture, because it lets different sensing methods, frontends, robot backends, and task modules share one runtime and one control model.
- [T] `POS-03` Pick-and-place shows that the architecture can support scene-adaptive execution within the current box-based model.
- [T] `POS-04` Seam welding shows the strongest fit for trajectory-centric spatial authoring in the current prototype.
- [I] Safe high-level takeaway: the thesis demonstrates that spatial authoring is viable for selected task-oriented workflows when combined with explicit modular boundaries, but the current prototype remains a qualitative proof of concept rather than a fully validated industrial programming platform.
Sources: `introduction.tex` Motivation, High-level approach, Goals; `ch03_system_design.tex` System at a glance, UsecaseTree: from use case modules to executable programs; `ch04_implementation.tex` Task-oriented use case modules, Pick-and-place use case, Seam welding use case; `ch05_user_workflow.tex` User story: pick-and-place, User story: weld.

## 7.2 Near-Term Future Work
- [T] `FW-SENS-01` Improve the sensing and calibration stack, including more robust camera setups and recalibration support.
- [T] Fuse IMU data into pen tracking and improve per-device pen calibration.
- [T] Add timestamp alignment or interpolation in the camera pose injector.
- [T] Improve or replace the Windows-only camera acquisition backend with a cross-platform capture solution.
- [T] `FW-SENS-02` Move beyond the current box-only scene model toward richer object/scene representations.
- [T] Add temporal stabilization and confidence outputs to scene detection.
- [T] `FW-ROBOT-01` Add a standardized tool-control abstraction for grippers, welding tools, and other devices.
- [T] `FW-ROBOT-02` Add motion validation, collision checking, or stronger execution planning.
- [T] Add a simulation-capable execution path.
- [T] `FW-UI-01` Improve the control-plane UX and reduce setup/orchestration burden.
- [T] `FW-UI-02` Improve visualization synchronization and recovery beyond the current resync model.
Sources: `ch02_analysis.tex` Camera trade-offs, Scene detection, Robot interface, UI; `ch03_system_design.tex` 3D visualization interface, UI orchestration module, Scene detection interface; `ch04_implementation.tex` Pen input device, Pen Tracking (Multi-Cam), Camera pose injector module, Robot communication module, Pick-and-place use case, Seam welding use case, Task-oriented use case modules, Motion-primitive use cases.

## 7.3 Longer-Term Directions
- [T] `FW-INPUT-01` Support alternative 6DoF inputs such as hand tracking or VR/AR controllers.
- [T] `FW-INPUT-02` Explore multimodal intent, especially gesture plus speech.
- [T] `FW-EVAL-03` Add more complex use cases beyond the two main thesis demos.
- [T] `FW-EVAL-01` Run a formal user study or stronger quantitative evaluation.
- [T] `FW-EVAL-02` Compare the workflow against conventional approaches such as teach-pendant or offline programming in a controlled setting.
Sources: `ch01_background.tex` Multimodal intent, Positioning of this thesis; `ch02_analysis.tex` 6DoF input interface, Coverage of Additional Use Cases, Requirement-driven design decisions; `introduction.tex` Motivation, Goals, Thesis structure; `ch04_implementation.tex` Motion-primitive use cases.

## 7.4 Conclusion Boundary Notes
- [T] Re-state the main contribution hierarchy as modular system first, demonstrated task workflows second.
- [T] Keep claims below production-readiness and below universal workflow-superiority claims.
- [I] The most defensible closing message is that the thesis establishes a workable foundation for task-oriented spatial robot authoring and exposes the next engineering and research steps needed to make it broader and stronger.
Sources: `introduction.tex` High-level approach, Thesis structure; `ch03_system_design.tex` UsecaseTree: from use case modules to executable programs; `ch04_implementation.tex` Task-oriented use case modules.
