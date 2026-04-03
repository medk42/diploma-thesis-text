# Summary 4 Process Plan

## Scope

This pass is limited to the language, tone, thesis voice, and integration quality of:

- `ch06_discussion_v2.tex`
- `ch07_conclusion_future_work_v2.tex`

The goal is not a broad content rewrite. Substance, argument, structure, and honesty should be preserved unless a review round identifies a real mismatch or overclaim.

## Inputs loaded

Full-thesis context was loaded from:

- `thesis.tex`
- `introduction.tex`
- `ch01_background.tex`
- `ch02_analysis.tex`
- `ch03_system_design.tex`
- `ch04_implementation.tex`
- `ch05_user_workflow.tex`
- `ch06_discussion.tex`
- `ch07_conclusion_future_work.tex`
- `bibliography.tex`
- `appendix_attachments.tex`

Additional context loaded:

- `summary_3/41_review_v2.md`
- `summary_3/42_compare_v1_v2_agent.md`
- `summary_3/43_compare_v1_v2_self.md`
- `summary_2/expert_description.txt`

The previous `v2` chapter files were not present in the workspace, so this round recreates them from the current chapter text and then iterates from there.

## Working rules

- Do not overwrite `ch06_discussion.tex` or `ch07_conclusion_future_work.tex`.
- Keep all new process artefacts under `summary_4/`.
- Revise only `ch06_discussion_v2.tex` and `ch07_conclusion_future_work_v2.tex`.
- Prefer direct thesis prose over reviewer-style or meta-chapter framing.
- Preserve prototype honesty and the current evidence boundary.
- Do not remove meaningful content; reword, tighten, split, reorder locally, or add clarifying detail when needed.

## Language targets

Watch especially for prose that sounds like:

- an external reviewer evaluating the thesis
- meta-commentary about what the chapter is doing
- self-conscious framing of chapter roles
- defensive or legalistic qualification
- abstract wording such as "this reading", "the thesis should be read as", "scoped but defensible", "this connection matters"

Preferred replacement direction:

- direct claims grounded in the thesis
- calm qualification
- explicit but non-defensive limits
- smoother integration with the wording of the introduction and earlier chapters

## Iteration loop

For each round `N`:

1. Run a reviewer agent with the provided reviewer prompt and the current `v2` files.
2. Save the reviewer output as `summary_4/review_N.md`.
3. If needed, write `summary_4/planned_fixes_N.md`.
4. Optionally write `summary_4/change_notes_N.md` for local rationale.
5. Revise `ch06_discussion_v2.tex` and/or `ch07_conclusion_future_work_v2.tex`.
6. Repeat until the stopping rule is met.

## Naming conventions

- `summary_4/review_N.md`: full reviewer output for round `N`
- `summary_4/planned_fixes_N.md`: concrete fix list for round `N`
- `summary_4/change_notes_N.md`: optional local implementation notes
- `summary_4/ab_compare_agent.md`: final A/B comparison agent result
- `summary_4/ab_compare_self.md`: final self comparison
- `summary_4/final_summary.md`: final process summary and replacement recommendation

## Stopping rule

Stop only if the reviewer gives:

- content readiness >= 9/10
- language / thesis-voice readiness >= 9/10

If either score is below 9, continue.

Additional guardrails:

- A reviewer calling the chapters "ready" is not sufficient if several concrete tone issues remain.
- A score of 8 can be acceptable, but is not the target.
- If the reviewer still lists multiple recurring wording problems, continue.
- Remaining issues at stop should be truly minor.

## Finalization

After the final review round:

1. Run an A/B comparison agent on original vs `v2` chapters in full-thesis context.
2. Perform the same A/B comparison locally.
3. Write `summary_4/final_summary.md` with:
   - review rounds
   - fixes performed
   - final reviewer verdict
   - A/B agent verdict
   - self verdict
   - recommendation on whether `v2` should replace the originals
