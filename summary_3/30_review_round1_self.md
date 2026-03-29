# Round 1 Self-Review

## Overall verdict

The rewritten Chapters 6 and 7 are substantially better than the originals. They now close the introduction goals explicitly, give the modular-runtime contribution appropriate weight, surface the weld vs. pick-and-place asymmetry clearly, and define the prototype/evaluation boundary much more honestly. They are no longer abruptly thin relative to the rest of the thesis.

The draft is not finished yet. The main remaining issues are not factual correctness, but integration polish: stronger comparison to the related-work positioning, a slightly clearer threats-to-validity presentation, and a few sentences that still read more like synthesized summary prose than like the calmer explanatory style used in Chapters 2 to 5.

## Main findings

1. The discussion still underuses the explicit Chapter 1 positioning against related work. The thesis now explains what it built and why weld is the clearest fit, but it still does not fully cash out the claim that this work differs from many related systems by emphasizing a reusable modular runtime and use-case boundary rather than a one-off interaction workflow. This point is present in the thesis and should appear explicitly in Chapter 6. Relevant sources: `ch01_background.tex:23-57`, `ch03_system_design.tex:18-37`, `ch06_discussion.tex:7-27`.

2. The evaluation boundary is strong, but the wording would benefit from one explicit `Threats to validity` signal inside Chapter 6. Right now the content is there under `Current limitations and validity boundary`, but a reader scanning the chapter may still miss that this is the place where the thesis defines what can and cannot be inferred. Relevant sources: `introduction.tex:90-94`, `ch06_discussion.tex:39-53`.

3. Some sentences still sound slightly more synthesized than the rest of the thesis, especially where they compress ideas into polished formulations. Examples include:
   - `ch06_discussion.tex:27-31`
   - `ch06_discussion.tex:35-39`
   - `ch07_conclusion_future_work.tex:5-13`
   These are not wrong, but a few of them could be simplified to match the plainer explanatory style of `introduction.tex:35-56` and `ch04_implementation.tex:18-23`.

4. Chapter 7 is structurally improved, but the near-term future-work section could connect one step more directly to the specific prototype boundaries already named in Chapter 6. Right now it is good, but slightly abstract in places. A little more carry-over from the exact limitations would make it feel even more grounded. Relevant sources: `ch06_discussion.tex:39-53`, `ch07_conclusion_future_work.tex:15-23`.

5. The conclusion is now explicit about goal fulfillment, but it could state the bounded answer to the thesis question even more directly in the final paragraph by restating the narrow class of workflows where the approach looks strongest. Relevant sources: `introduction.tex:4-8`, `ch06_discussion.tex:31-38`, `ch07_conclusion_future_work.tex:9-13`.

## What is now clearly improved

- Goal closure is now explicit rather than implicit: `ch06_discussion.tex:9-13`, `ch07_conclusion_future_work.tex:7-9`.
- The modular-runtime / explicit-interface contribution is foregrounded properly: `ch06_discussion.tex:15-23`, `ch07_conclusion_future_work.tex:7-9`.
- The weld vs. pick-and-place asymmetry is clear and convincing: `ch06_discussion.tex:31-39`.
- Limitations are now categorized rather than collapsed: `ch06_discussion.tex:41-53`.
- The proof-of-concept boundary is explicit in both chapters: `ch06_discussion.tex:53-55`, `ch07_conclusion_future_work.tex:11-13`.
- Future work is better split into near-term engineering and longer-term research directions: `ch07_conclusion_future_work.tex:15-31`.

## What is still missing or weak

- More explicit comparison to the related-work positioning from Chapter 1.
- A clearer visual/structural marker for threats to validity within Chapter 6.
- Slightly calmer, less compressed prose in a few dense paragraphs.
- Slightly tighter bridge from Chapter 6 limitations to Chapter 7 near-term future work.

## What should be changed in the next round

1. Add one paragraph in Chapter 6 `What the results mean` that explicitly positions the thesis against the related-work space:
   - not only waypoint/path authoring,
   - not only one-off task demos,
   - but a reusable task-oriented runtime with explicit contracts and interchangeable modules.

2. Add an explicit `\minihead{Threats to validity.}` block in Chapter 6 before or instead of the current evaluation-boundary paragraph. Use it to name:
   - qualitative workflow-oriented evaluation,
   - simulator-heavy testing,
   - limited real-robot validation,
   - no user study / baseline / quantitative tracking characterization.

3. Simplify a few high-density sentences in both chapters so they read more like thesis prose and less like polished synthesis.

4. In Chapter 7 near-term future work, make the first sentences tie more directly to the current prototype boundaries already discussed in Chapter 6.

5. Consider adding one sentence in Chapter 7 conclusion that restates where the approach is strongest:
   - frequently changing,
   - task-structured,
   - trajectory-centric or otherwise compatible with prepared use cases.

## Any claims that need qualification or factual recheck

- `ch06_discussion.tex:29-31` mentions specialized industrial handling tasks in general terms. This is reasonable, but the wording should stay clearly interpretive rather than factual about industry at large.
- `ch07_conclusion_future_work.tex:17-19` mentions improving persistence and orchestration robustness. This is supported indirectly by workflow text, but should stay phrased as prototype completion, not as a strong diagnosed subsystem failure.

## If no major issues remain, say so explicitly

No major factual or structural failure remains. The remaining work is quality-improvement work, not rescue work.
