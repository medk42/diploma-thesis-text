# Chapter 6 Draft v2

## 6.1 What the thesis built

This thesis explored whether frequently changing collaborative-robot tasks can be programmed with less friction by specifying spatial intent directly in the real workspace. The result is not only a pen-based interaction concept, but a modular end-to-end system that connects sensing, authoring, interpretation, and execution through explicit interfaces. In that sense, the main thesis result is a reprogrammable spatial-authoring framework for a robot cell, not a single demo or a single input device.

The system is intentionally task-oriented. It does not attempt to become a full robot programming language with branching, loops, or rich recovery logic. Instead, it supports selected task classes through use-case plugins that reuse the same acquisition and execution infrastructure. The two main use cases, pick-and-place and seam welding, are not only examples of what the system can do, but also evidence that the same runtime can support different kinds of task structure.

## 6.2 What the results mean

The most important result is that the thesis provides a viable middle ground between two existing deployment patterns. On one side is the static integrator-built cell, where the task is configured once and then reused with little change. On the other side is the full robot-programming language, which offers expressive control but pushes complexity onto the user. The thesis sits between those extremes. It keeps the task-specific behavior, but it makes the task reauthoring much more direct through spatial intent and a shared runtime.

This matters because the real value area is not every possible robot task. It is repeated reprogramming, frequent changeovers, and tasks that are simple enough to re-teach but annoying enough to justify a better workflow. In that region, the human should be able to prepare the cell, point to the intended motion, confirm it, and let the robot do the repetitive part. That is the strongest interpretation of what the thesis brings to the world.

## 6.3 Where the approach works well

The strongest result is the architecture itself. The thesis does not only validate one sensing pipeline or one frontend; it shows that sensing, UI, robot backend, visualization, and use-case logic can be separated behind explicit boundaries. That is important because it turns the work into a platform rather than a one-off prototype. It also makes the prototype easier to think about: the system has a clear control plane, and the user workflow is explicit rather than hidden inside implementation details.

The use cases show two different strengths. Pick-and-place is useful because it proves the system can adapt to the current scene at runtime. That is a positive result, even if pick-and-place is not necessarily the ideal practical target for this kind of interface. Its value is that it demonstrates the architecture can stay flexible when the scene changes. Seam welding is the stronger practical fit. It matches the idea of teaching a trajectory once, aligning it to the scene, and then reusing it in a repeated or frequently re-taught task. That is where spatial authoring feels most natural.

The more concrete lesson is that the thesis is not trying to replace expert integrators everywhere. It is trying to make a narrower but important band of work easier: tasks that are repetitive, spatial, and often re-authored. In that setting, the thesis suggests a workflow that is closer to "prepare the cell, teach the intent, run the task" than to "write a full program from scratch."

## 6.4 Where the approach is not useful

The system should not be oversold as a general replacement for established robot-programming workflows. For static high-volume cells that rarely change, the overhead of setting up a spatial-authoring workflow may not be justified. For tasks that require heavy branching, recovery logic, or rich planning, the current command model is too simple. And for tasks where the scene understanding or tracking is too weak, the idea may not generalize well enough to be useful.

The main point is not that the thesis failed to solve robot programming. The point is that it defines a useful region of the problem space and shows that this region can be handled with a modular spatial-authoring system. That is a meaningful result on its own, but it should be framed as a prototype result, not as a universal solution.

## 6.5 What to say explicitly

The discussion should say that the system is a useful reprogramming layer for selected task classes. It should say that pick-and-place proves runtime adaptability, but welding is the clearest fit. It should say that the modular runtime is the main thesis result, while the use cases show why that runtime matters. And it should say that the current prototype is a proof of concept with real promise, not a finished industrial platform.

