---
artifact_id: 64_fix_plan_r1
stage: S6
status: complete
owner_role: orchestrator
source_files_loaded:
  - summary_5/outputs/60_truth_review_r1.md
  - summary_5/outputs/61_content_review_r1.md
  - summary_5/outputs/62_style_review_r1.md
  - summary_5/outputs/63_language_review_r1.md
  - summary_5/outputs/50_ch06_rewrite_v1.tex
  - summary_5/outputs/51_ch07_rewrite_v1.tex
depends_on:
  - summary_5/outputs/60_truth_review_r1.md
  - summary_5/outputs/61_content_review_r1.md
  - summary_5/outputs/62_style_review_r1.md
  - summary_5/outputs/63_language_review_r1.md
outputs_next:
  - summary_5/outputs/70_revision_brief_v2.md
  - summary_5/outputs/71_ch06_rewrite_v2.tex
  - summary_5/outputs/72_ch07_rewrite_v2.tex
  - summary_5/outputs/73_revision_notes_v2.md
---

# Overall Routing Decision

- recommendation: `narrow revision`
- rationale: truth review passed with only minor wording corrections; the remaining issues are local to paragraph emphasis, cadence, terminology consistency, and future-work grouping.

# Blocker-First Action List

## 1. Keep Chapter 6 from re-centering architecture

- severity: `medium`
- assign_to: `Chapter 6`
- source reviews: `61_content_review_r1.md`, `62_style_review_r1.md`, `63_language_review_r1.md`
- problem: one paragraph in `Main Result and Thesis Closure` still presents the runtime/interfaces point too independently, and the discussion opening is too dense.
- required fix:
  - split the opening so the thesis answer, consequence, and boundary do not arrive as one summary chain
  - rewrite the runtime/interfaces paragraph so the consequence is the reusable workflow across use cases, not the architecture by itself
  - prefer `select or configure a use case` over `discover a use case`

## 2. Remove orbiting in Chapter 6 task-fit argument

- severity: `medium`
- assign_to: `Chapter 6`
- source reviews: `62_style_review_r1.md`, `63_language_review_r1.md`
- problem: the welding/practical-fit and prepared-workflow points are restated across adjacent paragraphs.
- required fix:
  - keep one plain welding-fit argument
  - keep one plain applicability/prepared-workflow boundary
  - remove the second restatement and any repeated `prepared workflow` cadence

## 3. Simplify Chapter 6 limitations language

- severity: `medium`
- assign_to: `Chapter 6`
- source reviews: `61_content_review_r1.md`, `62_style_review_r1.md`, `63_language_review_r1.md`
- problem: the scene-understanding paragraph opens with dense jargon, and the section drifts toward backlog-style equal weighting.
- required fix:
  - split the scene-model boundary into shorter sentences with plainer phrasing
  - keep scene understanding, sensing/calibration, and execution limits primary
  - compress UI/portability to a short secondary note
  - keep the final evaluation-boundary paragraph single-purpose

## 4. Tighten Chapter 7 conclusion cadence

- severity: `medium`
- assign_to: `Chapter 7`
- source reviews: `61_content_review_r1.md`, `62_style_review_r1.md`, `63_language_review_r1.md`, `60_truth_review_r1.md`
- problem: the conclusion opens with two stacked summary claims and some slightly polished contrast wording.
- required fix:
  - keep one bounded thesis-answer opening
  - move directly to the compressed contribution hierarchy
  - keep the comparison boundary explicit by naming teach-pendant or offline-programming workflows if used
  - prefer `clearest practical fit` or `strongest practical fit`

## 5. Rework Chapter 7 near-term future work into cleaner paragraph jobs

- severity: `medium`
- assign_to: `Chapter 7`
- source reviews: `61_content_review_r1.md`, `62_style_review_r1.md`, `63_language_review_r1.md`
- problem: the near-term section still reads partly like a dense agenda/backlog, with too many jobs per paragraph.
- required fix:
  - give each paragraph one primary job
  - keep sensing/tracking/calibration together
  - keep execution-layer completion together
  - keep validation/platform completion together, but compress low-level cleanup items
  - replace system-note language such as `scene pipeline`, `execution layer`, or `control-plane cleanup` with plainer thesis vocabulary

## 6. Tighten Chapter 7 final longer-term paragraph

- severity: `low`
- assign_to: `Chapter 7`
- source reviews: `63_language_review_r1.md`
- problem: the final longer-term paragraph compresses too many ideas into one long sentence.
- required fix:
  - separate task-family extension from broader operating-condition claims
  - keep the close bounded and easy to scan

# Must-Not-Regress Rules

- no stronger factual claims than v1
- keep Chapter 6 as the longer interpretive chapter
- keep Chapter 7 shorter and clearly split into conclusion plus future work
- keep the prototype/evaluation boundary explicit
- keep the pick-and-place versus welding asymmetry

# Gate Implication

- truth gate already passed for v1
- content/style/language gates require another local rewrite wave
- no re-planning required at this time

# Grounding

- `GT`: this fix plan merges [60_truth_review_r1.md](/c:/dev/diploma-thesis/diploma-thesis-text/summary_5/outputs/60_truth_review_r1.md), [61_content_review_r1.md](/c:/dev/diploma-thesis/diploma-thesis-text/summary_5/outputs/61_content_review_r1.md), [62_style_review_r1.md](/c:/dev/diploma-thesis/diploma-thesis-text/summary_5/outputs/62_style_review_r1.md), and [63_language_review_r1.md](/c:/dev/diploma-thesis/diploma-thesis-text/summary_5/outputs/63_language_review_r1.md).

