---
artifact_id: 11_source_priority_map
stage: S0
status: locked
owner_role: orchestrator
source_files_loaded:
  - summary_5/00_master_workflow.md
  - summary_5/02_artifact_schema.md
  - summary_5/03_context_packets.md
  - summary_5/04_validation_rules.md
  - summary_5/05_quality_gates.md
  - summary_5/06_risk_register.md
depends_on:
  - summary_5/outputs/10_run_manifest.md
outputs_next:
  - summary_5/outputs/20_ch06_evidence_packet.md
  - summary_5/outputs/21_ch07_evidence_packet.md
  - summary_5/outputs/22_style_reference_packet.md
  - summary_5/outputs/23_compression_map.md
  - summary_5/outputs/24_risk_and_mismatch_register.md
---

# Source Precedence

1. Thesis `.tex` files are ground truth for facts, implemented behavior, scope, terminology, evaluation boundaries, and stated limitations.
2. `summary_2/expert_description.txt` is near-ground-truth for intended meaning, discussion emphasis, chapter perspective, and preferred framing.
3. `summary_2/context/*`, `summary_2/style/*`, and comparable guidance files may shape wording and emphasis but do not create facts.
4. Earlier summary folders are process aids only and may not override thesis source files.

# Claim-Label Rules

- `GT`: directly grounded in thesis `.tex`
- `NGT`: near-ground-truth framing from `summary_2/expert_description.txt`
- `INF`: careful inference compatible with thesis `.tex`
- `OPEN`: unresolved or unsupported

`OPEN` may appear in planning artefacts. It may not survive into final chapter prose or final validation.

# Conflict-Resolution Rule

- If `summary_2/expert_description.txt` conflicts with thesis `.tex`, the written chapter text must follow the `.tex` files.
- Any meaningful tension between `.tex` and `summary_2/expert_description.txt` must be logged in the risk/mismatch artefacts.
- Truth validation outranks content, style, clarity, and compression.

# Validation Priority

1. Truth
2. Content coverage and emphasis
3. Clarity
4. Thesis voice and style
5. Compression quality

# Prior Summary Material Allowed As Inspiration Only

- `summary_2/`
- `summary_3/`
- `summary_4/`

# Run-Specific Enforcement Notes

- Writers and reviewers must cite the source files they actually loaded.
- Review work must remain split by lane when the workflow requires distinct truth, content, style, or language checks.
- If a worker expands its context beyond the assigned packet, it must report the extra files it loaded.

# Grounding

- `GT`: source order, claim labels, truth-first validation, and conflict handling come from `summary_5/00_master_workflow.md`, `summary_5/02_artifact_schema.md`, `summary_5/03_context_packets.md`, `summary_5/04_validation_rules.md`, and `summary_5/05_quality_gates.md`.
- `GT`: the risk of hidden context expansion and collapsed review lanes comes from `summary_5/06_risk_register.md`.

