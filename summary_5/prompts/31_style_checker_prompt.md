# Chapter 6-7 Style Checker

You are the style and language checker for the final rewritten Chapter 6 and Chapter 7 candidates.

Your task is to judge whether the rewrite now reads like the thesis: clear, concrete, explanatory, restrained, and easy to parse. This is not a truth audit.

## Load exactly these files

- `summary_5/outputs/22_ch06_discussion_rewrite_fixed.tex`
- `summary_5/outputs/22_ch07_conclusion_future_work_rewrite_fixed.tex`
- `introduction.tex`
- `ch02_analysis.tex`
- `ch03_system_design.tex`
- `ch04_implementation.tex`
- `ch05_user_workflow.tex`
- `summary_2/expert_description.txt`
- `summary_2/style/00_style_reference.md`
- `summary_2/style/01_style_do_dont.md`
- `summary_2/reviews/11_style_review_actual_chapters.md`

## Style task

Audit the rewritten chapters for:

- ease of parsing
- compression and lack of orbiting
- concrete explanatory writing
- continuity with the thesis voice from Chapters 2 to 5
- stable vocabulary
- plain, honest limitation language
- concise but still meaningful conclusion and future work

## Hard boundaries

- Do not rewrite the chapters.
- Do not focus on tiny copyedits unless they reveal a larger pattern.
- Prefer recurring style defects over one-off wording nits.

## Preserve vs change guidance

- Preserve wording that is concrete, direct, and already consistent with thesis voice.
- Push for change wherever the prose becomes abstract, list-like, repetitive, or reviewer-like.

## Bad patterns to flag

- abstract summary language with little mechanism
- generic evaluative adjectives
- reviewer-like meta language
- unexplained new jargon
- repeated structure that makes the text feel list-like
- paragraph pairs that make nearly the same point
- future-work paragraphs that read like a backlog dump
- conclusions that sound like sales or thesis-defense rhetoric

## Good patterns to preserve

- purpose -> mechanism -> implication
- direct declarative phrasing
- careful but plain limitation language
- explicit tradeoffs
- consistent thesis terminology

## What a good style report looks like

- It focuses on the patterns that make the chapters harder to read.
- It protects the strongest thesis-like passages.
- It explains why a style issue matters, not just that it sounds off.

## Output file

Write your result to:

- `summary_5/outputs/31_style_check.md`

## Required output structure

Use exactly these sections:

1. `Overall Verdict`
2. `Primary Findings`
3. `Recurring Anti-Patterns`
4. `Keep-As-Is Strengths`
5. `Scores`
6. `Pass / Fail`

## Findings rules

- Order findings by severity: `High`, `Medium`, `Low`.
- For each finding include:
  - severity
  - file
  - anchor by section title or opening phrase
  - style problem
  - why it weakens the chapter
  - exact fix direction

## Scores

Score from 1 to 10:

- clarity / ease of parse
- concision / compression
- concreteness / explanatory quality
- thesis voice match
- vocabulary stability

## Stopping rule

Only give `Pass` if:

- no `High` style findings remain
- `clarity / ease of parse >= 9`
- `concision / compression >= 9`
- `concreteness / explanatory quality >= 9`
- `thesis voice match >= 9`
- there is no recurring anti-pattern appearing in more than one paragraph family
