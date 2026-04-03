# Chapter 6-7 Rewrite Fixer

You are revising the rewritten Chapter 6 and Chapter 7 drafts after review.

Your job is to make the chapters ready for truth and style checking. Apply valid review findings with disciplined edits. Keep the gains from the draft; do not churn the text without reason.

## Load exactly these files

- `summary_5/outputs/12_rewrite_plan_fixed.md`
- `summary_5/outputs/20_ch06_discussion_rewrite.tex`
- `summary_5/outputs/20_ch07_conclusion_future_work_rewrite.tex`
- `summary_5/outputs/20_rewrite_notes.md`
- `summary_5/outputs/21_rewrite_review.md`
- `introduction.tex`
- `ch02_analysis.tex`
- `ch03_system_design.tex`
- `ch04_implementation.tex`
- `ch05_user_workflow.tex`
- `ch06_discussion.tex`
- `ch07_conclusion_future_work.tex`
- `summary_2/expert_description.txt`
- `summary_2/style/00_style_reference.md`
- `summary_2/style/01_style_do_dont.md`

## Task

Produce the fixed rewrite candidates.

## Hard boundaries

- Do not edit the original thesis chapter files.
- Write only new files under `summary_5/outputs/`.
- Do not introduce new unsupported claims while fixing style or structure.
- Do not make global rewrites unless the review shows a real systemic problem.
- If you reject a review point, explain why in the fix log.

## Preserve

- the labels and overall chapter identities
- the strongest paragraph-level improvements from the rewrite draft
- the clearer structure if it works
- factual caution
- the engineering-vs-research split in future work

## Change

- overclaim risk
- unclear or repetitive passages
- paragraph openings that feel list-like or formulaic
- any place where the text still sounds like an external reviewer
- any place where the same idea appears twice without added value

## Bad fixing patterns to avoid

- rewriting whole sections when a local fix is enough
- changing accurate language into more impressive but less defensible language
- reducing repetition by deleting necessary explanation
- following every review nit equally instead of fixing the highest-value problems first

## What a good result looks like

- The fixed chapters keep the gains of the rewrite but remove the major defects.
- The text is tighter, clearer, and no less honest.
- The chapters are ready for truth and style checking without another structural pass.

## Output files

Write:

- `summary_5/outputs/22_ch06_discussion_rewrite_fixed.tex`
- `summary_5/outputs/22_ch07_conclusion_future_work_rewrite_fixed.tex`
- `summary_5/outputs/22_fix_log.md`

## `22_fix_log.md` requirements

For each review finding:

- state whether you accepted it
- describe the change made
- if partly rejected, justify the rejection with source-based reasoning

Then add:

- `Residual risks`
- `Self-check`

## Self-check requirements

Confirm explicitly that:

- Chapter 6 is still the main interpretive chapter
- Chapter 7 is still shorter
- the evaluation boundary is explicit
- no unsupported stronger claim was introduced
- repetition was reduced rather than merely moved around
