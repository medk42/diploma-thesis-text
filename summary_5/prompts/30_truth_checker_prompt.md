# Chapter 6-7 Truth Checker

You are the truth and content checker for the final rewritten Chapter 6 and Chapter 7 candidates.

Your task is to verify whether the rewritten chapters stay within what the thesis text actually supports. This is a source-grounding audit, not a style pass.

## Load exactly these files

- `summary_5/outputs/22_ch06_discussion_rewrite_fixed.tex`
- `summary_5/outputs/22_ch07_conclusion_future_work_rewrite_fixed.tex`
- `introduction.tex`
- `ch02_analysis.tex`
- `ch03_system_design.tex`
- `ch04_implementation.tex`
- `ch05_user_workflow.tex`
- `ch06_discussion.tex`
- `ch07_conclusion_future_work.tex`
- `summary_2/expert_description.txt`
- `summary_2/reviews/10_truth_review_actual_chapters.md`

## Audit task

Check every material claim in the rewritten chapters against the thesis sources.

Focus especially on:

- what the thesis actually built
- what the introduction goals allow the chapters to claim
- what pick-and-place demonstrates
- what welding demonstrates
- what the architecture result really is
- what the evaluation did and did not establish
- what future work is directly thesis-derived vs authorial but acceptable

## Hard boundaries

- Do not rewrite the chapters.
- Do not evaluate style except where wording changes the factual strength of a claim.
- Do not let plausible interpretation pass as a stated result unless it is clearly framed as interpretation.

## Preserve vs change guidance

- Preserve claims that are clearly supported and well scoped.
- Push for change or softening wherever the rewrite overstates evidence, generality, usefulness, or evaluation strength.

## Mandatory evidence boundary checks

The final rewrite must not blur any of these:

- demonstration on a real Kassow robot
- most development and testing took place in simulation
- physical validation was limited
- no formal user study
- no baseline comparison against teach pendant or offline programming workflows
- no quantitative characterization of tracking accuracy, repeatability, or robustness
- no support for claims of broad industrial readiness or general superiority

## Bad truth patterns to flag

- stronger claim than source support
- implied measurement where there was no measurement
- implied generality where only selected task-oriented workflows were shown
- future work phrased as if already established
- comparison claims that outrun the thesis evidence

## What a good audit looks like

- It catches the few claims that actually threaten credibility.
- It protects supported claims instead of flattening everything.
- It distinguishes safe interpretation from unsupported conclusion.

## Output file

Write your result to:

- `summary_5/outputs/30_truth_check.md`

## Required output structure

Use exactly these sections:

1. `Overall Verdict`
2. `Must-Fix Findings`
3. `Softening Needed`
4. `Safe Claims To Preserve`
5. `Evidence Boundary Check`
6. `Scores`
7. `Pass / Fail`

## Findings rules

- Order findings by severity: `High`, `Medium`, `Low`.
- Each finding must include:
  - severity
  - file
  - anchor by section title or opening phrase
  - claim at issue
  - why it is too strong, unsupported, or ambiguous
  - exact softening or fix direction
  - source file(s) that define the boundary

## Scores

Score from 1 to 10:

- source grounding
- discipline around interpretation vs result
- evaluation-boundary honesty
- future-work framing discipline

## Stopping rule

Only give `Pass` if all of the following are true:

- no `High` unsupported or misleading claims
- `source grounding >= 9`
- `evaluation-boundary honesty >= 9`
- all broader or future-facing claims are clearly marked as scoped interpretation or future work
