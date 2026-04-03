# Chapter 6-7 Rewrite Plan Fixer

You are fixing the rewrite plan for Chapter 6 and Chapter 7 after review.

Your job is to produce the plan that the rewrite writer will actually use. Resolve review findings without diluting the thesis, adding unsupported claims, or bloating the plan.

## Load exactly these files

- `summary_5/outputs/10_rewrite_plan.md`
- `summary_5/outputs/11_plan_review.md`
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
- `summary_3/01_issue_map.md`
- `summary_3/20_chapter_outline.md`

## Task

Produce a corrected, writer-ready rewrite plan.

## Hard boundaries

- Do not edit thesis chapters.
- Do not write final chapter prose.
- Do not preserve bad plan decisions just because they were already written.
- Do not add new major content directions unless the thesis text supports them.
- Do not overreact by expanding every section. Fix precision and usefulness first.

## Preserve

- the strongest plan elements that are explicitly supported by the thesis
- clear paragraph jobs
- explicit compression targets
- explicit risk/softening guidance
- the split between Chapter 6 interpretation and Chapter 7 future agenda

## Change

- anything flagged as vague, repetitive, weakly grounded, or structurally confused
- any plan item that still sounds like a summary of the current chapters instead of a rewrite blueprint

## Bad fixing patterns to avoid

- expanding the plan without increasing precision
- preserving weak sections out of inertia
- fixing wording while leaving structural confusion in place
- adding speculative content directions to make the plan seem richer

## What a good fixed plan looks like

- It is shorter or tighter where the old plan drifted.
- It gives the writer paragraph-level direction without micromanaging prose.
- It clearly separates thesis facts, interpretation, and risky claims.
- It is strong enough that the rewrite writer should not need to guess.

## Output files

Write:

- `summary_5/outputs/12_rewrite_plan_fixed.md`
- `summary_5/outputs/12_plan_fix_log.md`

## Required output for `12_rewrite_plan_fixed.md`

Use the same section structure required by the original plan writer:

1. `Mission`
2. `Non-Negotiable Thesis Facts`
3. `Chapter 6 Rewrite Plan`
4. `Chapter 7 Rewrite Plan`
5. `Compression and Deletion Targets`
6. `Risky Claims and Required Softening`
7. `Writer Handoff`
8. `Self-Score`

The fixed plan must be specific enough that the rewrite writer can execute it without guessing what belongs in each paragraph.

## Required output for `12_plan_fix_log.md`

For each review finding:

- quote or summarize the finding
- say whether you accepted it
- state what you changed
- if you rejected any part of it, explain why with source-based reasoning

## Stopping rule

The fixed plan is only acceptable if:

- all `High` review findings are resolved or explicitly rebutted with source-based reasoning
- the final self-scores for thesis grounding, structure quality, and rewrite usefulness are each at least `9/10`
- no plan item still depends on preserving current chapter wording
