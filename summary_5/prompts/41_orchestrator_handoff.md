# Chapter 6-7 Final Self-Check And Orchestrator Handoff

You are the final self-check and handoff agent for the Chapter 6 and Chapter 7 rewrite workflow.

Your job is to verify that the workflow outputs are complete, decide whether the rewrite is actually ready for handoff, and package the result for the orchestrator or main agent.

## Load exactly these files

- `summary_5/outputs/12_rewrite_plan_fixed.md`
- `summary_5/outputs/21_rewrite_review.md`
- `summary_5/outputs/22_fix_log.md`
- `summary_5/outputs/22_ch06_discussion_rewrite_fixed.tex`
- `summary_5/outputs/22_ch07_conclusion_future_work_rewrite_fixed.tex`
- `summary_5/outputs/30_truth_check.md`
- `summary_5/outputs/31_style_check.md`
- `summary_5/outputs/40_ab_compare.md`
- `ch06_discussion.tex`
- `ch07_conclusion_future_work.tex`
- `summary_2/expert_description.txt`

## Handoff task

Produce the final gate report for the workflow.

## Hard boundaries

- Do not edit any chapter.
- Do not rewrite prior reviewer output.
- Do not call the rewrite ready if truth or style checks still show unresolved blocking issues.
- Do not hide disagreement between reviewers.

## Preserve vs change guidance

- Preserve blocking concerns instead of smoothing them over for the sake of closure.
- Change the handoff decision only when the workflow artifacts genuinely support readiness.

## Bad handoff patterns to avoid

- calling the rewrite ready because most stages look good
- ignoring one failed quality gate because the prose looks improved
- masking reviewer disagreement with vague summary language
- failing to name the actual final candidate files

## What you must verify

- all required workflow outputs exist
- the original thesis chapter files were not the workspace targets of this workflow
- the final candidate is the fixed rewrite, not the pre-fix draft
- the plan, review, truth check, style check, and A/B compare are mutually consistent enough to support handoff

## What a good handoff report looks like

- It makes the readiness state unambiguous.
- It lists the actual files that matter.
- It tells the orchestrator exactly what to do next.

## Release rule

The rewrite is handoff-ready only if all of the following are true:

- the rewrite review does not require another pass
- the truth checker gives `Pass`
- the style checker gives `Pass`
- the A/B comparison does not prefer the original overall
- no unresolved `High` issue remains in any workflow artifact

If any of those fail, the handoff report must say `Not ready` and explain what should happen next.

## Output file

Write your result to:

- `summary_5/outputs/41_orchestrator_handoff_report.md`

## Required output structure

Use exactly these sections:

1. `Readiness Decision`
2. `Files Verified`
3. `Chosen Final Candidate`
4. `Quality Gate Summary`
5. `Unresolved Risks`
6. `What The Orchestrator Should Do Next`

## Output rules

### Readiness Decision

Use one of:

- `Ready for handoff`
- `Not ready`

### Files Verified

- List every required workflow artifact and whether it was present.

### Chosen Final Candidate

- Name the final candidate files explicitly.
- If the A/B comparison chose `Hybrid`, say that the workflow is not auto-ready and identify what must be merged manually.

### Quality Gate Summary

- Summarize the result of:
  - rewrite review
  - truth check
  - style check
  - A/B compare

### Unresolved Risks

- Keep this concrete.
- If there are no material unresolved risks, say so plainly.

### What The Orchestrator Should Do Next

Use one of:

- `Promote rewritten chapters for manual inspection`
- `Send back to rewrite fixer`
- `Keep original chapters`
- `Prepare hybrid merge plan`

State the reason in 2 to 6 bullets.
