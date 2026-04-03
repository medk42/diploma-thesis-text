---
artifact_id: 37_plan_fixlist_r1
stage: S3
status: complete
owner_role: orchestrator
source_files_loaded:
  - summary_5/outputs/34_plan_review_grounding_r1.md
  - summary_5/outputs/35_plan_review_content_r1.md
  - summary_5/outputs/36_plan_review_style_language_r1.md
  - summary_5/outputs/30_rewrite_plan_draft.md
  - summary_5/outputs/31_ch06_blueprint.md
  - summary_5/outputs/32_ch07_blueprint.md
  - summary_5/outputs/33_cross_chapter_rules.md
depends_on:
  - summary_5/outputs/34_plan_review_grounding_r1.md
  - summary_5/outputs/35_plan_review_content_r1.md
  - summary_5/outputs/36_plan_review_style_language_r1.md
outputs_next:
  - summary_5/outputs/30_rewrite_plan_draft.md
  - summary_5/outputs/31_ch06_blueprint.md
  - summary_5/outputs/32_ch07_blueprint.md
  - summary_5/outputs/33_cross_chapter_rules.md
---

# Gate Outcome

- outcome: `fail`
- reason: the plan is grounded and structurally sound, but the style/language lane returned `revise`, so the S3 pass condition of a fully passable drafting plan is not yet met.

# Merged Action List

## 1. Tighten the canonical contribution phrasing

- severity: `major`
- target output file: `summary_5/outputs/30_rewrite_plan_draft.md`
- related files: `summary_5/outputs/31_ch06_blueprint.md`, `summary_5/outputs/32_ch07_blueprint.md`, `summary_5/outputs/33_cross_chapter_rules.md`
- owner: `plan_fixer`
- disposition: `accept`
- source reviews: `35_plan_review_content_r1.md`, `36_plan_review_style_language_r1.md`
- problem: the same contribution block can still be restated in slightly different forms across Chapter 6 and Chapter 7, which invites recap prose.
- fix direction: define one full contribution formulation for Chapter 6, define one compressed reuse form for Chapter 7, and make the reuse rule explicit in cross-chapter controls.

## 2. Replace generic future-work buckets with concrete bounded clusters

- severity: `major`
- target output file: `summary_5/outputs/32_ch07_blueprint.md`
- related files: `summary_5/outputs/30_rewrite_plan_draft.md`
- owner: `plan_fixer`
- disposition: `accept`
- source reviews: `34_plan_review_grounding_r1.md`, `35_plan_review_content_r1.md`, `36_plan_review_style_language_r1.md`
- problem: umbrella labels such as `engineering and validation work` and `broader workflow directions` are broad enough to produce either roadmap filler or a bug list.
- fix direction: bind each future-work paragraph to source-backed clusters already named in the packets: sensing/tracking/calibration, execution/tool abstraction/collision checking, physical validation and quantitative characterization, richer inputs such as hand tracking or VR/AR, multimodal input such as speech plus gesture, teach-pendant/controller integration, and broader task families.

## 3. Rebalance the contribution hierarchy away from architecture-first phrasing

- severity: `medium`
- target output file: `summary_5/outputs/30_rewrite_plan_draft.md`
- owner: `plan_fixer`
- disposition: `accept`
- source reviews: `35_plan_review_content_r1.md`
- problem: the hierarchy is correct, but listing the modular runtime before the reusable use-case boundary may nudge the writer toward an architecture-first close.
- fix direction: either reorder those items or add a direct note that architecture must always be explained through workflow and use-case consequences.

## 4. Make the Chapter 6 execution-limit paragraph more concrete

- severity: `medium`
- target output file: `summary_5/outputs/31_ch06_blueprint.md`
- owner: `plan_fixer`
- disposition: `accept`
- source reviews: `34_plan_review_grounding_r1.md`, `35_plan_review_content_r1.md`
- problem: the execution/tooling limitations paragraph is slightly abstract and under-specifies source-backed gaps.
- fix direction: explicitly name incomplete tool abstraction, missing collision checking, lack of simulated execution, and keep UI/portability limits visible in the late limitations sequence without letting them dominate.

## 5. Make the review criteria operational for style control

- severity: `medium`
- target output file: `summary_5/outputs/30_rewrite_plan_draft.md`
- owner: `plan_fixer`
- disposition: `accept`
- source reviews: `36_plan_review_style_language_r1.md`
- problem: `technical, measured, and easy to parse` is too generic as a writer control by itself.
- fix direction: replace it with explicit checks already supported by the style packet: stable terminology, no reviewer/meta voice, no sales tone, no AI-summary patterns, and one clear paragraph job.

## 6. Shorten the Chapter 6 closing boundary cadence

- severity: `minor`
- target output file: `summary_5/outputs/31_ch06_blueprint.md`
- owner: `plan_fixer`
- disposition: `accept`
- source reviews: `36_plan_review_style_language_r1.md`
- problem: the final Chapter 6 boundary paragraph could invite one more summary-like restatement instead of a crisp evidence boundary.
- fix direction: keep the last paragraph single-purpose: qualitative boundary, limited physical validation, no superiority/readiness claims.

## 7. Narrow longer-term Chapter 7 Paragraph 8 to real research directions

- severity: `minor`
- target output file: `summary_5/outputs/32_ch07_blueprint.md`
- owner: `plan_fixer`
- disposition: `accept`
- source reviews: `35_plan_review_content_r1.md`
- problem: Paragraph 8 could blur longer-term research with near-term implementation completion.
- fix direction: keep implementation completion in Paragraphs 4-6 and reserve Paragraph 8 for workflow/interaction research only.

# Keep-As-Is Elements

- retain the sharp Chapter 6 versus Chapter 7 role split
- retain the pick-and-place versus welding asymmetry
- retain the compression strategy that removes repetition without hiding the prototype and evaluation boundaries

# Approved-Plan Statement

- none for `r1`; the plan is not yet approved for writing

# Grounding

- `GT`: this fix list merges [34_plan_review_grounding_r1.md](/c:/dev/diploma-thesis/diploma-thesis-text/summary_5/outputs/34_plan_review_grounding_r1.md), [35_plan_review_content_r1.md](/c:/dev/diploma-thesis/diploma-thesis-text/summary_5/outputs/35_plan_review_content_r1.md), and [36_plan_review_style_language_r1.md](/c:/dev/diploma-thesis/diploma-thesis-text/summary_5/outputs/36_plan_review_style_language_r1.md).

