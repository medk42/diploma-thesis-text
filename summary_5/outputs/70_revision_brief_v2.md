---
artifact_id: 70_revision_brief_v2
stage: S7
status: ready
owner_role: orchestrator
source_files_loaded:
  - summary_5/outputs/64_fix_plan_r1.md
  - summary_5/outputs/50_ch06_rewrite_v1.tex
  - summary_5/outputs/51_ch07_rewrite_v1.tex
  - summary_5/outputs/60_truth_review_r1.md
  - summary_5/outputs/61_content_review_r1.md
  - summary_5/outputs/62_style_review_r1.md
  - summary_5/outputs/63_language_review_r1.md
depends_on:
  - summary_5/outputs/64_fix_plan_r1.md
outputs_next:
  - summary_5/outputs/71_ch06_rewrite_v2.tex
  - summary_5/outputs/72_ch07_rewrite_v2.tex
  - summary_5/outputs/73_revision_notes_v2.md
---

# Referenced Review Round

- source round: `r1`

# Revision Scope

- local rewrite only
- no re-planning
- no stronger claims than v1

# Chapter 6 Must-Fix Items

1. split the dense opening into cleaner paragraph jobs
2. fold the runtime/interfaces point back into the reusable workflow consequence
3. replace `discover a use case` with `select or configure a use case`
4. remove repeated prepared-workflow / welding-fit restatement
5. simplify the scene-understanding boundary with plainer wording
6. compress UI/portability into secondary status
7. keep the final evaluation-boundary paragraph single-purpose

# Chapter 7 Must-Fix Items

1. keep one bounded opening answer and one compressed contribution paragraph
2. keep the contribution contrast plain, not polished
3. make the near-term section three clean paragraph jobs with fewer stacked clauses
4. replace system-note wording with thesis vocabulary
5. keep teach-pendant / offline-programming comparison boundary explicit if referenced
6. split the final longer-term paragraph into clearer units if needed

# Must-Not-Regress Items

- chapter labels unchanged
- Chapter 6 remains the main interpretive chapter
- Chapter 7 remains shorter
- prototype boundary remains explicit
- no unsupported comparison, timing, readiness, or productivity claims
- pick-and-place remains flexibility evidence
- welding remains the clearest practical fit

# Assigned Writers

- Writer A: `71_ch06_rewrite_v2.tex`
- Writer B: `72_ch07_rewrite_v2.tex`

# Grounding

- `GT`: revision targets come from [64_fix_plan_r1.md](/c:/dev/diploma-thesis/diploma-thesis-text/summary_5/outputs/64_fix_plan_r1.md) and the four `r1` review artefacts.

