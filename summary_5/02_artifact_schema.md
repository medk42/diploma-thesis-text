# Summary 5 Artifact Schema

## Naming System

Use a flat numeric prefix so another orchestrator can sort the run chronologically without guessing:

- `00-09`: control documents that define the workflow
- `10-19`: run setup and source-priority files
- `20-29`: planning evidence packets
- `30-39`: rewrite plan and plan-review artefacts
- `40-49`: writer briefs
- `50-59`: first writing-wave outputs
- `60-69`: review outputs and fix plans
- `70-79`: revision-wave artefacts
- `80-89`: final validation and handoff

All coordination, review, and planning files use `.md`.
All chapter-text outputs use `.tex`.

## General File Rules

- Every generated run artefact from `10_*` onward must start with a metadata block.
- Metadata must include:
  - `artifact_id`
  - `stage`
  - `status`
  - `owner_role`
  - `source_files_loaded`
  - `depends_on`
  - `outputs_next`
- Every generated file that makes claims about thesis content must include a `Grounding` section.
- Every review file must separate blockers from minor edits.
- Every fix plan must map findings to a target output file.

## Claim Labels

Use these labels consistently inside planning, review, and notes files:

- `GT`: directly grounded in thesis `.tex`
- `NGT`: near-ground-truth framing from `summary_2/expert_description.txt`
- `INF`: careful inference from thesis `.tex`
- `OPEN`: unresolved or unsupported

`OPEN` items may exist in planning notes but must not survive into final chapter drafts.

## Expected Files

### Control documents

`summary_5/00_master_workflow.md`

- Contains the full algorithm, gate logic, run order, and stopping rules.

`summary_5/01_stage_map.md`

- Contains one operational section per stage with purpose, inputs, outputs, owner, and pass/fail criteria.

`summary_5/02_artifact_schema.md`

- Contains naming rules and expected file contents for the whole workflow.

### Setup files

`summary_5/10_run_manifest.md`

- Run objective
- target chapter files
- allowed output locations
- excluded files
- current round state

`summary_5/11_source_priority_map.md`

- source precedence
- claim-label rules
- conflict-resolution rule
- list of prior summary folders allowed as inspiration only

### Planning evidence packets

`summary_5/20_ch06_evidence_packet.md`

- Chapter 6 role summary
- thesis-grounded claims to preserve
- intended emphasis from expert description
- limitations and validity items to surface
- candidate cuts and compressions
- source index

`summary_5/21_ch07_evidence_packet.md`

- Chapter 7 role summary
- thesis-grounded conclusion points
- future-work split guidance
- items to keep short
- source index

`summary_5/22_style_reference_packet.md`

- examples of thesis voice from earlier chapters
- wording patterns to imitate
- wording patterns to avoid
- terminology that must stay stable
- anti-hype and anti-sales reminders

`summary_5/23_compression_map.md`

- current chapter areas to cut
- areas to merge
- areas to compress
- areas that must stay expanded
- target emphasis shift for each chapter

`summary_5/24_risk_and_mismatch_register.md`

- conflicts between source types
- likely overclaim risks
- likely repetition risks
- missing-evidence risks
- unresolved questions that must be avoided or softened

### Plan synthesis files

`summary_5/30_rewrite_plan_draft.md`

- end-to-end rewrite strategy
- chapter-specific goals
- contribution hierarchy
- removal/compression strategy
- review criteria that later stages will enforce

`summary_5/31_ch06_blueprint.md`

- ordered section list for Chapter 6
- purpose of each section
- must-include evidence points
- must-avoid wording
- maximum repetition constraints

`summary_5/32_ch07_blueprint.md`

- ordered section list for Chapter 7
- conclusion scope
- near-term vs longer-term future-work split
- rules that keep Chapter 7 shorter and cleaner than Chapter 6

`summary_5/33_cross_chapter_rules.md`

- non-overlap rules
- terminology consistency rules
- contribution hierarchy shared by both chapters
- transition rules between discussion and conclusion

### Plan review files

`summary_5/34_plan_review_grounding_rR.md`

- review verdict for the plan’s source support
- unsupported planned claims
- claims that need softening
- source gaps to close before writing

`summary_5/35_plan_review_content_rR.md`

- chapter-role evaluation
- structure evaluation
- compression evaluation
- repetition and drift risks

`summary_5/36_plan_review_style_language_rR.md`

- style-fit evaluation
- thesis-voice fit
- clarity and wording risk
- terminology stability check

`summary_5/37_plan_fixlist_rR.md`

- merged action list
- severity ordering
- owner per fix
- disposition:
  - `accept`
  - `revise`
  - `defer`
  - `drop`
- explicit gate outcome: pass or fail

### Writer brief files

`summary_5/40_writer_brief_global.md`

- shared rules for all writers
- claim-label policy
- truth hierarchy
- formatting and output requirements
- review issues that writers must preempt

`summary_5/41_writer_brief_ch06.md`

- exact files the Chapter 6 writer must load
- section-by-section writing plan
- content hierarchy
- compression instructions
- prohibited themes and overclaims
- output path

`summary_5/42_writer_brief_ch07.md`

- exact files the Chapter 7 writer must load
- section-by-section writing plan
- required future-work split
- concision rules
- prohibited repetition from Chapter 6
- output path

### First writing-wave files

`summary_5/50_ch06_rewrite_v1.tex`

- full Chapter 6 replacement draft
- ready to compare or later transplant
- no review commentary inside the chapter text

`summary_5/51_ch07_rewrite_v1.tex`

- full Chapter 7 replacement draft
- ready to compare or later transplant
- no review commentary inside the chapter text

`summary_5/52_writer_notes_v1.md`

- what each writer loaded
- what each writer changed relative to the plan
- any unresolved gaps or soft spots
- items reviewers should inspect closely

### Review files

`summary_5/60_truth_review_rR.md`

- per-chapter truth findings
- unsupported or weak claims
- `.tex` conflicts
- items that must be removed or softened

`summary_5/61_content_review_rR.md`

- thesis-arc check
- chapter-role check
- redundancy check
- compression success/failure check

`summary_5/62_style_review_rR.md`

- voice and tone findings
- jargon or invented-vocabulary warnings
- AI-summary or sales-tone warnings
- wording-level priorities

`summary_5/63_language_review_rR.md`

- grammar findings
- sentence clarity findings
- readability problems
- awkward repetition patterns

`summary_5/64_fix_plan_rR.md`

- merged findings from `60-63`
- blocker-first action list
- assignment of each fix to Chapter 6, Chapter 7, or both
- recommendation for narrow revision vs broad rewrite

### Revision-wave files

`summary_5/70_revision_brief_vV.md`

- targeted revision scope
- referenced review round
- must-fix items
- must-not-regress items
- assigned writers

`summary_5/71_ch06_rewrite_vV.tex`

- revised Chapter 6 draft for version `V`

`summary_5/72_ch07_rewrite_vV.tex`

- revised Chapter 7 draft for version `V`

`summary_5/73_revision_notes_vV.md`

- resolved findings list
- deferred findings list
- explanation for any reviewer disagreement

### Final validation files

`summary_5/80_final_validation_truth.md`

- final truth verdict
- list of any softened but acceptable claims
- explicit statement that no `OPEN` blockers remain

`summary_5/81_final_validation_content_style_language.md`

- combined final verdict for chapter roles, compression, style, and language
- residual nits only
- recommendation: ready or not ready

`summary_5/82_release_readiness_report.md`

- latest accepted draft version
- summary of review rounds
- unresolved minor issues
- rationale for stopping

`summary_5/83_handoff_index.md`

- ordered list of the files a fresh agent should read first
- latest approved draft paths
- known risks that remain
- exact next action for a continuation agent

## Round and Version Conventions

- Review rounds use `r1`, `r2`, `r3`, and so on.
- Draft versions use `v1`, `v2`, `v3`, and so on.
- Round numbers and version numbers do not need to match, but they should usually advance together after each full review/fix cycle.

## Minimum Packet Expectations by Role

Planning packet minimum:

- grounded evidence
- intended emphasis
- compression guidance
- source index

Reviewer packet minimum:

- blockers
- major concerns
- minor edits
- recommendation

Writer note minimum:

- loaded sources
- changes made
- uncertainties left

Final handoff minimum:

- latest good draft
- last accepted fix plan
- last validation verdict

## Forbidden File Patterns

Do not create:

- unlabeled scratch files such as `notes.md`, `tmp.md`, or `draft_new.md`
- duplicate chapter drafts without version suffixes
- review files that merge truth, content, style, and language into one unstructured blob
- any file under `summary_5/` that pretends to be authoritative but does not list sources
