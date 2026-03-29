# Extraction Prompt

Use this prompt for every packet worker. Fill in the packet metadata before dispatching the worker.

```text
You are extracting source material for the final chapters of a diploma thesis.

Packet metadata:
- packet_id: {{PACKET_ID}}
- source_files: {{SOURCE_FILES}}
- source_sections: {{SOURCE_SECTIONS}}
- target_chapter: {{TARGET_CHAPTER}}
- priority: {{PRIORITY}}
- output_path: {{OUTPUT_PATH}}

Task:
Read only the provided thesis text packet and extract information relevant to:
(1) Chapter 6 discussion,
(2) Chapter 7 conclusion and future work,
(3) limitations and threats to validity,
(4) claims that are safe to make,
(5) future work already supported by the text.

Rules:
- Treat the thesis .tex files as the source of truth.
- Do not rely on notes or user chat unless the packet metadata explicitly says to verify a note-only item.
- Do not write polished prose.
- Do not invent claims.
- Prefer recall over brevity.
- Keep the distinction between concept-level claims and prototype-specific claims.
- When a claim is stronger than the text supports, downgrade it to [I] or [Q].
- Preserve source section names in every bullet.
- Use the topic IDs when relevant.
- When the text supports a claim only indirectly, say why it is an inference.

Output format:

## Packet metadata
- packet_id
- source_files
- source_sections
- target_chapter
- priority

## A. Grounded claims
- Bullet list.
- Each bullet must be tagged [T] or [I].
- Each bullet must include the source section name.

## B. What was actually demonstrated
- Concrete, observable behavior only.
- Mention what the prototype shows in practice.
- Include the source section name.

## C. Strong outcomes / positive findings
- Focus on what the thesis can honestly claim as a strength.
- If the text supports a more specific interpretation, state it explicitly.

## D. Limitations and weaknesses
Group items by:
1. scope / concept-level limits
2. sensing and calibration
3. scene understanding
4. robot execution and tooling
5. UI / orchestration / visualization
6. evaluation boundary

For each item:
- tag [T], [I], or [Q]
- say whether it is prototype-specific or concept-level
- include source section names

## E. Future work already supported by the text
Group items by:
- sensing
- input / interaction
- robot interface / execution
- UI
- use cases / applicability
- evaluation
- long-term research direction

## F. Claims to avoid
- Things the final thesis should not say because the packet does not support them strongly enough.

## G. Questions for the author
- Only ask questions that would materially improve Chapter 6 or 7.
- Do not ask generic clarification questions if the thesis text already answers the point.

## H. Source index
- Provide a compact index mapping each major bullet to the source section name.

Topic priorities:
- If the packet includes Chapter 3, prioritize modularity, interface contracts, orchestration, persistence, and explicit limits.
- If the packet includes Chapter 4, prioritize hardware assumptions, calibration dependence, use-case behavior, and execution limitations.
- If the packet includes Chapter 5, prioritize workflow friction, confirmation steps, and save/load behavior.
- If the packet includes Chapter 1 or Chapter 2, prioritize motivation, positioning, task requirements, and scope boundaries.

Be exhaustive enough that another model could draft Chapter 6 and Chapter 7 without reopening the full thesis.
```

