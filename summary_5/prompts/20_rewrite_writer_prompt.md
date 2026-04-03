# Chapter 6-7 Rewrite Writer

You are writing a fresh rewrite of Chapter 6 and Chapter 7 from a fixed plan.

This is a full rewrite and compression pass. Do not treat the current wording as the baseline. Keep the thesis facts, the evidence boundary, and the useful structure, but write the chapters as if you were producing the clearest version now.

## Load exactly these files

- `summary_5/outputs/12_rewrite_plan_fixed.md`
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

## Main task

Write replacement-ready rewritten chapter files for Chapter 6 and Chapter 7.

The new result must be:

- clearer and easier to parse
- less repetitive
- more concrete and explanatory
- better tied back to the thesis question and introduction goals
- strongly grounded in the actual thesis text
- honest about prototype limits
- shorter where the current text is orbiting or restating itself

## Hard boundaries

- Do not edit `ch06_discussion.tex`.
- Do not edit `ch07_conclusion_future_work.tex`.
- Write new candidate files only under `summary_5/outputs/`.
- Do not use placeholder text.
- Do not include reviewer commentary, TODO notes, or bracketed instructions inside the chapter files.
- Do not invent new evidence.
- Do not claim measured productivity, industrial readiness, superiority over existing workflows, or validated accuracy that the thesis does not establish.

## Preserve

- the chapter labels:
  - `\chapter{Discussion} \label{chapter:ch6_discussion}`
  - `\chapter{Conclusion and Future Work} \label{chapter:ch7_conclusion}`
- thesis terminology that is already stable and useful
- the introduction-goal closure
- the modular-runtime and use-case architecture result
- the welding vs pick-and-place asymmetry
- the qualitative, prototype-level evaluation boundary
- the split between near-term and longer-term future work
- the thesis habit of explaining mechanism, then implication, then boundary

## Change aggressively where needed

- section titles
- paragraph structure
- opening and closing paragraphs
- redundant interpretation
- vague synthesis language
- repetitive contrast framing
- sentences that sound like a reviewer or an AI summary instead of thesis prose

## Bad language patterns to avoid

- `this chapter`
- `the thesis should be read as`
- `technically coherent`
- `cautiously positive`
- `complementary strengths`
- `between two extremes` if used as a slogan instead of explanation
- `scene-adaptive execution` unless immediately explained in plain language
- `box-based model` unless immediately explained in plain language
- `spatial authoring is viable` without saying for what, why, and within what limit
- sales language
- orbiting around the same point in multiple paragraphs
- repeated paragraph openings such as `The first`, `Another`, `Finally` when they create a list-like rhythm instead of an argument

## What good prose should look like here

- A reader who only read the introduction can still follow the discussion and conclusion.
- Each paragraph has one clear job.
- Claims are concrete and explained.
- The text says what the system does, why that matters, where it helps, and where it stops being enough.
- Limitations are stated plainly, not defensively.
- Future work separates `finish the prototype` from `interesting next research`.

## Output files

Write:

- `summary_5/outputs/20_ch06_discussion_rewrite.tex`
- `summary_5/outputs/20_ch07_conclusion_future_work_rewrite.tex`
- `summary_5/outputs/20_rewrite_notes.md`

## Chapter-specific guidance

### Chapter 6

- This should be the main interpretive chapter.
- It should be longer than Chapter 7.
- It must close the loop with the introduction goals.
- It must explain what the thesis built, what that result means, where it works best, and where the validation stops.
- It should not become a chapter-by-chapter recap.

### Chapter 7

- Keep it shorter than Chapter 6.
- Open with a scoped conclusion, not a mini-discussion.
- Name the contribution hierarchy clearly.
- State the proof-of-concept boundary plainly.
- Split future work into:
  - near-term engineering completion
  - longer-term research directions

## `20_rewrite_notes.md` requirements

Keep this file short. Include:

- the final section structure you used
- 5 to 10 bullets on major rewrite decisions
- any claim that you intentionally softened

## Self-check before finishing

Before you finalize, verify all of the following:

- no paragraph merely restates the previous paragraph
- the welding discussion is more concrete than the pick-and-place discussion
- the evaluation boundary is explicit
- Chapter 7 does not collapse into a bug list
- the writing sounds like the thesis, not like a reviewer report
