# Style Reference

## Observed style in Chapters 2 to 5

The thesis uses a deliberate explanatory style. Each section usually begins by stating the purpose of the section, then explains the rationale for a choice, and only then gives the concrete implementation or consequence. The prose is technical, but not compressed. It prefers clear comparisons, explicit tradeoffs, and exact boundaries over rhetorical emphasis.

## Structural habits

- Sections often begin with a short "Purpose" or summary sentence.
- The text commonly explains why a decision was made before describing the decision itself.
- Tradeoffs are stated with `However`, `At the same time`, `Therefore`, and `In practice`.
- The thesis likes to separate general design claims from concrete implementation notes.
- A limitation is usually stated as a boundary of the approach, not as a dramatic failure.
- The prose often closes with a summary sentence that ties the section back to the next chapter.

## Sentence patterns

- The thesis prefers direct declarative sentences over ornate phrasing.
- It often uses "we select", "we implement", "we treat", "we keep", and "the system requires" instead of vague verbs.
- It explains a mechanism, then a consequence, then a design implication.
- It uses long sentences when listing closely related technical conditions, but not when making the main point.
- It is comfortable with precise technical nouns repeated across sections.

## Vocabulary habits

- `use case` is the preferred concept for task-specific behavior.
- `control plane` is used for the frontend/orchestrator role.
- `module`, `interface`, `wrapper`, `workflow`, `persistence`, `scene detection`, and `execution` are the main recurring terms.
- The thesis avoids hype words where possible.
- The thesis uses consistent contrast terms: `However`, `At the same time`, `Therefore`, `Unlike`.

## Rhetorical style

- The text is careful about scope.
- It frequently says what is out of scope.
- It prefers bounded claims such as "for this thesis", "in this prototype", and "in our setup".
- It avoids pretending the prototype is complete when it is not.
- It does not overstate novelty; instead it explains the design rationale and the observed result.

## Chapter-appropriate tone

- Chapter 2 and Chapter 3 sound like design justification.
- Chapter 4 sounds like implementation exposition.
- Chapter 5 sounds like operator instructions and system behavior.
- Chapter 6 should sound like a measured evaluation with explicit interpretation.
- Chapter 7 should sound like a short conclusion plus future agenda.

