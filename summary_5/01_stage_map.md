# Summary 5 Stage Map

## S0. Bootstrap and Scope Lock

**Purpose**

Freeze the target, truth hierarchy, and workflow limits before any worker starts.

**Inputs**

- user request for a rewrite/compression workflow
- file names of the two target chapters
- `summary_2/expert_description.txt`
- existing summary folders for process inspiration only

**Outputs**

- `summary_5/10_run_manifest.md`
- `summary_5/11_source_priority_map.md`

**Agent role**

Main orchestrator only.

**Pass criteria**

- target chapters explicitly named
- scope limited to design/orchestration artefacts under `summary_5/`
- ground-truth and near-ground-truth rules recorded
- claim tags defined

**Fail criteria**

- chapter targets are ambiguous
- source precedence is not written down
- plan allows direct writing before planning review

## S1. Planning Evidence Packets

**Purpose**

Collect the minimum source-grounded planning context by using sub-agents that read the relevant `.tex` files themselves.

**Inputs**

- `10_run_manifest.md`
- `11_source_priority_map.md`
- thesis `.tex` files relevant to Chapters 6 and 7
- `summary_2/expert_description.txt`

**Outputs**

- `summary_5/20_ch06_evidence_packet.md`
- `summary_5/21_ch07_evidence_packet.md`
- `summary_5/22_style_reference_packet.md`
- `summary_5/23_compression_map.md`
- `summary_5/24_risk_and_mismatch_register.md`

**Agent role**

Planning sub-agents only. Each one loads a bounded source set and writes a packet.

**Pass criteria**

- each packet lists source files used
- each packet distinguishes grounded facts from interpretation
- each packet is concrete enough to support planning without rereading all sources
- compression map includes keep, compress, cut, and merge candidates

**Fail criteria**

- vague summaries with no source anchors
- style packet that names preferences but gives no evidence
- risk register that does not note `.tex` vs expert-description tensions

## S2. Rewrite Plan Synthesis

**Purpose**

Turn evidence packets into a concrete plan package before writing starts.

**Inputs**

- `20-24` planning packets

**Outputs**

- `summary_5/30_rewrite_plan_draft.md`
- `summary_5/31_ch06_blueprint.md`
- `summary_5/32_ch07_blueprint.md`
- `summary_5/33_cross_chapter_rules.md`

**Agent role**

Main orchestrator only. It reads packets, not the full thesis.

**Pass criteria**

- plan defines the function of each chapter
- section order is explicit
- contribution hierarchy is explicit
- compression and deletion decisions are explicit
- future-work split is explicit

**Fail criteria**

- plan remains aspirational instead of operational
- blueprints do not specify section-level responsibilities
- cross-chapter rules do not prevent repetition

## S3. Plan Review and Iteration

**Purpose**

Stress-test the plan before any writing agent is allowed to draft prose.

**Inputs**

- `30_rewrite_plan_draft.md`
- `31_ch06_blueprint.md`
- `32_ch07_blueprint.md`
- `33_cross_chapter_rules.md`
- planning packets as needed

**Outputs**

- `summary_5/34_plan_review_grounding_rR.md`
- `summary_5/35_plan_review_content_rR.md`
- `summary_5/36_plan_review_style_language_rR.md`
- `summary_5/37_plan_fixlist_rR.md`

**Agent role**

Reviewer sub-agents plus orchestrator aggregator.

**Pass criteria**

- no major unsupported planned claims
- no unclear chapter-role separation
- no unresolved ambiguity around intended emphasis
- style/language guidance is actionable rather than generic

**Fail criteria**

- reviewer predicts likely overclaiming
- reviewer cannot tell what gets cut vs kept
- reviewer finds plan tone already drifting into hype or summary filler

## S4. Writer Packet Preparation

**Purpose**

Prepare executable writer instructions so the drafting stage can be delegated cleanly.

**Inputs**

- approved plan package
- latest plan fix list

**Outputs**

- `summary_5/40_writer_brief_global.md`
- `summary_5/41_writer_brief_ch06.md`
- `summary_5/42_writer_brief_ch07.md`

**Agent role**

Main orchestrator only.

**Pass criteria**

- each brief tells the writer exactly which files to load
- each brief defines forbidden overclaims and forbidden tone
- each brief specifies output path and format
- each brief gives section-by-section goals

**Fail criteria**

- brief depends on unstated chat context
- brief omits the required sources
- brief allows the writer to improvise unsupported content

## S5. Writing Wave

**Purpose**

Produce the actual rewrite drafts through sub-agents.

**Inputs**

- `40_writer_brief_global.md`
- `41_writer_brief_ch06.md`
- `42_writer_brief_ch07.md`
- source files listed in each brief

**Outputs**

- `summary_5/50_ch06_rewrite_v1.tex`
- `summary_5/51_ch07_rewrite_v1.tex`
- `summary_5/52_writer_notes_v1.md`

**Agent role**

Writing sub-agents only. The orchestrator may collect outputs but must not author the chapter prose.

**Pass criteria**

- both chapter drafts exist
- both drafts are complete enough to review as chapters
- unsupported gaps are logged explicitly
- chapter files are `.tex`-ready rather than loose notes

**Fail criteria**

- draft is partial without explanation
- writer invented material rather than logging a gap
- Chapter 7 expands into a second discussion chapter

## S6. Integrated Review Wave

**Purpose**

Evaluate the written drafts from four required angles.

**Inputs**

- latest chapter draft files
- approved plan package
- writer notes
- source files needed by each reviewer

**Outputs**

- `summary_5/60_truth_review_rR.md`
- `summary_5/61_content_review_rR.md`
- `summary_5/62_style_review_rR.md`
- `summary_5/63_language_review_rR.md`
- `summary_5/64_fix_plan_rR.md`

**Agent role**

Reviewer sub-agents plus orchestrator aggregator.

**Pass criteria**

- each review lane produces concrete findings
- fix plan ranks blockers before nits
- repeated issues are grouped rather than duplicated

**Fail criteria**

- reviews are impressionistic and not actionable
- fix plan loses source grounding
- style and language are merged so vaguely that no one can execute fixes

## S7. Revision Waves

**Purpose**

Apply reviewer findings through controlled rewrite iterations.

**Inputs**

- latest `64_fix_plan_rR.md`
- latest approved drafts
- writer briefs

**Outputs**

- `summary_5/70_revision_brief_vV.md`
- `summary_5/71_ch06_rewrite_vV.tex`
- `summary_5/72_ch07_rewrite_vV.tex`
- `summary_5/73_revision_notes_vV.md`

**Agent role**

Revision-writing sub-agents. The orchestrator assigns work and tracks closure of findings.

**Pass criteria**

- revision brief maps each change to a prior finding
- changed text addresses the highest-severity issues first
- no resolved issue reappears because of careless rewrites

**Fail criteria**

- revisions answer only language nits while truth blockers remain
- revision notes do not explain deviations from reviewer requests
- loop continues without learning from recurring failures

## S8. Final Validation and Handoff

**Purpose**

Confirm that the rewrite is ready for human inspection or later application into the thesis files.

**Inputs**

- latest revised chapter drafts
- latest review history
- source files needed for final checks

**Outputs**

- `summary_5/80_final_validation_truth.md`
- `summary_5/81_final_validation_content_style_language.md`
- `summary_5/82_release_readiness_report.md`
- `summary_5/83_handoff_index.md`

**Agent role**

Final reviewer sub-agents plus orchestrator.

**Pass criteria**

- no unresolved truth blockers
- no missing core discussion or conclusion function
- style and language issues are minor only
- handoff index is sufficient for a fresh agent to resume immediately

**Fail criteria**

- final reviewers still find structural drift
- handoff package does not identify the latest accepted draft
- readiness report hides unresolved risk
