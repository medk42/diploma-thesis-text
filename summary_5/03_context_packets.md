# Context Packets For Chapter 6-7 Rewrite

## Purpose

This file defines the minimum context each worker type must load for a full rewrite or compression pass of:

- `ch06_discussion.tex`
- `ch07_conclusion_future_work.tex`

The design goal is deliberate:

- the main orchestrator stays light;
- sub-agents load their own context packets;
- `.tex` files remain the factual base;
- `summary_2/expert_description.txt` guides intended meaning and emphasis, but does not override thesis facts.

If a worker needs context outside its packet, it should self-load that context and report that it did so. The orchestrator should not preload full chapters "just in case".

## Source Authority

Use this authority order in every packet.

1. Thesis `.tex` files are factual ground truth.
   - They define what was built, what was evaluated, what was limited, and what may be claimed.
   - If a summary file conflicts with a `.tex` file, the `.tex` file wins.
2. `summary_2/expert_description.txt` is near-ground-truth for intended meaning.
   - It is authoritative for chapter emphasis, interpretation priority, and what the author wants the reader to understand.
   - It is not sufficient for hard factual claims by itself.
   - If it extends beyond the thesis text, keep the idea only as softened interpretation or future-facing framing.
3. `summary_2/context/03_author_intent_handoff.md`, `summary_2/context/01_safe_vs_risky_claims.md`, and the style files are workflow guides.
   - They help choose wording and claim strength.
   - They do not create new facts.
4. Older review and planner files are support material.
   - They help an agent avoid repeating failed approaches.
   - They are optional unless a packet says otherwise.

## Shared Loading Rules

- Required means the worker must load the file before starting.
- Optional means the worker should load it only when the task calls for it.
- A worker should prefer `introduction.tex` plus the relevant source chapters over broad full-thesis loading.
- A worker must not cite review files as factual evidence when the claim can be grounded in `.tex`.
- If `summary_5/02_artifact_schema.md` is in use, classify nontrivial points as:
  - `GT`: directly grounded in `.tex`
  - `NGT`: near-ground-truth framing from `summary_2/expert_description.txt`
  - `INF`: careful inference compatible with `.tex`
  - `OPEN`: unresolved and not safe for final prose

## Shared Anti-Drift Prompt Footer

Attach this guidance to writer, reviewer, and checker prompts:

- Keep the prose concrete and thesis-like.
- Prefer mechanism -> consequence -> boundary.
- Avoid polished summary language that compresses multiple ideas into one abstract sentence.
- Avoid sales tone, invented vocabulary, and reviewer/meta phrasing.
- Reuse the thesis vocabulary already present in Chapters 2-5.
- If a sentence sounds smoother but less precise, prefer the more precise version.

## Packet A: Planner

### When to use

- creating a rewrite plan
- creating a compression plan
- deciding worker splits
- deciding what later agents must load

### Required files

- `introduction.tex`
- `ch06_discussion.tex`
- `ch07_conclusion_future_work.tex`
- `summary_2/expert_description.txt`
- `summary_2/context/03_author_intent_handoff.md`
- `summary_2/context/01_safe_vs_risky_claims.md`
- `summary_2/style/00_style_reference.md`
- `summary_2/style/01_style_do_dont.md`
- `summary_2/planner/03_chapter_structure_v2.md`
- `summary_5/04_validation_rules.md`
- `summary_5/05_quality_gates.md`

### Optional files

- `ch02_analysis.tex`
- `ch03_system_design.tex`
- `ch04_implementation.tex`
- `ch05_user_workflow.tex`
- `summary_2/reviews/10_truth_review_actual_chapters.md`
- `summary_2/reviews/11_style_review_actual_chapters.md`
- `summary_2/reviews/12_intro_alignment_review.md`
- `summary_4/00_process_plan.md`

### Output contract

The planner should produce:

- section goals for Chapter 6 and Chapter 7
- a list of required source chapters for each later worker
- explicit claims that must stay softened
- a split between required and optional validation passes
- claim-tag guidance using `GT`, `NGT`, `INF`, and `OPEN`

### Planner load discipline

The planner should not load all of Chapters 2-5 by default. It should escalate to those chapters only if it cannot specify later writer/checker packets without them.

## Packet B: Writer

### When to use

- full rewrite of Chapter 6
- full rewrite of Chapter 7
- compression rewrite of either chapter
- local rewrite of one section with continuity to the rest

### Required files

- `introduction.tex`
- target chapter file being rewritten
- sibling closing chapter file
- `summary_2/expert_description.txt`
- `summary_2/context/03_author_intent_handoff.md`
- `summary_2/context/01_safe_vs_risky_claims.md`
- `summary_2/style/00_style_reference.md`
- `summary_2/style/01_style_do_dont.md`
- `summary_5/04_validation_rules.md`

### Required factual source pack

For any substantial rewrite, the writer must also load:

- `ch02_analysis.tex`
- `ch03_system_design.tex`
- `ch04_implementation.tex`
- `ch05_user_workflow.tex`

These are required because the writer is the agent most likely to introduce unsupported synthesis if it relies only on summaries.

### Optional files

- `ch01_background.tex`
  - load only when comparing to related work or discussing longer-term interaction directions already grounded there
- `summary_2/reviews/10_truth_review_actual_chapters.md`
- `summary_2/reviews/11_style_review_actual_chapters.md`
- `summary_2/reviews/12_intro_alignment_review.md`
- `summary_2/reviews/13_ch06_ab_choice.md`
- prior draft or compare files under `summary_3/` or `summary_4/`

### Output contract

The writer should output:

- revised prose or a section rewrite
- an inline or sidecar claim map for any nontrivial new paragraph using `GT`, `NGT`, `INF`, and `OPEN`
- a short list of statements that are interpretation rather than direct thesis fact

### Writer load discipline

- The writer should self-load source chapters before drafting, not ask the orchestrator to paste context.
- The writer may use review files to avoid repeated mistakes, but not to replace source grounding.
- If the task is compression only, the writer still loads the factual source pack; compression often causes accidental omission or overstatement.

## Packet C: Reviewer

### When to use

- broad editorial review of a completed draft
- chapter-level critique before narrower checks
- identifying where truth, content, or style checkers should focus

### Required files

- reviewed draft file(s)
- `introduction.tex`
- `summary_2/expert_description.txt`
- `summary_2/context/03_author_intent_handoff.md`
- `summary_2/style/00_style_reference.md`
- `summary_2/style/01_style_do_dont.md`
- `summary_5/04_validation_rules.md`
- `summary_5/05_quality_gates.md`

### Optional files

- `summary_2/context/01_safe_vs_risky_claims.md`
- `summary_2/reviews/10_truth_review_actual_chapters.md`
- `summary_2/reviews/11_style_review_actual_chapters.md`
- `summary_2/reviews/12_intro_alignment_review.md`
- relevant `.tex` source chapters if the reviewer suspects a truth issue

### Output contract

The reviewer should not act like a truth checker. It should produce:

- structural problems
- repeated or overlapping sections
- likely overclaim zones to send to truth check
- likely style drift zones to send to style check
- likely omission or emphasis problems to send to content check
- any suspicious `OPEN` items that should not advance

### Reviewer load discipline

The reviewer starts light. It loads raw source chapters only when the draft contains a concrete suspicious claim.

## Packet D: Checker

Use this packet only for narrow validation. Do not merge these roles into one generic "review" pass.

## D1. Truth Checker

### Required files

- reviewed draft file(s)
- `introduction.tex`
- `ch02_analysis.tex`
- `ch03_system_design.tex`
- `ch04_implementation.tex`
- `ch05_user_workflow.tex`
- `summary_2/expert_description.txt`
- `summary_2/context/01_safe_vs_risky_claims.md`
- `summary_5/04_validation_rules.md`

### Optional files

- `ch01_background.tex`
- original `ch06_discussion.tex` and `ch07_conclusion_future_work.tex`

### Focus

- factual support
- overclaim detection
- conflicts between draft and source chapters
- proper softening of author-intent material

### Must not do

- broad style rewriting
- chapter restructuring unless the structure causes a factual error

## D2. Style Checker

### Required files

- reviewed draft file(s)
- `summary_2/style/00_style_reference.md`
- `summary_2/style/01_style_do_dont.md`
- `summary_2/expert_description.txt`
- `summary_5/04_validation_rules.md`

### Optional files

- `introduction.tex`
- `ch02_analysis.tex`
- `ch03_system_design.tex`
- `ch04_implementation.tex`
- `ch05_user_workflow.tex`
- `summary_2/reviews/11_style_review_actual_chapters.md`

### Focus

- thesis voice
- anti-AI-polish rules
- paragraph readability
- stable vocabulary
- sentence mechanics

### Must not do

- approve or reject facts it did not verify
- request stronger claims just to sound more decisive

## D3. Content Checker

### Required files

- reviewed draft file(s)
- `introduction.tex`
- `summary_2/expert_description.txt`
- `summary_2/context/03_author_intent_handoff.md`
- `summary_2/context/01_safe_vs_risky_claims.md`
- `summary_2/planner/03_chapter_structure_v2.md`
- `summary_5/04_validation_rules.md`

### Optional files

- `ch02_analysis.tex`
- `ch03_system_design.tex`
- `ch04_implementation.tex`
- `ch05_user_workflow.tex`
- original `ch06_discussion.tex` and `ch07_conclusion_future_work.tex`
- `summary_2/reviews/12_intro_alignment_review.md`

### Focus

- whether the chapter answers the introduction
- whether weld vs pick-and-place emphasis is correct
- whether architecture is meaningful but not dominant
- whether limitations and future work are properly separated
- whether compression removed required ideas

### Must not do

- line-edit for style unless wording changes meaning
- wave through unsupported claims because they "fit the story"

## Packet E: Comparator

### When to use

- choosing between draft A and draft B
- deciding whether a new compression pass is safer than the current draft
- deciding whether a rewrite is actually an improvement over the original chapter

### Required files

- both candidate draft files
- original `ch06_discussion.tex`
- original `ch07_conclusion_future_work.tex`
- `introduction.tex`
- `summary_2/expert_description.txt`
- `summary_2/context/01_safe_vs_risky_claims.md`
- `summary_5/04_validation_rules.md`
- `summary_5/05_quality_gates.md`

### Optional files

- relevant checker outputs
- `summary_2/style/00_style_reference.md`
- `summary_2/context/03_author_intent_handoff.md`
- source `.tex` chapters only if the candidates disagree on a factual point

### Output contract

The comparator should answer:

- which draft is safer on truth
- which draft is closer to thesis voice
- which draft is clearer under compression
- whether one draft drops mandatory content
- whether neither draft should advance

### Comparator load discipline

The comparator should not reread the full thesis by default. It should only escalate to source chapters when the candidates differ on a factual or interpretive point that affects the decision.

## Minimal Orchestrator Load

The main orchestrator should normally load only:

- `summary_5/00_master_workflow.md`
- `summary_5/01_stage_map.md`
- `summary_5/02_artifact_schema.md`
- `summary_5/03_context_packets.md`
- `summary_5/04_validation_rules.md`
- `summary_5/05_quality_gates.md`
- `summary_5/06_risk_register.md`
- the current task brief
- current worker outputs under review

The orchestrator should delegate all heavier source loading to the relevant worker packet.
