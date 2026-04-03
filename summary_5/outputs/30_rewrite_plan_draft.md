---
artifact_id: 30_rewrite_plan_draft
stage: S2
status: draft
owner_role: orchestrator
source_files_loaded:
  - summary_5/outputs/20_ch06_evidence_packet.md
  - summary_5/outputs/21_ch07_evidence_packet.md
  - summary_5/outputs/22_style_reference_packet.md
  - summary_5/outputs/23_compression_map.md
  - summary_5/outputs/24_risk_and_mismatch_register.md
  - summary_5/00_master_workflow.md
  - summary_5/01_stage_map.md
  - summary_5/02_artifact_schema.md
  - summary_5/04_validation_rules.md
  - summary_5/05_quality_gates.md
depends_on:
  - summary_5/outputs/20_ch06_evidence_packet.md
  - summary_5/outputs/21_ch07_evidence_packet.md
  - summary_5/outputs/22_style_reference_packet.md
  - summary_5/outputs/23_compression_map.md
  - summary_5/outputs/24_risk_and_mismatch_register.md
outputs_next:
  - summary_5/outputs/31_ch06_blueprint.md
  - summary_5/outputs/32_ch07_blueprint.md
  - summary_5/outputs/33_cross_chapter_rules.md
  - summary_5/outputs/34_plan_review_grounding_r1.md
  - summary_5/outputs/35_plan_review_content_r1.md
  - summary_5/outputs/36_plan_review_style_language_r1.md
---

# Rewrite Strategy

- Rewrite both closing chapters from scratch at paragraph level; do not preserve current wording unless it is already the clearest formulation.
- Keep thesis facts and limits intact, but compress repeated architecture claims, recap lists, and duplicated boundary language. When architecture appears, explain it through workflow and use-case consequences, not as a standalone headline.
- Make Chapter 6 the main interpretive chapter: answer what was built, what it means, where it fits, and where the evidence stops.
- Make Chapter 7 the shorter closure chapter: restate the contribution hierarchy once, state the proof-of-concept boundary, and split future work into near-term engineering versus longer-term research.
- Keep the introduction thread visible throughout: frequently changing tasks, in-workspace spatial intent, representative task families, and prototype-scope closure of the three thesis goals.
- Keep architecture meaningful through use-case consequences and workflow support, not as a self-justifying headline.
- Chapter 6 full contribution form: name the bounded prototype answer first, then the reusable use-case boundary and operator workflow, then the shared modular runtime with explicit interfaces, then the representative demonstrations.
- Chapter 7 compressed reuse form: reuse only the short version that names the bounded prototype answer and the workflow-enabling runtime once; do not re-list the architecture block or re-explain the mechanism.

# Contribution Hierarchy To Preserve

1. `GT`: prototype-level answer to the thesis question for selected task-oriented workflows.
2. `GT`: reusable use-case boundary and end-to-end operator workflow.
3. `GT`: shared modular runtime with explicit interfaces.
4. `GT`: representative demonstrations on pick-and-place and seam welding.
5. `INF`: pick-and-place as flexibility/runtime-refresh evidence; welding as clearest current practical fit.

# Facts To Preserve Verbatim In Meaning

- `GT`: the result is a prototype and the evaluation is qualitative.
- `GT`: no formal user study, no baseline comparison, no quantitative characterization of accuracy, repeatability, or productivity.
- `GT`: the work is not a claim of industrial readiness, commercial readiness, or universal superiority.
- `GT`: pick-and-place and welding are not symmetric examples in meaning.
- `GT`: future work must stay future-facing.

# Facts To Soften

- `NGT`: practical usefulness beyond the demonstrated examples must stay interpretive and bounded.
- `NGT`: human-in-the-loop framing is acceptable only as careful workflow interpretation, not as a claim of assistant-like capability.
- `INF`: any statement about reducing setup friction must remain qualitative and mechanism-based, not measured.

# Facts To Remove

- `OPEN`: exact timing claims.
- `OPEN`: superiority claims over teach pendant, offline programming, or integrator workflows.
- `OPEN`: production-readiness or deployment-readiness language.
- `OPEN`: abstract polished labels that add tone but not explanation.

# Compression Strategy

- Merge repeated Chapter 6 main-result statements into one result paragraph and one consequence paragraph.
- Merge detailed architecture praise into the paragraphs where architecture explains workflow support or use-case reuse.
- Compress pick-and-place to one mechanism paragraph plus one limitation/fit paragraph.
- Keep welding concrete but state its practical-fit argument once.
- Move detailed limitations and evaluation-boundary work into Chapter 6; Chapter 7 should only refer back to that boundary briefly.
- Group Chapter 7 future work into engineering-completion clusters and research-direction clusters instead of a long defect list.

# Planned Chapter Functions

## Chapter 6

- `GT`: interpret the thesis result.
- `GT`: close the loop with the introduction goals.
- `GT`: explain why the architecture matters through workflow and use cases.
- `GT`: state the pick-and-place versus welding asymmetry.
- `GT`: surface the applicability boundary, key limitations, and evaluation boundary.

## Chapter 7

- `GT`: close the thesis argument cleanly.
- `GT`: restate the contribution hierarchy once.
- `GT`: keep the proof-of-concept boundary explicit.
- `GT`: split future work into near-term engineering completion and longer-term research directions.

# Review Criteria For Later Stages

- `GT`: no unsupported hard claims.
- `GT`: no Chapter 6 / Chapter 7 role overlap.
- `GT`: Chapter 7 stays shorter and more conclusive than Chapter 6.
- `GT`: repeated architecture language must only survive where it adds a new consequence.
- `GT`: limitation language stays plain and visible.
- `GT`: future work does not collapse into a bug backlog.
- `GT`: thesis voice stays operationally controlled: stable terminology, no reviewer/meta voice, no sales tone, no AI-summary patterns, and one paragraph = one job.

# Grounding

- `GT`: chapter functions, stop rules, and truth-first constraints come from [20_ch06_evidence_packet.md](/c:/dev/diploma-thesis/diploma-thesis-text/summary_5/outputs/20_ch06_evidence_packet.md), [21_ch07_evidence_packet.md](/c:/dev/diploma-thesis/diploma-thesis-text/summary_5/outputs/21_ch07_evidence_packet.md), [23_compression_map.md](/c:/dev/diploma-thesis/diploma-thesis-text/summary_5/outputs/23_compression_map.md), and [24_risk_and_mismatch_register.md](/c:/dev/diploma-thesis/diploma-thesis-text/summary_5/outputs/24_risk_and_mismatch_register.md).
- `GT`: style and language constraints come from [22_style_reference_packet.md](/c:/dev/diploma-thesis/diploma-thesis-text/summary_5/outputs/22_style_reference_packet.md), `summary_5/04_validation_rules.md`, and `summary_5/05_quality_gates.md`.
