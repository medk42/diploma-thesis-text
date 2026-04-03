---
artifact_id: 20_ch06_evidence_packet
stage: S1
status: ready
owner_role: planning_sub_agent
source_files_loaded:
  - introduction.tex
  - ch06_discussion.tex
  - summary_2/expert_description.txt
  - summary_2/context/03_author_intent_handoff.md
  - summary_2/context/01_safe_vs_risky_claims.md
  - summary_2/style/00_style_reference.md
  - summary_2/style/01_style_do_dont.md
  - summary_2/planner/03_chapter_structure_v2.md
  - summary_5/00_master_workflow.md
  - summary_5/01_stage_map.md
  - summary_5/02_artifact_schema.md
  - summary_5/03_context_packets.md
  - summary_5/04_validation_rules.md
  - summary_5/05_quality_gates.md
  - summary_5/06_risk_register.md
  - summary_5/prompts/10_plan_writer_prompt.md
  - summary_5/outputs/10_run_manifest.md
  - summary_5/outputs/11_source_priority_map.md
depends_on:
  - summary_5/outputs/10_run_manifest.md
  - summary_5/outputs/11_source_priority_map.md
outputs_next:
  - summary_5/outputs/30_rewrite_plan_draft.md
  - summary_5/outputs/31_ch06_blueprint.md
---

# Chapter 6 Evidence Packet

## Grounding

- `GT`: Chapter 6 is the discussion chapter and, in the current thesis, it already states that the result is a qualitative prototype-level evaluation of what was built, what it means, where it works, where it stops, and what must not be claimed. Sources: `ch06_discussion.tex`, `introduction.tex`, `summary_5/01_stage_map.md`, `summary_5/04_validation_rules.md`.
- `GT`: The thesis question from the introduction is about reducing friction for frequently changing collaborative-robot tasks by specifying spatial intent directly in the real workspace rather than by editing motion commands in pendant-style or offline workflows. Sources: `introduction.tex`.
- `NGT`: The intended discussion emphasis is that the chapter should answer what was built, what the results mean, why they matter, where the approach is useful, and where it stops being useful. Sources: `summary_2/expert_description.txt`, `summary_2/context/03_author_intent_handoff.md`.
- `NGT`: The intended practical contrast is a prepared use case that can be redefined quickly by the operator, rather than a thesis about architecture for its own sake. Sources: `summary_2/expert_description.txt`, `summary_2/context/03_author_intent_handoff.md`.
- `INF`: The chapter should probably preserve the current 6.1 to 6.4 shape because it already maps to `what was built`, `what it means`, `where it stops`, and `what not to claim`, but the paragraph jobs inside those sections still need compression and de-duplication. Sources: `ch06_discussion.tex`, `summary_2/planner/03_chapter_structure_v2.md`, `summary_5/05_quality_gates.md`.
- `OPEN`: Any claim that depends on measured speed, industrial readiness, commercial readiness, or universal superiority is outside the current evidence boundary and should stay out unless new measurements are added. Sources: `summary_2/context/01_safe_vs_risky_claims.md`, `summary_5/04_validation_rules.md`.

## Chapter 6 Role Summary

- `GT`: Chapter 6 should function as the thesis' interpretive evaluation, not as another implementation chapter. It should connect the system back to the introduction, interpret the use cases, describe the current limits, and keep the evaluation boundary explicit. Sources: `ch06_discussion.tex`, `introduction.tex`, `summary_5/01_stage_map.md`, `summary_5/05_quality_gates.md`.
- `GT`: The chapter should keep the modular runtime and explicit interfaces as a meaningful result, but not the only result. Sources: `ch06_discussion.tex`.
- `NGT`: The chapter should stay close to the introduction thread so the reader can move from the research question to the discussion without encountering a new topic structure. Sources: `summary_2/context/03_author_intent_handoff.md`, `summary_2/expert_description.txt`.
- `INF`: A good rewrite should keep one paragraph that states the built artifact, one that interprets the result, one that explains the task-fit asymmetry, and one that states the validation boundary, rather than repeating the same system-level claim in several forms. Sources: `ch06_discussion.tex`, `summary_2/planner/03_chapter_structure_v2.md`, `summary_5/05_quality_gates.md`.

## Thesis-Grounded Claims To Preserve

- `GT`: The main result is an end-to-end prototype system for in-workspace spatial authoring that combines workspace sensing, spatial input, task-specific interpretation, and robot execution behind a shared modular runtime with explicit interfaces. Sources: `ch06_discussion.tex`, `introduction.tex`.
- `GT`: The thesis goals are fulfilled only at prototype scope: direct spatial authoring in the real workspace, an extensible plugin-based system, and a real-robot demonstration on pick-and-place and seam welding. Sources: `introduction.tex`, `ch06_discussion.tex`.
- `GT`: The workflow is broader than the two example tasks alone because it covers module-graph construction, activation, calibration, authoring, confirmation, execution, visualization, and persistence. Sources: `ch06_discussion.tex`.
- `GT`: The use-case boundary is part of the result because it turns the runtime into a concrete programming model that can discover use cases, create commands, confirm them, run them, and save or load authored programs. Sources: `ch06_discussion.tex`.
- `GT`: The strongest conceptual result is the combination of shared runtime, explicit interfaces, a reusable use-case boundary, and a complete operator workflow. Sources: `ch06_discussion.tex`.
- `GT`: Pick-and-place matters mainly as a flexibility result because the system can combine authored intent with refreshed scene state at execution time by storing an object identity and reconstructing the pick pose from the current object pose. Sources: `ch06_discussion.tex`.
- `GT`: Pick-and-place is not the main practical target because the current scene model is intentionally narrow, based on registry-defined fiducial boxes, and many industrial handling tasks are more tightly coupled to tooling and process-specific integration. Sources: `ch06_discussion.tex`, `summary_2/expert_description.txt`.
- `GT`: Welding is the clearest practical fit for the current prototype because it is trajectory-centric, the user intent is spatially meaningful, and the system can infer an approach-weld-depart sequence from authored trajectory plus sensed scene geometry. Sources: `ch06_discussion.tex`, `summary_2/expert_description.txt`.
- `GT`: The thesis explicitly frames the system as useful for selected task-oriented workflows, not as a replacement for all robot programming. Sources: `introduction.tex`, `ch06_discussion.tex`.
- `GT`: The current result remains qualitative and prototype-level; the thesis does not claim a formal user study, a controlled comparison against teach-pendant or offline programming, or quantitative characterizations of accuracy or productivity. Sources: `ch06_discussion.tex`, `summary_2/context/01_safe_vs_risky_claims.md`, `summary_5/04_validation_rules.md`.

## Intended Emphasis From Expert Description

- `NGT`: The chapter should read as an answer to the introduction: what did we build, what did it show, why does it matter, and where does it stop being useful. Sources: `summary_2/expert_description.txt`, `summary_2/context/03_author_intent_handoff.md`.
- `NGT`: Architecture is a real result, but it should be discussed through the use cases and the workflow rather than as a self-justifying headline. Sources: `summary_2/expert_description.txt`, `summary_2/context/03_author_intent_handoff.md`.
- `NGT`: Pick-and-place should be framed as flexibility evidence, not as the main sweet spot. Sources: `summary_2/expert_description.txt`, `summary_2/context/01_safe_vs_risky_claims.md`.
- `NGT`: Welding should be framed across three levels of usefulness: fixed repetitive production, small-batch production, and one-off or highly variable welding where re-teaching cost matters most. Sources: `summary_2/expert_description.txt`, `summary_2/context/03_author_intent_handoff.md`.
- `NGT`: The discussion should stay modest about human-robot cooperation and should use soft framing such as human-in-the-loop task intent plus repetitive robot execution, not assistant or science-fiction analogies. Sources: `summary_2/context/03_author_intent_handoff.md`, `summary_2/context/01_safe_vs_risky_claims.md`.
- `NGT`: The intended deployment contrast is a prepared task-specific use case that can be redefined quickly, versus conventional integration that remains fixed once commissioned. Sources: `summary_2/expert_description.txt`, `summary_2/context/03_author_intent_handoff.md`.
- `NGT`: The chapter should explain usefulness by mechanism and boundary, not by abstract praise. Sources: `summary_2/style/00_style_reference.md`, `summary_2/style/01_style_do_dont.md`.

## Limitations and Validity Items To Surface

- `GT`: Highest-priority limitation is scene understanding. The current system uses registry-defined fiducial boxes, returns only object IDs and poses, processes one stereo pair per `READ_SCENE` request, and does not provide temporal stabilization or confidence outputs. Sources: `ch06_discussion.tex`.
- `GT`: Next limitation is sensing and calibration robustness. Pen tracking is marker-based and therefore sensitive to visibility, motion blur, lighting conditions, and corner detection quality; the pen does not fuse IMU data even though the device provides it; camera-pose calibration assumes a rigid robot-mounted stereo rig. Sources: `ch06_discussion.tex`.
- `GT`: Execution and tooling remain incomplete. The thesis implements a shared robot motion interface, but generalized tool control is not standardized, the evaluated use cases simulate gripper or welding actions with fixed delays, no collision checking is performed, and the prototype does not support simulated execution of authored programs. Sources: `ch06_discussion.tex`.
- `GT`: The programming model is intentionally bounded. The thesis does not target a full robot programming language and does not address rich branching, loops, exception recovery, or rich sensor-driven logic. Sources: `introduction.tex`, `ch06_discussion.tex`.
- `GT`: UI maturity and portability are still limited. The frontend is a prototype control plane; stale visualization may require manual reloads; reloading a saved setup can fail or restore only part of the graph if hardware modules cannot reactivate; camera acquisition is currently Windows-only and BLE behavior differs between Windows and Linux. Sources: `ch06_discussion.tex`.
- `GT`: Applicability and safety boundaries should stay explicit. The weld use case assumes the workpiece configuration remains unchanged after confirmation; pick-and-place assumes the scene can be refreshed at execution time and that the expected object can still be matched by its stored identity; the prototype does not perform collision-aware planning. Sources: `ch06_discussion.tex`.
- `GT`: The evaluation boundary is qualitative and feasibility-oriented. Most development and testing took place in simulation, physical validation was limited, and the thesis does not support claims of broad industrial readiness or measured productivity gains. Sources: `ch06_discussion.tex`.
- `INF`: If space is tight, these limitations should be ordered by practical risk rather than by implementation convenience: scene understanding first, then sensing/tracking and calibration, then planning/collision/execution robustness, then tool abstraction, then exportability, then evaluation gap, then cross-platform/UI roughness. Sources: `summary_2/expert_description.txt`, `summary_2/context/03_author_intent_handoff.md`, `ch06_discussion.tex`.

## Candidate Cuts And Compressions

- `merge`: The opening main-result paragraphs repeat the same thesis-level claim in slightly different forms. Keep one concise result statement and one interpretation paragraph instead of three adjacent restatements. Sources: `ch06_discussion.tex`, `summary_5/05_quality_gates.md`.
- `merge`: The repeated explanation that the modular runtime and explicit interfaces are the key result appears in several places. Keep one strong paragraph that links architecture to the use cases and cut the duplicate self-justification. Sources: `ch06_discussion.tex`, `summary_2/expert_description.txt`.
- `merge`: The pick-and-place discussion can be reduced to one flexibility paragraph and one limitation paragraph. The current text returns to the same point several times. Sources: `ch06_discussion.tex`, `summary_2/context/03_author_intent_handoff.md`.
- `merge`: The welding fit discussion should keep the three-level usefulness framing, but it should be stated once rather than reintroduced through multiple near-synonymous formulations. Sources: `ch06_discussion.tex`, `summary_2/expert_description.txt`.
- `relocate`: Secondary UI and platform details can be compressed or moved later in the limitations sequence if they interrupt the main task-fit argument. Sources: `ch06_discussion.tex`, `summary_2/context/03_author_intent_handoff.md`.
- `cut`: Abstract labels that sound polished but do not add explanation, such as `scene-adaptive`, `complementary strengths`, or similarly compressed phrasing, should be removed unless they are immediately explained in plain thesis language. Sources: `summary_2/style/01_style_do_dont.md`, `summary_5/04_validation_rules.md`, `summary_2/context/03_author_intent_handoff.md`.
- `cut`: Any sentence that reads like a conclusion chapter summary inside Chapter 6 should be shortened or removed if it duplicates the closure job that Chapter 7 should carry. Sources: `summary_5/04_validation_rules.md`, `summary_5/05_quality_gates.md`, `summary_2/planner/03_chapter_structure_v2.md`.

## Keep / Cut Priorities

- `keep`: The introduction thread, the three goals, and the prototype-scope closure must survive intact because they define why the discussion exists. Sources: `introduction.tex`, `ch06_discussion.tex`.
- `keep`: The distinction between architecture as a result and architecture as the only result must stay visible. Sources: `ch06_discussion.tex`, `summary_2/expert_description.txt`.
- `keep`: Pick-and-place should stay as a flexibility demonstration, not as the main practical sweet spot. Sources: `ch06_discussion.tex`, `summary_2/context/03_author_intent_handoff.md`.
- `keep`: Welding should stay as the clearest practical fit, especially in the small-batch and frequently re-taught case. Sources: `ch06_discussion.tex`, `summary_2/expert_description.txt`.
- `keep`: The evaluation boundary and major limitations must remain explicit even after compression. Sources: `ch06_discussion.tex`, `summary_5/04_validation_rules.md`.
- `cut`: Repeated claims that the system is modular, extensible, and reusable should not occupy multiple paragraphs unless each repetition adds a new consequence. Sources: `ch06_discussion.tex`.
- `cut`: Any implied speed, productivity, or industrial-readiness claim should be removed unless a source file provides direct measurement or a clearly softened interpretation. Sources: `summary_2/context/01_safe_vs_risky_claims.md`, `summary_5/04_validation_rules.md`.
- `cut`: Any wording that makes the chapter sound like a feature list, product pitch, or implementation recap should be compressed away. Sources: `summary_2/style/01_style_do_dont.md`, `summary_5/05_quality_gates.md`.

## Open Checks

- `OPEN`: Do not convert the current prototype into a claimed deployment model for industrial integration. The expert notes allow a soft integrator-like interpretation only if it stays a plausible framing rather than a thesis fact. Sources: `summary_2/expert_description.txt`, `summary_2/context/01_safe_vs_risky_claims.md`, `summary_2/context/03_author_intent_handoff.md`.
- `OPEN`: Do not add exact timing claims such as a weld-teaching speed, because the thesis does not provide measurements for them. Sources: `summary_2/context/01_safe_vs_risky_claims.md`, `summary_5/04_validation_rules.md`.
- `OPEN`: Do not claim the system is commercially viable, commercially ready, or generally superior to teach-pendant or offline programming workflows. Sources: `summary_2/context/01_safe_vs_risky_claims.md`, `summary_5/04_validation_rules.md`.
- `OPEN`: Do not use science-fiction assistant analogies in thesis prose; keep any human-robot cooperation language soft and task-oriented. Sources: `summary_2/context/03_author_intent_handoff.md`, `summary_2/context/01_safe_vs_risky_claims.md`.

## Keep / Cut Priority Order

- `GT`: Keep the discussion tied to the introduction question first, then the result, then the meaning, then the limits. Sources: `introduction.tex`, `ch06_discussion.tex`, `summary_5/01_stage_map.md`.
- `GT`: Keep the architecture/use-case/result hierarchy, but do not let architecture dominate the ending. Sources: `ch06_discussion.tex`, `summary_2/context/03_author_intent_handoff.md`.
- `GT`: Keep the welding/pick-and-place asymmetry clear because it is one of the main interpretive findings. Sources: `ch06_discussion.tex`, `summary_2/expert_description.txt`.
- `INF`: If the chapter must be shortened, remove repeated framing and platform minutiae before removing any of the main result, the task-fit asymmetry, or the evaluation boundary. Sources: `summary_5/04_validation_rules.md`, `summary_5/05_quality_gates.md`.

## Source Index

- Thesis ground truth: `introduction.tex` for the research question, goals, and chapter roles; `ch06_discussion.tex` for the current discussion content, result framing, limitations, and validation boundary.
- Author intent and framing: `summary_2/expert_description.txt` for the intended discussion emphasis and the welding/pick-and-place asymmetry; `summary_2/context/03_author_intent_handoff.md` for the discussion-vs-conclusion split and the preferred tone; `summary_2/context/01_safe_vs_risky_claims.md` for safe claim strength and softening rules.
- Style and wording discipline: `summary_2/style/00_style_reference.md` and `summary_2/style/01_style_do_dont.md`.
- Chapter structure guidance: `summary_2/planner/03_chapter_structure_v2.md`.
- Workflow and validation rules: `summary_5/00_master_workflow.md`, `summary_5/01_stage_map.md`, `summary_5/02_artifact_schema.md`, `summary_5/03_context_packets.md`, `summary_5/04_validation_rules.md`, `summary_5/05_quality_gates.md`, `summary_5/06_risk_register.md`, `summary_5/prompts/10_plan_writer_prompt.md`, `summary_5/outputs/10_run_manifest.md`, `summary_5/outputs/11_source_priority_map.md`.
- Optional thesis chapters loaded: none.
