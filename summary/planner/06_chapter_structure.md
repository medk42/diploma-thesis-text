# Chapter Structure

The thesis should keep **2 chapters**, not 3, for the closing section.

Reason:

- The thesis roadmap already states that Chapter 6 is the qualitative discussion/evaluation chapter.
- The roadmap already states that Chapter 7 is the conclusion and future work chapter.
- Keeping two chapters avoids churn and keeps the closing structure aligned with the introduction.

## Chapter 6 - Discussion

Chapter 6 should be analytical, balanced, and source-grounded.

### 6.1 What the thesis achieved

Use:

- `GF-01`
- `GF-02`
- `GF-03`
- `GF-04`
- `GF-05`

This subsection should restate the thesis contribution in concrete terms:

- the spatial authoring problem the thesis addresses
- the modular system that was built
- the two representative tasks that were demonstrated
- the fact that the system is task-oriented rather than a full programming language

### 6.2 Where the approach works well

Use:

- `POS-01`
- `POS-02`
- `POS-03`
- `POS-04`
- `POS-05`
- `POS-06`
- `POS-07`

This subsection should highlight:

- modularity and replaceability
- the usefulness of the confirm/start workflow
- the difference between welding and pick-and-place as two complementary strengths
- the practical value of separate graph and program persistence

### 6.3 Limitations and threats to validity

Use:

- `LIM-SCOPE-01`
- `LIM-SCOPE-02`
- `LIM-SCOPE-03`
- `LIM-SENS-*`
- `LIM-ROBOT-*`
- `LIM-UI-*`
- `VAL-*`

This subsection should be the main honest boundary section.

Recommended order:

1. scope and concept limits
2. sensing and calibration
3. scene understanding
4. robot execution and tooling
5. UI and orchestration
6. evaluation boundary

### 6.4 Claims to avoid

Use:

- `AVOID-01`
- `AVOID-02`
- `AVOID-03`
- `AVOID-04`

This subsection should explicitly prevent overclaiming.

## Chapter 7 - Conclusion and Future Work

Chapter 7 should be shorter and more forward-looking than Chapter 6.

### 7.1 Conclusion

Use:

- `GF-01`
- `GF-02`
- `GF-03`
- `GF-04`
- `GF-06`

This subsection should compress the whole thesis into a few sentences:

- what problem was addressed
- what system was built
- what was demonstrated
- what the main takeaway is

### 7.2 Near-term future work

Use:

- `FW-SENS-01`
- `FW-SENS-02`
- `FW-ROBOT-01`
- `FW-ROBOT-02`
- `FW-UI-01`
- `FW-UI-02`

These are the practical engineering improvements closest to the current prototype.

### 7.3 Longer-term directions

Use:

- `FW-INPUT-01`
- `FW-INPUT-02`
- `FW-EVAL-01`
- `FW-EVAL-02`
- `FW-EVAL-03`

These belong in the thesis as future-looking directions, but they should stay clearly separated from the immediate engineering roadmap.

## Tone Guidance

- Chapter 6 should sound like a careful evaluation.
- Chapter 7 should sound like a concise conclusion plus a realistic future agenda.
- Neither chapter should read like a feature list.
- Neither chapter should sound promotional.

## Final Boundary Rule

If a claim can be made only because of user memory or implementation knowledge, do not place it into the thesis draft until it is verified against the source text.

