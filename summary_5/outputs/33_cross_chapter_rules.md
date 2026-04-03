---
artifact_id: 33_cross_chapter_rules
stage: S2
status: draft
owner_role: orchestrator
source_files_loaded:
  - summary_5/outputs/20_ch06_evidence_packet.md
  - summary_5/outputs/21_ch07_evidence_packet.md
  - summary_5/outputs/22_style_reference_packet.md
  - summary_5/outputs/23_compression_map.md
  - summary_5/outputs/24_risk_and_mismatch_register.md
  - summary_5/04_validation_rules.md
  - summary_5/05_quality_gates.md
depends_on:
  - summary_5/outputs/30_rewrite_plan_draft.md
  - summary_5/outputs/31_ch06_blueprint.md
  - summary_5/outputs/32_ch07_blueprint.md
outputs_next:
  - summary_5/outputs/34_plan_review_grounding_r1.md
  - summary_5/outputs/35_plan_review_content_r1.md
  - summary_5/outputs/36_plan_review_style_language_r1.md
---

# Non-Overlap Rules

- `GT`: Chapter 6 carries interpretation, task fit, limitations, and evaluation boundary.
- `GT`: Chapter 7 carries concise closure, contribution hierarchy, and future work.
- `GT`: If a paragraph requires detailed mechanism or limitation treatment, it belongs in Chapter 6.
- `GT`: If a paragraph exists mainly to close the thesis or define next steps, it belongs in Chapter 7.

# Shared Contribution Hierarchy

1. `GT`: bounded prototype answer to the thesis question
2. `GT`: reusable use-case boundary and operator workflow
3. `GT`: shared modular runtime with explicit interfaces
4. `GT`: representative demonstrations on two task families
5. `INF`: asymmetric interpretive value of those two task families

- `GT`: when Chapter 6 names the contribution, start with the workflow/use-case consequence and only then mention architecture; do not let architecture lead the conclusion.

# Terminology Consistency Rules

- `GT`: keep `use case`, `workflow`, `module`, `interface`, `scene detection`, `execution`, and `spatial authoring` stable.
- `GT`: keep `prototype`, `qualitative evaluation`, `limitations`, and `future work` as distinct categories.
- `OPEN`: do not introduce polished substitute vocabulary unless it is defined once in plain words and materially improves clarity.

# Transition Rules

- Chapter 6 should end by making the evaluation boundary explicit so Chapter 7 can begin with a concise conclusion instead of a fresh caution block.
- Chapter 7 should assume Chapter 6 already carried the interpretive load and should therefore summarize rather than explain.
- The introduction thread should be visible in both chapters, but the fuller answer belongs in Chapter 6.

# Repetition Controls

- Chapter 6 states the main result fully once; Chapter 7 may reuse only the compressed form that refers back to the bounded prototype answer and shared runtime without re-listing the architecture block.
- The modular-runtime claim must not appear as free-standing praise in both chapters.
- The pick-and-place / welding contrast may be explained once in Chapter 6 and only briefly referenced in Chapter 7.
- The prototype boundary may be fully stated once in Chapter 6 and briefly reaffirmed once in Chapter 7.

# Claim-Strength Rules

- `GT`: thesis facts come from `.tex` sources.
- `NGT`: expert-description guidance may shape emphasis, not factual claim strength.
- `INF`: interpretive usefulness claims must stay visibly interpretive.
- `OPEN`: unsupported claims must be removed or rewritten before drafting completes.

# Forbidden Drift

- `OPEN`: architecture-first ending that detaches from use cases and workflow
- `OPEN`: Chapter 7 turning into a second discussion chapter
- `OPEN`: future work collapsing into a bug backlog
- `OPEN`: compression that hides the evaluation boundary or prototype limits
- `OPEN`: sales tone, reviewer voice, or AI-summary phrasing

# Grounding

- `GT`: these rules synthesize the required separation, overlap control, and truth/style boundaries from [20_ch06_evidence_packet.md](/c:/dev/diploma-thesis/diploma-thesis-text/summary_5/outputs/20_ch06_evidence_packet.md), [21_ch07_evidence_packet.md](/c:/dev/diploma-thesis/diploma-thesis-text/summary_5/outputs/21_ch07_evidence_packet.md), [22_style_reference_packet.md](/c:/dev/diploma-thesis/diploma-thesis-text/summary_5/outputs/22_style_reference_packet.md), [23_compression_map.md](/c:/dev/diploma-thesis/diploma-thesis-text/summary_5/outputs/23_compression_map.md), [24_risk_and_mismatch_register.md](/c:/dev/diploma-thesis/diploma-thesis-text/summary_5/outputs/24_risk_and_mismatch_register.md), `summary_5/04_validation_rules.md`, and `summary_5/05_quality_gates.md`.
