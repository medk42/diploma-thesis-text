---
artifact_id: 32_ch07_blueprint
stage: S2
status: draft
owner_role: orchestrator
source_files_loaded:
  - summary_5/outputs/21_ch07_evidence_packet.md
  - summary_5/outputs/22_style_reference_packet.md
  - summary_5/outputs/23_compression_map.md
  - summary_5/outputs/24_risk_and_mismatch_register.md
depends_on:
  - summary_5/outputs/30_rewrite_plan_draft.md
outputs_next:
  - summary_5/outputs/34_plan_review_grounding_r1.md
  - summary_5/outputs/35_plan_review_content_r1.md
  - summary_5/outputs/36_plan_review_style_language_r1.md
---

# Ordered Section List

1. `Conclusion`
2. `Near-Term Future Work`
3. `Longer-Term Research Directions`

# Section Purposes

## 1. Conclusion

- Restate the thesis answer once, at prototype scope.
- Name the contribution hierarchy without reopening the Chapter 6 discussion.
- Reaffirm that welding is the clearest fit and pick-and-place is primarily flexibility evidence, but only briefly.

## 2. Near-Term Future Work

- Group the engineering and validation work needed to make the prototype more complete and better characterized.

## 3. Longer-Term Research Directions

- Group broader interaction, validation, and workflow directions that extend the thesis beyond immediate prototype completion.

# Paragraph Plan

## Section 1. Conclusion

### Paragraph 1

- purpose: give the bounded final answer.
- main claim: the thesis shows that selected frequently changing tasks can be authored more directly through in-workspace spatial intent at prototype scope.
- why it matters: this closes the thesis question cleanly.
- source anchors: `GT`.
- preserve vs change: preserve the thesis answer; keep it shorter and cleaner than Chapter 6.

### Paragraph 2

- purpose: state the contribution hierarchy.
- main claim: the main contributions are a reusable use-case boundary and end-to-end workflow for selected tasks, carried by a shared runtime with explicit interfaces and demonstrated on representative tasks.
- why it matters: it tells the reader what should remain after the details fade.
- source anchors: `GT`.
- preserve vs change: preserve the hierarchy; merge repeated architecture phrases into one block.

### Paragraph 3

- purpose: close with the proof-of-concept boundary.
- main claim: the result is feasibility-oriented and qualitative; welding is the clearest practical fit, while pick-and-place mainly demonstrates architectural flexibility.
- why it matters: it ends the conclusion with the correct asymmetry and honesty boundary.
- source anchors: `GT` plus `NGT` tone guidance.
- preserve vs change: preserve the asymmetry; avoid re-explaining mechanism.

## Section 2. Near-Term Future Work

### Paragraph 4

- purpose: group sensing, tracking, and calibration completion work.
- main claim: improved scene understanding, more robust tracking, and better calibration are the first engineering steps because they directly bound the current workflow.
- why it matters: it turns the strongest current limitations into near-term next work.
- source anchors: `GT`.
- preserve vs change: preserve the practical ordering; avoid bug-list style.

### Paragraph 5

- purpose: group execution-layer completion work.
- main claim: tool abstraction, collision checking, simulated execution, and possible robot-side export or compilation are needed to make the prototype workflow more complete.
- why it matters: it keeps execution maturity separate from higher-level research directions.
- source anchors: `GT`.
- preserve vs change: preserve these as engineering work, not claims of readiness.

### Paragraph 6

- purpose: group validation and platform-completion work.
- main claim: broader physical validation, bounded characterization of repeatability or tracking accuracy, cross-platform completion, and compact UI cleanup belong in the near term because they strengthen the current prototype rather than changing the thesis direction.
- why it matters: it keeps validation work concrete and future-facing.
- source anchors: `GT`.
- preserve vs change: preserve the distinction between validation work and established results.

## Section 3. Longer-Term Research Directions

### Paragraph 7

- purpose: group richer human-input modalities.
- main claim: hand tracking, VR or AR controllers, and speech plus gesture are longer-term directions that could expand how spatial intent is authored.
- why it matters: they extend the authoring concept beyond the current pen-based prototype.
- source anchors: `GT/NGT`.
- preserve vs change: preserve them as directions, not commitments.

### Paragraph 8

- purpose: group broader workflow research directions.
- main claim: teach-pendant or controller integration and a formal user study are longer-term questions about how the authoring model fits existing practice; any extension to broader task families should follow those directions, not replace them.
- why it matters: it keeps the thesis connected to real programming practice without overclaiming current support.
- source anchors: `GT/NGT`.
- preserve vs change: preserve the research shape; avoid superiority language.

### Paragraph 9

- purpose: close the chapter with a forward-looking but bounded ending.
- main claim: the prototype provides a bounded basis for further work on use-case-oriented spatial authoring, but broader claims depend on the validation and extensions named above.
- why it matters: it ends with direction rather than hype.
- source anchors: `INF` bounded by `GT`.
- preserve vs change: preserve the modest tone; avoid abstract flourish.

# Conclusion Scope Rules

- Chapter 7 must not repeat Chapter 6 limitation detail.
- Chapter 7 must not re-argue the mechanism of pick-and-place or welding.
- Chapter 7 must remain clearly shorter than Chapter 6.
- Future work must separate `finish the prototype` from `interesting next research`.

# Rules That Keep Chapter 7 Shorter And Cleaner

- One thesis-answer paragraph.
- One contribution-hierarchy paragraph.
- One proof-of-concept/asymmetry paragraph.
- Three grouped future-work paragraphs maximum before the broader directions.
- No long recap lists, feature inventories, or repeated architecture justification.

# Must-Avoid Wording

- `OPEN`: any claim that the future work is already validated
- `OPEN`: bug-list presentation
- `OPEN`: Chapter 6-style detailed discussion in the conclusion
- `OPEN`: unsupported comparison or readiness language

# Grounding

- `GT`: all paragraph jobs are synthesized from [21_ch07_evidence_packet.md](/c:/dev/diploma-thesis/diploma-thesis-text/summary_5/outputs/21_ch07_evidence_packet.md), [23_compression_map.md](/c:/dev/diploma-thesis/diploma-thesis-text/summary_5/outputs/23_compression_map.md), and [24_risk_and_mismatch_register.md](/c:/dev/diploma-thesis/diploma-thesis-text/summary_5/outputs/24_risk_and_mismatch_register.md).
- `GT`: style constraints come from [22_style_reference_packet.md](/c:/dev/diploma-thesis/diploma-thesis-text/summary_5/outputs/22_style_reference_packet.md).
