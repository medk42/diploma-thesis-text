# Chapters 6-7 Rewrite Orchestration

Goal: rewrite `ch06_discussion.tex` and `ch07_conclusion_future_work.tex` so they match the depth, integration, and thesis-level quality of Chapters 2-5.

Primary constraints:
- Keep claims faithful to the thesis text and demonstrated prototype.
- Increase detail efficiently, not by padding.
- Tie the discussion and conclusion back to the introduction goals and the actual implemented system.
- Keep the result readable with minimal context, especially if a reader jumps from the introduction to Chapter 6 or 7.
- Distinguish prototype-level findings from broader industrial claims.

Main issues to solve:
1. Goal fulfillment is implicit rather than explicit.
2. The evaluation boundary / threats to validity are underdeveloped.
3. Important concrete limitations from Chapters 3-5 are not surfaced clearly enough.
4. The weld vs. pick-and-place asymmetry should be a central result, not a side observation.
5. The modular runtime / interface / reusable use-case boundary contribution is slightly undersold.
6. Future work needs a better split between near-term engineering work and longer-term research directions.
7. Style must remain consistent with the existing thesis; avoid generic AI-summary tone, sales tone, and newly invented vocabulary unless already established in the thesis.

Process:
1. Build issue-specific evidence packs from the thesis and prior review guidance.
2. Draft expanded Chapter 6 and Chapter 7 text.
3. Run dedicated review passes focused on truthfulness, thesis integration, style, and reviewer expectations.
4. Iterate at least three review/improvement rounds.
5. Keep all intermediate outputs in `summary_3/` so a future agent can resume from files alone.

Key external guidance sources:
- `summary_2/expert_description.txt`
- user messages in this conversation describing desired discussion/conclusion shape
- prior assistant review findings in this conversation

Expected final chapter characteristics:
- Chapter 6 should be the main interpretive chapter and clearly longer than the conclusion.
- Chapter 7 should close the thesis explicitly and then present future work in a deliberate structure.
- Both chapters should feel connected to the introduction, analysis, design, implementation, and workflow chapters.
