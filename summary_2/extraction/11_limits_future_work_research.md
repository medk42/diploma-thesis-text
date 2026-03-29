# Limits And Future Work Research Note

## Metadata
- `packet_id`: L2-second-pass
- `source_files`: `introduction.tex`, `ch02_analysis.tex`, `ch03_system_design.tex`, `ch04_implementation.tex`, `ch05_user_workflow.tex`, `summary/final/ch06_discussion_draft.md`, `summary/final/ch07_conclusion_future_work_draft.md`, `notes/outline_v2.md`
- `author_note_status`: mixed, with explicit `T` / `I` / `Author-view`
- `target_use`: rewrite support for Chapters 6 and 7

## What The User Changed In This Pass
The new review does not ask for a different thesis. It asks for a different emphasis.

The main shift is:
- Chapter 6 should start from the introduction and answer what was built, what the results mean, why the results matter, and where the system is useful.
- Chapter 6 should keep the system architecture as a major result, but not the only result.
- Chapter 6 should make use cases central, because they are the evidence that the system actually does something useful.
- Chapter 7 should stay short, modest, and split future work into near-term engineering completion and longer-term research directions.

The user also wants the prose to sound like this thesis, not like a generic AI summary:
- direct,
- comparative,
- concrete,
- qualified,
- and tightly tied to the prototype scope.

## Executive Judgment
The current thesis is strongest when it is read as a proof-of-concept for task-oriented spatial robot authoring, not as a universal robot-programming platform.

That means the rewrite should keep three ideas in balance:
- the architecture is itself a real result,
- the use cases show concrete value and concrete boundaries,
- the thesis is honest about what is not solved yet.

## Ranked Limitations

### P0. Scene understanding is the biggest practical limitation
Tag: `T`

Why this is highest priority:
- It is the most direct threat to usefulness.
- It is the first thing that would need replacement in a more general deployment.
- It affects the use cases themselves, not just the UI or polish.

What the thesis text supports:
- The scene model is intentionally box-based and fiducial-based.
- Scene detection is box-only, registry-based, and limited to simple object geometry.
- Pick-and-place depends on marker identity and a box model.
- Welding depends on seam inference from detected boxes.

Best thesis phrasing strength:
- `T` for the box-only limitation.
- `I` for saying this is the biggest practical limitation.
- `Author-view` for saying this is the first component a later system would likely replace.

Sources:
- `ch03_system_design.tex`, scene detection interface and box-only limits.
- `ch04_implementation.tex`, scene detection module and use-case implementations.
- `ch05_user_workflow.tex`, weld and pick-and-place user stories.

### P0. Robot-side export / compilation is a meaningful missing capability
Tag: `Author-view` with `I` support

Why it matters:
- The user wants this treated as a real future direction.
- It is a clean deployment question, not just a bug fix.
- It is especially relevant if the thesis is framed as a reusable layer for repeated task packages.

What can safely be said:
- The current workflow is mediated by the thesis runtime.
- The architecture suggests a possible export path, but it is not implemented or validated.
- The use-case model currently stores command JSON and executes through the runtime, not as a compiled robot-native artifact.

What should stay soft:
- `the system can be exported easily`
- `the architecture already supports robot-side execution`
- `the thesis proves exportability`

Recommended phrasing:
- `the architecture suggests a possible path toward export, but this is not yet implemented or validated`
- `export or compilation toward robot-side execution is a meaningful future direction`

Sources:
- `ch03_system_design.tex`, UsecaseTree and persistence semantics.
- `ch04_implementation.tex`, use-case implementations.
- `summary_2/context/00_author_viewpoints_map.md`.

### P1. Planning, collision avoidance, and motion validation are important engineering gaps
Tag: `T` for the lack, `Author-view` for the interpretation

What the thesis text shows:
- The robot interface is motion-centric.
- The demonstrated use cases use direct motion primitives.
- No collision checking is performed in the demonstrated use cases.
- Simulation mode is not supported.
- The robot layer focuses on motion and state feedback rather than execution planning.

How to frame it:
- This is not a generic failure of the architecture.
- It is a missing capability that matters if the system is pushed toward broader or safer use.
- It belongs in limitations and near-term future work.

Recommended phrasing strength:
- `T` for the absence of collision checking and simulation support.
- `I` for saying motion validation is a necessary next step.
- `Author-view` for saying the system would benefit from a more execution-aware robot layer.

Sources:
- `ch03_system_design.tex`, robot execution interface.
- `ch04_implementation.tex`, pick-and-place and seam welding use cases.

### P1. Tool abstraction is a real limitation, but not the same kind of problem as scene understanding
Tag: `T`

Why this belongs in limitations:
- The thesis text explicitly says tool control is not generalized.
- Tool control is harder to standardize than motion.
- A later system would need either a generic tool interface or a per-use-case tool module.

Why it is secondary to scene understanding:
- It is important, but the thesis can still demonstrate the core authoring concept without it.
- It does not threaten the core spatial-authoring idea as directly as broken scene understanding would.

Recommended phrasing:
- `the current robot layer is motion-centric and does not provide a standardized tool-control stack`
- `tool abstraction remains open for future work`

Sources:
- `ch02_analysis.tex`, robot interface requirements and discussion.
- `ch03_system_design.tex`, robot execution interface.
- `ch04_implementation.tex`, pick-and-place and weld implementation.

### P1. The sensing setup is effective for the prototype, but still fragile
Tag: `T`

What is grounded:
- Marker tracking depends on visibility, lighting, occlusion, and calibration quality.
- The current pen tracking does not fuse IMU data.
- The camera pose injector uses latest-sample association, not full synchronization.
- The camera acquisition module is Windows-only.
- The robot-mounted calibration assumes a rigid mount.

How to phrase it:
- Keep it as a prototype constraint.
- Do not overstate this as a conceptual failure.
- Separate `system fragility` from `implementation polish`.

Best strength:
- `T` for the technical limits.
- `I` for saying these limits reduce the confidence that the system would transfer unchanged to harsher environments.
- `Author-view` for saying more robust sensing would widen the set of useful tasks.

Sources:
- `ch02_analysis.tex`, 6DoF input and camera trade-off sections.
- `ch04_implementation.tex`, stereo camera module, camera pose injector, pen tracking, calibration module.
- `ch05_user_workflow.tex`, activation and calibration workflow.

### P1. There is no formal experimental validation
Tag: `T` / `I`

What the thesis supports:
- The evaluation is qualitative and workflow-oriented.
- The thesis uses representative tasks and prototype operation rather than benchmark-style testing.
- The introduction and chapter roadmap frame Chapter 6 as a qualitative discussion.

What should be said carefully:
- There is no formal user study in the extracted thesis text.
- There is no quantitative precision characterization in the extracted thesis text.
- There is no direct comparison against pendant workflows in the extracted thesis text.

Recommended phrasing:
- `the evidence is qualitative and workflow-oriented rather than benchmark-based`
- `formal user study and stronger quantitative evaluation remain future work`
- `efficiency claims should stay qualitative unless measured`

Sources:
- `introduction.tex`, thesis structure and goals.
- `ch02_analysis.tex`, qualitative design reasoning note.
- `summary/final/ch06_discussion_draft.md`.

### P2. Cross-platform support is partial, not a core result
Tag: `T`

What is actually supported:
- The thesis implementation targets Windows and Linux.
- Most modules are portable.
- Camera acquisition is currently Windows-only.
- BLE discovery/connection has a platform-specific caveat on Linux.

How to frame it:
- This is real engineering debt.
- It should not be promoted into a major thesis-level limitation unless needed.
- It belongs below scene understanding, exportability, planning, and tool abstraction.

Recommended phrasing:
- `the core architecture is portable, but the camera acquisition backend is still platform-specific`
- `Linux support is partial in the current prototype`

Sources:
- `ch04_implementation.tex`, implementation note and stereo camera module.

### P2. UI roughness is secondary unless separately verified
Tag: `Needs separate verification` for specific bug claims

What the source text supports:
- The UI is a prototype control plane, not a reference frontend.
- Visualization uses best-effort updates and can be rebuilt via reload.
- Save/load is part of the orchestration workflow.

What the thesis text does not currently support strongly:
- specific freeze bugs,
- specific reload deadlocks,
- specific desynchronization bug reports,
- specific broken pop-up behavior.

Therefore:
- keep generic UI prototype limitations,
- keep specific bug claims out unless the thesis text is updated,
- do not turn unverified bugs into thesis findings.

Sources:
- `ch03_system_design.tex`, UI orchestration and visualization sections.
- `summary_2/context/01_safe_vs_risky_claims.md`.

## Negative Findings To Keep, But Not Overwrite The Main Story

### Pick-and-place is a positive result, but not the main practical sweet spot
Tag: `Author-view` with strong source support

Why it matters:
- It proves runtime adaptability.
- It shows the architecture is not frozen at authoring time.
- It is still weaker than welding as a practical use case.

How to say it:
- `pick-and-place demonstrates flexibility`
- `pick-and-place is better treated as a flexibility demonstration than as the main practical sweet spot`
- `pick-and-place shows that the architecture can adapt at runtime, even though that is not the strongest application target`

Sources:
- `ch04_implementation.tex`, pick-and-place use case.
- `ch05_user_workflow.tex`, pick-and-place user story.

### Seam welding is the clearest practical fit
Tag: `Author-view` with `T` support

Why it matters:
- It fits the current one-off / repeatedly re-taught workflow the best.
- It is a strong demonstration of trajectory-centric spatial authoring.
- It is the best answer to the thesis question, even if the system is broader.

How to say it:
- `welding is the strongest fit for the current prototype`
- `the current prototype appears especially well matched to repetitive, frequently re-taught welding-like tasks`
- `the current value proposition is strongest where the human defines the task intent and the robot repeats the physical execution`

Sources:
- `ch04_implementation.tex`, seam welding use case.
- `ch05_user_workflow.tex`, weld user story.

### The linear use-case model is a design choice, not a defect
Tag: `T` and `Author-view`

What the source says:
- The use case model is intentionally linear.
- Branching and parallel composition are out of scope.
- The thesis focuses on task-oriented use cases, not a full language.

How to frame it:
- It should be discussed as scope, not failure.
- It is fine to mention that it sits between a one-off command and a full robot language, but do not present it as a problem.

Recommended phrasing:
- `the use-case model sits between a one-off command and a full robot programming language`
- `the linear structure is a deliberate scope choice`

Sources:
- `introduction.tex`, high-level approach.
- `ch03_system_design.tex`, UsecaseTree and workflow state machine.

## Future Work Split

### Near-Term Engineering Completion
These are the right items for Chapter 7 subsection 7.2.

1. Robot-side export / compilation path
- Make it a deployment option, not a thesis claim.
- Keep it as `possible future direction`, not `already planned implementation`.

2. Tool abstraction
- Introduce a standardized tool interface or per-use-case tool modules.
- This is a direct extension of the motion-centric robot layer.

3. Motion validation / collision avoidance
- Add execution planning, path validation, and safer motion handling.
- This is the most important robot-layer gap after tool abstraction.

4. Better sensing and calibration
- Improve IMU fusion, tracking stability, calibration workflow, and recalibration support.
- This is useful, but keep it framed as engineering strengthening unless the text supports more.

5. Cross-platform completion
- Finish Linux camera acquisition.
- Resolve BLE/platform-specific behavior cleanly.

6. Better scene detection
- Move beyond the box-only model.
- Add richer geometry, more robust detection, and better scene-state semantics.

7. UI / orchestration cleanup
- Improve visualization sync and recovery.
- Reduce manual recovery burden.
- Keep this separate from the thesis-level claims.

### Longer-Term Research Directions
These are the right items for Chapter 7 subsection 7.3.

1. Hand tracking
- Interesting as a natural input modality.
- Needs careful evaluation because intent signalling and stability are hard.

2. VR / AR controllers
- Strong tracking ecosystem.
- Good fit if the system becomes headset-centered or controller-centered.

3. Voice plus deictic gesture
- This is the strongest long-term interaction concept.
- It fits the authorial view of a human-in-the-loop workflow.

4. Teach-pendant or controller integration
- The author wants this as a deployment angle.
- It should be treated as a possible integration model, not a current result.

5. Formal user study and precision characterization
- This is the strongest academic evaluation direction.
- It would directly answer the current prototype's biggest validation gap.

6. More complex use cases
- Keep it open-ended and academically motivated.
- Good examples include more structured welding, inspection, and other repetitive task families.

## What Should Stay Out Unless Verified

- Exact speed comparisons.
- Claims of global accuracy.
- Claims that the system is commercially viable.
- Claims that the system is a universal replacement for existing robot programming.
- Claims that specific UI bugs are thesis findings if the thesis text does not currently support them.
- Claims that the system is faster than specific industrial products.

## Recommended Writing Order For The Rewrite

1. Write Chapter 6 opening as a bridge from the introduction.
2. Write one section on what the thesis achieved.
3. Write one section on what the results mean, with use cases central.
4. Write one section on limitations, ordered by practical importance.
5. Write Chapter 7 conclusion as a concise restatement.
6. Write Chapter 7 future work in two tiers:
   - near-term engineering,
   - longer-term research.

## Recommended Strength Labels

- `T` for explicit thesis text.
- `I` for cautious inference from thesis text.
- `Author-view` for user ideas that are reasonable discussion material but not directly stated in the thesis.

## Source Index

- `introduction.tex`
- `ch02_analysis.tex`
- `ch03_system_design.tex`
- `ch04_implementation.tex`
- `ch05_user_workflow.tex`
- `summary_2/context/00_author_viewpoints_map.md`
- `summary_2/context/01_safe_vs_risky_claims.md`
- `summary_2/style/00_style_reference.md`
- `summary_2/style/01_style_do_dont.md`

