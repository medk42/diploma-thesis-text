# Summary Schema

This document defines the folder structure and file roles for the extraction workflow.

## Folder Layout

```text
summary/
  planner/
    00_workflow_plan.md
    01_summary_schema.md
    02_topic_map.md
    03_packet_plan.md
    04_extraction_prompt.md
    05_review_prompts.md
    06_chapter_structure.md
  extraction/
    p01_intro_ch01_ch02.md
    p02_ch03_contracts.md
    p03_ch03_orchestration.md
    p04_ch04_implementation_a.md
    p05_ch04_implementation_b.md
    p06_ch05_workflow.md
    90_master_evidence.md
    91_discussion_evidence.md
    92_conclusion_evidence.md
  reviews/
    grammar/
    truth/
  final/
    ch06_discussion_draft.md
    ch07_conclusion_future_work_draft.md
```

## File Roles

### Extraction packet files

Each packet file should be a markdown evidence note, not polished prose.

Required content:

| Section | Purpose |
|---|---|
| Metadata | Packet id, source files, sections read, reviewer target |
| Grounded claims | Directly supported claims with topic IDs |
| Inferred claims | Careful inferences that stay close to the text |
| Positive outcomes | What the thesis clearly demonstrates |
| Limitations | Prototype-level and concept-level limits |
| Future work | Work that the text already implies |
| Claims to avoid | Statements that would overreach the text |
| Questions for author | Only where the text cannot settle a point |
| Source index | Source file and section names for every major claim |

### Master evidence files

- `90_master_evidence.md` is the merged, de-duplicated evidence bank.
- `91_discussion_evidence.md` is the filtered set of evidence relevant to Chapter 6.
- `92_conclusion_evidence.md` is the filtered set of evidence relevant to Chapter 7.

These files should preserve the packet source sections and topic IDs.

### Review output folders

The review folders should contain one file per reviewer run.

Suggested naming:

- `summary/reviews/grammar/<packet_or_merge_id>_grammar.md`
- `summary/reviews/truth/<packet_or_merge_id>_truth.md`

## Required Metadata Fields

Every extraction or review file should begin with:

- `packet_id`
- `source_files`
- `source_sections`
- `priority`
- `target_chapter`
- `author_note_status`

## Claim Tagging Rules

- `T` means the claim is directly grounded in the cited thesis text.
- `I` means the claim is a careful inference from the cited thesis text.
- `Q` means the claim still needs author confirmation or extra evidence.

## Writing Constraints

- Keep the evidence bank detailed enough that another model could draft chapters from it without reopening the whole thesis.
- Avoid vague summary language like "the system is robust" unless the thesis text supports it directly.
- Include the source section name for every nontrivial item.
- Keep note-only ideas separate from grounded thesis material.

