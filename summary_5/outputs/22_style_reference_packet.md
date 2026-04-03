---
artifact_id: 22_style_reference_packet
stage: S1
status: ready
owner_role: planning_subagent
source_files_loaded:
  - summary_5/00_master_workflow.md
  - summary_5/01_stage_map.md
  - summary_5/02_artifact_schema.md
  - summary_5/03_context_packets.md
  - summary_5/04_validation_rules.md
  - summary_5/05_quality_gates.md
  - summary_5/06_risk_register.md
  - summary_5/outputs/10_run_manifest.md
  - summary_5/outputs/11_source_priority_map.md
  - introduction.tex
  - ch02_analysis.tex
  - ch03_system_design.tex
  - ch04_implementation.tex
  - ch05_user_workflow.tex
  - summary_2/expert_description.txt
  - summary_2/style/00_style_reference.md
  - summary_2/style/01_style_do_dont.md
  - summary_2/reviews/11_style_review_actual_chapters.md
depends_on:
  - summary_5/outputs/10_run_manifest.md
  - summary_5/outputs/11_source_priority_map.md
outputs_next:
  - summary_5/outputs/23_compression_map.md
  - summary_5/outputs/24_risk_and_mismatch_register.md
---

# Style Reference Packet

## Grounding

- `GT`: The thesis voice is explanatory, technical, and scope-bound. Chapters should begin by stating purpose, then rationale, then consequence; they should prefer stable vocabulary, mechanism before praise, and explicit boundaries over rhetorical emphasis (`summary_2/style/00_style_reference.md:5`, `summary_2/style/00_style_reference.md:20`, `summary_2/style/00_style_reference.md:29`, `summary_2/style/00_style_reference.md:37`, `summary_2/style/00_style_reference.md:45`, `summary_2/style/00_style_reference.md:46`; `summary_5/04_validation_rules.md:98`, `summary_5/04_validation_rules.md:109`, `summary_5/04_validation_rules.md:119`, `summary_5/04_validation_rules.md:129`, `summary_5/04_validation_rules.md:139`).
- `GT`: The validation rules require Chapter 6 to stay measured and interpretive, and Chapter 7 to stay shorter, conclusive, and future-facing. They also treat reviewer/meta voice, sales tone, and AI-polished summary prose as style failures (`summary_5/04_validation_rules.md:154`, `summary_5/04_validation_rules.md:156`, `summary_5/04_validation_rules.md:178`, `summary_5/04_validation_rules.md:214`, `summary_5/04_validation_rules.md:225`, `summary_5/04_validation_rules.md:240`; `summary_5/05_quality_gates.md:166`, `summary_5/05_quality_gates.md:192`, `summary_5/05_quality_gates.md:204`, `summary_5/05_quality_gates.md:208`).
- `NGT`: The expert handoff wants the closing chapters tied back to the introduction, with Chapter 6 answering what was built, what results were found, and what was brought into the world, while Chapter 7 separates near-term engineering follow-up from longer-term research directions and stays shorter than Chapter 6 (`summary_2/expert_description.txt:5`; `summary_2/reviews/11_style_review_actual_chapters.md:10`, `summary_2/reviews/11_style_review_actual_chapters.md:11`, `summary_2/reviews/11_style_review_actual_chapters.md:17`, `summary_2/reviews/11_style_review_actual_chapters.md:18`, `summary_2/reviews/11_style_review_actual_chapters.md:26`, `summary_2/reviews/11_style_review_actual_chapters.md:31`).
- `INF`: When a sentence sounds smoother but less precise, the safer choice is the one that preserves the prototype boundary, the evaluation boundary, and the distinction between fact, interpretation, limitation, and future work (`summary_5/04_validation_rules.md:41`, `summary_5/04_validation_rules.md:53`, `summary_5/04_validation_rules.md:83`, `summary_5/04_validation_rules.md:96`, `summary_5/04_validation_rules.md:154`; `summary_5/06_risk_register.md:7`, `summary_5/06_risk_register.md:11`, `summary_5/06_risk_register.md:42`, `summary_5/06_risk_register.md:58`, `summary_5/06_risk_register.md:174`).
- `OPEN`: Avoid reusing shorthand that is not defined in the same chapter, especially `scene-adaptive execution`, `box-based model`, and `explicit module boundaries`, unless the chapter itself defines them in plain words first (`summary_2/reviews/11_style_review_actual_chapters.md:8`, `summary_2/reviews/11_style_review_actual_chapters.md:10`, `summary_2/reviews/11_style_review_actual_chapters.md:11`).

## Voice Examples

- `ch02_analysis.tex:501`, `ch02_analysis.tex:505` closes by naming the selected components, restating that the choices are made in prototype context, and handing off to the next chapter. The shape is useful: summary without vagueness, then transition.
- `ch03_system_design.tex:3`, `ch03_system_design.tex:5`, `ch03_system_design.tex:40`, `ch03_system_design.tex:1619`, `ch03_system_design.tex:1670` shows the architecture voice: the chapter states what the system is, how modules communicate, and why the design matters, then closes by mapping the design back to the running system.
- `ch04_implementation.tex:4`, `ch04_implementation.tex:5`, `ch04_implementation.tex:23`, `ch04_implementation.tex:114`, `ch04_implementation.tex:115` separates design from implementation clearly. The chapter names the concrete prototype, explains the chapter boundary, and then explains what each subsection will cover.
- `ch05_user_workflow.tex:4`, `ch05_user_workflow.tex:119`, `ch05_user_workflow.tex:276`, `ch05_user_workflow.tex:301`, `ch05_user_workflow.tex:350` is the best procedural model. It states the operator workflow, then uses explicit contrasts to distinguish weld from pick-and-place and persistence of setup from persistence of programs.

## Patterns To Imitate

- Start sections with the section purpose or the chapter job, not with abstract praise.
- Use direct declarative sentences such as `The system is implemented ...` or `This chapter describes ...` when introducing a chapter-level claim.
- Prefer `However`, `At the same time`, `Therefore`, and `In practice` to signal tradeoffs without sounding promotional.
- State mechanism first, then consequence, then boundary. The thesis does this repeatedly in Chapters 2-5.
- Keep repeated technical nouns stable: `use case`, `module`, `interface`, `workflow`, `execution`, `scene detection`, `spatial authoring`.
- End a section by tying it back to the next chapter, the next stage, or the remaining boundary.

## Patterns To Avoid

- Avoid reviewer voice: `this chapter should`, `the discussion must`, `the text argues`, `the thesis should be read as`.
- Avoid sales tone: `awesome`, `best`, `perfect`, `game-changing`, `commercial-grade`, `ideal`, `strongly demonstrates`.
- Avoid generated summary stacks such as `technically coherent and practically interesting` or `complementary strengths within a reusable adaptive framework`.
- Avoid abstract praise before mechanism.
- Avoid hard-coded umbrella phrasing that is not already defined in the thesis.
- Avoid turning Chapter 6 into a recap list or Chapter 7 into a second discussion.

## Stable Terminology

- Keep `use case` as the main task-level unit.
- Keep `control plane` for the UI/orchestrator role.
- Keep `module`, `interface`, `wrapper`, `workflow`, `execution`, `scene detection`, `spatial authoring`, `pick-and-place`, and `seam welding` stable.
- Keep `prototype`, `qualitative evaluation`, `limitations`, and `future work` distinct.
- Keep `robot-mounted stereo camera`, `6DoF input`, and `shared runtime` stable where they already appear in the thesis.
- If a new term is needed, define it once in plain words before reuse.

## Anti-Hype / Anti-Sales

- Do not claim industrial readiness, commercial readiness, or superiority over teach pendant or offline programming unless the source text explicitly supports that claim.
- Do not imply the thesis has already validated accuracy, precision, robustness, or cross-platform behavior beyond what the source chapters say.
- Do not stack positive adjectives to compensate for weak evidence.
- Do not frame limitations as marketing opportunities.
- Do not write as if the prototype is complete when the thesis itself treats it as a prototype.

## Chapter-Closure Risks

- `GT`: Chapter 6 must keep the introduction thread visible and must explain what the built system means for the two representative task families, not just what the architecture contains (`summary_5/04_validation_rules.md:225`, `summary_5/04_validation_rules.md:240`; `summary_5/06_risk_register.md:9`, `summary_5/06_risk_register.md:58`, `summary_5/06_risk_register.md:142`).
- `NGT`: The discussion should read as `what we built -> what it showed -> where it works -> where it stops`, while the conclusion should shrink that argument and move into next steps (`summary_2/expert_description.txt:5`; `summary_2/reviews/11_style_review_actual_chapters.md:23`, `summary_2/reviews/11_style_review_actual_chapters.md:24`, `summary_2/reviews/11_style_review_actual_chapters.md:25`).
- `INF`: Pick-and-place should read as the flexibility and scene-adaptation result, while welding should read as the clearest practical fit; do not flatten that asymmetry (`summary_5/04_validation_rules.md:240`; `summary_5/06_risk_register.md:9`, `summary_5/06_risk_register.md:158`).
- `OPEN`: If a sentence only sounds good because it hides the concrete boundary, rewrite it before keeping it.
- `OPEN`: If future work starts reading like a bug backlog, split it again into near-term engineering follow-up and longer-term research directions.
- `OPEN`: If a phrase is understandable only to the author, define it or replace it with plainer thesis vocabulary.

## Writer Cue

- Prefer the sentence that is more exact, even if it is less smooth.
- Preserve the thesis vocabulary before trying to improve rhythm.
- If a paragraph has more than one job, split it.
- If a closing paragraph sounds polished but vague, rewrite it toward mechanism, consequence, and boundary.
