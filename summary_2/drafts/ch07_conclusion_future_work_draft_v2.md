# Chapter 7 Draft v2

## 7.1 Conclusion

This thesis investigated whether collaborative-robot tasks that change frequently can be programmed more directly by authoring spatial intent in the real workspace. The answer from the prototype is cautiously positive: the thesis built a modular spatial-authoring system, demonstrated it on a real robot, and showed that the same runtime can support both scene-adaptive and trajectory-centric use cases.

The main contribution is the system itself. It is a reusable runtime with explicit interfaces that separates sensing, authoring, interpretation, and execution. Pick-and-place shows that the system can adapt at runtime when the scene changes, while seam welding shows that trajectory-centric tasks can be expressed in a practical, task-oriented way. The most defensible conclusion is that spatial authoring is useful for selected repeated or re-taught workflows, but that the prototype remains a research system rather than a validated industrial replacement.

## 7.2 Near-term future work

The nearest future work is technical completion. The scene pipeline should become less narrow, because the current box-based fiducial model is the clearest practical limit of the thesis. The tracking stack should be made more robust, especially by improving calibration support and making better use of the pen's available sensing. The execution layer should also be strengthened with real planning support, collision checking, and clearer tool abstraction. These are the items that would most directly reduce the gap between the prototype and a broader-use system.

The UI and orchestration layer also need refinement, but that should remain a secondary concern compared with sensing and execution. The current frontend already proves the workflow, but the workflow still carries setup burden and relies on recovery mechanisms that are good enough for a prototype rather than ideal for repeated daily use.

## 7.3 Longer-term directions

The longer-term research direction is richer interaction. Hand tracking, VR or AR controllers, and voice-plus-gesture input are all plausible replacements or extensions for the current pen-based interaction. A teach-pendant or robot-controller integration path is also interesting, because it would let the same spatial-authoring idea live inside an existing industrial workflow instead of remaining a separate frontend.

The other important long-term direction is evaluation. The thesis deliberately stops short of a formal user study or quantitative comparison, so the next step should be to measure how the system performs, how stable the tracking really is, and when the workflow actually reduces effort compared with conventional programming methods. That is the right way to turn the current prototype into a stronger scientific result.

## 7.4 Closing note

The cleanest final message is that the thesis establishes a workable foundation for task-oriented spatial robot authoring. It is strongest when the task is repeated, spatial, and re-teachable. It is weakest when the task depends on broad scene understanding, path planning, or a full robot-programming environment. That is a useful result, and it points clearly to the next engineering and research steps.

