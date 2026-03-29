# Issue Map and Evidence Targets

## Issue A: Explicit goal fulfillment and thesis-level outcomes
Need material tying the introduction goals to concrete thesis outputs:
- in-workspace spatial authoring for frequently changing tasks
- extensible plugin-based system
- demonstration on real robot with representative use cases

Primary evidence targets:
- `introduction.tex`
- `ch02_analysis.tex`
- `ch03_system_design.tex`
- `ch04_implementation.tex`
- `ch05_user_workflow.tex`

## Issue B: Strongest conceptual and practical results
Need material showing:
- modular runtime with explicit interfaces
- reusable use-case boundary and shared infrastructure
- workflow from setup to execution
- weld vs. pick-and-place asymmetry
- motion primitives as compatibility/flexibility evidence

Primary evidence targets:
- `ch03_system_design.tex`
- `ch04_implementation.tex`
- `ch05_user_workflow.tex`

## Issue C: Limitations split by type
Need a clean distinction between:
- concept/scope limitations
- sensing/calibration limitations
- scene-understanding limitations
- robot/tool/execution limitations
- UI/prototype maturity limitations
- portability limitations
- applicability limitations
- safety / production-readiness limitations

Primary evidence targets:
- `ch02_analysis.tex`
- `ch03_system_design.tex`
- `ch04_implementation.tex`
- `ch05_user_workflow.tex`

## Issue D: Evaluation boundary and threats to validity
Need explicit support for:
- mostly qualitative evaluation
- most testing in simulator
- limited physical validation
- no user study
- no baseline comparison to pendant/offline programming
- no quantitative accuracy characterization

Primary evidence targets:
- `introduction.tex`
- `ch04_implementation.tex`
- `ch06_discussion.tex`
- user/assistant review discussion in this conversation

## Issue E: Future work structure
Need two layers:
- near-term engineering completion / prototype maturation
- longer-term research and interaction directions

Possible topics:
- tool abstraction
- motion validation / collision checking / safer planning
- simulation support
- scene model and uncertainty
- IMU fusion and sensing improvements
- stronger evaluation
- richer interaction: hand tracking, VR/AR, multimodal input
- integration with established robot-programming workflows
- broader task applicability, especially welding-like tasks and adjacent domains

Primary evidence targets:
- `ch02_analysis.tex`
- `ch03_system_design.tex`
- `ch04_implementation.tex`
- `ch05_user_workflow.tex`
- `summary_2/expert_description.txt`

## Issue F: Style and thesis integration
Need to preserve:
- the thesis' technical yet readable prose
- concrete wording over abstract “sales pitch” wording
- continuity with the introduction framing
- clarity for readers who may jump directly to Chapter 6 or 7

Primary evidence targets:
- `introduction.tex`
- selected well-written passages from Chapters 2-5
- `summary_2/expert_description.txt`
