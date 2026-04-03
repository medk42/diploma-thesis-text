# Summary 5 Master Workflow

## Purpose

This workflow defines a full rewrite/compression pass for:

- `ch06_discussion.tex`
- `ch07_conclusion_future_work.tex`

The main orchestrator is a control-plane agent only. It should not load the full thesis. It should coordinate sub-agents that load the relevant `.tex` files themselves, then make decisions from the resulting artefacts.

## Source Priority Rules

Use the following precedence order throughout the workflow:

1. Thesis `.tex` files are ground truth for facts, implemented behavior, scope, terminology, and stated limitations.
2. `summary_2/expert_description.txt` is near-ground-truth for intended meaning, discussion emphasis, chapter perspective, and preferred framing.
3. Earlier summary folders are process aids only. They may suggest topics or workflow structure, but they do not override the `.tex` sources.

If `summary_2/expert_description.txt` conflicts with the `.tex` files, the written chapter text must follow the `.tex` files and the conflict must be logged.

## Non-Negotiable Operating Rules

- Do not write chapter prose before the planning gate passes.
- Do not let the main orchestrator draft chapter text directly.
- All chapter writing and substantive rewriting must be done by sub-agents.
- All reviewers must cite source files they checked.
- Every nontrivial claim in the rewritten chapters must be classifiable as one of:
  - `GT`: directly grounded in thesis `.tex`
  - `NGT`: supported mainly by `summary_2/expert_description.txt`, used only for framing or emphasis
  - `INF`: careful inference from thesis `.tex`
  - `OPEN`: unresolved, must be removed or rewritten before completion
- Style, content, and language checks are mandatory in every post-writing review round.
- The process must optimize for clarity, compression, and thesis voice, not for maximal length.

## Stage Overview

| Stage | Name | Main owner | Hard gate |
|---|---|---|---|
| S0 | Bootstrap and scope lock | Orchestrator | No writing allowed |
| S1 | Planning evidence packets | Sub-agents | No writing allowed |
| S2 | Rewrite plan synthesis | Orchestrator | No writing allowed |
| S3 | Plan review and iteration | Review sub-agents + orchestrator | Must pass before writing |
| S4 | Writer packet preparation | Orchestrator | Only after approved plan |
| S5 | Writing wave | Writing sub-agents | Drafts required |
| S6 | Integrated review wave | Reviewer sub-agents | Must produce fix plan |
| S7 | Revision waves | Writing sub-agents + orchestrator | Loop until stop rule |
| S8 | Final validation and handoff | Reviewer sub-agents + orchestrator | Workflow ends here |

## End-to-End Algorithm

1. Create a run manifest and lock the target scope to the two final thesis chapters only.
2. Record the source-priority rules and claim-tag rules for the run.
3. Launch planning sub-agents to gather:
   - chapter-goal evidence,
   - discussion/conclusion evidence,
   - style reference material,
   - compression targets,
   - mismatch and risk findings.
4. Merge the planning outputs into a single rewrite plan package.
5. Launch plan reviewers in parallel for:
   - grounding and source sufficiency,
   - chapter-role/content quality,
   - style/language suitability.
6. Aggregate review findings into a concrete plan fix list.
7. If the plan has unresolved fail conditions, revise the plan and repeat Stage S3.
8. When the plan passes, generate writer briefs and chapter-specific task packets.
9. Launch writing sub-agents. At minimum use one writer for Chapter 6 and one writer for Chapter 7.
10. Collect the first draft outputs without editing the thesis chapter files.
11. Launch the integrated reviewer set on the produced drafts.
12. Merge reviewer findings into a single ranked fix plan.
13. If reviewers report blockers, launch revision sub-agents and produce the next draft version.
14. Repeat the review/fix/rewrite loop until all stopping rules are satisfied.
15. Run a final validation wave on the candidate final drafts.
16. Emit a final readiness report and a handoff package for whichever agent will apply or compare the chapter replacements later.

## Stage Details

### S0. Bootstrap and Scope Lock

Goal:
- Establish the run contract without loading the full thesis.

Required actions:
- Confirm the targets are `ch06_discussion.tex` and `ch07_conclusion_future_work.tex`.
- Confirm the design-only workspace is `summary_5/`.
- Record that thesis chapter files are not to be edited in this workflow.
- Record the hard source precedence and claim tags.

Required artefacts:
- `summary_5/10_run_manifest.md`
- `summary_5/11_source_priority_map.md`

Decision point:
- Proceed only if the scope, source order, and target chapter names are explicit.

### S1. Planning Evidence Packets

Goal:
- Push source loading into specialized sub-agents and gather planning inputs without bloating orchestrator context.

Required worker outputs:
- Chapter 6 evidence packet
- Chapter 7 evidence packet
- style reference packet
- compression/removal map
- risk and mismatch register

Required artefacts:
- `summary_5/20_ch06_evidence_packet.md`
- `summary_5/21_ch07_evidence_packet.md`
- `summary_5/22_style_reference_packet.md`
- `summary_5/23_compression_map.md`
- `summary_5/24_risk_and_mismatch_register.md`

Decision point:
- If any packet lacks source citations, chapter-role guidance, or explicit keep/cut priorities, rerun that packet before synthesis.

### S2. Rewrite Plan Synthesis

Goal:
- Convert planning evidence into an operational rewrite plan before any prose drafting begins.

Required artefacts:
- `summary_5/30_rewrite_plan_draft.md`
- `summary_5/31_ch06_blueprint.md`
- `summary_5/32_ch07_blueprint.md`
- `summary_5/33_cross_chapter_rules.md`

Decision point:
- The plan must specify section order, contribution hierarchy, compression targets, facts to preserve, facts to soften, and facts to remove.

### S3. Plan Review and Iteration

Goal:
- Review the plan itself before writing starts.

Mandatory reviewer lanes:
- grounding review
- content/structure review
- style/language review

Required artefacts for each round `R`:
- `summary_5/34_plan_review_grounding_rR.md`
- `summary_5/35_plan_review_content_rR.md`
- `summary_5/36_plan_review_style_language_rR.md`
- `summary_5/37_plan_fixlist_rR.md`

Plan gate:
- No `40_*` or later writing artefacts may be created until the plan gate passes.

Pass conditions:
- reviewers agree that the plan is source-grounded enough to draft from,
- the plan clearly distinguishes Chapter 6 from Chapter 7,
- the plan contains explicit compression/removal guidance,
- the plan integrates style, content, and language criteria,
- no reviewer reports a major ambiguity that would predictably create a bad draft.

Fail conditions:
- missing evidence for a planned claim,
- vague section descriptions,
- unclear handling of expert-description guidance,
- unresolved disagreement about what should be cut, merged, or emphasized.

### S4. Writer Packet Preparation

Goal:
- Create exact task packets for writing agents after the plan is approved.

Required artefacts:
- `summary_5/40_writer_brief_global.md`
- `summary_5/41_writer_brief_ch06.md`
- `summary_5/42_writer_brief_ch07.md`

Required packet contents:
- files each writer must load,
- files each writer must not treat as truth,
- section-level writing goals,
- compression targets,
- forbidden overclaims,
- claim-tag expectations,
- output format and destination path.

Decision point:
- Proceed only if the writer briefs are chapter-specific and concrete enough that a new sub-agent can execute them without extra chat context.

### S5. Writing Wave

Goal:
- Produce rewrite drafts through sub-agents only.

Minimum writer split:
- Writer A: Chapter 6 rewrite
- Writer B: Chapter 7 rewrite

Optional writer split if Chapter 6 is still too large:
- Writer A1: Chapter 6 opening and contribution/result section
- Writer A2: Chapter 6 limitations/validity section
- Writer B: Chapter 7 conclusion and future work
- Integration writer: chapter seam check only

Required artefacts:
- `summary_5/50_ch06_rewrite_v1.tex`
- `summary_5/51_ch07_rewrite_v1.tex`
- `summary_5/52_writer_notes_v1.md`

Decision point:
- If a writer cannot support a section with the provided evidence and source files, it must emit an explicit gap note instead of inventing filler prose.

### S6. Integrated Review Wave

Goal:
- Evaluate each produced draft across truth, content, style, and language.

Mandatory review lanes for each round `R`:
- truth/grounding review
- content/argument review
- style/voice review
- language/clarity review

Required artefacts:
- `summary_5/60_truth_review_rR.md`
- `summary_5/61_content_review_rR.md`
- `summary_5/62_style_review_rR.md`
- `summary_5/63_language_review_rR.md`
- `summary_5/64_fix_plan_rR.md`

Review expectations:
- truth reviewer checks claims against `.tex` and flags `OPEN` items,
- content reviewer checks thesis arc, discussion/conclusion role separation, repetition, and compression quality,
- style reviewer checks thesis voice, anti-hype, anti-sales tone, and terminology discipline,
- language reviewer checks grammar, sentence clarity, redundancy, and awkward AI-summary phrasing.

Decision point:
- No revision starts until the fix plan merges and prioritizes all reviewer findings.

### S7. Revision Waves

Goal:
- Iteratively improve the drafts through sub-agent rewrites, not by manual orchestrator drafting.

Required artefacts for version `V > 1`:
- `summary_5/70_revision_brief_vV.md`
- `summary_5/71_ch06_rewrite_vV.tex`
- `summary_5/72_ch07_rewrite_vV.tex`
- `summary_5/73_revision_notes_vV.md`

Loop rule:
- Each revision wave must answer the previous `64_fix_plan_rR.md` item by item.

Decision point:
- If the same blocker survives two rounds unchanged, launch a targeted diagnostic reviewer before another broad rewrite wave.

### S8. Final Validation and Handoff

Goal:
- Confirm readiness and leave a restartable package for any later agent.

Required artefacts:
- `summary_5/80_final_validation_truth.md`
- `summary_5/81_final_validation_content_style_language.md`
- `summary_5/82_release_readiness_report.md`
- `summary_5/83_handoff_index.md`

Decision point:
- Stop only when the final validation reviewers find no unresolved truth blockers and only minor editorial issues remain.

## Mandatory Decision Points

1. After S1: Are the evidence packets detailed enough to support planning without reopening full sources?
2. After S2: Does the draft plan specify what to keep, compress, cut, and reframe?
3. After S3: Has the plan review gate passed?
4. After S5: Are the draft chapters complete enough to review as chapters, not fragments?
5. After each S6 round: Are the reported problems local revisions or plan-level failures?
6. Before S8 completion: Are any remaining issues factual, structural, stylistic, or only editorial?

## Stopping Rules

### Planning stop rule

The workflow may leave planning and enter writing only if all are true:

- both chapter blueprints exist,
- the compression map exists,
- all planned major claims have identified thesis support,
- all plan reviewers mark the plan as passable with no major blockers,
- the orchestrator has written an explicit approved-plan statement into the fix list or plan update.

### Review-loop stop rule

The workflow may stop revision looping only if all are true:

- no truth reviewer leaves an `OPEN` blocker,
- no content reviewer reports missing core discussion/conclusion functions,
- style reviewer reports thesis voice as consistent enough,
- language reviewer reports only minor edits,
- no reviewer flags persistent repetition or orbiting structure,
- Chapter 7 remains clearly shorter and more conclusive than Chapter 6.

### Forced continuation rule

Continue another revision round if any of the following appear:

- unsupported claim,
- unresolved contradiction between `.tex` and `expert_description`,
- summary-like filler or sales tone,
- repeated points across adjacent paragraphs,
- Chapter 6 and Chapter 7 drifting into the same rhetorical role,
- future work collapsing into a bug backlog instead of a deliberate split.

## Required Artefacts by Stage

| Stage | Required artefacts |
|---|---|
| S0 | `10_run_manifest.md`, `11_source_priority_map.md` |
| S1 | `20_ch06_evidence_packet.md`, `21_ch07_evidence_packet.md`, `22_style_reference_packet.md`, `23_compression_map.md`, `24_risk_and_mismatch_register.md` |
| S2 | `30_rewrite_plan_draft.md`, `31_ch06_blueprint.md`, `32_ch07_blueprint.md`, `33_cross_chapter_rules.md` |
| S3 | `34_plan_review_grounding_rR.md`, `35_plan_review_content_rR.md`, `36_plan_review_style_language_rR.md`, `37_plan_fixlist_rR.md` |
| S4 | `40_writer_brief_global.md`, `41_writer_brief_ch06.md`, `42_writer_brief_ch07.md` |
| S5 | `50_ch06_rewrite_v1.tex`, `51_ch07_rewrite_v1.tex`, `52_writer_notes_v1.md` |
| S6 | `60_truth_review_rR.md`, `61_content_review_rR.md`, `62_style_review_rR.md`, `63_language_review_rR.md`, `64_fix_plan_rR.md` |
| S7 | `70_revision_brief_vV.md`, `71_ch06_rewrite_vV.tex`, `72_ch07_rewrite_vV.tex`, `73_revision_notes_vV.md` |
| S8 | `80_final_validation_truth.md`, `81_final_validation_content_style_language.md`, `82_release_readiness_report.md`, `83_handoff_index.md` |

## Exact Recommended Run Order

Use this exact sequence unless a hard failure forces rollback:

1. Write `10_run_manifest.md`.
2. Write `11_source_priority_map.md`.
3. Launch planning worker `P1` for Chapter 6 evidence -> `20_ch06_evidence_packet.md`.
4. Launch planning worker `P2` for Chapter 7 evidence -> `21_ch07_evidence_packet.md`.
5. Launch planning worker `P3` for style reference -> `22_style_reference_packet.md`.
6. Launch planning worker `P4` for compression map -> `23_compression_map.md`.
7. Launch planning worker `P5` for risks and mismatches -> `24_risk_and_mismatch_register.md`.
8. Wait for all `20-24` artefacts.
9. Synthesize `30_rewrite_plan_draft.md`.
10. Synthesize `31_ch06_blueprint.md`.
11. Synthesize `32_ch07_blueprint.md`.
12. Synthesize `33_cross_chapter_rules.md`.
13. Launch plan grounding reviewer -> `34_plan_review_grounding_r1.md`.
14. Launch plan content reviewer -> `35_plan_review_content_r1.md`.
15. Launch plan style/language reviewer -> `36_plan_review_style_language_r1.md`.
16. Merge findings into `37_plan_fixlist_r1.md`.
17. If plan fails, update `30-33`, then repeat steps 13-16 with `r2`, `r3`, and so on.
18. After plan approval, write `40_writer_brief_global.md`.
19. Write `41_writer_brief_ch06.md`.
20. Write `42_writer_brief_ch07.md`.
21. Launch writer `W1` -> `50_ch06_rewrite_v1.tex`.
22. Launch writer `W2` -> `51_ch07_rewrite_v1.tex`.
23. Merge writer notes into `52_writer_notes_v1.md`.
24. Launch truth reviewer -> `60_truth_review_r1.md`.
25. Launch content reviewer -> `61_content_review_r1.md`.
26. Launch style reviewer -> `62_style_review_r1.md`.
27. Launch language reviewer -> `63_language_review_r1.md`.
28. Merge findings into `64_fix_plan_r1.md`.
29. Launch revision writers from `64_fix_plan_r1.md` -> `71_ch06_rewrite_v2.tex`, `72_ch07_rewrite_v2.tex`.
30. Record revision rationale -> `70_revision_brief_v2.md`, `73_revision_notes_v2.md`.
31. Repeat the review cycle with incremented round/version numbers until the review-loop stop rule passes.
32. Launch final truth validation -> `80_final_validation_truth.md`.
33. Launch final integrated validation -> `81_final_validation_content_style_language.md`.
34. Write `82_release_readiness_report.md`.
35. Write `83_handoff_index.md`.

## Escalation Logic

- If planning keeps failing on evidence gaps, add or rerun only the needed planning packet instead of broadening orchestrator context.
- If writing keeps failing on the same chapter section, split that chapter into narrower writer packets.
- If language issues remain after content stabilizes, run a language-only revision wave rather than reopening structural planning.
- If truth issues appear late, truth fixes take priority over style or compression improvements.

## What the Orchestrator Must Never Do

- load the full thesis into its own working context unless the workflow has already failed and no narrower recovery path exists,
- silently resolve source conflicts without logging them,
- write final chapter prose directly,
- skip the plan review gate,
- skip the integrated review wave after writing,
- accept drafts with unresolved `OPEN` claims.
