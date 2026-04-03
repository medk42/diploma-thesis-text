# Summary 5 Rewrite Pack

This folder contains a full sub-agent workflow for a fresh rewrite/compression pass of:

- `ch06_discussion.tex`
- `ch07_conclusion_future_work.tex`

The workflow is designed so that the main orchestrator stays light and the sub-agents load the thesis context themselves.

## Read first

1. `00_master_workflow.md`
2. `01_stage_map.md`
3. `02_artifact_schema.md`
4. `03_context_packets.md`
5. `04_validation_rules.md`
6. `05_quality_gates.md`
7. `06_risk_register.md`

## Prompt pack

Planning:

- `prompts/10_plan_writer_prompt.md`
- `prompts/11_plan_reviewer_prompt.md`
- `prompts/12_plan_fixer_prompt.md`

Writing and iteration:

- `prompts/20_rewrite_writer_prompt.md`
- `prompts/21_rewrite_reviewer_prompt.md`
- `prompts/22_rewrite_fixer_prompt.md`

Validation:

- `prompts/30_truth_checker_prompt.md`
- `prompts/31_style_checker_prompt.md`
- `prompts/40_ab_compare_prompt.md`
- `prompts/41_orchestrator_handoff.md`

## Recommended execution order

1. Run the plan writer prompt.
2. Run the plan reviewer prompt.
3. If needed, run the plan fixer prompt.
4. Repeat plan review/fix until the plan passes the planning gate.
5. Run the rewrite writer prompt.
6. Run the rewrite reviewer prompt.
7. If needed, run the rewrite fixer prompt.
8. Repeat rewrite review/fix until the rewrite passes the rewrite gate.
9. Run the truth checker.
10. Run the style checker.
11. Run the A/B comparison.
12. Run the orchestrator handoff/self-check.

## Source authority

- Thesis `.tex` files are factual ground truth.
- `summary_2/expert_description.txt` is near-ground-truth for intended meaning and desired discussion emphasis.
- Earlier summary folders are support material only.

## Main design goal

The target result should be:

- clearer
- more concrete
- easier to parse
- less repetitive
- less orbiting
- still honest about prototype limits and evidence boundaries

The goal is not to preserve the current `v2` wording. The goal is to produce a cleaner final result grounded in the thesis and in the expert description.
