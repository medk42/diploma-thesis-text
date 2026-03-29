# Packet Plan

This chapter split is designed to maximize recall while keeping each extraction worker focused.

## Packet Priorities

| Packet | Priority | Goal |
|---|---|---|
| P1 | High | Gather thesis framing, motivation, and the core problem decomposition. |
| P2 | High | Extract the architectural contracts and interface semantics from Chapter 3. |
| P3 | High | Extract control-plane orchestration, persistence, and end-to-end system mapping from Chapter 3. |
| P4 | High | Extract hardware setup and sensing/authoring implementation details from Chapter 4. |
| P5 | High | Extract robot execution and use-case behavior from Chapter 4. |
| P6 | High | Extract the user workflow and operational limits from Chapter 5. |

## Packet Definitions

### P1 - Introduction + Related Work + Analysis

Source files:

- `introduction.tex`
- `ch01_background.tex`
- `ch02_analysis.tex`

Why this packet matters:

- It supplies the claims about the problem, the thesis goals, the representative task families, and the scope boundary.
- It also provides the strongest material for Chapter 7 conclusion framing.

What to extract:

- goal fulfillment language
- task-family rationale
- scope and exclusions
- related-work positioning
- design requirements and the reasons for them
- explicit future-work hooks already present in the text

### P2 - Chapter 3 architecture contracts

Source file:

- `ch03_system_design.tex`

Sections to prioritize:

- `sec:ch3_overview`
- `sec:ch3_module_contract`
- `subsec:ch3_roles`
- `subsec:ch3_channel_contract`
- `subsec:ch3_message_lifecycle`
- `subsec:ch3_reflection_orchestration`
- `subsec:ch3_module_rules`
- `sec:ch3_interface_contracts`
- `subsec:ch3_activation_interface`
- `sec:ch3_usecase_wrapper`
- `sec:ch3_visualization_interface`
- `sec:ch3_robot_interface`
- `sec:ch3_scene_detection_interface`
- `sec:ch3_supporting_messages`

Why this packet matters:

- It provides the architecture-level claims that support Chapter 6 discussion of modularity and extensibility.
- It also contains the strongest grounded limitations around contract scope, message semantics, and feature boundaries.

Chapter 3 priority guidance:

| Subsection group | Priority | Notes |
|---|---|---|
| System at a glance | High | Needed for the thesis-level story of contracts vs implementations. |
| Module contract | High | Needed for modularity, messaging, lifecycle, and threading claims. |
| Interface contracts | High | Needed for activation, use case, visualization, robot, and scene semantics. |
| Supporting message formats | Medium | Useful for grounding the sensing pipeline and the UI, but not as important as the interfaces themselves. |
| Core implementation | Low to medium | Extract only limitations and operational constraints that matter for discussion. |
| Reading guide | Skip | Not useful for discussion or future work. |

### P3 - Chapter 3 orchestration and persistence

Source file:

- `ch03_system_design.tex`

Sections to prioritize:

- `sec:ch3_usecase_tree`
- `sec:ch3_ui_orchestration`
- `sec:ch3_workflow_state_machine`
- `sec:ch3_persistence_semantics`
- `sec:ch3_demo_configuration`

Why this packet matters:

- It describes how the user actually operates the system.
- It is the best source for discussion of practical workflow, persistence, and the boundary between core setup and authored programs.
- It is also the best source for Chapter 6 claims about what the prototype can and cannot do in practice.

What to extract:

- linear command model
- confirm/start/status/remove lifecycle
- program persistence vs core graph persistence
- UI orchestration responsibilities
- visualization resync behavior
- workflow state machine
- end-to-end mapping back to thesis requirements

### P4 - Chapter 4 implementation A

Source file:

- `ch04_implementation.tex`

Sections to prioritize:

- physical setup and calibration artifacts
- robot platform and execution backend
- stereo camera hardware
- pen input device
- workspace scene objects
- calibration artifacts
- compute platform
- sensing pipeline modules

Why this packet matters:

- It gives the concrete hardware and sensing choices that underlie the prototype.
- It supplies the strongest discussion material for sensing limitations and calibration assumptions.

### P5 - Chapter 4 implementation B

Source file:

- `ch04_implementation.tex`

Sections to prioritize:

- robot-mounted stereo camera calibration module
- authoring modules
- execution backend module
- task-oriented use case modules
- motion-primitive use cases

Why this packet matters:

- It gives the concrete behavior of pick-and-place and seam welding.
- It is the main source for the positive claim that pick-and-place shows scene-adaptive flexibility and welding shows trajectory-centric authoring.
- It is also the best source for execution limitations, such as lack of collision checking, tool abstraction, and simulation support.

### P6 - Chapter 5 user workflow

Source file:

- `ch05_user_workflow.tex`

Sections to prioritize:

- preconditions and environment
- system startup
- instantiate the module graph
- activation and calibration
- main view essentials
- user story: weld
- user story: pick-and-place
- save and load the program

Why this packet matters:

- It is the operational proof of the architecture.
- It contains concrete workflow steps that should feed the discussion of usability and future work.
- It is the best place to capture practical setup friction and operator-facing limitations if they are stated in the thesis text.

## Chapter 3 Skip List

These Chapter 3 areas should generally not get deep extraction effort unless they directly support a limitation or future work item:

- `sec:ch3_reading_guide`
- low-level helper utility details
- most of `sec:ch3_core` implementation internals

Reason:

- They add little to Chapter 6 or Chapter 7 unless a specific limitation depends on them.
- The important discussion content lives in the contract layer and the orchestration layer.

## Recommended Worker Split

Suggested worker ownership:

| Worker | Packet | Output path |
|---|---|---|
| W1 | P1 | `summary/extraction/p01_intro_ch01_ch02.md` |
| W2 | P2 | `summary/extraction/p02_ch03_contracts.md` |
| W3 | P3 | `summary/extraction/p03_ch03_orchestration.md` |
| W4 | P4 | `summary/extraction/p04_ch04_implementation_a.md` |
| W5 | P5 | `summary/extraction/p05_ch04_implementation_b.md` |
| W6 | P6 | `summary/extraction/p06_ch05_workflow.md` |

If Chapter 3 still feels overloaded after the first pass, split `P2` into a dedicated core-implementation pass and keep `P3` as the orchestration pass.

