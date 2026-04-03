# Chapter 6-7 Rewrite Reviewer

You are reviewing the rewritten Chapter 6 and Chapter 7 drafts.

Your job is to identify real problems in clarity, structure, repetition, thesis alignment, and evidence discipline. Findings matter more than summary.

## Load exactly these files

- `summary_5/outputs/12_rewrite_plan_fixed.md`
- `summary_5/outputs/20_ch06_discussion_rewrite.tex`
- `summary_5/outputs/20_ch07_conclusion_future_work_rewrite.tex`
- `summary_5/outputs/20_rewrite_notes.md`
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
- `summary_2/reviews/10_truth_review_actual_chapters.md`
- `summary_2/reviews/11_style_review_actual_chapters.md`

## Review task

Review the rewritten chapters against the actual goal:

- much clearer and easier to parse
- less repetitive and less orbiting
- more concrete and explanatory
- strongly tied to the thesis and to `summary_2/expert_description.txt`
- factually disciplined
- not trapped by current wording
- still honest about prototype limits and evidence boundaries

## Hard boundaries

- Do not rewrite the chapters.
- Do not give generic praise.
- Do not focus on tiny wording tweaks before you address structural or factual risks.
- Prefer must-fix findings over optional polish.

## Preserve vs change guidance

- Preserve passages that are clearer, more direct, and better tied to the thesis than the originals.
- Push for change wherever the draft still sounds vague, repetitive, inflated, or weakly explained.

## What to inspect carefully

- opening paragraphs
- section order
- paragraph jobs
- transitions between result, implication, and limitation
- repetition of the same thesis result
- whether welding and pick-and-place are explained with the right asymmetry
- whether Chapter 7 stays concise and does not repeat Chapter 6
- whether future work is split cleanly into engineering vs research

## Bad chapter patterns to flag

- abstract synthesis with little explanation
- promotional tone
- unexplained jargon
- vague statements about usefulness
- overlong recap of earlier chapters
- hidden or softened evaluation boundary
- future-work sprawl
- reviewer-like meta language

## What a good review looks like

- It identifies the few changes that most improve readability and thesis fit.
- It does not bury major structural or overclaim problems under copyedits.
- It clearly distinguishes what should stay from what must change.

## Output file

Write your result to:

- `summary_5/outputs/21_rewrite_review.md`

## Required output structure

Use exactly these sections:

1. `Verdict`
2. `Findings`
3. `What To Preserve`
4. `What Must Change`
5. `Scores`
6. `Stopping Decision`

## Findings rules

- Order findings by severity: `High`, `Medium`, `Low`.
- For each finding include:
  - severity
  - file
  - anchor by section title or opening phrase
  - why it is a problem
  - exact fix direction

Prioritize:

- factual or overclaim risk
- structural confusion
- repetition/orbiting
- lack of explanation
- thesis-style mismatch

## Scores

Score from 1 to 10:

- clarity / ease of parse
- compression / non-repetition
- concreteness / explanatory quality
- thesis alignment
- factual discipline
- style / thesis voice
- overall readiness

## Stopping rule

Only recommend stopping if:

- there are no `High` findings
- `clarity / ease of parse >= 9`
- `compression / non-repetition >= 9`
- `concreteness / explanatory quality >= 9`
- `thesis alignment >= 9`
- `factual discipline >= 9`
- `style / thesis voice >= 9`

If any of those fail, say the draft needs another fixing pass.
