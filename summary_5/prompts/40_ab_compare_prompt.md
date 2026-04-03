# Chapter 6-7 Final A/B Comparison

You are the final A/B comparison agent.

Compare the original Chapter 6 and Chapter 7 against the rewritten final candidates and decide which version better serves the thesis. The goal is not novelty. The goal is the better thesis ending.

## Load exactly these files

- `ch06_discussion.tex`
- `ch07_conclusion_future_work.tex`
- `summary_5/outputs/22_ch06_discussion_rewrite_fixed.tex`
- `summary_5/outputs/22_ch07_conclusion_future_work_rewrite_fixed.tex`
- `summary_5/outputs/30_truth_check.md`
- `summary_5/outputs/31_style_check.md`
- `introduction.tex`
- `ch02_analysis.tex`
- `ch03_system_design.tex`
- `ch04_implementation.tex`
- `ch05_user_workflow.tex`
- `summary_2/expert_description.txt`
- `summary_2/style/01_style_do_dont.md`

## Comparison task

Compare:

- original Chapter 6 vs rewritten Chapter 6
- original Chapter 7 vs rewritten Chapter 7
- the original pair vs the rewritten pair as a thesis ending

Judge on:

- clarity and ease of parsing
- compression and reduction of orbiting
- explanatory concreteness
- tie-back to the thesis question and introduction goals
- accuracy and evidence discipline
- honesty about prototype limits
- future-work quality
- fit with the thesis voice

## Hard boundaries

- Do not assume the rewrite is better because it is newer.
- Do not assume the original is safer because it is older.
- Use the truth and style checks, but make your own judgment.
- If neither version is clearly good enough, say so.

## Preserve vs change guidance

- Preserve whichever version states the thesis result more clearly and more honestly.
- If one version contains the stronger structure but the other contains safer wording, say so explicitly and choose `Hybrid` if needed.

## Bad comparison habits to avoid

- choosing the rewrite for polish alone
- choosing the original for familiarity alone
- ignoring truth/style check findings
- describing differences without making a decision

## What a good comparison looks like

- It makes a real choice.
- It explains why the winning version better serves the thesis ending.
- It does not reward novelty if novelty damaged grounding or clarity.

## Output file

Write your result to:

- `summary_5/outputs/40_ab_compare.md`

## Required output structure

Use exactly these sections:

1. `Overall Decision`
2. `Chapter 6 Decision`
3. `Chapter 7 Decision`
4. `Why The Winner Is Better`
5. `Residual Risks`
6. `Adoption Recommendation`

## Decision rules

For each chapter, choose one:

- `A = keep original`
- `B = use rewritten version`
- `Hybrid = mostly B but keep specific material from A`

If you choose `Hybrid`, identify exactly what should be kept from `A`.

## Stopping rule

Choose `B` only if it is:

- clearly better on clarity and explanatory value
- not worse on factual discipline
- at least as honest about the prototype boundary

If those conditions are not met, do not choose `B`.
