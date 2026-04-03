---
artifact_id: 24_risk_and_mismatch_register
stage: S1
status: complete
owner_role: planning_sub_agent
source_files_loaded:
  - summary_5/00_master_workflow.md
  - summary_5/01_stage_map.md
  - summary_5/02_artifact_schema.md
  - summary_5/03_context_packets.md
  - summary_5/04_validation_rules.md
  - summary_5/05_quality_gates.md
  - summary_5/06_risk_register.md
  - summary_5/outputs/10_run_manifest.md
  - summary_5/outputs/11_source_priority_map.md
  - introduction.tex
  - ch06_discussion.tex
  - ch07_conclusion_future_work.tex
  - summary_2/expert_description.txt
  - summary_2/context/03_author_intent_handoff.md
  - summary_2/context/01_safe_vs_risky_claims.md
depends_on:
  - summary_5/outputs/10_run_manifest.md
  - summary_5/outputs/11_source_priority_map.md
outputs_next:
  - summary_5/outputs/30_rewrite_plan_draft.md
  - summary_5/outputs/31_ch06_blueprint.md
  - summary_5/outputs/32_ch07_blueprint.md
  - summary_5/outputs/33_cross_chapter_rules.md
---

# Risk And Mismatch Register

## Grounding

- `GT`: `introduction.tex` frames the thesis around reducing reprogramming friction for frequently changing tasks by authoring spatial intent in the real workspace, and the closing chapters must stay tied to that question.
- `GT`: `ch06_discussion.tex` treats the result as an end-to-end prototype with explicit limits, qualitative evaluation only, and no claim of production readiness.
- `GT`: `ch07_conclusion_future_work.tex` states that the thesis demonstrates feasibility and architectural coherence, not measured superiority or broad industrial readiness.
- `NGT`: `summary_2/expert_description.txt` wants Chapter 6 to emphasize what was built, what the results mean, where the approach is useful, and what the thesis contributes, while keeping the tone modest.
- `NGT`: the same source wants pick-and-place framed as a flexibility demonstration and welding framed as the strongest practical fit.
- `NGT`: the same source wants near-term engineering future work separated from longer-term research directions.
- `INF`: the rewrite should preserve architecture as meaningful through use cases and workflow, not as a self-justifying result.
- `OPEN`: no source loaded here provides quantitative throughput, precision, or user-study evidence, so those claim families must stay out unless later evidence is added.

## Conflicts Between Source Types

- `GT` vs `NGT`: the expert notes push the discussion toward stronger statements about what the system enables in practice, but the chapters themselves are stricter and keep the result at prototype, feasibility, and qualitative-evaluation level. Later prose must keep usefulness interpretive and qualified.
- `GT` vs `NGT`: the expert notes favor a discussion that feels like "what we brought to the world," while the chapter text warns against production, commercial, or superiority claims. The later rewrite should keep the benefit statement, but only as a bounded interpretation of the prototype.
- `GT` vs `NGT`: the expert notes want future work to stay academically interesting and not collapse into small bug-fix tickets, while `ch07_conclusion_future_work.tex` explicitly includes near-term engineering completion items such as sensing, scene pipeline, execution, and cross-platform robustness. The register should preserve both, but keep the engineering items compact and clearly separate from longer-term directions.
- `GT` vs `NGT`: the expert notes allow human-robot-cooperation framing only as a careful interpretation, whereas the source chapters avoid science-fiction language. Any assistant-like framing must be softened into human-in-the-loop workflow language.
- `GT` vs workflow docs: `summary_5/00_master_workflow.md` and `summary_5/01_stage_map.md` describe packet names without the `/outputs/` prefix, while `summary_5/outputs/10_run_manifest.md` normalizes the generated outputs under `summary_5/outputs/`. Treat this as a path-resolution detail for the workflow, not as a thesis-content issue.

## Likely Overclaim Risks

- `GT`/`OPEN`: avoid any claim of industrial readiness, commercial readiness, or "real deployment" unless it is explicitly softened; the chapter text already says the prototype is not a production platform.
- `GT`/`OPEN`: avoid exact speed claims such as "30 seconds to teach a weld" unless later evidence is loaded; current sources only support qualitative friction reduction.
- `GT`/`OPEN`: avoid exact precision, repeatability, or global-accuracy claims for pen tracking, scene detection, or the combined workflow; the thesis only supports a qualitative feasibility statement.
- `NGT`/`OPEN`: avoid saying pick-and-place proves broad dynamic programming capability; the expert notes and the chapter text both restrict it to a flexibility demonstration.
- `NGT`/`OPEN`: avoid saying welding is universally ideal; the safest supported wording is that welding is the clearest current fit, especially in small-batch or frequently re-taught settings.
- `NGT`/`OPEN`: avoid language that makes the system sound like a replacement for teach pendant programming, offline programming, or industrial integrators.
- `INF`: if the later plan wants to say the system reduces setup friction, that should remain a plausible inference from the prototype, not a measured improvement.

## Likely Repetition Risks

- `GT`: Chapter 6 already repeats the modular-runtime story across the main result, task fit, and where the approach works well. The plan should merge those repetitions or give each one a distinct job.
- `GT`: the prototype boundary and qualitative-evaluation boundary appear in multiple places in both chapters. Keep them once in the main limitations/evaluation sections, not as generic disclaimers in every paragraph.
- `NGT`: pick-and-place can easily be repeated as "flexibility demo" in more than one section. Keep one strong explanation and let later mentions be shorter.
- `NGT`: welding can also be repeated as "best fit" in both discussion and conclusion. The conclusion should refer back briefly, not restate the whole argument.
- `INF`: Chapter 7 already has a near-term/long-term split; if the rewrite adds another internal split without a new purpose, it will read repetitive rather than clearer.

## Missing-Evidence Risks

- `OPEN`: no formal user study is available in the loaded sources, so any claim about user preference, usability improvement, or workflow efficiency beyond qualitative interpretation must be withheld or softened.
- `OPEN`: no controlled comparison against teach pendant or offline programming is available here, so superiority claims are unsupported.
- `OPEN`: no quantitative tracking characterization is available here, so claims about stability, accuracy, or repeatability should remain limited to what the chapters already state.
- `OPEN`: any detailed claim about Linux BLE behavior, camera acquisition portability, or UI failure modes should stay tied to the exact chapter wording unless a dedicated source is loaded later.
- `OPEN`: the source packet does not justify turning the future-work section into a roadmap with estimated effort, implementation order, or research ranking beyond the author-intent guidance.

## Unresolved Questions To Avoid Or Soften

- `OPEN`: whether the thesis should say the system is "more practical" than existing tooling. Use "different trade-off" or "may be useful for" instead.
- `OPEN`: whether the system should be described as a "reusable task-package layer" or a similar deployment metaphor. That is an inference, not a source fact, so keep it soft.
- `OPEN`: whether "explicit module boundaries" needs to appear as a conclusion phrase. If the wording does not help the reader, drop it rather than explaining it vaguely.
- `OPEN`: whether "scene-adaptive execution" is reader-friendly enough. If it is used, it must be defined; otherwise prefer plainer thesis vocabulary.
- `OPEN`: whether the future-work section should foreground low-level engineering cleanup or higher-level research directions. The safest answer is both, but with the cleanup items compressed and the research directions given more room.
- `OPEN`: whether analogies to a human assistant or sci-fi-style cooperative robot should remain in the thesis prose. They should not appear literally unless they are heavily softened into a bounded workflow interpretation.

## Routing Advice For Later Gates

- `S2 planning`: mark every major claim as `GT`, `NGT`, `INF`, or `OPEN` before writing any blueprint; if a claim only comes from author intent, keep it in `NGT` and soften it.
- `S2 planning`: keep Chapter 6 focused on interpretation, usefulness, and limits; keep Chapter 7 focused on concise conclusion plus two-tier future work.
- `S3 plan review`: fail the plan if Chapter 7 starts repeating Chapter 6 at the same level of detail, or if the plan cannot distinguish near-term engineering work from longer-term directions.
- `S4 writer briefs`: require writers to load the thesis chapters and the safe/risky claim guide, then explicitly ban production-readiness, superiority, and timing claims.
- `S6 truth review`: prioritize removal or softening of any unsupported hard claim before style or compression work.
- `S6 content review`: check that pick-and-place stays a flexibility demonstration and welding stays the clearest practical fit.
- `S7 revision`: if a mismatch changes claim strength, truth wins; do not "smooth" the claim back into a stronger form.
- `S7 revision`: if the future-work section starts reading like a bug list, route back to content planning rather than polishing the wording.

