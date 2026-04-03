# Risk Register For Rewrite Orchestration

## Purpose

This register lists the most likely failure modes for a sub-agent-driven rewrite or compression workflow of Chapters 6-7 and defines how the orchestrator should respond.

## R1. Writer loads too little context

### Symptom

- draft reads like generic thesis summary
- introduction thread is weak
- claims are broad but thinly grounded

### Likely cause

- writer used only summaries, reviews, or prior drafts

### Orchestrator response

- reject the pass
- rerun with the Writer packet and confirm the factual source pack was loaded

## R2. Writer loads too much irrelevant context

### Symptom

- chapter becomes bloated
- unrelated implementation details leak into the closing chapters
- the draft loses the main story

### Likely cause

- worker loaded the full thesis without role discipline

### Orchestrator response

- narrow the packet
- restate chapter jobs
- tell the writer to keep only source material that supports closing-chapter claims

## R3. Expert description is treated as factual proof

### Symptom

- draft contains unsourced deployment claims
- discussion states authorial interpretation as established result

### Likely cause

- agent used `summary_2/expert_description.txt` as evidence instead of intent guidance

### Orchestrator response

- send the draft to truth check
- require all expert-description-driven claims to be softened or removed

## R4. `.tex` ground truth gets overridden by summaries

### Symptom

- a review file is cited as if it proved a fact
- draft repeats a prior reviewer interpretation that the source chapter does not support

### Likely cause

- agent trusted previous summary artifacts more than source chapters

### Orchestrator response

- stop the loop
- reload the relevant `.tex` files
- invalidate any claim that cannot be grounded there

## R5. AI-polished prose drift

### Symptom

- text sounds smooth but vague
- abstract praise appears before mechanism
- paragraphs use repeated generated-looking openings

### Likely cause

- writer optimized for fluency
- style check was skipped or too weak

### Orchestrator response

- run the style checker
- ask for concrete rewrites, not general `make it more natural`

## R6. Truth, style, and content checks collapse into one redundant review

### Symptom

- review comments mix evidence, tone, and structure without clear pass/fail
- same issues recur across rounds

### Likely cause

- generic reviewer used in place of dedicated checkers

### Orchestrator response

- split the validation into dedicated truth, style, and content passes
- route fixes in the order defined by the quality gates

## R7. Discussion and conclusion start overlapping

### Symptom

- Chapter 7 repeats Chapter 6 findings at similar length
- conclusion becomes a second discussion

### Likely cause

- no explicit overlap check
- writer compressed by merging rather than separating roles

### Orchestrator response

- run content check and comparator
- require Chapter 6 to carry interpretation and Chapter 7 to carry closure plus next steps

## R8. Compression hides uncertainty

### Symptom

- short draft reads cleaner but drops the prototype boundary
- limitations become generic or disappear

### Likely cause

- compression treated caveats as expendable

### Orchestrator response

- fail the truth gate
- restore the evaluation boundary and major limits before any further shortening

## R9. Architecture starts dominating the ending

### Symptom

- modular runtime becomes the only main result
- use cases and task fit become secondary

### Likely cause

- writer over-relied on Chapter 3 language

### Orchestrator response

- rerun content check
- force the draft back to the introduction question and the two representative task families

## R10. Pick-and-place and welding are framed incorrectly

### Symptom

- pick-and-place is treated as the main practical target
- welding is flattened into just another demo

### Likely cause

- agent ignored the intended asymmetry in expert and handoff material

### Orchestrator response

- fail the content check
- require explicit restatement: pick-and-place shows flexibility; welding is the clearest practical fit

## R11. Future work becomes a bug list

### Symptom

- Chapter 7 lists low-level cleanup items without research shape
- future work repeats limitations without saying what should be studied or built next

### Likely cause

- no distinction between near-term engineering and longer-term directions

### Orchestrator response

- restore the split
- keep only high-value engineering items in near-term work
- keep academically meaningful directions in longer-term work

## R12. Comparator rewards polish over safety

### Symptom

- smoother draft wins despite weaker claim discipline

### Likely cause

- no explicit truth-first compare rule

### Orchestrator response

- re-run comparison with truth and content findings attached
- prefer the safer draft unless the clearer draft is equally safe

## R13. The orchestrator becomes heavy again

### Symptom

- the main agent starts preloading large source chapters for every pass
- worker prompts assume pasted context instead of self-loading

### Likely cause

- packet discipline eroded after several rounds

### Orchestrator response

- stop and reset to Gate 0
- enforce worker-owned context loading

## R14. Review loops do not converge

### Symptom

- repeated rounds change wording but not the underlying quality
- issues recur under different phrasing

### Likely cause

- no gate-based stop/continue logic
- wrong checker is being used

### Orchestrator response

- identify the deepest failing gate
- send the draft back only to the worker that can resolve that gate
- stop style churn if the real problem is truth or content

## R15. Conflicting outputs from truth and content checks

### Symptom

- content check wants a stronger statement
- truth check says the stronger statement is not supported

### Likely cause

- intended meaning outruns source support

### Orchestrator response

- truth wins
- keep the idea only as softened interpretation or future-facing language
- if that still fails the content need, escalate to planner and rewrite the section framing

## R16. Workers fail to report extra files they self-loaded

### Symptom

- later agents cannot reproduce decisions
- factual basis is unclear

### Likely cause

- output contract too loose

### Orchestrator response

- require each worker to list any extra files loaded beyond the packet
- reject outputs that hide important context expansion

## Escalation Rule

The orchestrator should escalate immediately when:

- a truth failure survives one revision round
- the source hierarchy becomes disputed
- two agents disagree on a point that changes factual claim strength

At that point, do not continue with generic rewriting. Reload sources or re-plan.
