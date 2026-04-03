---
artifact_id: 40_writer_brief_global
stage: S4
status: ready
owner_role: orchestrator
source_files_loaded:
  - summary_5/outputs/30_rewrite_plan_draft.md
  - summary_5/outputs/31_ch06_blueprint.md
  - summary_5/outputs/32_ch07_blueprint.md
  - summary_5/outputs/33_cross_chapter_rules.md
  - summary_5/outputs/37_plan_fixlist_r2.md
  - summary_5/03_context_packets.md
  - summary_5/04_validation_rules.md
depends_on:
  - summary_5/outputs/37_plan_fixlist_r2.md
outputs_next:
  - summary_5/outputs/41_writer_brief_ch06.md
  - summary_5/outputs/42_writer_brief_ch07.md
  - summary_5/outputs/50_ch06_rewrite_v1.tex
  - summary_5/outputs/51_ch07_rewrite_v1.tex
  - summary_5/outputs/52_writer_notes_v1.md
---

# Shared Rules For All Writers

- You are writing fresh replacement drafts from the approved plan package, not lightly polishing the current wording.
- Thesis `.tex` files are factual ground truth.
- `summary_2/expert_description.txt` is near-ground-truth for emphasis and intended meaning, not factual proof.
- Earlier summary and review files may help you avoid repeated mistakes but must not be treated as truth.
- Every nontrivial claim must be classifiable as `GT`, `NGT`, `INF`, or `OPEN`.
- `OPEN` may appear in writer notes. It may not appear in final draft prose.

# Required Files Every Writer Must Load

- `introduction.tex`
- `ch02_analysis.tex`
- `ch03_system_design.tex`
- `ch04_implementation.tex`
- `ch05_user_workflow.tex`
- target chapter file being rewritten
- sibling closing chapter file
- `summary_2/expert_description.txt`
- `summary_2/context/03_author_intent_handoff.md`
- `summary_2/context/01_safe_vs_risky_claims.md`
- `summary_2/style/00_style_reference.md`
- `summary_2/style/01_style_do_dont.md`
- `summary_5/04_validation_rules.md`
- `summary_5/outputs/30_rewrite_plan_draft.md`
- `summary_5/outputs/31_ch06_blueprint.md`
- `summary_5/outputs/32_ch07_blueprint.md`
- `summary_5/outputs/33_cross_chapter_rules.md`

# Files Writers Must Not Treat As Truth

- `summary_2/reviews/*`
- `summary_3/*`
- `summary_4/*`
- any prior generated draft under `summary_5/outputs/`

# Claim-Strength Policy

- `GT`: use for direct thesis-supported facts.
- `NGT`: use only for framing or emphasis derived from the expert description.
- `INF`: use only for careful interpretation that stays visibly interpretive.
- `OPEN`: unresolved; remove from prose or log in writer notes.

# Forbidden Overclaims

- measured productivity improvement
- exact timing or speed claims
- industrial or commercial readiness
- superiority over teach pendant, offline programming, or general robot-programming workflows
- broad deployment claims
- future work written as if already validated

# Required Style Controls

- stable terminology
- no reviewer/meta voice
- no sales tone
- no AI-summary phrasing
- one paragraph = one main job
- mechanism -> consequence -> boundary where needed

# Output Requirements

- Chapter drafts must be `.tex`-ready files with the original chapter labels preserved.
- Do not edit `ch06_discussion.tex` or `ch07_conclusion_future_work.tex`.
- Write only to:
  - `summary_5/outputs/50_ch06_rewrite_v1.tex`
  - `summary_5/outputs/51_ch07_rewrite_v1.tex`
  - `summary_5/outputs/52_writer_notes_v1.md`

# Writer Notes Requirements

- list all files loaded
- list any extra files self-loaded beyond the required packet
- list major rewrite decisions
- list any claims intentionally softened
- list any unresolved weak spots reviewers should inspect closely

# Grounding

- `GT`: shared writer rules come from [30_rewrite_plan_draft.md](/c:/dev/diploma-thesis/diploma-thesis-text/summary_5/outputs/30_rewrite_plan_draft.md), [33_cross_chapter_rules.md](/c:/dev/diploma-thesis/diploma-thesis-text/summary_5/outputs/33_cross_chapter_rules.md), `summary_5/03_context_packets.md`, and `summary_5/04_validation_rules.md`.

