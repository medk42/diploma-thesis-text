# Issue E: Future Work Evidence Pack

This pack is for rewriting `ch07_conclusion_future_work.tex` so that the future-work section feels like a thesis-level continuation of the argument in the introduction, analysis, system design, implementation, and discussion chapters.

The main editorial rule is not to restate every limitation as future work. The chapter should instead separate:
- near-term engineering completion of the prototype,
- technically grounded sensing / execution improvements,
- and longer-term research directions that are genuinely interesting on their own.

## 1. Issue definition

The current Chapter 7 is structurally sound but too compressed for the rest of the thesis. It already has the right high-level split into conclusion, near-term future work, and longer-term directions, but the content is too thin relative to how much technical material Chapters 2-5 establish.

The thesis itself gives a clear foundation for future work:
- the introduction frames the work as spatial authoring for frequently changing tasks, not a general robot programming language (`introduction.tex:4-8`, `introduction.tex:54-63`),
- the analysis explicitly commits to a modular architecture and open-ended replacement of sensing / UI / robot / use-case components (`ch02_analysis.tex:481-505`),
- the implementation chapter exposes concrete prototype boundaries that are legitimate future-work targets, especially sensing robustness, tool abstraction, simulation, and portability (`ch04_implementation.tex:11-17`, `ch04_implementation.tex:164-166`, `ch04_implementation.tex:245-246`, `ch04_implementation.tex:531-535`, `ch04_implementation.tex:623-628`, `ch04_implementation.tex:640-653`),
- the discussion chapter already interprets the scope boundary correctly: prototype-level result, qualitative evaluation, narrow scene model, and limited physical validation (`ch06_discussion.tex:29-39`),
- the current Chapter 7 already contains a useful skeleton, but it does not yet exploit the available evidence (`ch07_conclusion_future_work.tex:5-27`).

The user guidance in this conversation is important, especially the high-level rewrite brief in `summary_2/expert_description.txt:1-5`:
- keep the chapter connected to the introduction, not a separate “future ideas” appendix,
- distinguish what is a genuine next research topic from what is merely an implementation defect,
- avoid sales language and avoid phrases that are too abstract to be meaningful to a reader who has not just read Chapters 3-5,
- keep Chapter 7 shorter than Chapter 6, but not abruptly short.

## 2. Near-term engineering future work

This subsection should be the “prototype maturation” layer. It should not sound like random maintenance tasks; it should sound like the work needed to turn the demonstrated system into a more robust research platform.

Strong evidence:
- The current system is explicitly a prototype with a bounded scope, not a validated industrial platform (`ch06_discussion.tex:37-39`, `ch07_conclusion_future_work.tex:9`).
- The implementation chapter already names concrete limitations that naturally become near-term future work: Windows-only camera acquisition, Linux BLE caveat, no IMU fusion, no collision checking, no simulation mode, simulated tool actions, and fragile scene understanding (`ch04_implementation.tex:12-17`, `ch04_implementation.tex:61`, `ch04_implementation.tex:78`, `ch04_implementation.tex:165-166`, `ch04_implementation.tex:193-197`, `ch04_implementation.tex:531-535`, `ch04_implementation.tex:623-628`, `ch04_implementation.tex:640-653`).
- The conclusion already names the right near-term topics at a high level: scene/sensing, execution, and cross-platform support (`ch07_conclusion_future_work.tex:11-17`).

What to include:
- better cross-platform support for the acquisition stack,
- a stronger capture / calibration workflow,
- better use of available sensing data where it is already present,
- more explicit motion validation and safer planning in the execution layer,
- a better tool-control abstraction instead of fixed delays.

What to say carefully:
- do not present these as “interesting research ideas” first,
- present them as the engineering work needed to remove the sharp edges of the prototype,
- but do not collapse the section into a checklist of bugs.

Useful thesis anchors:
- `ch04_implementation.tex:11-17`
- `ch04_implementation.tex:61`
- `ch04_implementation.tex:78`
- `ch04_implementation.tex:165-166`
- `ch04_implementation.tex:193-197`
- `ch04_implementation.tex:531-535`
- `ch04_implementation.tex:623-628`
- `ch04_implementation.tex:640-653`
- `ch07_conclusion_future_work.tex:11-17`

## 3. Sensing and scene future work

This is the strongest “near-term but still research-relevant” area. It should be phrased as improving the system’s ability to ground spatial input in the workspace, not as a generic “better sensor” wish list.

Evidence from the thesis:
- The whole thesis starts from the idea that spatial input should be grounded in external sensing (`introduction.tex:8`, `introduction.tex:37-42`, `introduction.tex:56-63`).
- The analysis explicitly compares hand tracking, VR/AR controllers, and fiducial marker tracking, which gives legitimate future directions for alternative sensing modalities (`ch02_analysis.tex:113-152`).
- Scene detection is intentionally simple and box-based; it provides only object IDs and poses, with no uncertainty model (`ch03_system_design.tex:1303-1360`).
- The implementation uses a narrow fiducial-box model, single-frame `READ_SCENE`, and no temporal stabilization (`ch04_implementation.tex:326-377`).
- The discussion chapter already identifies scene understanding as the most important limitation (`ch06_discussion.tex:31`).

What should be in the future-work section:
- better pen tracking robustness, especially better use of the IMU that is already on the device,
- alternative input modalities that the analysis already frames as viable candidates,
- stronger scene estimation beyond the current box model,
- uncertainty or confidence outputs for detections,
- temporal filtering or aggregation instead of only single-shot scene reads,
- a richer object model if the thesis is later extended toward more complex workpieces.

What should not dominate the section:
- “better camera” phrasing by itself,
- isolated algorithm names without connection to the thesis architecture,
- a narrow hardware-shopping list.

Useful thesis anchors:
- `introduction.tex:8`, `introduction.tex:37-42`, `introduction.tex:56-63`
- `ch02_analysis.tex:113-152`
- `ch03_system_design.tex:1303-1360`
- `ch04_implementation.tex:76-79`
- `ch04_implementation.tex:84-86`
- `ch04_implementation.tex:220-239`
- `ch04_implementation.tex:326-377`
- `ch06_discussion.tex:31-33`
- `ch07_conclusion_future_work.tex:13`

## 4. Execution and robot/tool abstraction future work

This should be the second engineering block after sensing. It is the layer that makes the thesis look more complete as a robot system, not just as an interaction system.

Evidence:
- The analysis says the robot interface must be robot-agnostic and support motion primitives while treating tool control as a harder cross-platform problem (`ch02_analysis.tex:427-439`).
- The system design makes the same boundary explicit: motion is implemented, tool control is out of scope, and the execution interface is intentionally small and standardized (`ch03_system_design.tex:1205-1295`).
- The implementation confirms that tool actions in the use cases are simulated by fixed delays, collision checking is absent, and simulation mode is rejected (`ch04_implementation.tex:431-435`, `ch04_implementation.tex:531-535`, `ch04_implementation.tex:624-628`, `ch04_implementation.tex:640-653`).
- Motion primitives already exist as a useful compatibility layer (`ch04_implementation.tex:634-688`).

What to include:
- a generalized tool-control abstraction,
- better motion validation and safer planning,
- collision checking,
- optional compilation/export to robot-side programs for tasks that do not need runtime scene adaptation,
- clearer treatment of when runtime execution is the right abstraction and when export is better.

Important nuance:
- This should not be sold as “make everything industrial-ready” text.
- It should be framed as extending the current robot-control layer from a minimum viable motion backend into a more robust execution substrate.

Useful thesis anchors:
- `ch02_analysis.tex:427-439`
- `ch03_system_design.tex:1205-1295`
- `ch04_implementation.tex:43-45`
- `ch04_implementation.tex:419-437`
- `ch04_implementation.tex:431-435`
- `ch04_implementation.tex:531-535`
- `ch04_implementation.tex:623-628`
- `ch04_implementation.tex:634-688`
- `ch07_conclusion_future_work.tex:15-17`

## 5. Interaction and frontend future work

This is the strongest “longer-term direction” category. It should feel like an extension of the thesis’ core idea, not a deviation from it.

Evidence:
- The introduction already frames the work as AR-inspired spatial authoring in the real workspace (`introduction.tex:8`, `introduction.tex:35-43`).
- The analysis explicitly considers hand tracking, VR/AR controllers, and AR/VR UI integration as alternative component choices (`ch02_analysis.tex:113-152`, `ch02_analysis.tex:441-466`).
- The related-work chapter explicitly positions multimodal gesture + language as a promising future direction (`ch01_background.tex:51-55`).
- The system design says the UI is intentionally a prototype frontend and that the system could be embedded into richer workflows later (`ch03_system_design.tex:1416-1467`, `ch03_system_design.tex:1484-1545`).
- The conclusion already mentions hand tracking, VR/AR controllers, and multimodal interaction (`ch07_conclusion_future_work.tex:21-23`).

What to include:
- alternative 6DoF inputs such as hand tracking or VR/AR controllers,
- multimodal interaction combining gesture and speech,
- deeper integration with a teach pendant or controller workflow,
- a frontend that is less of a separate prototype and more part of a conventional robot-programming environment.

How to keep the tone right:
- Present these as directions that extend the thesis concept, not as “nice to have UI upgrades.”
- Tie them back to the idea that the user should specify spatial intent while the system handles the task-specific internal structure.
- Avoid generic claims that these technologies are simply “better.”

Useful thesis anchors:
- `introduction.tex:8`, `introduction.tex:35-43`
- `ch01_background.tex:51-55`
- `ch02_analysis.tex:113-152`
- `ch02_analysis.tex:441-466`
- `ch03_system_design.tex:1416-1467`
- `ch03_system_design.tex:1484-1545`
- `ch07_conclusion_future_work.tex:21-23`

## 6. Evaluation future work

This should be one of the most important future-work blocks, because the thesis currently provides a strong prototype and workflow demonstration but not a formal evaluation regime.

Evidence:
- The introduction already says the thesis aims to “explore and validate” the approach (`introduction.tex:69-73`).
- The discussion explicitly says the evaluation boundary is qualitative and workflow-oriented, with no formal user study, no pendant baseline, and no quantitative tracking characterization (`ch06_discussion.tex:37-39`).
- The conclusion repeats that the thesis is a proof of concept rather than a validated industrial platform (`ch07_conclusion_future_work.tex:5-9`).
- The related-work chapter gives a useful comparison point because Müller et al. report a user study for offline programming, while Vysocký et al. report participant-based timing and accuracy comparisons (`ch01_background.tex:37-49`).

What to include:
- a formal user study,
- timing / workflow comparison against pendant and offline workflows,
- quantitative evaluation of tracking and scene estimation,
- repeatability / robustness characterization,
- broader physical testing outside a controlled prototype setup.

What to avoid:
- overstating that a user study is the only missing thing,
- phrasing the thesis as if it had already completed the evaluation and only needed a final benchmark table.

Useful thesis anchors:
- `introduction.tex:69-73`
- `ch01_background.tex:37-49`
- `ch06_discussion.tex:37-39`
- `ch07_conclusion_future_work.tex:25`

## 7. Broader applicability and use-case exploration

This section should be the “why this matters beyond the prototype” part. It should stay academic, not commercial, but it can still point to broader application spaces.

Evidence:
- The introduction already justifies the work using frequently changing tasks and low-volume / changeover-heavy work (`introduction.tex:4-8`, `introduction.tex:58-63`).
- The analysis explicitly introduced painting and motion primitives as additional plausibility checks, not formal proofs of generality (`ch02_analysis.tex:16-20`, `ch02_analysis.tex:83-89`).
- The discussion says the approach is most useful where robot execution is worthwhile but the concrete task changes often enough that low-level reprogramming dominates cost (`ch06_discussion.tex:23-27`).
- The discussion also distinguishes specialized one-customer use cases from more generic multi-deployment use cases (`ch06_discussion.tex:25-27`).
- The conclusion suggests extending the system toward richer welding, dispensing, and surface-processing workflows (`ch07_conclusion_future_work.tex:27`).

What to include:
- richer welding scenarios,
- dispensing / surface processing / other human-in-the-loop workflows,
- more complex use cases than the current demos,
- exploration of where the system sits between very specific fixed-task integration and very general robot programming.

What to keep careful:
- Pick-and-place should not be presented as the strongest industrial beneficiary.
- The thesis should not claim broad generality from only two demonstrations.
- This section should feel like a thoughtful exploration of scope, not a sales expansion plan.

Useful thesis anchors:
- `introduction.tex:4-8`, `introduction.tex:58-63`
- `ch02_analysis.tex:16-20`, `ch02_analysis.tex:83-89`
- `ch06_discussion.tex:19-27`
- `ch07_conclusion_future_work.tex:27`

## 8. What should stay out of the main future-work spotlight

This is the “do not waste the reader’s time” filter.

Do not make these the headline of Chapter 7:
- Linux camera support by itself,
- a pure bug-fix list,
- “use a better camera” without a thesis-level reason,
- low-level calibration housekeeping unless it is framed as part of a broader sensing question,
- implementation nits that do not open a real research or engineering trajectory.

Why:
- The user explicitly wants future work that feels like a credible next step, not a dump of unfinished tasks.
- The thesis already has enough detail to support more interesting framing.
- A future-work section that foregrounds trivialities makes the conclusion feel weaker than the rest of the thesis.

What to demote rather than highlight:
- Windows-only camera acquisition (`ch04_implementation.tex:164-166`),
- Linux BLE caveat (`ch04_implementation.tex:16`),
- box-only scene model as a blunt future-work headline (`ch03_system_design.tex:1355-1360`),
- the absence of simulation as a headline by itself (`ch04_implementation.tex:535`, `ch04_implementation.tex:628`, `ch04_implementation.tex:640`).

These items still belong in the chapter, but as evidence that motivates the more substantial near-term work.

## 9. Recommended Chapter 7 structure

Use this structure:

1. `Conclusion`
   - Close the thesis question directly.
   - State that the system supports selected task-oriented workflows, not general robot programming.
   - Explicitly name the modular runtime as the main contribution.
   - State the practical asymmetry: seam welding is the strongest fit, pick-and-place is more of an architectural demonstration.

2. `Near-Term Future Work`
   - Split into one compact paragraph for sensing/scene robustness and one for execution/tool abstraction.
   - Mention cross-platform support here only as completion work.
   - Mention simulation, collision checking, motion validation, and tool abstraction here.

3. `Longer-Term Directions`
   - Put the more interesting research work here.
   - Include alternative 6DoF input, multimodal gesture + speech, teach-pendant integration, formal evaluation, and broader use-case exploration.

This structure matches the user’s requested distinction between engineering completion and academically interesting extensions.

Why this structure fits the thesis:
- It mirrors the thesis’ flow from question -> system -> validation -> boundaries -> extensions.
- It keeps the chapter readable for someone who only has the introduction and conclusion in mind.
- It avoids repeating Chapter 6.

## 10. Suggested wording blocks

These are not final prose. They are phrasing targets to guide the rewrite.

### Conclusion block
Use a sentence like:
- The thesis shows that spatial intent in the real workspace can support selected collaborative-robot workflows when combined with explicit sensing, interpretation, and execution infrastructure.

Then follow with:
- The strongest result is not a single input device, but the reusable modular runtime and use-case boundary that lets different task families share the same acquisition and execution stack.

Then make the scope boundary explicit:
- The result is a proof of concept for task-oriented spatial authoring, not a general replacement for industrial robot programming.

### Near-term future work block
Use a paragraph that groups prototype completion work:
- The clearest next steps are to make the sensing stack more robust, improve the execution layer, and complete the cross-platform boundary so the prototype behaves more consistently across supported environments.

Then add specifics:
- That includes better use of the pen’s available IMU data, stronger scene estimation, collision checking, motion validation, and a clearer abstraction for tool control.

### Longer-term directions block
Use a paragraph that opens up the research space:
- Beyond prototype completion, the thesis points toward richer interaction and a broader integration of spatial authoring into established robot-programming workflows.

Then mention concrete directions:
- hand tracking or VR/AR controllers,
- multimodal gesture and speech,
- teach-pendant or controller integration,
- formal user studies and quantitative evaluation,
- richer welding, dispensing, and surface-processing use cases.

### Scope/filtering block
Use a cautionary sentence like:
- Not every unresolved implementation detail deserves equal prominence in the future-work discussion; the chapter should emphasize directions that open a meaningful next research step or materially improve the thesis platform.

This line is useful because it justifies keeping Linux support / box-model cleanup in the background rather than making them the main attraction.

### Guarded applicability block
Use a careful scope sentence:
- The present system appears most useful for tasks that are repetitive enough to justify robot execution but change often enough that repeated low-level reprogramming is the dominant cost.

This stays aligned with `ch06_discussion.tex:23-27` and avoids the kind of broad product-style claim the user warned against.

## Style notes for the rewrite

- Keep the thesis voice concrete and technical, not promotional.
- Prefer “this suggests” / “this indicates” / “this is a natural next step” over stronger claims.
- Do not introduce new jargon unless the thesis already uses it.
- Do not say “box-based model” without explanation; if used at all, tie it back to the actual scene model in plain words.
- Avoid making the future-work section feel like a list of random engineering tickets.
- Avoid long explanations of obvious limitations where the chapter can instead point to a broader direction.

## Safe claims

- The thesis identifies a technically coherent direction for task-oriented spatial authoring.
- The prototype demonstrates that the approach works for selected workflows on a real robot.
- The current system is most promising where a prepared use case is reused and the concrete task instance changes often.
- The near-term future work is mainly about completing and hardening the prototype.
- The longer-term directions are richer interaction, better evaluation, and broader applicability.

## Claims to avoid

- That the thesis already validates industrial deployment.
- That the current prototype is close to a full robot programming language.
- That pick-and-place is the strongest industrial application.
- That one hardware limitation alone explains the future-work agenda.
- That the future-work section should read like a bug tracker.
