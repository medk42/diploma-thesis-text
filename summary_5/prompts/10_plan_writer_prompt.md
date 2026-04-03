# Chapter 6-7 Rewrite Plan Writer

You are the planning and structure-extraction agent for a full rewrite and compression pass of Chapter 6 and Chapter 7.

Your job is to produce a fresh, thesis-grounded rewrite plan. Do not draft final prose. Do not lightly tweak the current chapter wording. Build a plan that another agent can use to rewrite both chapters from scratch while staying faithful to the thesis.

## Load exactly these files

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
- `summary_3/01_issue_map.md`
- `summary_3/20_chapter_outline.md`

## Goal

Create a rewrite plan that makes the new result:

- much clearer and easier to parse
- less repetitive and less orbiting
- more concrete and explanatory
- strongly tied to the thesis and to `summary_2/expert_description.txt`
- factually grounded in the thesis text
- not forced to preserve the current wording or voice
- still honest about prototype limits and evidence boundaries

## Hard boundaries

- Do not edit any thesis chapter.
- Do not write replacement chapter prose.
- Do not invent claims that cannot be supported from the thesis text.
- Do not preserve the current Chapter 6 or Chapter 7 structure just because it already exists.
- Do not treat the current chapter wording as sacred.
- Do not turn the plan into a vague list of themes. It must be actionable at paragraph level.

## What must be preserved

- The thesis question from the introduction.
- The three thesis goals and how the work closes them at prototype scope.
- The system-level result: a modular runtime with explicit interfaces and reusable use-case boundary.
- The asymmetry between pick-and-place and welding.
- The fact that welding is the strongest practical fit in the current prototype.
- The fact that pick-and-place matters mainly as architectural evidence for combining authored intent with refreshed scene state.
- The qualitative and limited evaluation boundary.
- The split in Chapter 7 between near-term engineering completion and longer-term research directions.

## What should change

- Section order if a better order makes the chapter easier to parse.
- Paragraph order and internal emphasis.
- Redundant restatement of the same thesis result.
- Abstract summary language that does not explain mechanism or implication.
- Reviewer-like or AI-summary-like phrasing.
- Unexplained terminology that a reader jumping from the introduction would not parse.

## Bad language and planning patterns to avoid

- sales pitch framing
- generic praise such as `strong`, `excellent`, `powerful`, `game-changing`
- meta phrasing such as `this chapter argues`, `the thesis should be read as`, `the reader should understand`
- abstract labels without explanation such as `complementary strengths`, `scene-adaptive execution`, `box-based model`, `trajectory-centric spatial authoring` unless the plan also explains them in plain thesis language
- orbiting: repeating the same point with only slightly different wording
- future-work inflation: turning bug backlog items into the main research agenda
- plan items that say only `mention X` without saying why it matters and where it belongs

## Output file

Write your result to:

- `summary_5/outputs/10_rewrite_plan.md`

## Required output structure

Use exactly these sections in the output:

1. `Mission`
2. `Non-Negotiable Thesis Facts`
3. `Chapter 6 Rewrite Plan`
4. `Chapter 7 Rewrite Plan`
5. `Compression and Deletion Targets`
6. `Risky Claims and Required Softening`
7. `Writer Handoff`
8. `Self-Score`

## Output content requirements

### 1. Mission

- State the rewrite objective in 4 to 8 bullets.
- State the intended difference from the current chapters.

### 2. Non-Negotiable Thesis Facts

- List the thesis facts that the writer must not distort.
- For each fact, include the main supporting source file(s).

### 3. Chapter 6 Rewrite Plan

For Chapter 6, provide:

- proposed section order
- section title for each section
- section purpose in 1 to 2 sentences
- paragraph-by-paragraph plan
- for each paragraph:
  - purpose
  - main claim
  - why it matters
  - source anchors
  - notes on what to preserve vs change from the current chapter

The plan must explicitly cover:

- the main thesis-level result
- closure of introduction goals
- what the runtime and use-case architecture contribute
- welding vs pick-and-place asymmetry
- applicability boundary
- limitations grouped by type
- evaluation boundary

### 4. Chapter 7 Rewrite Plan

For Chapter 7, provide the same level of detail.

The plan must explicitly cover:

- scoped thesis conclusion
- contribution hierarchy
- proof-of-concept boundary
- near-term engineering completion
- longer-term research directions
- a clear difference between `finish the prototype` and `interesting next research`

### 5. Compression and Deletion Targets

- List the current ideas that should be merged, shortened, or cut.
- For each item, explain why it is repetitive, vague, or low-value.
- Include explicit `keep / merge / cut / relocate` labels.

### 6. Risky Claims and Required Softening

- List claims that would become unsafe if stated too strongly.
- For each item, give:
  - unsafe version
  - safe direction
  - source boundary

### 7. Writer Handoff

- Give practical writing instructions to the rewrite agent.
- Include:
  - what the opening paragraphs should do
  - what the closing paragraphs should do
  - vocabulary to prefer
  - vocabulary to avoid
  - relative chapter length guidance

### 8. Self-Score

Score yourself from 1 to 10 on:

- thesis grounding
- structural usefulness
- compression quality
- clarity
- readiness for a writer to execute without guessing

If any score is below 9, state why.

## What a good result looks like

- Another agent can rewrite both chapters without rereading the user request.
- The plan is specific enough that each paragraph has a job.
- The plan distinguishes thesis facts from interpretation.
- The plan identifies what to cut instead of only adding more material.
- The plan stays anchored in the thesis, not in generic discussion-chapter habits.
