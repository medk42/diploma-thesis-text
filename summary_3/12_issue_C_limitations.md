# Issue Definition

This pack collects the thesis evidence needed to rewrite the limitations part of Chapters 6 and 7 without overclaiming. The core task is to separate the prototype’s real limitations by type, keep the discussion anchored in the actual system, and avoid collapsing everything into one generic “prototype is incomplete” paragraph.

The source material supports a fairly clean structure:
- concept and scope limits are mostly established in the introduction and analysis chapters,
- sensing, calibration, scene understanding, execution, and UI limits are established in implementation and workflow chapters,
- Chapter 6 should then interpret those limits as a validity boundary,
- Chapter 7 should turn only the most meaningful limits into future work.

The user’s notes add a second filter: the rewrite should not just restate bugs or unfinished work, but distinguish what is thesis-level limitation, what is implementation roughness, and what is a genuine research direction.

The key danger is overexpanding Chapter 6 into a laundry list of flaws. The better shape is: what the thesis actually demonstrates, where that demonstration is valid, and where the result stops.

# Concept-Level / Scope Limitations

These are the limitations that belong to the thesis idea itself, not just to the prototype.

- The thesis explicitly does not target a full robot programming language. The introduction states that the approach does not cover complex branching, loops, exception recovery, or rich sensor-driven logic (`introduction.tex:54-56`). Chapter 6 repeats that the system is narrower than a full robot programming environment (`ch06_discussion.tex:7-9`).
- The analysis chapter already frames the system as task-oriented use cases rather than general automation logic. It says the system should support use cases, but that the requirements and abstractions are meant for a broader class of tasks, not arbitrary robot programs (`ch02_analysis.tex:18-20`, `ch02_analysis.tex:474-478`, `ch02_analysis.tex:493-497`).
- The use-case model itself is a deliberate scope choice. The design chapter formalizes use cases as a plugin boundary and states that the UI uses a linear command model, with branching and parallel composition out of scope (`ch03_system_design.tex:1416-1467`).
- The thesis therefore should not discuss the result as a universal replacement for teach pendants or offline programming. The conclusion already phrases this cautiously, but that caution should remain central (`ch07_conclusion_future_work.tex:5-9`).

What to say in Chapter 6:
- this is a prototype framework for selected task classes,
- the value lies in fast re-authoring inside prepared use cases,
- the thesis does not attempt to solve arbitrary robot-program logic.

What to say in Chapter 7:
- the strongest conclusion is that the architecture is useful for a specific class of workflows,
- not that it replaces standard robot programming in general.

# Sensing and Calibration Limitations

This is one of the strongest limitation clusters because the thesis is very explicit about it.

- The introduction already frames the system as relying on a 6DoF tracked pen and stereo-vision-based sensing (`introduction.tex:8-9`).
- The analysis chose camera-based marker tracking, but only after weighing accuracy, calibration effort, and intent signaling (`ch02_analysis.tex:113-152`).
- The same chapter states that monocular marker pose estimation produced unstable depth in early experiments (`ch02_analysis.tex:199-201`, `ch02_analysis.tex:330-330`).
- The implementation confirms that the pen tracking module does not fuse IMU data even though the pen firmware transmits it (`ch04_implementation.tex:77-79`, `ch04_implementation.tex:315-320`).
- The robot-mounted stereo calibration depends on a rigid mount and successful Charuco-based calibration; if the mount is disturbed, the calibration is invalid (`ch04_implementation.tex:219-245`, `ch04_implementation.tex:244-245`).
- The workflow chapter reinforces the same dependency: calibration is valid only while the stereo rig remains rigid with respect to the flange, and it must be repeated if the camera mount is moved or reassembled (`ch05_user_workflow.tex:149-162`).
- Appendix material confirms that reproducibility of the end-to-end system requires either physical robot access or a restricted offline environment, which is not generally available (`appendix_attachments.tex:251-253`).

Interpretation:
- The thesis can safely claim that the sensing stack is good enough for the prototype workflow and limited physical validation.
- It cannot claim that the sensing stack has been quantitatively characterized or that it is robust under all deployment conditions.

What Chapter 6 should emphasize:
- marker visibility, blur, lighting, and calibration quality affect tracking;
- the current stack is prototype-grade, not production-grade;
- lack of IMU fusion is a concrete gap, not a generic “future improvement”.

# Scene-Understanding Limitations

This is the clearest practical limit on applicability.

- The design chapter defines the scene interface as a static registry of detected boxes with only `id` and `Pose` and explicitly says there is no uncertainty model (`ch03_system_design.tex:1308-1360`).
- The implementation confirms that the scene detection module works on fiducial-tagged boxes only, processes a single stereo pair per `READ_SCENE`, and does not use temporal stabilization or confidence outputs (`ch04_implementation.tex:326-378`).
- The workflow chapter shows that the user must place fiducial-tagged boxes in the scene and that weld/pick workflows depend on that registry model (`ch05_user_workflow.tex:233-240`, `ch05_user_workflow.tex:304-327`).
- Chapter 6 identifies scene understanding as the most important limitation and says the current system is furthest from broader practical use there (`ch06_discussion.tex:31-31`).

Interpretation:
- The current system is intentionally box-based, and that matters because it sharply limits generalization.
- Pick-and-place can work because the object model is simple and tied to IDs.
- More complex material handling tasks would need richer object understanding than this thesis provides.

What to avoid:
- do not phrase this as if the whole thesis is “about boxes”; it is about the architecture and authoring model, with boxes as the prototype scene abstraction.

# Robot Execution and Tool Limitations

The execution side is deliberately simplified, and this should be stated plainly.

- The analysis says the robot interface should support motion primitives and tool control, but also acknowledges that portable tool control is substantially harder to standardize (`ch02_analysis.tex:427-439`).
- The design chapter states that tool control is out of scope for the implemented robot interface (`ch03_system_design.tex:1205-1295`).
- The implementation confirms that the robot module supports motion, state feedback, cancellation, and status reporting, but tool/gripper control is simulated by fixed delays in the use cases (`ch04_implementation.tex:393-437`, `ch04_implementation.tex:434-435`, `ch04_implementation.tex:516-523`, `ch04_implementation.tex:612-627`).
- The implementation also says collision checking is absent and simulation mode is not supported for the prototype (`ch04_implementation.tex:531-535`, `ch04_implementation.tex:623-628`, `ch04_implementation.tex:449-450`, `ch04_implementation.tex:640-653`).
- The workflow chapter makes the same point more concretely by describing the welding and pick motions as linear sequences, with weld and pick relying on fixed motion patterns and no collision validation (`ch05_user_workflow.tex:230-280`, `ch05_user_workflow.tex:298-344`).

Interpretation:
- The thesis demonstrates a robot execution layer, not a complete industrial execution stack.
- Motion support is real and meaningful, but tool semantics remain placeholder-level.
- That makes the result strong as an architecture prototype and weak as a deployment-ready robot program generator.

# UI / Orchestration / Visualization Limitations

These are mostly prototype maturity limits, and they should be presented as such.

- The design chapter defines the UI as a control-plane integration for graph setup, activation, use-case programming, visualization aggregation, and persistence (`ch03_system_design.tex:1482-1545`).
- The same chapter states that the UI stores the program model as a linear command list, with branching and parallel composition out of scope (`ch03_system_design.tex:1415-1467`).
- The workflow chapter describes practical rough edges: users may need to reload visualization if stale artifacts remain visible, and save/load can fail or partially restore the setup when hardware modules cannot activate (`ch05_user_workflow.tex:172-177`, `ch05_user_workflow.tex:211-215`).
- The workflow chapter also makes clear that setup and program persistence are distinct and that the system is sensitive to whether the robot and camera are active at load time (`ch05_user_workflow.tex:173-177`, `ch05_user_workflow.tex:350-362`).

Interpretation:
- The UI is intentionally a prototype frontend for orchestration, not a polished production interface.
- Its limitations are partly about maturity, partly about how much orchestration complexity the thesis decided to expose.

What Chapter 6 can say safely:
- the UI covers the full workflow end to end,
- but it remains a prototype control plane,
- and some rough edges belong to engineering completeness rather than to the thesis concept itself.

# Portability Limitations

This thesis presents itself as multi-platform in the abstract, but the actual prototype is not fully portable yet.

- The implementation says most modules are platform-neutral, but platform-specific code is concentrated in the Windows camera acquisition module (`ch04_implementation.tex:11-17`, `ch04_implementation.tex:61-62`, `ch04_implementation.tex:164-166`).
- The same chapter says the current BLE discovery sequence assumes service UUIDs are visible during scanning as observed on Windows, while Linux would need to connect first and query services afterward (`ch04_implementation.tex:16-17`, `ch04_implementation.tex:308-310`).
- The appendix says the build workflow supports both Windows and Linux in principle, but that is a build/dependency capability, not proof that the end-to-end hardware workflow is equally mature on both platforms (`appendix_attachments.tex:42-59`, `appendix_attachments.tex:75-83`).

Interpretation:
- The codebase is architecturally portable, but the demonstrated hardware workflow is still partly platform-bound.
- That should be described as a limitation of the current prototype, not as a contradiction of the modular design goal.

# Applicability Limitations

This is where the thesis should be honest about where the approach fits and where it does not.

- Chapter 6 already says pick-and-place is not the strongest practical target for the prototype, especially compared to welding-like tasks (`ch06_discussion.tex:19-23`).
- The same section argues that the value lies where repeated low-level reprogramming becomes the dominant cost, which is a narrower class of workflows than generic automation (`ch06_discussion.tex:23-27`).
- The workflow chapter shows why welding is easier to adapt: it can be resolved during confirmation into fixed poses, while pick-and-place is scene-adaptive but relies on a simple box/ID model (`ch05_user_workflow.tex:301-303`, `ch05_user_workflow.tex:336-344`).
- The implementation confirms that weld is fixed after command creation and assumes unchanged scene/workpiece configuration, while pick-and-place re-reads the scene at execution and recomputes the pick pose from the box pose (`ch04_implementation.tex:505-523`, `ch04_implementation.tex:594-607`).

Interpretation:
- The thesis is strongest for task families that are repetitive, spatially specific, and relatively stable in structure.
- It is weaker for highly specific material-handling cells that depend on richer industrial sensing chains or more specialized integration.

This is a good place to say explicitly:
- welding-like tasks are the clearest fit,
- pick-and-place is the proof of adaptability, not the strongest practical target.

# Safety / Production-Readiness Limitations

This should be a careful, honest boundary statement rather than a dramatic warning.

- The introduction frames the system as a thesis prototype and a way to explore a new authoring model, not a finished industrial platform (`introduction.tex:8-9`, `introduction.tex:54-56`).
- The implementation explicitly lacks collision checking, generalized tool control, and simulation-mode execution (`ch04_implementation.tex:531-535`, `ch04_implementation.tex:623-628`, `ch04_implementation.tex:449-450`).
- The workflow requires a clear workspace, rigid mounting, and controlled calibration conditions (`ch05_user_workflow.tex:18-27`, `ch05_user_workflow.tex:149-162`, `ch05_user_workflow.tex:233-240`).
- Chapter 6 states directly that the thesis is a prototype-level result and not a general replacement for existing tools (`ch06_discussion.tex:7-9`, `ch06_discussion.tex:37-39`).
- Chapter 7 repeats that the thesis is a proof of concept rather than a validated industrial programming platform (`ch07_conclusion_future_work.tex:5-9`).

Interpretation:
- The thesis can justify “research prototype” and “proof of concept”.
- It should not imply deployment readiness, safety certification, or production-grade autonomy.

# Which Limitations Are Explicitly Supported in Text

These are safe to state as factual thesis claims.

- The system is not a full robot programming language (`introduction.tex:54-56`, `ch06_discussion.tex:7-9`).
- The scene model is box-only and registry-driven (`ch03_system_design.tex:1308-1360`, `ch04_implementation.tex:344-377`).
- There is no uncertainty/confidence output in scene detection (`ch03_system_design.tex:1355-1360`, `ch04_implementation.tex:373-377`).
- Pen tracking does not use IMU fusion (`ch04_implementation.tex:77-79`, `ch04_implementation.tex:315-320`).
- Calibration depends on a rigid robot-mounted stereo rig (`ch04_implementation.tex:219-245`, `ch05_user_workflow.tex:149-162`, `appendix_attachments.tex:131-134`).
- Tool/gripper control is not standardized and is simulated by fixed delays (`ch02_analysis.tex:437-439`, `ch03_system_design.tex:1205-1295`, `ch04_implementation.tex:434-435`, `ch04_implementation.tex:516-523`, `ch04_implementation.tex:612-627`).
- Collision checking is absent (`ch04_implementation.tex:531-535`, `ch04_implementation.tex:623-628`).
- Simulation mode is not supported in the prototype (`ch04_implementation.tex:449-450`, `ch04_implementation.tex:640-653`).
- The current evaluation is qualitative and workflow-oriented, with no formal user study or quantitative tracking characterization (`ch06_discussion.tex:37-39`).
- The thesis is best understood as a prototype / proof of concept, not an industrial programming platform (`ch07_conclusion_future_work.tex:5-9`).

# Which User Notes Are Only Partially Supported or Should Remain Future-Facing

These notes came from the user’s detailed guidance and are useful, but not all of them are explicitly established in the thesis text. They should be treated as future-facing unless later verified in code or another thesis passage.

- `blocking save/load`
  - Partially supported: save/load exists and can fail or partially restore when hardware modules are unavailable (`ch05_user_workflow.tex:173-177`, `ch05_user_workflow.tex:350-362`).
  - Not explicitly supported in the current thesis text: a hard “blocking” issue as a recurring problem statement.

- `visualization desync from fragmented updates`
  - Partially supported: the UI has a `Reload Visualization` action for stale artifacts, and the 3D view uses incremental updates (`ch05_user_workflow.tex:211-215`, `ch03_system_design.tex:1530-1535`).
  - Not explicitly supported: a detailed diagnosis that the desync is specifically due to fragmented updates.

- `reload edge cases`
  - Partially supported: reload exists and is needed for the UI-local visualization mirror (`ch05_user_workflow.tex:211-215`, `ch03_system_design.tex:1533-1535`).
  - Not explicitly supported: a catalog of specific reload edge cases.

- `custom-load popup issues`
  - Only weakly supported: the thesis describes activation/capture dialogs and progress dialogs, but not any specific popup bug (`ch03_system_design.tex:917-930`, `ch03_system_design.tex:935-941`).

- `re-adding camera not visualized`
  - Only weakly supported: the thesis shows how modules are added and how visualization updates occur, but not this exact issue as a named fact (`ch05_user_workflow.tex:68-102`, `ch05_user_workflow.tex:211-215`, `ch03_system_design.tex:1530-1535`).

- `Linux camera backend / unified capture layer`
  - Supported as a future direction, but the current thesis text only explicitly proves the Windows camera module is the concrete implementation and Linux BLE handling would need adaptation (`ch04_implementation.tex:11-17`, `ch04_implementation.tex:164-166`, `ch04_implementation.tex:308-310`).

- `stronger quantitative timing comparison`
  - Supported as a future evaluation idea, not as a current thesis claim (`ch06_discussion.tex:37-39`, `ch07_conclusion_future_work.tex:25-27`).

The practical rule for the rewrite:
- if it is not in the thesis text or clearly implied by it, do not convert it into a limitation fact;
- if it is a reasonable engineering issue but not text-grounded, keep it in future work or omit it.

# Suggested Chapter Wording Blocks

These are not final prose, but they are close enough to guide the rewrite.

## Chapter 6: opening limitation framing

The thesis built an end-to-end prototype for in-workspace spatial authoring, but that prototype should be read as a targeted system for selected task classes rather than as a general robot-programming environment. Its value lies in showing that spatial input, workspace sensing, and a shared execution runtime can be composed into a usable workflow; its limits are equally important, because they define where that workflow can and cannot yet be transferred.

## Chapter 6: scene and sensing boundary

The strongest boundary of the current system is the sensing stack. Pen tracking depends on marker visibility, lighting, blur, and calibration quality, and the current implementation does not fuse the IMU data available from the device. Scene understanding is even narrower: it operates on a registry of fiducial-tagged boxes, returns only `id` and pose, and does not report uncertainty or stabilize detections over time.

## Chapter 6: use-case asymmetry

The two evaluated use cases therefore have different weight. Pick-and-place demonstrates that authored intent can be combined with a fresh scene snapshot at execution time, but it also shows the limits of the current box-based scene model. Seam welding is the more direct fit for the approach: the task is trajectory-centric, the interpretation logic is simple enough to infer a complete procedure, and the user only needs to re-author the parts that actually vary.

## Chapter 6: validity boundary

Taken together, the prototype demonstrates a working workflow and a reusable runtime, but not a fully validated industrial programming platform. The result is qualitative and workflow-oriented: it shows what the system can do, how it behaves on representative task families, and where its present limitations begin.

## Chapter 7: conclusion

The most defensible conclusion is that spatial authoring is a promising programming model for selected collaborative-robot workflows, especially when a task changes often enough that repeated low-level reprogramming becomes the dominant cost. The thesis does not replace established robot-programming tools; it identifies a technically coherent direction that is useful where the task structure is stable enough to be packaged as a use case.

## Chapter 7: near-term future work

The nearest next step is not to broaden the idea immediately, but to finish the prototype boundaries that are already visible: improve the sensing and calibration stack, strengthen the execution layer with tool abstraction and validation, and make the current workflow more robust across platforms.

## Chapter 7: longer-term directions

Beyond that, the more interesting research directions are richer interaction and richer task scope: hand tracking or VR/AR controllers as alternative 6DoF inputs, multimodal interaction with speech, integration with established robot-programming workflows, formal user studies, and broader use cases that can show where spatial authoring is genuinely better than traditional programming.

