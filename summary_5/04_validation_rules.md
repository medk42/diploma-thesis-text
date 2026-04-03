# Validation Rules For Chapter 6-7 Rewrite

## Purpose

These rules define how to validate rewrite or compression outputs for:

- truth
- style
- clarity
- overlap
- thesis voice

They also define how truth check, style check, and content check differ.

## Validation Hierarchy

Use this order whenever there is tension between checks.

1. Truth
2. Content coverage and emphasis
3. Clarity
4. Thesis voice and style
5. Compression quality

A draft that sounds better but is less true fails. A shorter draft that hides limits fails.

## Source Hierarchy During Validation

1. `.tex` files are factual ground truth.
2. `summary_2/expert_description.txt` is near-ground-truth for intended meaning.
3. Handoff, style, and review files are validation aids.

Practical rule:

- facts come from `.tex`
- intended emphasis comes from `summary_2/expert_description.txt`
- wording discipline comes from the style files

## Claim Labels

Where the workflow uses the labels defined in `summary_5/02_artifact_schema.md`, apply them this way:

- `GT`: direct factual support from `.tex`
- `NGT`: near-ground-truth framing from `summary_2/expert_description.txt`
- `INF`: careful inference from `.tex`
- `OPEN`: unresolved or unsupported

Validation rule:

- `OPEN` may exist in planning notes
- `OPEN` must fail truth validation if it survives into chapter prose

## Truth Rules

### Truth-1: No contradiction to thesis source

Fail if the draft states or implies something that the relevant `.tex` files contradict.

### Truth-2: Interpretation must be marked by language

Ideas coming mainly from `summary_2/expert_description.txt` are allowed only when phrased as interpretation or careful implication.

Preferred signals:

- `suggests`
- `points toward`
- `appears`
- `may be useful for`
- `in the current prototype`
- `qualitatively`

### Truth-3: No unsupported hard claims

Fail on:

- measured speed claims
- exact precision or accuracy claims
- industrial readiness
- commercial readiness
- superiority over teach pendant, offline programming, or other systems
- general deployment claims not grounded in the thesis

### Truth-4: Future work must stay future-facing

Fail if future work is written as if it already exists or was already validated.

### Truth-5: Thesis limits must survive compression

Fail if compression removes:

- prototype boundary
- qualitative evaluation boundary
- limited physical validation boundary
- main sensing or scene limitations

## Style Rules

### Style-1: Keep thesis vocabulary stable

Prefer terms already established in the thesis:

- use case
- workflow
- module
- interface
- control plane
- scene detection
- execution
- spatial authoring

Fail if the draft introduces polished substitute vocabulary that changes the tone or meaning.

### Style-2: Prefer mechanism before praise

State what the system does and why it matters before giving evaluative language.

Fail if a paragraph begins with abstract praise and only later becomes specific.

### Style-3: Avoid reviewer and meta voice

Fail on phrasing that sounds like notes to the writer or evaluator, for example:

- `this chapter should`
- `the text argues`
- `the discussion must remain`
- `this reading`
- `the thesis should be read as`

### Style-4: Avoid sales tone

Fail on:

- `powerful`
- `strongly demonstrates`
- `game-changing`
- `ideal` when not tightly bounded
- stacked positive adjectives

### Style-5: Avoid AI-polished summary prose

Treat these as style failures:

- abstract noun stacks with weak concrete meaning
- sentences that compress several causal steps into one polished claim
- repeated balanced constructions that sound generated rather than authored
- paragraph openings that repeat the same formula too often

Examples of drift:

- `technically coherent and practically interesting direction`
- `complementary strengths within a reusable adaptive framework`
- `scene-adaptive trajectory-centric authoring substrate`

## Clarity Rules

### Clarity-1: One paragraph, one main job

Each paragraph should primarily do one of these:

- state the result
- explain why it matters
- state the limit
- define the evaluation boundary
- define future work

Fail if a paragraph mixes several jobs so tightly that the reader has to unpack it.

### Clarity-2: Keep the reader oriented

A reader who knows the introduction but not the implementation should still follow the closing chapters.

Fail if a term or contrast appears without enough framing, for example:

- undefined internal architecture wording
- unexplained box model references
- code-level helper names used without need

### Clarity-3: Prefer plain technical sentences over compressed abstractions

Fail if a simpler sentence could state the same point with less ambiguity.

### Clarity-4: Keep claim strength visible

The reader should be able to tell the difference between:

- fact
- interpretation
- limitation
- future work

Fail if wording blurs those categories.

## Overlap Rules

### Overlap-1: Chapter 6 and Chapter 7 must not do the same work

Chapter 6 should carry the interpretive load.
Chapter 7 should close the argument and define next steps.

Fail if Chapter 7 repeats Chapter 6 at similar detail.

### Overlap-2: Repetition inside a chapter must be purposeful

Fail if the same point appears in multiple sections with only wording changes, especially:

- modularity repeated without new consequence
- weld vs pick-and-place asymmetry repeated without new interpretation
- prototype boundary repeated as a generic disclaimer

### Overlap-3: Future work must not be just the limitations section rewritten

Near-term future work may answer limitations, but it must read as next work, not as a second copy of the negatives.

## Thesis-Voice Rules

### Voice-1: Stay close to Chapters 2-5

The target voice is:

- technical
- measured
- explicit about scope
- explanatory rather than promotional

### Voice-2: Keep the introduction thread visible

The draft should still answer:

- frequently changing tasks
- spatial intent in the real workspace
- use-case-oriented authoring
- representative task families

Fail if the closing chapters sound detached from the introduction.

### Voice-3: Keep architecture meaningful but not dominant

Pass only if the draft treats architecture as a result that matters through use cases and workflow, not as the whole thesis by itself.

### Voice-4: Keep pick-and-place and welding in the right relation

Pass only if:

- pick-and-place is a flexibility/runtime-adaptation result
- welding is the clearest practical fit

Fail if that relation is reversed or flattened.

## How The Checks Differ

## Truth Check

Question:

- `Is this claim supported, softened correctly, and inside the thesis evidence boundary?`

Primary evidence:

- `.tex` files
- safe/risky claims guide

Ignore unless it affects truth:

- sentence elegance
- paragraph rhythm
- repetition

Pass criteria:

- no direct contradiction to `.tex`
- no unsupported hard claim
- no author-intent-only statement presented as fact
- all future work clearly future-facing
- no `OPEN` claim survives in prose

Fail criteria:

- any hard factual contradiction
- any unjustified superiority or readiness claim
- any omitted boundary that makes the draft misleading

## Style Check

Question:

- `Does this sound like thesis prose rather than AI-polished summary prose?`

Primary evidence:

- style reference
- style do/don't
- current draft wording

Ignore unless it affects style:

- whether a claim is fully grounded
- whether a section is complete in content terms

Pass criteria:

- vocabulary stable
- no sales tone
- no reviewer/meta voice
- no repeated abstract-summary patterns
- prose remains easy to parse aloud

Fail criteria:

- several generated-sounding sentences
- invented vocabulary
- stacked abstract judgments
- repeated list-like paragraph openings

## Content Check

Question:

- `Does the chapter cover the right ideas, with the right emphasis, in the right places?`

Primary evidence:

- introduction
- expert description
- author-intent handoff
- revised chapter structure

Ignore unless it affects content:

- local grammar polish
- tiny wording choices

Pass criteria:

- Chapter 6 answers what was built, what it means, where it works, where it stops
- Chapter 7 stays shorter and cleaner
- limitations, validation boundary, and future work remain distinct
- architecture/use-case/task-fit emphasis is balanced correctly

Fail criteria:

- discussion becomes recap only
- conclusion becomes another discussion
- future work becomes a bug list
- compression removes one of the required chapter functions

## Pass/Fail Matrix By Dimension

| Dimension | Pass when | Fail when |
|---|---|---|
| Truth | No unsupported hard claims; all interpretive claims softened; core prototype limits remain visible | Any contradiction, readiness overclaim, unsupported comparison, or misleading omission |
| Style | Thesis vocabulary stable; concrete and technical tone; no AI-polish patterns dominate | Sales tone, invented vocabulary, reviewer voice, abstract-summary prose |
| Clarity | Paragraph purpose is obvious; claim strength visible; terms are understandable with intro context | Reader must decode compressed abstractions or undefined terms |
| Overlap | Chapter roles are distinct; repetition adds meaning | Discussion and conclusion repeat each other or limitations reappear as pseudo-future-work |
| Thesis voice | Sounds like Chapters 2-5 and stays tied to the introduction | Detached summary tone or architecture-first drift |

## Default Validation Outcome

Use three outcomes only:

- `pass`
- `revise`
- `fail`

Interpret them strictly:

- `pass`: safe to advance
- `revise`: keep the loop going; issue is fixable without re-planning
- `fail`: stop the current loop and escalate to re-planning or source reload
