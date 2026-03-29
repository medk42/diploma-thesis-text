# Integrated Rewrite Outline for Chapters 6 and 7

This file is the synthesis point between the issue-specific evidence packs and the actual chapter rewrite.

## Chapter 6: Discussion

Planned role:
- main interpretive chapter
- closes the loop with the introduction goals
- explains what the thesis built, what that result means, where it is strongest, and where the validity boundary lies

Planned high-level structure:
1. `What the thesis built`
2. `What the results mean`
3. `Current limitations and validity boundary`

Planned content for Section 1:
- restate the thesis question in scoped form
- identify the real result as an end-to-end system and workflow, not only a pen-based interaction
- explicitly connect to the four stages from the introduction: sensing, authoring, interpretation, execution
- foreground the modular runtime, explicit interfaces, use-case wrapper boundary, and reusable control-plane workflow
- explicitly close the introduction goals in prose:
  - Goal 1: direct spatial authoring in the real workspace was realized in prototype scope
  - Goal 2: extensible plugin-based architecture was realized
  - Goal 3: real-robot demonstration with pick-and-place and weld was achieved at limited prototype-validation level

Planned content for Section 2:
- explain the main result at thesis level: a reusable architecture for task-oriented spatial authoring
- explain what the use cases show beyond “two demos”
- elevate the weld vs. pick-and-place asymmetry
- frame welding as strongest practical fit
- frame pick-and-place as architectural evidence for runtime scene coupling but weaker current practical fit
- explain applicability boundary:
  - strongest where repeated low-level reprogramming becomes the cost driver
  - weaker where tasks are highly specialized and already integrated with dedicated industrial sensing/tooling
- explain the relevance of motion-primitive use cases as compatibility/flexibility evidence

Planned content for Section 3:
- split limitations by type inside the section, even if not as separate LaTeX subsections
- cover:
  - concept/scope limitations
  - sensing and calibration limitations
  - scene-understanding limitations
  - execution/tooling limitations
  - UI/prototype-maturity limitations
  - portability limitations
  - safety / production-readiness limitations
- then explicitly state the evaluation boundary:
  - qualitative and workflow-oriented
  - most testing in simulator
  - limited real-robot trials
  - no user study
  - no baseline comparison
  - no quantitative tracking characterization

Target tone:
- concrete, thesis-like, evidence-led
- no hype
- no detached AI-summary style

## Chapter 7: Conclusion and Future Work

Planned role:
- shorter than Chapter 6
- clean thesis closure
- explicit contributions and bounded conclusion
- future work split into near-term engineering and longer-term research directions

Planned high-level structure:
1. `Conclusion`
2. `Near-Term Future Work`
3. `Longer-Term Directions`

Planned content for Section 1:
- restate the thesis question
- answer it in a scoped way
- name the main contribution clearly:
  - modular runtime with explicit interfaces
  - task-oriented spatial-authoring workflow
  - two representative use cases on a real robot
- explicitly name weld as the strongest current practical fit
- explicitly state proof-of-concept / prototype boundary

Planned content for Section 2:
- prototype maturation / engineering completion
- group by:
  - sensing and calibration robustness
  - scene representation and estimation
  - execution layer maturity (tool abstraction, validation, collision checking, planning)
  - possible export/compilation for fixed tasks
  - cross-platform completion
- keep this practical, not speculative

Planned content for Section 3:
- richer interaction:
  - hand tracking
  - VR/AR controllers or frontends
  - multimodal gesture + speech
- integration with existing robot-programming workflows
- stronger evaluation:
  - user study
  - workflow timing comparison
  - quantitative tracking / repeatability characterization
- broader applicability:
  - richer welding scenarios
  - dispensing / surface processing
  - other task-oriented human-in-the-loop workflows

Target tone:
- concise but not abrupt
- clearly derived from the thesis, not wishlist-like
- academic future-work filter stronger than commercial backlog filter
