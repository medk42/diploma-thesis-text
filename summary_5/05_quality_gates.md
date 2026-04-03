# Quality Gates For Rewrite And Compression

## Purpose

These gates define when the workflow may continue, when it must loop, and when it must stop.

Use them for both:

- full rewrite of Chapters 6-7
- compression rewrite of existing Chapters 6-7

## Gate 0: Packet Readiness

### Goal

Ensure the orchestrator is not carrying hidden context.

### Continue only if

- each worker role has a defined packet
- each packet distinguishes required vs optional files
- the source authority order is explicit
- claim-label usage is compatible with `summary_5/02_artifact_schema.md`
- the worker can self-load what it needs

### Stop if

- a worker prompt expects the orchestrator to paste long source excerpts
- required files are missing from the packet definition
- source authority is ambiguous

### Orchestrator action

Do not launch rewrite work. Fix the packet definition first.

## Gate 1: Planning Readiness

### Goal

Ensure the planned rewrite has the right chapter jobs before drafting starts.

### Continue only if

- Chapter 6 and Chapter 7 have clearly separate roles
- the plan ties the closing chapters back to `introduction.tex`
- the plan names where weld vs pick-and-place asymmetry will be handled
- the plan names where limitations, evaluation boundary, and future work will be handled

### Revise if

- the plan is broadly correct but one chapter role is still blurred
- the plan depends on vague ideas such as `make it more polished`

### Stop if

- the plan cannot say which claims are fact vs interpretation
- the plan would require unsourced new content
- the plan makes architecture the only headline result

### Orchestrator action

Send the plan back to the planner. Do not ask the writer to solve structural uncertainty ad hoc.

## Gate 2: Source Readiness Before Writing

### Goal

Ensure the writer has enough factual grounding.

### Continue only if

- the writer has loaded the full required factual source pack
- the writer has loaded `summary_2/expert_description.txt`
- any expected author-intent-only idea is marked as interpretation

### Stop if

- the writer relies mainly on summaries or prior reviews
- the writer has not loaded the relevant `.tex` files
- the writer treats `summary_2/expert_description.txt` as if it were factual proof

### Orchestrator action

Abort the write pass and rerun with the correct packet.

## Gate 3: First-Draft Structural Check

### Goal

Catch early failure before expensive validation.

### Continue only if

- Chapter 6 is the longer interpretive chapter
- Chapter 7 is shorter and clearly split into conclusion and future work
- the draft is readable without implementation-heavy context
- obvious AI-polish drift is not dominating the prose

### Revise if

- the structure is correct but several paragraphs are vague or repetitive

### Stop if

- Chapter 6 reads like recap only
- Chapter 7 repeats Chapter 6 at similar depth
- the draft has obvious unsupported claims even before truth check

### Orchestrator action

If stopped here, go straight back to the writer with structural findings. Do not spend checker budget yet.

## Gate 4: Truth Gate

### Goal

Verify factual safety before style optimization.

### Continue only if

- truth check returns `pass`

### Revise if

- truth check returns `revise`
- all issues are local softening, removal, or source-alignment fixes

### Stop if

- truth check returns `fail`
- there is any contradiction to source `.tex`
- key prototype boundaries are missing
- unsupported industrial, commercial, or comparative claims appear

### Orchestrator action

Do not send a truth-failing draft to style cleanup. Fix truth first.

## Gate 5: Content Gate

### Goal

Verify chapter function and emphasis.

### Continue only if

- content check returns `pass`

### Revise if

- content check returns `revise`
- missing items are local and do not require a new plan

### Stop if

- content check returns `fail`
- the introduction thread is broken
- weld vs pick-and-place emphasis is wrong
- limitations and future work are collapsed together
- compression removed mandatory chapter content

### Orchestrator action

If content fails for structural reasons, return to planning. If it fails locally, return to writing.

## Gate 6: Style And Voice Gate

### Goal

Ensure the draft still sounds like the thesis.

### Continue only if

- style check returns `pass`
- the draft has no major thesis-voice issues

### Revise if

- style check returns `revise`
- issues are local wording, rhythm, repetition, or paragraph openings

### Stop if

- style check returns `fail`
- generated-sounding prose dominates multiple paragraphs
- repeated abstract summary language makes the text hard to parse

### Orchestrator action

Return to the writer with narrow style edits. Do not reopen factual scope unless the style issue changes claim strength.

## Gate 7: Overlap And Compression Gate

### Goal

Ensure the rewrite is shorter or tighter for the right reasons.

### Continue only if

- Chapter 7 does not duplicate Chapter 6
- repeated points inside each chapter have been reduced
- compression preserved the evaluation boundary and main limitations

### Revise if

- the draft is safe but still repeats itself

### Stop if

- a shorter draft became vaguer
- the rewrite hides uncertainty to gain fluency
- conclusion text starts doing discussion work again

### Orchestrator action

Use a comparator if needed. Prefer the safer draft over the smoother one.

## Gate 8: Comparator Gate

### Goal

Choose whether the newest candidate should replace the current best draft.

### Continue only if

- comparator says the new draft is clearly better or clearly safer

### Revise if

- the new draft is mixed: clearer in some parts, weaker in others

### Stop if

- comparator cannot choose because both drafts have unresolved truth or content issues

### Orchestrator action

Escalate to the relevant checker. Do not guess based on prose smoothness.

## Gate 9: Final Release Gate

### Goal

Allow handoff or final promotion.

### Continue only if

- truth gate passed
- content gate passed
- style and voice gate passed
- overlap and compression gate passed
- no open `fail` status remains

### Stop if

- any pass depends on `we can fix that later`
- unresolved conflicts remain between source truth and intended meaning

### Orchestrator action

Only at this point may the draft be treated as the current best version.

## Loop Policy

Use this default routing:

1. Planning issue -> back to planner.
2. Factual issue -> back to writer with truth findings.
3. Structural content issue -> back to planner or writer depending on scope.
4. Style issue -> back to writer with narrow edits only.
5. Mixed issue -> fix truth first, then content, then style.

## Hard Stop Conditions

Stop the workflow and escalate if any of these occur:

- `.tex` source and `summary_2/expert_description.txt` pull in different directions and the difference changes a thesis claim
- the writer or checker did not actually load the required files
- repeated rewrite rounds keep changing voice but not improving truth or content
- the process starts rewarding polish over parseability

## Minimum Acceptance Standard

The workflow is ready to stop only when:

- the result is source-safe
- the chapter roles are distinct
- the prose is easy to parse
- the draft still sounds like the thesis
- the final text is tighter because it is better organized, not because it dropped necessary boundaries
