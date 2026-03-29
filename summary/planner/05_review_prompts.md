# Review Prompts

Use these after the extraction workers and the first synthesis pass.

## Review Cycle 1: Grammar and Style Consistency

```text
You are reviewing a thesis evidence draft for grammar, style consistency, and terminology consistency.

Scope:
- Check the evidence draft only.
- Do not re-extract from the thesis text unless the draft is clearly malformed.
- Do not focus on factual truth unless a wording choice creates a stylistic or clarity problem.

What to check:
- consistent terminology, especially "use case", "program", "module", "scene", "pose", and "trajectory"
- tense consistency
- sentence-level grammar
- section ordering and repeated points
- whether claims are phrased at a consistent strength level
- whether any bullet is too verbose or too vague for later chapter drafting

Output:
## Findings
- List issues in descending severity.
- Include the file name and the section or bullet heading.

## Suggested rewrites
- Provide concise replacement wording only when it would materially improve readability.

## Consistency notes
- Mention terminology that should be normalized across Chapter 6 and Chapter 7.
```

## Review Cycle 2: Truth and Reference Check

```text
You are reviewing a thesis evidence draft for truth, grounding, and reference discipline.

Scope:
- Verify every nontrivial claim against the provided thesis .tex source sections.
- Flag claims that are unsupported, overstated, or missing a source section reference.
- Distinguish direct support from inference.

What to check:
- whether each claim is actually in the cited section
- whether the claim is too strong for the cited text
- whether a limitation is prototype-specific or concept-level
- whether future work is truly implied by the thesis text
- whether any note-only idea has been promoted without verification

Output:
## Supported claims
- Brief list of the claims that are grounded well.

## Problems
- Each item should say what is wrong, why it is wrong, and what source section would be needed.

## Overclaims
- Claims that should be softened, split, or removed.

## Missing references
- Bullets that need a source section attached.

## Recommendation
- Say whether the draft is safe to use for chapter drafting or needs another extraction round.
```

## Review Cycle 3: Discussion Logic and Boundaries

```text
You are reviewing a thesis evidence draft for discussion logic, validity, and boundary discipline.

Scope:
- Check whether the draft supports a balanced Chapter 6 and Chapter 7.
- Check that the evidence separates strengths, limitations, threats to validity, and future work cleanly.
- Check that the final chapter should not overstate production readiness or generality.

What to check:
- whether the strongest positive claims are actually the strongest claims
- whether limitations are honest and not hidden
- whether the threats to validity are clearly distinct from prototype limitations
- whether future work is realistic and grounded in the text
- whether any chapter structure appears redundant or overloaded

Output:
## Strengths
## Boundary issues
## Missing discussion angles
## Recommended chapter-scope changes
```

## Review Ordering

Use the review prompts in this order:

1. Grammar/style consistency.
2. Truth/reference check.
3. Discussion logic and boundary discipline.

If the truth review finds major problems, rerun extraction before writing final chapter notes.

