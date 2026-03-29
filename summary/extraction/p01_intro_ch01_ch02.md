# Packet P1 Evidence

## Packet metadata
- `packet_id`: `P1`
- `source_files`: `introduction.tex`; `ch01_background.tex`; `ch02_analysis.tex`
- `source_sections`: Motivation; High-level approach; Goals; Thesis structure; all relevant Chapter 1 sections; all relevant Chapter 2 sections
- `target_chapter`: Chapter 6 and Chapter 7
- `priority`: High

## A. Grounded claims
- [T] **GF-01** The thesis is framed as an attempt to reduce robot-programming friction for frequently changing tasks by enabling in-workspace spatial authoring directly in the real workspace, rather than editing pendant-style programs or using offline programming workflows. Source: `introduction.tex` Motivation, High-level approach, Goals.
- [T] **GF-02** The thesis presents a modular, end-to-end system in which workspace sensing, authoring, interpretation, and execution are connected through explicit interfaces. Source: `introduction.tex` High-level approach; `ch02_analysis.tex` Modular architecture; `ch01_background.tex` Positioning of this thesis.
- [T] **GF-03** The evaluation focus is two representative task families: pick-and-place and seam welding. Source: `introduction.tex` High-level approach, Goals; `ch02_analysis.tex` Target tasks and their requirements.
- [T] **GF-04** The thesis deliberately targets task-oriented use cases rather than a full robot programming language, and explicitly excludes complex branching, loops, exception recovery, and rich sensor-driven logic. Source: `introduction.tex` High-level approach; `ch02_analysis.tex` Target tasks and their requirements; `ch02_analysis.tex` Summary.
- [T] **GF-05** Chapter 6 is planned as a qualitative evaluation/discussion chapter. Source: `introduction.tex` Thesis structure.
- [T] **GF-06** Chapter 7 is planned to summarize contributions and outline future work. Source: `introduction.tex` Thesis structure.
- [T] The thesis positions its approach against teach-pendant programming, offline programming, and hand-guiding as alternatives that remain friction-heavy for changing tasks. Source: `introduction.tex` Motivation.
- [T] The thesis argues that low-level motion details dominate effort in small frequently changing robot programs, which motivates a task-oriented use-case abstraction. Source: `introduction.tex` High-level approach.
- [T] The related-work chapter positions this thesis closer to authoring-focused AR robot programming than to visualization-only systems. Source: `ch01_background.tex` AR/VR interfaces; Positioning of this thesis.
- [T] The related-work chapter distinguishes this thesis from online waypoint/path authoring and online trigger-action authoring by emphasizing reusable use-case logic that combines spatial intent with scene context. Source: `ch01_background.tex` Online trajectory authoring; Online rule-based authoring; Positioning of this thesis.
- [T] Chapter 2 derives the system from three representative requirements: 6DoF spatial input, scene detection, and a UI for non-spatial parameters plus use-case selection/visualization/confirmation. Source: `ch02_analysis.tex` System requirements.
- [T] Chapter 2 decomposes the system into five base components: 6DoF input interface, scene detection, robot execution interface, UI, and use-case plugin support. Source: `ch02_analysis.tex` Requirement-driven design decisions.
- [T] Chapter 2 explicitly treats the system-design comparisons as qualitative engineering assessments rather than quantitative benchmarks. Source: `ch02_analysis.tex` Requirement-driven design decisions.

## B. What was actually demonstrated
- [T] The packet shows the thesis is designed around two task classes that stress different interaction patterns: a discrete object-centric task and a trajectory-centric process task. Source: `introduction.tex` High-level approach; `ch02_analysis.tex` Target tasks and their requirements.
- [T] The packet shows that the system is intended to support reuse of the same sensing and execution infrastructure across multiple use cases, rather than hard-coding one task. Source: `introduction.tex` High-level approach; `ch02_analysis.tex` Use case plugin support.
- [T] The packet shows that the thesis evaluates several candidate modalities and settles on a low-hardware-overhead configuration for a prototype. Source: `ch02_analysis.tex` 6DoF input interface; Scene detection; Camera trade-offs; UI.
- [T] The packet demonstrates, at the design level, that pick-and-place can be made scene-aware through object detection and object-relative pose logic, while seam welding can be made trajectory-centric through scene-aligned seam reasoning. Source: `ch02_analysis.tex` Pick-and-place; Seam welding.

## C. Strong outcomes / positive findings
- [T] **POS-01** The architecture-level claim strongest in this packet is not any single algorithm, but the ability to separate stable contracts from exchangeable implementations. Source: `ch02_analysis.tex` Modular architecture; `ch01_background.tex` Positioning of this thesis.
- [T] **POS-02** The use-case plugin boundary is a meaningful contribution because it lets different tasks interpret the same spatial input differently without changing the core sensing or execution pipeline. Source: `ch02_analysis.tex` Use case plugin support; Modular architecture.
- [T] **POS-05** The choice of a robot-mounted stereo camera is justified as a practical compromise: monocular depth was observed to be unstable, while stereo improves usable depth while keeping the system prototype-friendly. Source: `ch02_analysis.tex` 6DoF input interface; Camera trade-offs; Summary.
- [T] The thesis gives a clear design rationale for preferring stable, repeatable pose capture over maximum input intuitiveness when the task requires repeated authoring near objects. Source: `ch02_analysis.tex` 6DoF input interface.
- [T] The thesis argues that fixed use cases are a deliberate trade-off: they reduce expressiveness but make the system practical for frequently changing tasks and easier to extend later. Source: `introduction.tex` High-level approach; `ch02_analysis.tex` Seam welding; Use case plugin support.
- [T] The related work chapter supports the thesis positioning by showing that the work sits in a gap between waypoint/path authoring, rule-based authoring, offline transfer workflows, and gesture-only systems. Source: `ch01_background.tex` AR robot programming systems; Multimodal intent; Positioning of this thesis.

## D. Limitations and weaknesses

### 1. Scope / concept-level limits
- [T] **LIM-SCOPE-01** The system is intentionally not a full robot programming language. It does not cover branching, loops, exception recovery, or rich sensor-driven logic. This is concept-level, not just a prototype quirk. Source: `introduction.tex` High-level approach; `ch02_analysis.tex` Target tasks and their requirements.
- [T] **LIM-SCOPE-02** The thesis deliberately accepts reduced expressiveness by focusing on task-oriented use cases. This means the architecture is optimized for fixed task families, not arbitrary programs. Source: `introduction.tex` High-level approach; `ch02_analysis.tex` Use case plugin support; Modular architecture.
- [T] **LIM-SCOPE-03** Tool control is acknowledged as a hard problem in the robot interface analysis, especially across heterogeneous robots and tool types. The packet supports a cautious treatment, not a full general tool abstraction claim. Source: `ch02_analysis.tex` Robot interface.

### 2. Sensing and calibration
- [T] **LIM-SENS-01** Hand tracking is considered attractive but risky for precise workspace authoring because of depth instability, gesture ambiguity, occlusion sensitivity, and lighting sensitivity. This is a design limitation of that modality, not a flaw of the thesis implementation. Source: `ch02_analysis.tex` 6DoF input interface.
- [T] **LIM-SENS-02** Camera-based marker tracking depends on practical factors such as camera quality, marker size, viewing distance, lighting, and occlusion. Source: `ch02_analysis.tex` 6DoF input interface.
- [T] **LIM-SENS-03** The camera configuration trade study explicitly identifies monocular depth instability as a problem, motivating stereo or multi-camera alternatives. Source: `ch02_analysis.tex` Camera trade-offs; 6DoF input interface summary.
- [T] **LIM-SENS-04** The chosen robot-mounted stereo configuration assumes a rigid mount and stable calibration, which makes the sensing stack sensitive to physical disturbance. Source: `ch02_analysis.tex` Camera trade-offs.
- [T] **LIM-SENS-05** The analysis keeps the input interface modular specifically so alternative 6DoF sources such as hand tracking or VR controllers can replace the current modality later. Source: `ch02_analysis.tex` 6DoF input interface; Modular architecture.

### 3. Scene understanding
- [T] **LIM-SENS-06** Scene detection is intentionally limited to fiducial-based object pose estimation in the thesis setup. This is a simplified scene model, not a full object understanding pipeline. Source: `ch02_analysis.tex` Scene detection; Summary.
- [T] **LIM-SENS-07** The scene-detection requirement is stricter than the input requirement because the detected object poses are used to refine user input and derive execution geometry. Source: `ch02_analysis.tex` Scene detection; System requirements.
- [T] **LIM-SENS-08** The thesis explicitly notes that more advanced alternatives exist, such as model-based pose estimation or reconstruction-based approaches, but they are outside the selected prototype. Source: `ch02_analysis.tex` Scene detection.

### 4. Robot execution and tooling
- [T] **LIM-ROBOT-01** The robot interface is intentionally small and motion-centric: it exposes a limited set of motion primitives and state signals, not a full tool-control stack. Source: `ch02_analysis.tex` Robot interface.
- [T] **LIM-ROBOT-02** The thesis treats tool control as an optional extension and notes that portable cross-robot tool APIs are a substantial topic on their own. Source: `ch02_analysis.tex` Robot interface.
- [T] **LIM-ROBOT-03** The robot interface analysis indicates that Cartesian motion is preferred for the thesis workflow, but vendor support may differ and some primitives may need approximation. Source: `ch02_analysis.tex` Robot interface.

### 5. UI / orchestration / visualization
- [T] **LIM-UI-01** The UI is chosen as a pragmatic 2D tablet-style frontend rather than an AR/VR interface, mainly to keep hardware and calibration overhead low. Source: `ch02_analysis.tex` UI.
- [T] **LIM-UI-02** AR/VR interaction is described as potentially powerful but ambiguous for composed use cases because the final program is often derived from intent plus scene context, not a direct copy of raw user input. Source: `ch02_analysis.tex` UI.
- [T] **LIM-UI-03** The architecture remains open to alternative frontends later, which implies that the current UI should not be read as a production-optimized endpoint. Source: `ch02_analysis.tex` UI; Modular architecture.

### 6. Evaluation boundary
- [T] **VAL-01** The packet supports only qualitative design reasoning, not benchmark-grade claims. Source: `ch02_analysis.tex` Requirement-driven design decisions.
- [T] **VAL-02** The thesis frames the chosen task families as representative rather than exhaustive. Source: `introduction.tex` High-level approach; `ch02_analysis.tex` Target tasks and their requirements.
- [T] **VAL-03** The ability to cover additional tasks such as painting or motion primitives is presented as a plausibility check, not as a formal proof of generality. Source: `ch02_analysis.tex` Coverage of Additional Use Cases.
- [MAYBE] **VAL-04** Because the packet does not include any user study or controlled comparison, later chapters should stay cautious about efficiency claims. This is a strong inference from the scope, but the packet itself does not contain a formal evaluation section. Source: `introduction.tex` Thesis structure; `ch02_analysis.tex` Requirement-driven design decisions.

## E. Future work already supported by the text

### Sensing
- [T] **FW-SENS-01** Replace or extend the current sensing stack with alternative 6DoF input sources, including hand tracking or VR/AR controllers. Source: `ch02_analysis.tex` 6DoF input interface; `ch01_background.tex` Positioning of this thesis.
- [T] **FW-SENS-02** Improve camera configuration beyond the selected robot-mounted stereo setup, including fixed stereo, multiple cameras, or robot-mounted multi-view capture. Source: `ch02_analysis.tex` Camera trade-offs; Modular architecture.
- [T] **FW-SENS-03** Improve scene understanding beyond fiducial boxes via model-based or reconstruction-based methods. Source: `ch02_analysis.tex` Scene detection; Modular architecture.
- [T] **FW-SENS-04** Improve marker robustness and pose stability using different marker families or stronger depth/pose pipelines. Source: `ch02_analysis.tex` 6DoF input interface; Camera trade-offs.

### Input / interaction
- [T] **FW-INPUT-01** Consider multimodal intent input such as gesture plus speech. Source: `ch01_background.tex` Multimodal intent.
- [T] **FW-INPUT-02** Consider using AR/VR hardware for both input and visualization once calibration and interaction semantics are solved. Source: `ch02_analysis.tex` UI; 6DoF input interface.

### Robot interface / execution
- [T] **FW-ROBOT-01** Develop a more general tool abstraction that can cover grippers, welders, and other device types across robot platforms. Source: `ch02_analysis.tex` Robot interface.
- [T] **FW-ROBOT-02** Expand motion/execution support beyond the small thesis interface, especially where robot vendors differ in available primitives. Source: `ch02_analysis.tex` Robot interface.

### UI
- [T] **FW-UI-01** Replace or augment the 2D tablet-style UI with alternative frontends if deployment constraints justify it. Source: `ch02_analysis.tex` UI.
- [T] **FW-UI-02** Use the same architecture to integrate a better-aligned AR/VR UI once the interaction model is well defined. Source: `ch02_analysis.tex` UI; Modular architecture.

### Use cases / applicability
- [T] **FW-USE-01** Add additional task-oriented use cases beyond pick-and-place and seam welding, such as painting or surface processing. Source: `ch02_analysis.tex` Coverage of Additional Use Cases; Use case plugin support.
- [T] **FW-USE-02** Improve the way the system handles tasks that need stronger object semantics or richer scene reasoning than the current fiducial-based model. Source: `ch02_analysis.tex` Pick-and-place; Seam welding; Scene detection.

### Evaluation
- [T] **FW-EVAL-01** Run a formal user study or other controlled comparison to quantify whether spatial authoring really reduces programming friction. Source: `introduction.tex` Motivation; `ch02_analysis.tex` Requirement-driven design decisions.
- [T] **FW-EVAL-02** Compare against alternative robot-programming workflows such as teach pendants, offline programming, and hand-guiding in a controlled setting. Source: `introduction.tex` Motivation; `ch01_background.tex` Positioning of this thesis.
- [T] **FW-EVAL-03** Evaluate the system on more tasks and more varied environments to strengthen the evidence for extensibility. Source: `ch02_analysis.tex` Coverage of Additional Use Cases; Modular architecture.

### Long-term research direction
- [T] **FW-LONG-01** The broader direction is a modular authoring system in which sensing, UI, robot integration, and use-case logic can all be swapped independently. Source: `ch02_analysis.tex` Modular architecture.
- [T] **FW-LONG-02** The thesis explicitly suggests that future systems could combine spatial intent with richer scene context and higher-level interaction, rather than requiring explicit low-level program edits. Source: `introduction.tex` High-level approach; `ch01_background.tex` Multimodal intent.

## F. Claims to avoid
- Do not claim the thesis delivers a full robot programming language. The text explicitly says it does not. Source: `introduction.tex` High-level approach; `ch02_analysis.tex` Target tasks and their requirements.
- Do not claim the architecture is universally superior to teach pendants, offline programming, or hand-guiding. The packet supports motivation and a design rationale, not universal dominance. Source: `introduction.tex` Motivation; `ch01_background.tex` Positioning of this thesis.
- Do not claim formal quantitative performance improvements from this packet. The Chapter 2 comparisons are explicitly qualitative. Source: `ch02_analysis.tex` Requirement-driven design decisions.
- Do not claim the current system already supports general tool abstraction or cross-robot tool interoperability. The packet says that is future work. Source: `ch02_analysis.tex` Robot interface.
- Do not claim the current system has solved AR/VR interaction or gesture-plus-speech intent. The packet only positions those as future directions. Source: `ch02_analysis.tex` UI; `ch01_background.tex` Multimodal intent.
- Do not claim broader task coverage than the thesis actually evaluates. The extra examples are plausibility checks, not proof of generality. Source: `ch02_analysis.tex` Coverage of Additional Use Cases.

## G. Questions for the author
- Is the conclusion chapter supposed to emphasize the modular runtime as the main contribution, or the task-specific use cases as the main contribution?
- Should discussion frame pick-and-place primarily as evidence of scene-adaptive flexibility, or keep it secondary to welding as the stronger fit?
- Are there any source-grounded statements you want to make about how strongly the current prototype supports future tool abstraction?
- Do you want Chapter 7 to mention the plausibility-check tasks from Chapter 2 explicitly, or keep future work focused on sensing/UI/robot extension?

## H. Source index
- `GF-01` to `GF-06`: `introduction.tex` Motivation, High-level approach, Goals, Thesis structure.
- `POS-01` to `POS-07`: `ch02_analysis.tex` Modular architecture, Use case plugin support, Camera trade-offs, UI; plus `ch01_background.tex` Positioning of this thesis.
- `LIM-SCOPE-*`: `introduction.tex` High-level approach; `ch02_analysis.tex` Target tasks and their requirements, Robot interface.
- `LIM-SENS-*`: `ch02_analysis.tex` 6DoF input interface, Scene detection, Camera trade-offs.
- `LIM-ROBOT-*`: `ch02_analysis.tex` Robot interface.
- `LIM-UI-*`: `ch02_analysis.tex` UI, Modular architecture.
- `VAL-*`: `introduction.tex` Thesis structure; `ch02_analysis.tex` Requirement-driven design decisions, Coverage of Additional Use Cases.
- `FW-*`: `ch01_background.tex` Multimodal intent; `ch02_analysis.tex` 6DoF input interface, Scene detection, Camera trade-offs, Robot interface, UI, Use case plugin support, Coverage of Additional Use Cases, Modular architecture.

