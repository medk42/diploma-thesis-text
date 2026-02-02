# Diploma Thesis Notes

## Abstract (en)

The goal of this thesis was to 

develop an experimental system 




## Outline


- Introduction
    - Motivation: see goal
    - Background
        - Typical programming approaches (teach pendants, offline programming tools)
        - Usual approaches of programming robots (integrators vs here for me users)
    - Goal: explore and validate the posibility of programming cooperative robots in real world space using AR-style inputs like 3d pen, hand tracking, VR controllers instead of teach pendant approach / teaching the robot by moving it. 
        - Goals: These should be after we introduce typical programming approaches and how cobots are programmed. We need to argue these goals from the motivation, typical approaches etc. So we will need to write why the teach-pendent/offline-programing/lead-through lacks -> goal 1) and why we chose fixed usecases (ease of use for new users / semi-automatic situations) -> goal 2)/3). And give example applications (pick and place, welding, painting). 
            1) Devise an approach to program a cooperative robot using real world movements / positions (hand tracking or other pose tracking) instead of the well-known teach-pendant or lead-through approaches.
            2) Develop a system that applies the programming tool from 1) to specific fixed common use-cases. The system should be easily extensible by new usecases in the form of plugins. 
            3) Implement demo usecases using this system - a pick and place demo and seam welding demo. 
        - Goals (ChatGPT, but i think it's too early for these -> these would slowly show up in Problem Decomposition):
            1) Enable spatial entry of poses/trajectory in workspace
            2) Support multiple use cases with unified pipeline (= support usecase extension by some sort of plugin system in a way that new plugins can still use the existing infrastructure)
            3) extensible architecture (swap inputs/sensing/UI/use-cases) (not originally, so we would need to argue before-hand why this is a goal in introduction - this is an emergent goal, not initial goal)
        - This should be done with a focus on simplifying the "robot programming" approach given specific usecases. 
            - For example: pick and place and welding
            - Create an application that will allow the user to easily program specific robot uses / use-cases in the real world space. The application should allow us to easily add use-cases for other actions.
        - Defining poses is both very common and quite hard using a teach pendant - you can teach by robot, however you then still need to physicially move the robot. Let's explore an alternative approach of defining poses and in general programming the cobots using a world pose definitions. 
            - This is target #1. Target #2 is to use #1 to simplify specific task definition.
    - What this thesis delivers - Not spoilers — just 5 lines so the reader knows you actually built something
    - Related work - guys from czech uni with hand tracking programming; voice-image intent programming

- analysis
    - Problem description
        - What project we want to be able to do
        - Required tasks: pick and place, welding, (painting)
    - Problem decomposition - do this first as a header (what we need to do) and then solve each part step by step
        - Introduction - here we analyze goal 1) and 2) and find that we require 3d pose and trajectory input and scene detection.
            - We could spin it as world data (scene) + user intent (pen) -> then we could also give example of user intent with hand tracking + voice as an example, but that it's outside of the scope of this thesis.
        - 3D pose / trajectory input
            - Hand tracking vs pen tracking vs VR vs  other solutions (commercial)
            - See chatgpt - we will discuss hand tracking solutions, the issues with them, the work from czech students; pen solution; vr; hand tracking + intent problem; hand tracking + single camera problem
            - Put the HW description of the pen here? What about FW (MCU on pen)/SW (module) - also here or in developer documentation?
        - Scene detection
            - Camera based vs simplified ARUCO vs commercial solutions
            - Should we describe the used implementation somewhere (the whole pipeline)?
        - Camera input - both previous require camera, both would be better with multiple cameras, therefore the system should support multi-camera system (flexibly)
            - mono vs stereo vs multi-cameras
            - fixed vs robot-mounted
            - merging camera views
            - calibration issues for all of theses and synchronization
            - In all of these -> our system should allow to use single camera, but it should not be hard to switch to multiple cameras or stereo camera etc. This nicely introduces the requirement for the module / middleware infrastructure. 
        - Plugin / message infrastructure = flexibility
            - This gives us the option to:
                a) commit to one way of doing things now (camera based pen tracking / scene detection), while having the option to change it later (as long as we maintain the interface)
                b) this means that the solution we pick is less important than interface definition, since interfaces either give us or lock down flexibility later on
                c) therefore we can pick simpler proof-of-the-concept solutions now and potentially replace few parts to get closer to a production-ready solution
            - Why not ROS / other middleware? - say ROS was considered, but be honest (worried about latency, overhead; wanted to avoid repeated copies / serialization; wanted deterministic thread wakes up and processes; wanted richer lifecycle / state behavior (than publish/subscribe); persistent module graph + serializaiton; configure mapping) - say that ROS was not bechmarked, it was pragmatic and risk-averse since the fit wasn't perfect. 
            - publish/subscribe and request/response architecture - why both
            - thread vs process
            - Shared memory - since we don't use a single big binary blob, we have to share (sometimes large) data across module (send message with the camera image on each frame, at 60fps) -> to avoid constant allocation and copying, let's use some shared memory paradigm (hard/er on ros?).
        - Robot interface
            - We implemented module for Kassow cobot and corresponding Kassow CBun
            - Robot Interface ToolIO - explain why tool control is hard across robots (IO vs vendor plugins vs capabilities).
            - Problem with tools added to the robot - how to tell a gripper to close? Welder to weld?
                - We need a generic device interface (generic gripper interface, powersource interface etc.)
                - Or we would need a second module that communicates with the robot and tells it to close the gripper. Then the gripper command would not need to go to the robot interface, but "could" (the same module could handle gripper interface and robot movement or they could be separate). 
                - Currently not implemented, there are possibilities, but it is a complex issue if we want to support multiple robots (movement is easy, external robot devices are not).
        - UI to control everything - tablet (app vs web) vs MR/VR vs teach pendent plugin
        - Usecase model - usecase wrapper within the module infrastructure. 
            - It can request the data it needs (pen intent, scene, etc.)
            - It can control the robot
            - It is automatically visualized / run via the UI (since it implements the right interfaces)
            - Usecase flow
                - parameter acquisition flow (request → user provides → validate → execute)
                - stateless vs stateful use cases; where “program state” lives (front-end vs use-case module)
            - What data do we need for a usecase -> automatic params, required params, advanced params split
    - Implementation details
        - Camera calibration
        - Pen HW/SW/FW
        - Scene detection
        - Robot module (Kassow + CBun)
            - Robot Interface ToolIO - state your current interface (motion + limited IO) and what you didn’t implement.
        - UI implementation choices
    - Other design choices
        - json saving
            - We save project state in a zip file (.aergo) that contains a JSON description of the mapping etc. and custom files (each module gives a JSON describing it + optionally some CUSTOM binary files, so that we dont blow up the JSON with base64). 
            - Similarly, we save the programs in a zip file (.paergo).
        - Use-case state locations - usecase state is kept in the frontend / CBunX command, usecases are stateless to prevent "memory" leaks
        - Module data - modules can have data folders, so when a module is created, the name of its dll/so file is taken and there is an attempt to find a folder of such name in the "data" folder, if such exists, we give the path to that folder to the module, otherwise we give it nullptr. Thus modules can have data (.stl or web files for the frontend module or saved states for the frontend module)
- User Documenatation
    - Used hw
    - Run instructions
    - Setup
    - User story (joint move, weld); and others
- Project/Developer Documentation - decide on the ordering of these, make it nice and logical (graph overview at start or end? etc.)
    - Middleware structure - make this clean and diagram-heavy
        - Core runtime + module lifecycle
        - Core code is "ugly" - because core matters less than modules. Modules need clean code because they are "fixed". Once implemented they cannot be changed. It's much harder to change the module base since that requires rewriting of all modules. Whereas changing the core requires nothing (or small change in less modules). 
        - Message types + routing/mapping
        - Serialization of state (modules + connections)
        - Activation, configuration, defaults, error handling
    - Interface structure (for each interface)
    - One big graph of the full / complete setup how everything communicates
    - Example module implementation (module usecase), developer workflow - “how to add a new module/use case”
    - QA/tooling notes (tests, CMake Ninja Multisystem usage, vs code setup, windows vs linux use), build instructions (see before + note the vcpkg usage and length of first build), run instructions
    - Dependencies (+ licencing, + freeze vcpkg version)
- Evaluation = Test results/experiments - or move this to the analysis? We could move this along with the pen HW/FW/SW and scene detection implementation to the analysis - as part of the chosen solution, after the decomposition section.
    - Tracking stability / repeatability -> "E1 Tracking stability (repeatability)"
        - Pen pose jitter when stationary (position std-dev, orientation std-dev)
            - 5 min of pen held still -> jitter mechanics
            - Pen held still: position/orientation std-dev over N seconds
        - Scene object pose jitter (same)
            - 5 min of scene marker held still -> scene jitter
            - Scene marker held still: same
        - Sensitivity tests: lighting change, distance change, partial occlusion
            - Conditions: distance near/far, lighting change, partial occlusion
        - Report reprojection errors (you already have them) as a supporting metric, not the end metric.
            - Outputs: 2–3 plots + a table.
    - End-to-end workflow metrics (fast, strong narrative), for 2-3 representative tasks: "E2 Workflow metrics (2–3 tasks)"
        - For welding and pick&place:
            - time-to-define-trajectory (rough, even if only you as operator) - start → ready-to-execute
            - number of user actions (clicks/holds/steps)
            - failure modes encountered (lost tracking, wrong pose, UI confusion)
                - what specifically would we put here? Both on teach pendant and my app, or what happens in my app that could cause issues for the user? If so, should we separate it to issues that are because of the demo and issues that are inherent to this design? I think that this maybe shouldnt be just observed, but also real limitations from both the use and "imagined/analyzed". But that fits better in the "what we achived" section.
        - 10-20 short "define seam and execute" trials -> workflow timing + failure taxonomy
    - Real robot validation: what was tested, what wasn’t, why -> "E3 Real robot validation"
        - what motions were executed
        - safety constraints (speed limits, workspace, emergency stop)
        - what wasn't tested and why
- Conclusion
    - What we achived - describe the results of the usecases pick and place / move works, but not too useful in this setup; weld is / could be really useful (compare with the SmoothTool?)
        - "but what did we actually achive", what is it good for -> does it need to be good for anything actually? 
        - what worked well any why - spatial input speed, modularity, fast prototyping
            - How the platform enables swapping components - hand tracking, MR UI, better sensing
        - Could be efficient for welding, for others less so in the current state
        - Qualitative “what we learned”: where spatial authoring shines (welding seam definition / fast point placement)
        - However, could be extended to standalone spatial programming tool or as part of teach-pendant extension
            - The "teach pose in world" has been verified as a really good solution
        - Built a middleware that can be used/extended for other work - we can replace any part of the system to improve it without breaking compatibility with the rest of the system as long as the interfaces are maintained. And since the interfaces are module-module, they truly and cleanly separate the modules from each other.
    - Known weaknesses - or move this to the analysis?
        - Where it breaks down - scene accuracy, UI polish, “one-shotness”
        - Qualitative “what we learned”: where it struggles (scene detection precision; complex program logic; UI overhead)
        - Tracking accuracy / stability: pen is usable but noisy; scene pose may be systematically off; absolute accuracy is hard to prove quickly.
        - Visible corner-cutting in UI / UX; “one-shot program tree” doesn’t fully match the system’s potential;
        - Demo limitations - some tasks are more "proof of flexibilityu" than "best solutions"
        - Platform is strong, but not production-ready.
    - Future work
        - Robot Interface ToolIO - capability flags / versioning / tool abstraction.
        - Input and intent
            - Hand tracking drop-in replacement
            - Using VR controllers instead (connected with the UI Quest 3 integration)
            - Voice + deictic gestrure interpretation (the "holy grail" system) - it could be built on top of the module infrastrure, but doesn't fit as neatly as the current solution
        - Sensing and accuracy
            - Industrial scene sensing, better fiducials, better calibration strategy
            - better filtering / EKF fusion (camera + IMU pen)
            - absolute accuracy characterization
        - Middleware
            - ROS vs my solution (vs other middlewares)
            - Core cleanup + multi-threading assessment and refinement
        - UI
            - Kassow CBun improvements - fixes, support for teach pendent command (for usecase commands or just pose definition)
            - Quest 3 AR integration
            - UI cleanup (blocking tasks, repeated visualization READ_FULL calls, code cleanup / better decomposition etc.)

- Appendices
    - Detailed math / solver formulation
    - Message schema / module interface tables (if not described before) / serialized message blob form.