# Style and Integration Guide for Chapters 6 and 7

Purpose: keep the rewritten discussion and conclusion consistent with the prose of the existing thesis and with the user's explicit style preferences.

## Positive style anchors from the thesis

### Introduction-style framing
- Define the thesis contribution in plain but precise language before narrowing scope.
- Prefer short explanatory transitions such as:
  - "This allows us to..."
  - "At the same time..."
  - "In that sense..."
  - "This is why..."
- Good examples:
  - `introduction.tex:35-56`
  - `introduction.tex:54-56`

### System-design explanatory style
- Use structured conceptual explanations without hype.
- When enumerating contributions, explain each one in concrete terms.
- Good example:
  - `ch03_system_design.tex:18-40`

### Implementation chapter tone
- Clearly distinguish what the chapter covers from what it does not cover.
- Use "prototype", "current implementation", "in this thesis", and similar qualifiers to avoid overclaiming.
- Good example:
  - `ch04_implementation.tex:5-23`

### Workflow chapter tone
- Be concrete and operator-facing when discussing what the system actually does.
- Prefer plain descriptions of actions and states over abstract labels.
- Good examples:
  - `ch05_user_workflow.tex:4-9`
  - `ch05_user_workflow.tex:197-205`

## User-provided style requirements from conversation
- The discussion and conclusion should make sense to a reader who remembers the introduction, even if they do not remember every implementation detail.
- Avoid sounding like a detached AI summary or a sales pitch.
- Avoid introducing new vocabulary unless it already exists in the thesis and is really needed.
- Keep language concrete: do not hide key claims inside vague phrases such as "complementary strengths" unless those strengths are then explained explicitly.
- The conclusion may summarize, but it should still feel like thesis prose, not executive-summary prose.
- Chapter 6 should be the main interpretive chapter. Chapter 7 should be shorter and cleaner.

## Writing rules for the rewrite
1. Start from the thesis question and goals, then connect them to what was built.
2. Prefer concrete nouns already established in the thesis:
   - spatial authoring
   - use cases
   - scene detection
   - robot execution interface
   - modular runtime
   - workflow
3. Use explicit qualifiers when needed:
   - prototype
   - proof of concept
   - qualitative
   - limited trials
   - current implementation
   - in this thesis
4. When discussing pick-and-place vs. weld, explain the difference in plain operational terms before abstracting it.
5. When discussing future work, separate engineering completion from broader research directions.

## Phrases / patterns to avoid
- grandiose framing such as "huge, great, awesome system"
- ungrounded promotional phrases such as "powerful framework" unless immediately justified
- abstract compression like "complementary strengths" without explanation
- opaque wording like "scene-adaptive execution inside the current box-based model" unless unpacked in plain words
- claims that imply industrial readiness

## Preferred structure signals
- "The main result of this thesis is..."
- "At the same time..."
- "This does not mean..."
- "Taken together..."
- "In practical terms..."
- "The current prototype..."
- "The thesis therefore shows..."

## Integration reminders
- Chapter 6 should explicitly close the loop with the introduction goals, but does not need a rigid goal-by-goal checklist structure.
- Chapter 7 should explicitly name the thesis contribution and close the loop on the goals more directly than Chapter 6.
- The weld use case should emerge as the clearest current fit.
- The modular runtime / interfaces / reusable use-case boundary should remain visible as a contribution throughout both chapters.
