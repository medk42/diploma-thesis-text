# Issue Definition

The problem is not that Chapters 6 and 7 are incorrect in isolation. The problem is that they are too compressed relative to the rest of the thesis, so they do not fully close the loop opened in the introduction and developed through Chapters 2 to 5. The rewrite needs to make the last two chapters feel like the thesis is finishing its argument, not just summarizing a prototype.

The core task is to keep the existing factual basis, but expand and reorganize it so the chapters:
- explicitly connect back to the thesis question and goals,
- explain what the system actually contributes beyond a pen demo,
- state the real limitations without turning into a bug list,
- distinguish prototype boundaries from broader research directions,
- and preserve the thesis voice rather than sliding into generic AI-summary prose.

The user also wants the result to read sensibly if someone remembers only the introduction. That means the discussion and conclusion must reuse the same conceptual vocabulary and sequence already established in the thesis: spatial authoring, task-oriented use cases, shared runtime, sensing, interpretation, execution, and the two representative tasks. See `introduction.tex:35-56`, `introduction.tex:69-94`, `ch03_system_design.tex:18-37`, `ch05_user_workflow.tex:4-9`.

# Style Traits to Preserve from the Thesis

- Start from a clear thesis question, then narrow scope carefully. The introduction does this well: it opens with the practical robot-programming friction and then defines spatial authoring as the response. See `introduction.tex:4-8`, `introduction.tex:29-36`.
- Use explicit but modest claims. The thesis repeatedly qualifies the work as a prototype or current implementation when that is the correct level of certainty. See `ch04_implementation.tex:5-23`, `ch06_discussion.tex:7-11`, `ch07_conclusion_future_work.tex:5-9`.
- Favor structured explanation over rhetorical flourish. Chapter 3 is a good model: it names a concept, explains its role, then shows how it fits into the architecture. See `ch03_system_design.tex:18-37`.
- Keep the prose operational when discussing the workflow. Chapter 5 is concrete, procedural, and readable because it names actions, states, and prerequisites directly. See `ch05_user_workflow.tex:15-34`, `ch05_user_workflow.tex:65-103`, `ch05_user_workflow.tex:230-280`.
- Maintain the thesis habit of distinguishing what is central from what is out of scope. This is especially important for the final chapters because they need to sound like a careful evaluation, not a marketing summary. See `ch02_analysis.tex:109-111`, `ch03_system_design.tex:1101-1110`, `ch04_implementation.tex:449-450`.
- Reuse the same key terms that the thesis has already established. Do not invent new labels unless they are necessary and immediately defined. The existing terminology is already strong enough: spatial authoring, use case, modular runtime, robot execution interface, scene detection, limited trials, proof of concept. See `introduction.tex:35-56`, `ch03_system_design.tex:851-858`, `ch06_discussion.tex:9-11`.

# Tonal Pitfalls to Avoid

- Do not write Chapter 6 as a summary of the thesis chapters in chronological order. The discussion should interpret results, not retell the table of contents.
- Do not use sales-pitch language. The user explicitly objected to wording that sounded like hype or a detached AI summary.
- Do not lead with abstract claims such as "complementary strengths" unless the text immediately explains what those strengths are in practical terms.
- Do not overstate industrial readiness. The thesis is a prototype with limited physical trials, simple scene understanding, and missing execution features. See `ch06_discussion.tex:31-37`, `ch07_conclusion_future_work.tex:9-17`.
- Do not introduce new vocabulary simply to sound more polished. If a concept is already available in the thesis, use that term instead.
- Do not make Chapter 7 longer than needed. It should be shorter and cleaner than Chapter 6, not another discussion chapter.
- Do not let future work become a loose wishlist. It needs structure and an academic rationale.

# How Chapter 6 Should Be Structured

Chapter 6 should be the main interpretive chapter. It should feel like the place where the thesis answers: what did we actually build, what does it show, and where does it stop?

Recommended structure:
- Section 1: what the thesis built.
- Section 2: what the results mean.
- Section 3: current limitations and validity boundary.

The current section names are already close to the right structure, so the rewrite should preserve them unless a section split is needed. The important change is depth and ordering inside each section, not a wholesale rename. See `ch06_discussion.tex:5-39`.

For Section 1, make the modular runtime and explicit interfaces visible as the actual contribution, not just the interaction technique. The section should say that the thesis produced an end-to-end system with graph construction, activation, calibration, authoring, confirmation, execution, visualization, and persistence. That is the strong thesis-level result. See `ch06_discussion.tex:7-11`, `ch03_system_design.tex:18-37`, `ch03_system_design.tex:1408-1467`.

For Section 2, the chapter should connect the built system back to the thesis goals without turning into a checklist. A good pattern is:
- state the practical result,
- explain how it shifts work away from teach pendant/offline programming,
- explain why the modular architecture matters,
- then use pick-and-place and welding to show the difference in task fit.

This is where the asymmetry matters:
- Pick-and-place proves that the system can rebind intent to current scene state at execution time, but it is not the strongest practical fit for the current prototype. See `ch04_implementation.tex:505-535`, `ch05_user_workflow.tex:298-344`, `ch06_discussion.tex:19-20`.
- Seam welding is the clearest current fit because it is trajectory-centric and aligns with the thesis motivation about repeated re-teaching. See `ch04_implementation.tex:582-628`, `ch05_user_workflow.tex:230-280`, `ch06_discussion.tex:21-27`.

For Section 3, the limitations need to be grouped by type, not dumped as a single paragraph. The section should make clear that the thesis establishes a prototype-level result with a qualitative evaluation boundary. See `ch06_discussion.tex:29-39`.

Good limitation groups for Chapter 6:
- scope limitations: not a general programming language, no branching or loops, use-case driven by design. See `introduction.tex:54-56`, `ch03_system_design.tex:1465-1466`.
- sensing and calibration limits: marker visibility, blur, lighting, rigid mount dependence, no IMU fusion. See `ch04_implementation.tex:78-79`, `ch04_implementation.tex:244-245`, `ch06_discussion.tex:33-33`.
- scene-understanding limits: registry-defined fiducial boxes, single stereo pair per `READ_SCENE`, no confidence or covariance. See `ch04_implementation.tex:344-377`, `ch03_system_design.tex:1355-1360`.
- execution limits: tool actions simulated, no collision checking, no simulation mode. See `ch04_implementation.tex:434-435`, `ch04_implementation.tex:531-535`, `ch04_implementation.tex:623-628`.
- validation limits: mostly qualitative, limited physical trials, no formal user study, no baseline comparison. See `ch06_discussion.tex:37-39`.

The section should end by making the validity boundary explicit: what is established, what is only suggested, and what remains open.

# How Chapter 7 Should Be Structured

Chapter 7 should be a clean closure, not a second discussion. It should be shorter than Chapter 6 and should do three things:
- close the thesis conclusion,
- name the main contribution clearly,
- and separate near-term engineering work from longer-term research directions.

Recommended structure:
- Section 1: conclusion.
- Section 2: near-term future work.
- Section 3: longer-term directions.

The current structure is already suitable. The rewrite should focus on making each section more concrete and better ordered. See `ch07_conclusion_future_work.tex:3-27`.

In the conclusion section, use a simple three-step arc:
- restate the thesis question,
- state the actual contribution in one sentence,
- then say what the thesis does and does not prove.

The main conclusion should not sound like an executive summary. It should sound like the end of a thesis argument. The best supported conclusion is that the system demonstrates a technically coherent and practically interesting direction for task-oriented spatial authoring, especially for selected workflows, but not a validated industrial replacement. See `ch07_conclusion_future_work.tex:5-9`.

Near-term future work should cover engineering completion and prototype maturation. This is the right place for:
- improving the current scene and sensing pipeline,
- improving calibration robustness,
- using the pen-side sensing more fully,
- adding better tool control,
- motion validation and collision checking,
- simulation support,
- export or compilation for fixed tasks,
- cross-platform completion where it is currently incomplete.

Keep this section practical and specific. It should read like the remaining work needed to turn the prototype into a more complete system, not like speculative research directions. See `ch07_conclusion_future_work.tex:13-17`.

Longer-term directions should feel more like research opportunities:
- richer interaction such as hand tracking or VR/AR controllers,
- multimodal gesture-plus-speech interaction,
- integration with established robot-programming workflows,
- formal evaluation and user studies,
- broader task exploration beyond the current demonstrations.

This section should reflect the user’s distinction between "basic missing engineering" and "interesting next research step." The future work should be academically meaningful, not just a backlog of fixes. See `ch07_conclusion_future_work.tex:21-27`.

# Transition Logic from Introduction -> Discussion -> Conclusion

The rewrite should preserve one clear conceptual flow:
- the introduction asks whether spatial intent can reduce reprogramming friction,
- the discussion explains what the prototype actually shows,
- the conclusion states the answer and the boundary of that answer.

The introduction already sets up the stages: sensing, authoring, interpretation, execution. Chapter 6 should reuse those same stages in the same order when summarizing the result. See `introduction.tex:37-56`.

The discussion should therefore start from the thesis question, not from implementation details. The existing opening already does this and should be kept as a model. See `ch06_discussion.tex:3-4`.

The conclusion should then move one step up in abstraction:
- not "here is what happened in the prototype",
- but "here is the defensible thesis claim after seeing the prototype."

That means Chapter 7 should not introduce unrelated new concepts. It should reuse the same terms from the introduction and discussion: spatial authoring, task-oriented workflows, shared execution infrastructure, selected use cases, prototype-level validation. See `introduction.tex:6-8`, `ch06_discussion.tex:7-11`, `ch07_conclusion_future_work.tex:5-9`.

# Vocabulary Guidance

Prefer these established terms:
- spatial authoring
- in-workspace spatial authoring
- task-oriented use cases
- modular runtime
- explicit interfaces
- scene detection
- robot execution interface
- prototype
- proof of concept
- qualitative evaluation
- limited trials
- current implementation
- selected workflows
- representative task families

Prefer these phrasings when possible:
- "The main result of this thesis is..."
- "At the same time..."
- "The current prototype..."
- "This does not mean..."
- "Taken together..."
- "In practical terms..."
- "The thesis therefore shows..."

Avoid or use only with immediate explanation:
- complementary strengths
- scene-adaptive execution
- box-based model
- powerful framework
- industrial platform
- general replacement
- future work bucket language such as "we could also..."

When welding and pick-and-place are compared, use plain operational descriptions first:
- pick-and-place re-reads the scene at execution time and recomputes the pick pose from the current box pose.
- weld resolves the task during confirmation and stores fixed world-frame poses.

This plain-language explanation is more readable than abstract labels alone. See `ch05_user_workflow.tex:301-344`, `ch04_implementation.tex:505-628`.

# Concrete Sentence-Pattern Guidance

Use sentence patterns that match the thesis style:
- "The main result of this thesis is..."
- "In practical terms, this means that..."
- "At the same time, the built system remains narrower in scope..."
- "The two use cases reveal different strengths..."
- "This is the clearest practical fit..."
- "The most important limitation of the current prototype is..."
- "The evaluation boundary of the chapter is therefore..."
- "The most defensible overall conclusion is..."

Prefer explicit qualifiers:
- "This was sufficient for the prototype demonstrations..."
- "Limited trials on physical hardware indicate..."
- "The thesis does not include..."
- "The current implementation is limited by..."

Use contrast structures often, because the thesis is fundamentally about tradeoffs:
- "While X is true, Y is also true."
- "On the one hand..., on the other hand..."
- "This is useful for..., but it also means..."
- "The advantage is..., the limitation is..."

Avoid piling up adjectives without explanation. If you say something is "interesting", say why.

When explaining a contribution, use one sentence for the claim and one sentence for the mechanism. Example pattern:
- claim: the thesis produced a modular runtime with explicit interfaces.
- mechanism: these interfaces separate sensing, UI, robot execution, and use-case logic, so the same infrastructure can support different task structures.

# Suggested Opening / Closing Strategies

For Chapter 6 opening, keep the existing thesis-question setup and then immediately state that the chapter is about what the built system shows. That keeps the reader anchored to the introduction. See `ch06_discussion.tex:3-4`.

For Chapter 6 closing, end by naming the validation level and the boundary of inference. The chapter should finish by saying what was established and what remains open, not by drifting into future work. See `ch06_discussion.tex:37-39`.

For Chapter 7 opening, restate the thesis question and answer it in one sentence, then qualify the answer as prototype-level. See `ch07_conclusion_future_work.tex:5-9`.

For Chapter 7 closing, end with a future-work sentence that points beyond the current prototype without sounding like a backlog. The final line should feel like the thesis is moving outward from a firm core result. See `ch07_conclusion_future_work.tex:25-27`.

# Red Flags to Check During Review

- The discussion begins with implementation details instead of the thesis question.
- The conclusion repeats the discussion almost verbatim.
- Pick-and-place and welding are described only as demos instead of as contrasting evidence for the thesis claim.
- The limitations section becomes a flat list of bugs or rough edges.
- Future work is just a restatement of limitations.
- The text implies production readiness or industrial validation that the thesis does not support.
- The text uses opaque labels that a reader would not understand without rereading half the thesis.
- The language becomes promotional or vague.
- The chapter lengths are inverted, with Chapter 7 becoming as long or longer than Chapter 6.
- The final chapters no longer sound like the same authorial voice as Chapters 2 to 5.

If a passage triggers any of these red flags, rewrite it in concrete thesis language and anchor it back to the existing terminology and evidence in the earlier chapters.
