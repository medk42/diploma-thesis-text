# Author Intent Handoff

This file captures the author's intent, preferences, and recurring review comments from the current chat, in a form that a fresh agent can use without reading the whole conversation.

It is not a source of thesis facts. It is a source of:
- discussion framing,
- authorial interpretation,
- wording preferences,
- section-level priorities,
- boundaries on overclaiming,
- and guidance for future editing passes.

## How To Use This File

- Use it together with:
  - `ch06_discussion.tex`
  - `ch07_conclusion_future_work.tex`
  - `summary_2/expert_description.txt`
  - `summary_2/context/01_safe_vs_risky_claims.md`
  - `summary_2/reviews/10_truth_review_actual_chapters.md`
  - `summary_2/reviews/11_style_review_actual_chapters.md`
  - `summary_2/reviews/12_intro_alignment_review.md`
  - `summary_2/reviews/13_ch06_ab_choice.md`
- Treat this as the author's interpretation and desired framing for Discussion and Conclusion.
- Do not turn every point here into thesis text verbatim.
- Use it to judge whether current wording matches the author's vision.

## Core Thesis Vision

### 1. What the thesis is really about

The thesis is not mainly about having built a big modular architecture for its own sake.

The intended high-level story is:
- the introduction asks whether frequently changing robot tasks can be programmed more directly through spatial input in the real workspace,
- the thesis builds a system to test that idea,
- the discussion should explain what the system showed,
- and the conclusion should summarize that result modestly.

Architecture is a major result, but it should not overshadow the original thesis question or the role of the use cases.

### 2. Main discussion question

Chapter 6 should answer:
- what did we build,
- what are the results,
- what do those results mean,
- why should anyone care,
- where is this useful,
- and where does it stop being useful.

The chapter should not read like:
- a recap of implementation,
- a feature list,
- or a self-justification of the architecture.

### 3. Main practical idea

The author's intended contrast is:
- conventional deployment often means a task-specific robot setup is integrated once and then remains mostly fixed,
- this thesis explores a different model in which a use case is prepared once, but the operator can redefine the concrete task quickly inside that use case through spatial input.

This is a core discussion idea.

It should be expressed carefully, because:
- it is an interpretation of what the system enables,
- it is not a hard measured result,
- but it is central to the intended meaning of the thesis.

## Use Case Interpretation

### 4. Pick-and-place

Pick-and-place is important, but not because it is the main practical target.

Intended framing:
- positive result: it proves the system can adapt execution at runtime rather than only replay fixed authored commands,
- positive result: it shows system flexibility,
- limitation: it is not the strongest real deployment target for this thesis,
- reason: real industrial pick-and-place tasks are usually highly specific and often better solved through dedicated integration.

Avoid:
- presenting pick-and-place as the main sweet spot,
- presenting it as pointless,
- presenting it as proof of broad industrial dynamic programming.

Best phrasing direction:
- good flexibility result,
- weaker practical target.

### 5. Welding

Welding is the strongest practical fit for the current prototype.

The intended layered framing is:
- fixed, repetitive production welding: little benefit, because conventional integration already works well,
- small-batch production: medium benefit, because reprogramming overhead begins to matter,
- one-off or highly variable welding: strongest and most interesting case, because the programming burden may otherwise make robot use impractical.

This is the context for discussing:
- why the system may matter,
- why fast spatial re-authoring could be genuinely useful,
- and why human-robot cooperation is an interesting direction.

Important nuance:
- do not simply say "the robot performs repeated execution better than the human";
- instead explain that the real question is whether faster programming could make robot use practical in cases where a human would otherwise just do the task manually.

### 6. Human-robot cooperation

This is an important authorial idea, but it must be phrased carefully.

Safe framing:
- the system points toward a human-in-the-loop workflow,
- the human provides task intent and contextual judgment,
- the robot performs the consistent physical execution.

Unsafe framing:
- "true robot-human integration"
- "this system clearly enables Stark-like assistants"
- any science-fiction-like analogy in the thesis text itself.

Those analogies are useful for understanding the author's direction, but they should stay outside the thesis prose or appear only as heavily softened future-facing intuition.

## Architecture And Modularity

### 7. How architecture should be discussed

The architecture matters because:
- it lets multiple use cases share the same infrastructure,
- it supports replacement of parts,
- it is more extensible than many narrowly tailored research demos,
- it allows the thesis to test more than one task through one system.

But the author does not want architecture to sound like:
- the thesis built a huge great platform and only incidentally fulfilled the original goals,
- or a self-justifying discussion of why the architecture exists.

Best framing:
- architecture is a real result,
- but it is meaningful through the use cases,
- and it should stay tied to the original thesis motivation.

### 8. Generic vs customer-specific use cases

This is a discussion-worthy distinction.

Two plausible deployment directions:
- a specific use case prepared for one customer or one recurring workflow,
- a more generic use case prepared once and then adapted by an integrator or operator.

The author does not think the thesis resolves which is better.

What matters is:
- both are compatible with the same architectural idea,
- the one-time effort goes into the use case,
- the concrete task is redefined later through spatial input.

## Programming Structure

### 9. One-off vs list vs full language

This is not mainly a technical implementation note. It is part of the conceptual discussion.

Intended framing:
- best case: a task-specific use case that fully covers the intended workflow,
- second-best: a simple linear list of commands for somewhat more generic workflows,
- weakest fit: a full generic robot programming language inside this approach.

Reason:
- if the user must build a complex program with loops, branching, and low-level logic, the main advantage of this approach starts to disappear,
- at that point it becomes more reasonable to use the manufacturer's programming environment directly.

Important:
- do not frame the linear command model as a major flaw,
- do not over-discuss internal names like `UsecaseTree`,
- do not sound defensive about why the linear structure exists.

Best framing:
- practical middle ground,
- more useful than a single one-off command,
- far simpler than a full language,
- aligned with the thesis goal of keeping programming simple.

## Limitations Priority

### 10. Biggest limitations

The author's priority order is approximately:

1. Scene understanding.
2. Real sensing/tracking quality and calibration dependence.
3. Planning, collision avoidance, and execution robustness.
4. Tool abstraction / gripper and process-tool handling.
5. Exportability or robot-side execution path.
6. Formal evaluation gap.
7. Cross-platform and code-level issues.
8. UI roughness.

Interpretation:
- UI roughness exists, but it is secondary.
- The biggest risk to real usefulness is not polish, but scene understanding and sensing.

### 11. Exportability / robot-side execution

This is important.

The author sees a meaningful three-part discussion:
- positive: runtime adaptation is a genuine strength of the system,
- negative: runtime adaptation also makes export to a native robot-side program harder,
- future work: explore export for fixed-task cases and rethink interfaces for runtime-adaptive ones.

This is a strong discussion thread and can be reused.

## Claims And Tone Boundaries

### 12. What must stay out or be softened

Do not claim:
- production readiness,
- commercial readiness,
- general superiority over teach pendant / offline programming / other tools,
- exact speed improvements,
- exact practical throughput claims,
- exact precision claims,
- exact timing claims like "30 seconds to teach a weld",
- Linux / BLE / UI bug details unless the text explicitly supports them.

Soften heavily:
- "faster"
- "ideal"
- "better"
- "practical"
- "commercially useful"

Preferred qualifiers:
- appears,
- suggests,
- points toward,
- may be useful for,
- is best suited to,
- in the current prototype,
- in the present setup,
- qualitatively.

### 13. Avoid AI-summary language

The author dislikes text that:
- sounds like a recap of earlier chapters,
- compresses too much meaning into abstract phrases,
- uses polished but empty wording,
- sounds salesy,
- or reads like generic AI thesis prose.

The desired style is:
- concrete,
- explanatory,
- mechanistic,
- thesis-like,
- close to Chapters 2 to 5.

### 14. Avoid code-ish or internal names in discussion

Avoid using implementation or code names unless necessary.

Example:
- avoid referring to `UsecaseTree` in the discussion if the conceptual point can be made without naming it.

## Section-Specific Intent

### 15. Chapter 6, `What the results mean`

This section should:
- answer what the results showed,
- interpret why the approach matters,
- compare practical use regions,
- discuss the strongest fit,
- discuss the difference between fixed-task integration and fixed-use-case redefinition.

It should not:
- repeat implementation details,
- justify the architecture to itself,
- or repeat the same point across several paragraphs with only slight rewording.

### 16. Chapter 6, usefulness discussion

If the chapter includes a usefulness discussion, it must be:
- clearly complementary to the preceding interpretation,
- not just "the same point again."

The author has a slight preference for integrating usefulness into the interpretation section rather than having a separate section, unless the separate section is clearly distinct.

### 17. Chapter 7

The author is broadly happy with the conclusion/future work split.

Desired structure:
- concise conclusion,
- near-term engineering future work,
- longer-term research directions.

Near-term:
- sensing improvements,
- scene understanding,
- tool abstraction,
- planning / collision avoidance,
- export path,
- engineering completion.

Longer-term:
- hand tracking,
- VR / AR,
- gesture + speech,
- teach-pendant integration,
- formal studies,
- precision characterization,
- more complex use cases,
- broader exploration of where this programming idea is actually useful.

## Practical Review Checklist For A New Agent

When reviewing the current `ch06_discussion.tex`, ask:

1. Does the section still follow the introduction's question?
2. Does it explain what the results mean, not only what the system does?
3. Is pick-and-place framed as flexibility, not as the main practical target?
4. Is welding framed with the correct three-level context:
   - repetitive fixed production,
   - small batch,
   - one-off / highly variable?
5. Is architecture discussed as meaningful through the use cases rather than as a self-justifying result?
6. Does the text avoid abstract repetition?
7. Does the text avoid overclaiming practicality or speed?
8. Does the programming-structure discussion stay conceptual rather than code-specific?
9. Does the usefulness discussion complement the interpretation rather than repeat it?
10. Does the text sound like Chapters 2 to 5?

## Suggested Prompt For A Fresh Agent

If a fresh agent should continue editing from this folder, a good instruction is:

`Read ch06_discussion.tex, ch07_conclusion_future_work.tex, summary_2/expert_description.txt, summary_2/context/03_author_intent_handoff.md, summary_2/context/01_safe_vs_risky_claims.md, and the review files in summary_2/reviews/. Then review whether the current Discussion and Conclusion match the author's intended framing. Focus especially on repetition, overcompression, practical meaning, welding vs pick-and-place framing, and the distinction between fixed task integration and fixed use case with fast task redefinition. Recommend or apply replacements only where they improve alignment with that intent.`

