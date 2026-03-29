# Workflow Plan

This folder defines the orchestration plan for extracting source-grounded material for Chapters 6 and 7.

## Goal

Build a grounded evidence bank from the thesis `.tex` files, then use it to produce:

1. a Discussion evidence draft,
2. a Conclusion and Future Work evidence draft,
3. review reports for style and truth/reference checks.

## Operating Rules

- Treat `.tex` files as the only source of truth.
- Treat `notes/` and user chat as orientation only.
- Do not promote note-only claims into the evidence bank unless a worker can verify them in the thesis text.
- Prefer recall over brevity during extraction.
- Keep every claim tied to a source section name.
- Distinguish `T` = directly supported, `I` = careful inference, `Q` = needs author confirmation.

## Planned Flow

### Stage 1: Planner output

Use the files in this folder as the control plane:

- `00_workflow_plan.md`
- `01_summary_schema.md`
- `02_topic_map.md`
- `03_packet_plan.md`
- `04_extraction_prompt.md`
- `05_review_prompts.md`
- `06_chapter_structure.md`

### Stage 2: Extraction workers

Run separate extraction workers in parallel. Suggested packet outputs:

- `summary/extraction/p01_intro_ch01_ch02.md`
- `summary/extraction/p02_ch03_contracts.md`
- `summary/extraction/p03_ch03_orchestration.md`
- `summary/extraction/p04_ch04_implementation_a.md`
- `summary/extraction/p05_ch04_implementation_b.md`
- `summary/extraction/p06_ch05_workflow.md`

If a packet is too large, split it before review rather than compressing it in the worker prompt.

### Stage 3: Merge into a master evidence bank

After all extraction workers finish, merge their outputs into:

- `summary/extraction/90_master_evidence.md`
- `summary/extraction/91_discussion_evidence.md`
- `summary/extraction/92_conclusion_evidence.md`

These are still evidence files, not polished prose. They should preserve source links and topic IDs.

### Stage 4: Review cycles

Run two review passes on the merged evidence.

1. Grammar/style consistency review.
2. Truth/reference and overclaim review.

Suggested review outputs:

- `summary/reviews/grammar/`
- `summary/reviews/truth/`

### Stage 5: Final synthesis

After reviews, produce two final planning artefacts:

- `summary/final/ch06_discussion_draft.md`
- `summary/final/ch07_conclusion_future_work_draft.md`

If the thesis text still lacks enough source support for full prose, keep these as detailed structured notes rather than forcing polished chapter text.

## Recommended Execution Order

1. Finish the planner files.
2. Launch extraction workers for packets `P1` through `P6` in parallel.
3. Wait for all extraction workers.
4. Merge the outputs into the master evidence bank.
5. Launch the grammar/style reviewers in parallel.
6. Launch the truth/reference reviewers in parallel.
7. Resolve any conflicts or unsupported claims.
8. Write the final Chapter 6 and Chapter 7 evidence drafts.

## Non-Goals

- Do not write final thesis prose before the evidence bank is reviewed.
- Do not spend worker budget on line-by-line paraphrase of implementation internals unless they directly support discussion or future work.
- Do not ask the user to validate claims that can already be grounded in the thesis text.

