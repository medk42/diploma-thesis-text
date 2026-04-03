---
artifact_id: 23_compression_map
stage: S1
status: complete
owner_role: orchestrator
source_files_loaded:
  - summary_5/00_master_workflow.md
  - summary_5/01_stage_map.md
  - summary_5/02_artifact_schema.md
  - summary_5/03_context_packets.md
  - summary_5/04_validation_rules.md
  - summary_5/05_quality_gates.md
  - summary_5/06_risk_register.md
  - summary_5/outputs/10_run_manifest.md
  - summary_5/outputs/11_source_priority_map.md
  - introduction.tex
  - ch06_discussion.tex
  - ch07_conclusion_future_work.tex
  - summary_2/expert_description.txt
  - summary_2/context/03_author_intent_handoff.md
  - summary_2/context/01_safe_vs_risky_claims.md
  - summary_2/style/00_style_reference.md
  - summary_2/style/01_style_do_dont.md
  - summary_2/planner/03_chapter_structure_v2.md
depends_on:
  - summary_5/outputs/10_run_manifest.md
  - summary_5/outputs/11_source_priority_map.md
outputs_next:
  - summary_5/outputs/24_risk_and_mismatch_register.md
---

# Grounding

## Grounded evidence

- `GT`: `introduction.tex` frames the thesis around frequently changing collaborative-robot tasks, direct spatial intent in the real workspace, and two representative task families: pick-and-place and seam welding.
- `GT`: `ch06_discussion.tex` currently repeats the main result, task fit, architecture value, limitations, and evaluation boundary across several adjacent sections.
- `GT`: `ch07_conclusion_future_work.tex` currently separates conclusion, near-term future work, and longer-term directions, but some limitation detail and evaluation framing still bleed across sections.
- `GT`: `summary_5/04_validation_rules.md` and `summary_5/05_quality_gates.md` require truth-first compression, visible prototype limits, and a strict separation between Chapter 6 interpretation and Chapter 7 closure plus next steps.

## Intended meaning

- `NGT`: `summary_2/expert_description.txt` says Chapter 6 should explain what was built, what it means, why it matters, where it is useful, and where it stops being useful.
- `NGT`: the same handoff says pick-and-place should stay a flexibility demonstration, not the main practical target, while welding is the clearest practical fit.
- `NGT`: the conclusion should stay modest, keep the near-term engineering roadmap separate from longer-term research directions, and avoid turning future work into a bug list.
- `INF`: compression should reduce repetition inside sections, but it must not hide the prototype boundary, the evaluation boundary, or the task-fit asymmetry that the author wants the reader to keep seeing.

# Target Emphasis Shift

## Chapter 6

- `keep`: move from "what was built" toward "what the result means" while still naming the built system once at the start.
- `keep`: preserve the explicit contrast between pick-and-place as flexibility evidence and welding as the strongest practical fit.
- `keep`: keep limitations visible as part of the argument, not as an afterthought.
- `compress`: reduce repeated architecture praise, implementation recaps, and internal module naming so the chapter reads like discussion rather than system documentation.

## Chapter 7

- `keep`: make the conclusion shorter and cleaner than Chapter 6.
- `keep`: use the near-term future work section for engineering completion and validation, then use the longer-term section for research directions with clearer academic shape.
- `compress`: avoid re-arguing the same thesis result at the same depth as Chapter 6.
- `relocate`: move detailed boundary and bug-style material into Chapter 6 where it belongs.

# Must Stay Expanded

- `keep`: the introduction thread back to frequently changing tasks and in-workspace spatial authoring, because the closing chapters must still read as the answer to that opening question.
- `keep`: the pick-and-place vs welding asymmetry, because the workflow stop rule explicitly says not to collapse the two chapters or flatten their roles.
- `keep`: the prototype boundary, including qualitative evaluation and limited physical validation, because the validation rules say shortening must not hide those limits.
- `keep`: the Chapter 6 and Chapter 7 role split, because Chapter 6 carries interpretation and Chapter 7 carries closure plus next steps.
- `keep`: the near-term versus longer-term future-work split, because the author intent and quality gates both require it.

# Areas To Compress

- `compress`: the repeated "main result" statements in Chapter 6 that restate the same modular-runtime point in slightly different wording.
  - Why: the thesis already says the system is modular and reusable in the introduction and again in Chapter 6; later repeats do not add new meaning.
- `compress`: the implementation-level workflow inventory in Chapter 6, such as module-graph construction, activation, calibration, confirmation, persistence, and similar lists.
  - Why: these are useful once, but the discussion should not read like a feature checklist.
- `compress`: internal names and plumbing terms such as `UsecaseTree`, wrapper protocol phrasing, and `READ_SCENE` references when the conceptual point is already clear.
  - Why: they are low-value at discussion level and risk pulling the reader back into code-level detail.
- `compress`: the motion-primitive examples in Chapter 6.
  - Why: they support the shared-runtime claim, but they are not one of the thesis's central results.
- `compress`: the repeated "not production-ready" language in Chapter 6 and Chapter 7.
  - Why: one concise boundary statement is enough if the surrounding limitation detail is preserved in Chapter 6.
- `compress`: the long near-term future-work lists in Chapter 7 into grouped clusters.
  - Why: the current form risks reading like a checklist of fixes rather than a structured roadmap.

# Areas To Merge

- `merge`: Chapter 6 "Main result" and "Task fit and scope" into one stronger arc.
  - Why: both sections explain the same thesis-level result and both repeat the modular-architecture point.
- `merge`: the first part of Chapter 6 "Where the approach works well" with the preceding task-fit discussion.
  - Why: the chapter currently reintroduces architecture and use-case value one section later with only minor wording changes.
- `merge`: the opening conclusion paragraph of Chapter 7 with the paragraph that immediately restates the main contribution hierarchy.
  - Why: they do the same job and can be reduced to one concise conclusion block.
- `merge`: the detailed evaluation framing in Chapter 7 with the Chapter 6 evaluation boundary.
  - Why: Chapter 7 should refer back to the boundary, not duplicate it.
- `merge`: near-term future-work items that belong together technically, especially sensing, scene pipeline, execution, and prototype completion.
  - Why: grouping them keeps the roadmap readable and prevents the future-work section from becoming a bug dump.

# Areas To Cut

- `cut`: repeated references to the same architecture claim when they do not add a new consequence.
  - Why: they are repetitive and weaken the chapter's argumentative focus.
- `cut`: unnecessary related-work negation sequences in Chapter 6, such as long lists of what the thesis is not.
  - Why: one compact distinction is enough; the rest is low-value repetition.
- `cut`: code-ish or implementation-surface names that are not needed for the chapter argument.
  - Why: they are more distracting than explanatory in a compression pass.
- `cut`: detailed UI bug examples from Chapter 7 if they only repeat the limitations already explained in Chapter 6.
  - Why: those details belong in the limitation discussion, not in the conclusion chapter.
- `cut`: any phrasing that turns future work into a simple backlog of fixes.
  - Why: the workflow requires future work to stay research-shaped where possible.

# Areas To Relocate

- `relocate`: detailed sensing and portability limitations from Chapter 7 into Chapter 6.
  - Why: Chapter 6 is the right place for current limits, evaluation boundary, and prototype scope.
- `relocate`: formal user study, timing characterization, repeatability, and tracking-accuracy questions into the near-term future-work subsection.
  - Why: these are future-facing validation questions, not conclusion material.
- `relocate`: richer interaction ideas such as hand tracking, VR or AR controllers, gesture plus speech, and teach-pendant integration into the longer-term directions subsection.
  - Why: these are broader research directions, not immediate engineering cleanup.
- `relocate`: export or compilation questions for the robot-side path into near-term future work, but only as part of the execution-layer roadmap.
  - Why: the current prototype mentions this as a plausible future path, and it fits the execution discussion better than the conclusion.

# Chapter-Specific Compression Notes

## Chapter 6

- `keep`: one opening paragraph that ties the discussion back to the introduction and states the prototype-level answer.
- `keep`: one compact paragraph that names the shared runtime, explicit interfaces, and reusable use-case boundary as the architectural result.
- `compress`: one interpretive paragraph for pick-and-place, followed by one interpretive paragraph for welding, rather than multiple rephrasings of the same fit argument.
- `keep`: one clear limitations section with the strongest boundary first, then the rest in descending importance.
- `compress`: the evaluation boundary into the end of the limitation section if possible, instead of repeating it as a separate mini-result.

## Chapter 7

- `keep`: a short conclusion that summarizes the contribution hierarchy modestly.
- `keep`: one near-term block for evaluation and sensing/execution completion.
- `keep`: one longer-term block for richer interaction and broader task families.
- `compress`: any lines that restate the Chapter 6 meaning at the same depth.
- `cut`: any attempt to make Chapter 7 carry the same interpretive load as Chapter 6.

# Stop-Rule Check

- Do not shorten Chapter 6 so much that the prototype boundary disappears.
- Do not shorten Chapter 7 so much that it becomes a second discussion chapter.
- Do not let compression collapse the special role of welding into the same level as pick-and-place.
- Do not let architecture become the only headline result.
