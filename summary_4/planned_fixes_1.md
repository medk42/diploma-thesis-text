# Planned Fixes Round 1

## Goal of this round

Keep the substance of Chapters 6 and 7, but remove the reviewer-like framing layer and replace it with calmer, more direct thesis prose.

## Main fixes for `ch06_discussion_v2.tex`

1. Rewrite the opening so it states the chapter's conclusion directly instead of announcing what the chapter will or will not do.

2. Replace opponent-style phrasing such as:
   - `scoped but defensible`
   - `This connection to the introduction matters`
   - `should be read as`
   - `supports the same reading`
   - `The discussion also clarifies`
   - `The correct interpretation is therefore`

3. Keep the goal-fulfillment content, but express it as direct thesis outcomes at prototype level rather than as an external evaluation of adequacy.

4. Keep the architectural argument, but phrase it as:
   - what the runtime and use-case boundary provide
   - how the evaluated use cases and motion primitives reuse that structure
   rather than how the reader should interpret the chapter.

5. Make the asymmetry between welding and pick-and-place more grounded and less evaluative:
   - welding as the clearest current fit
   - pick-and-place as a useful architectural demonstration with tighter scene-model dependence

6. State the validation boundary more concretely:
   - demonstrated on a real Kassow robot
   - most development and testing performed in simulation
   - only limited physical validation

7. Reduce abstract bridge phrases and meta transitions across the chapter.

## Main fixes for `ch07_conclusion_future_work_v2.tex`

1. Replace `The most defensible answer is positive...` with a direct conclusion bounded by prototype scope.

2. Tighten the conclusion so it closes more decisively and re-argues less.

3. Add a plain sentence that combines:
   - real Kassow robot demonstration
   - mostly simulated development/testing
   - limited physical validation
   - no production-readiness claim

4. Keep future work structure, but make sure current prototype gaps are named plainly:
   - tool integration
   - simulation support
   - sensing / scene robustness
   - evaluation

## Non-goals for this round

- no broad structural rewrite
- no stronger claims than the thesis supports
- no change to the core argument, use-case asymmetry, or prototype boundary
