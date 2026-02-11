














# 1. Refined Thesis Outline (Best Version)

## 1. Introduction (fast, clean narrative)

### 1.1 Motivation
- Why classical robot programming is friction-heavy for frequent changes / small batches  
- Why **in-workspace spatial authoring** (motions + actions) could reduce friction  

- Why robot programming is still costly/slow for small-batch, frequently changing tasks

- Defining poses is both very common and quite hard using a teach pendant - you can teach by robot, however you then still need to physicially move the robot. Let's explore an alternative approach of defining poses and in general programming the cobots using a world pose definitions. 

### 1.2 High-level approach (no spoilers like “pen”)
- Spatial AR-inspired input → acquisition of poses / trajectories / actions  
- Task-oriented programs (fixed use-cases), not a general-purpose robot language  
- External sensing allowed (camera-based scene understanding + input tracking)  

- In Introduction, state: “We evaluate the approach on two representative task families: (i) material handling / pick&place (common), (ii) process task requiring frequent re-teaching (seam welding).” Material handling and welding are among the most common industrial robot application classes. https://smart-robotics.io/what-is-a-pick-and-place-robot/?utm_source=chatgpt.com
    - Then you can say: “These were selected because they stress different requirements on spatial input and program structure.”

- Background: how robots are programmed today
    - 3 types: teach pandant, lead-through, offline programming
    - + Usual approaches of programming robots (integrators vs here for me users)

- Problem statement + scope:
    - We target task-oriented programs (no complex branching/loops; cooperative robot; external sensing allowed)
    - We focus on motions + actions (tool start/stop, open/close, etc.), not just trajectories

### 1.3 Goals & contributions
- **A:** Spatial authoring of motions + actions in the real workspace  
- **B:** Extensible plugin system reusing acquisition and execution infrastructure  
- **C:** Demonstration on selected representative tasks (pick & place, seam welding)  

- Goal A (interaction concept): Explore and validate programming of cooperative robots directly in the real workspace by defining robot motions and tool actions using spatial, AR-inspired inputs, as an alternative to traditional teach pendant and lead-through methods.
- Goal B (system): Provide an extensible system where task-oriented use cases can be implemented as plugins that reuse the same acquisition/execution infrastructure.
- Goal C (evaluation / demonstration): Demonstrate the approach on representative tasks:
    - a canonical material-handling task (pick & place)
    - a path-centric process task (seam welding)

Then add 3–5 lines in intro: why these two. You don’t need a perfect “source” for “pick&place is typical”, but you can cite that welding automation is a major industrial application area, and that “pick-and-place” is a widely used operation in automation/robotics practice (industry sources/news are acceptable for motivation-level claims). For welding being a major robot use, even basic industry overviews are fine.

> Phrase as *“selected representative tasks”*, not *“tasks discovered later”*.

- Scope here too?
    - Mention safety envelope (E3: Real robot validation)
    - “Could have been a Kassow CBun plugin” (and why you didn’t) - 2-4 sentences
        - Thesis contribution is spatial authoring + reusable acquisition/execution pipeline, not “a Kassow feature”.
        - See "Diploma Thesis Archive/Linear Program"
    - [CBun alternative exists; thesis focuses on spatial authoring + extensible pipeline, not vendor UI feature]

- Contributions:
    - A spatial parameter acquisition workflow for robot programs (poses/frames/trajectories + tool actions)
    - A plugin architecture combining pub/sub + req/resp, plus large-data blob transport (camera-rate friendly)
    - A pilot system validated on a real Kassow cobot with two representative use cases
    - What this thesis delivers - Not spoilers — just 5 lines so the reader knows you actually built something

### 1.4 Thesis structure
Motivation → high-level approach → contributions → thesis structure  

---

## 2. Background & Related Work (short, pragmatic)

The goal is not an exhaustive survey, but to justify why the proposed approach matters and to frame the design space.

- “Unlike X, we…”, “Similar to Y, but…”) — this makes it feel “researchy” fast.
    - Abstract + intro + system overview figure + conclusion is enough.

Work:
    Ikeda & Szafir, 2024 - https://www.semanticscholar.org/paper/PRogramAR%3A-Augmented-Reality-End-User-Robot-Ikeda-Szafir/fb46cc7e1c079f970ff7d997ecf3e52b13bdfb73  -  similar to my work, with more trackers and full AR

    Neto et al., 2010 - https://arxiv.org/pdf/1309.2093  -  similar to me, programming with a Wii controller, just 3dof + some voice commands; simple, can be referenced

    Bieller (IFR), 2023 – IFR Blog (industry) - https://ifr.org/post/traditional-robot-programming-vs-ai-machine-vision - "programming and integration account for 50-70% of the cost of a robot application", welding task defined, example implementation (pretty good); actually really good example why typical programming is slow / hard! great for introduction.

    TracePen

    2024_12_Corsetti_Tesi_01 pdf  -  this is some welding auto-shape detection; similar vibe as my thesis. Pretty cool work. Also GOOD experimental design.

    Thoo et al., 2021 - https://calinon.ch/papers/Thoo-arXiv2021.pdf

    https://pmc.ncbi.nlm.nih.gov/articles/PMC9583918/

    Dević et al., 2024 - https://www.mdpi.com/2075-1702/12/7/480 - VR/AR robot programming tool? good robot programming approaches description

    Maccio et al., 2024 - https://openreview.net/pdf?id=BnKSO5x2BC&utm_source=chatgpt.com - essentially offline version of the teach pendant programming / hand-guiding in mixed reality; they move an AR (hololens) version of the robot around and program it that way; no intent



### 2.1 How robots are programmed today
- Teach pendant  
- Lead-through / hand-guiding (kinesthetic teaching)  
- Offline programming (OLP)  
- 2-4 citations total

- Traditional robot programming interfaces
    - Teach pendant characteristics + pain points
    - Lead-through / kinesthetic teaching characteristics (https://proceedings.mlr.press/v229/lin23a/lin23a.pdf)
    - Offline programming as an alternative (benefits + setup cost) (https://www.mdpi.com/2504-4494/8/6/274?utm_source=chatgpt.com)
    - What to cite here: one OLP overview, one kinesthetic/lead-through reference, optionally one paper that contrasts programming modalities.

- Programming by Demonstration / Programming by Guidance - another chapter?
    - “Demonstration” idea: human shows motion, system generalizes
    - Why it’s relevant but beyond your scope (you’re not solving full generalization/learning)
    - Good anchor example: recent work demonstrating robot programming from a single demonstration using sensing/learning (as context, not as your method). https://smooth-robotics.com/?utm_source=chatgpt.com

### 2.2 AR/VR as robot programming or authoring interfaces
- AR visualization vs AR authoring  
- One to two examples of AR-based program input  
- 2-3 examples (not a survey)

- AR as a programming/preview medium (robot visualization, in-situ path authoring)
- Concrete examples: AR-based robot programming systems & evaluations
- Position your work: you do real workspace spatial authoring + real robot execution, not only AR visualization


### 2.3 Spatial input modalities
- Hand tracking (single-view vs multi-view vs RGB-D; temporal stability/jitter/occlusion)  
    - Present hand tracking as a mainstream modality (Quest/MediaPipe/etc. exist), but highlight the practical issues for your requirements (world-accurate 6D, jitter, occlusion, calibration, single-camera limitations).
    - Then in 3.3 -> Trade study table
    - keep it 2–4 pages max, focused on what matters for your decision: accuracy, jitter, world coordinates, camera setups, complexity.
    - Avoid: “I originally wanted hands” narrative. Instead: “We considered hand tracking as a natural AR input; constraints led to pen.”
    - [AR-inspired inputs; short hand-tracking survey (accuracy/jitter/world coords/camera setups); cite 2–6 key works]
- Tracked tools / fiducials (robust world 6D)
- VR controllers / tracked devices (strong tracking ecosystem, integration constraints) 
- *(Optional)* Multimodal intent (speech + deictic gesture) as future work teaser  (one)
- This is where we can put hand tracking paper list (or 3.3)

### Comparison to ours:
Add a tiny taxonomy early in Related Work (or at the end as a summary table)
Axes
- Authoring target: (a) pure motion, (b) motion + tool actions, (c) task programs (parameterized)
- Context: (a) offline/sim, (b) online/in-situ, (c) context-aware (scene + intent)
- Inputs: teach pendant / lead-through / tracked tool / hand / controller / speech+gesture
- System stance: single-purpose prototype vs extensible pipeline

- Then your claim becomes: “Most work clusters in (a) visualization + (b) motion authoring; we target motion+actions + task-oriented acquisition + extensibility.”
    - Even if a missing paper exists, it will likely just land somewhere else in your grid—not “steal your thesis”.

- Don’t claim “no one does X”. Claim a bounded gap. In theses, the safest strong wording is:
    - “To the best of our knowledge…”
    - “We did not find systems that combine A+B+C under constraints D…”
    - “Most prior work focuses on [bucket], whereas we focus on [your bucket].”


- Prior work on AR/VR robot programming largely focuses on digital-twin visualization and interactive offline/online authoring of robot motions in a spatial UI. Fewer systems address task-oriented program acquisition that combines (i) in-workspace spatial specification of motion primitives with (ii) tool/action semantics and (iii) a reusable acquisition/execution pipeline designed for adding new task-specific use cases. Multimodal intent-based approaches (e.g., combining deictic gesture and speech) demonstrate a different point in the design space, but typically trade off generality, reproducibility, or integration with existing robot programming workflows. In this thesis, we focus on validating spatial authoring as a practical alternative to teach pendant/lead-through for representative collaborative tasks, while structuring the system so that additional inputs and intent interpretation can be integrated later.
    - That reads “we know the landscape” without betting your life on an absolute novelty claim.



- We can mention Neura Robotics here - for the welding (we wanted a general system).

> This chapter can reasonably span 3–5 pages.

- Hand tracking: natural but struggles with world-accurate, low-jitter 6D at distance/occlusion (single-view especially)
- Multi-view / RGB-D: better but needs hardware + calibration complexity
- Tracked tool / fiducials: strong observability + easier to get stable 6D poses with calibrated camera(s)
- VR controllers: strong tracking in VR/inside-out ecosystems, integration constraints
- You can cite AR/HRI survey/taxonomy material to frame the space - https://repozitorium.omikk.bme.hu/bitstreams/93d61464-784f-4870-be74-4378e28b0077/download?utm_source=chatgpt.com

- (optional) Multimodal “intent-level” robot assistance (short: ¼–½ page) - next chapter
    - One paragraph that says: gesture+speech+context is an active direction; it motivates your future work. Use one strong citation and stop. https://proceedings.mlr.press/v229/lin23a.html
- (optional) Industrial baseline for welding programming (optional ¼–½ page)
    - If you want the Smooth Robotics comparison, cite something stable (e.g., UR marketplace listing for SmoothTool) as an example of industry tooling.

---

## 3. Analysis / Problem Decomposition (core chapter)

This chapter motivates the system design as a consequence of task requirements.

[derive requirements from tasks; argue 3D vs 2D; tradeoffs pen vs hand vs VR; why multi-cam matters; why plugin/messaging emerges]

Your notes show a very clear conceptual model: high-level task command → parameter acquisition → expansion to robot primitives → execution. That should become a core figure + narrative backbone.

### 3.1 Target tasks and their requirements (Requirements derived from goals & use cases)
- Pick & place  
- Seam welding  
- *(Optional mention)* Painting as another process-task family  
- we will also mention other possible tasks (even just simple moves) to get a nice amount of source tasks to analyze and see what data we need to fulfill them.

- What do usecases need?
    - It can request the data it needs (pen intent, scene, etc.)
    - It can control the robot
    - It is automatically visualized / run via the UI (since it implements the right interfaces)
    - Usecase flow
        - parameter acquisition flow (request → user provides → validate → execute)
    - What data do we need for a usecase -> automatic params, required params, advanced params split

- So the starting point are usecases - we want flexibility (adding more), existing interfaces and ease of use for the user. What do we need for that / how do we manage that. What do the usecases need. Here we will first define possible usecases and then outline what they need to work well. We will talk about robot control, scene understanding, user intent etc. Then we need to argue how that translates into rought poses/trajectories (user intent) and scene detection. And UI. 


For each task, specify required elements:
- Approach and task frames  
- Trajectories  
- Tool actions  
- Tolerances  

### 3.2 Required primitives
- **Spatial primitives:** 3D points, 6D frames, trajectories (position-only and full-frame)  
    - 2D hand tracking “could be enough” vs why you still needed 3D
- **Scene primitives:** world/table frame, objects, edges, markers, meshes  
- **Execution primitives:** robot motion and tool/action commands  
- **UI & feedback:** visualization, parameter acquisition, validation  

- based on 3.1, we need certain things, here we summarize that. Then in later sub-chapters we go through and pick them off one my one. 

### 3.3 Design trade-offs derived from requirements
- Different structure
    - hand / pen tracking chapter
    - scene detection chapter
    - camera input chapter

- Trade study table:
    - rows: hand tracking / tracked tool (fiducials) / VR controller
    - cols: world accuracy, jitter, occlusion robustness, setup complexity, hardware cost, integration risk
    - conclusion: “For a pilot system targeting repeatable 6D input in a constrained lab setup, tracked tool offers the best risk/accuracy trade-off.”
    - Then in implementation describe chosen modality
- Input tracking: hand vs tracked tool vs VR controller  
    - This is where we can put hand tracking paper list (or 2.3)
    - Subsection: 2D vs 3D requirements
        - welding seam might be geometrically constrained, but you still need 3D for tool orientation / approach / validation / mapping to robot base frame.
        - pick&place demands 3D pose and orientation.
    - Input requirements - why do we need buttons / intent
    - Parts
        - Evaluation criteria: 6D accuracy, jitter, occlusion robustness, setup/calibration burden, cost, integration risk
        - Compare candidate modalities (hand / tool / VR controller)
        - Conclude: chosen modality for pilot + what is left open as drop-in future replacements
    
    - Hand tracking vs pen tracking vs VR vs  other solutions (commercial, motionleap?)
        - 2d vs 3d
        - we will discuss hand tracking solutions, the issues with them, the work from czech students; pen solution; vr; hand tracking + intent problem; hand tracking + single camera problem
    - Sources:
        - Zhang et al., 2023 - HAND_TRACK, HEAT, TracePen mention; probability heavy
        - D-Point pen
            - https://github.com/Jcparkyn/dpoint/tree/main
            - https://hackaday.com/2023/11/14/d-point-a-digital-pen-with-optical-inertial-tracking/
            - https://rijnieks.com/blog/2023-11-25-replicating-dpoint/
        - Wandelbots (product, 2022) - TracePen
        - Mueller et al., 2024 and Ong et al., 2020 use OptiTrack, mention it here, to get sub mm accuracy
- Scene strategies: lightweight fiducials vs industrial localization vs full 3D scanning  
    - What you need (table frame, objects/meshes/markers, alignment)
    - Why you choose your simplified approach for a pilot
    - Camera based vs simplified ARUCO vs commercial solutions; moving robot vs multi-camera
- Technical constraints (accuracy, world coordinates, occlusion, calibration, jitter) = Analysis, because they determine what is feasible.
- Sensing: mono vs stereo vs multi-camera; fixed vs robot-mounted  
    - both previous require camera, both would be better with multiple cameras, therefore the system should support multi-camera system (flexibly)
    - mono vs stereo vs multi-cameras (next to each other or at sides of workspace; mention the czech study)
    - RGBD camera, Kinect (https://gmv.cast.uark.edu/scanning/hardware/microsoft-kinect-resourceshardware/), Iphone (depth sensor)
    - fixed vs robot-mounted (allowing camera movement)
    - merging camera views
    - calibration issues for all of theses and synchronization
    - In all of these -> our system should allow to use single camera, but it should not be hard to switch to multiple cameras or stereo camera etc. This nicely introduces the requirement for the module / middleware infrastructure. 
    - FOV, resolution, refresh rate...

    - normal 

Discussion:
- When 2D hand tracking may be sufficient (known 3D seam geometry)  
- When it is not (world stability, tool orientation, validation requirements)  

### 3.4 Robot interface

- We implemented module for Kassow cobot and corresponding Kassow CBun? No, this is for requirements, not for implementation -> Implementation chapter.
- Robot Interface ToolIO - explain why tool control is hard across robots (IO vs vendor plugins vs capabilities).
    - We need a generic device interface (generic gripper interface, powersource interface etc.)
    - Or we would need a second module that communicates with the robot and tells it to close the gripper. Then the gripper command would not need to go to the robot interface, but "could" (the same module could handle gripper interface and robot movement or they could be separate). 
    - Currently not implemented, there are possibilities, but it is a complex issue if we want to support multiple robots (movement is easy, external robot devices are not).

### 3.5 Emergence of modular plugins and messaging
- Why plugin modules at all (multi-camera variants, replace tracking, multiple UIs, multiple use cases) -> good for experimentation and flexibility
    - This gives us the option to:
        a) commit to one way of doing things now (camera based pen tracking / scene detection), while having the option to change it later (as long as we maintain the interface)
        b) this means that the solution we pick is less important than interface definition, since interfaces either give us or lock down flexibility later on
        c) therefore we can pick simpler proof-of-the-concept solutions now and potentially replace few parts to get closer to a production-ready solution
- Why pub/sub + req/resp - more like system design
    - Why shared blobs for large data (camera frames at rate)

- Why not ROS / other middleware? - say ROS was considered, but be honest (worried about latency, overhead; wanted to avoid repeated copies / serialization; wanted deterministic thread wakes up and processes; wanted richer lifecycle / state behavior (than publish/subscribe); persistent module graph + serializaiton; configure mapping) - say that ROS was not bechmarked, it was pragmatic and risk-averse since the fit wasn't perfect. 
    - this is optional and if mentioned should be so at the end (after pub/sub, req/resp and memoryblob discussions)

- Multiple interchangeable pipelines (tracking, sensing, scene estimation, UI)  
- Multiple use-cases reusing the same acquisition and execution paths  

Resulting requirements:
- Plugin boundaries  
- Typed communication channels + mapping (where)
- State handling and persistence  

> This section justifies the middleware without making it the main topic.

### 3.6 UI

- UI to control everything - tablet (app vs web) vs MR/VR vs teach pendent plugin
- nice-to-have - to allow choice and calibration of cameras, pen, etc.
- Argue possibilities and what we chose and why. 
- UI has to allow us to create the modular plugin mapping and activate modules (argue it somehow)
    - It then has to allow us selection of usecases and entering of the usecase parameters. It should also visualize the 3d scene and created usecases. 
- HMD? Expensive and weird, but way easier for visualization and usage.
- Platform - either with UI or separate chapter
    - cross-platform design

---

## 4. System Design (middleware as design, not code tour)

Focus on design guarantees and decisions. This will be a continuation of the analysis but with focus on the module architecture. 

[use case encapsulates internal sequence; Program Builder sequences commands; linear only; online execution vs compilation; interfaces + pub/sub + req/resp + blobs + persistence]

Your notes justify a hybrid communication model (pub/sub + req/resp) and large-data blobs as necessary for camera-rate workloads (this is a strong, concrete design contribution).

### 4.1 Module / plugin model and lifecycle
- Core responsibilities: load, map, route, supervise, persist  
- Module metadata:
  - Required inputs  
  - Provided outputs  
  - Request endpoints  
  - Status reporting  
- (optional) mention "core ugly, modules fixed" (or in Appendix)
- thread vs process

### 4.2 Communication model
- Publish / subscribe for streaming data  
- Request / response for on-demand operations  
- Channel mapping / multiple response producers problem (1-2 paragraphs max)

Rationale:
- Streaming frames vs explicit scene queries  
- Threading model (handlers executed in module-owned threads)  

### 4.3 Large data transport
- Why copying frames and meshes is unacceptable  
- Shared blob pools and reference counting  
- Conceptual crash and leak handling (no code details) - as “robustness considerations” (good engineering point)
- (optional) Mention ROS
- since we don't use a single big binary blob, we have to share (sometimes large) data across module (send message with the camera image on each frame, at 60fps) -> to avoid constant allocation and copying, let's use some shared memory paradigm (hard/er on ros?).

### 4.4 Persistence and state model
- Saving/loading (.aergo / .paergo) SHOULD BE in implementation
- here just write the reasoning for it + it should be after usecases since it covers those too
- **.aergo (setup state):**
  - Module graph  
  - Module configuration  
  - Module state blobs/files  

- **.paergo (program state):**
  - Use-case parameters  
  - Identifiers  
  - Compatibility checks  

- Stateless use-case modules vs state stored in the frontend/program builder (design rationale)
- Use-case state locations - usecase state is kept in the frontend / CBunX command, usecases are stateless to prevent "memory" leaks
- Or move to implementation!

### 4.5 Use-case wrapper and parameter acquisition flow
- How do we handle what we required in the analysis? 
    - we had some requirements as to what the usecases need, how will our architecture provided that?

- Request → user provides spatial input → validation → preview → execution  
- Required vs advanced parameters  
- Where the program resides and how execution invokes modules  
    - stateless vs stateful use cases; where “program state” lives (front-end vs use-case module)
- Use-case model & program representation
    - High-level command representation
    - Parameter acquisition workflow
    - Expansion to low-level robot primitives
    - Where state lives (frontend vs use-case module) and why

### 4.6 Program model and execution (or merge with 4.5) / execution strategy
- Use case encapsulates its internal sequence (weld/pick-place).
- Frontend “Program Builder” optionally sequences multiple commands.
- Scope boundary (“not a full robot language”)
- See "Diploma Thesis Archive/Linear Program"

- Compile to primitives was planned, cancelled due to conditional/context checks
    - Execution strategy (online execution vs offline compilation)
    - See "Diploma Thesis Archive/Linear Program"

- Program Builder responsibilities and command lifecycle
    - (parameter acquisition → preview → expansion (optional) → execution)

---

## 5. Implementation

Factual description of what was built. Mention github here. 

[what is actually implemented in sequencer/UI; pen HW/FW/SW; calibration; scene detection; Kassow module; UI limits]

A reproducible demo path (even if narrow): “from fresh checkout → run → see pen+scene → run weld/pick demo”.
    - either here, or in appendix; or at least in github

### 5.0 system at a glance

- ref from intro!
- One paragraph: what the system is (modules + spatial authoring + use-cases + execution)
- One figure: your “mega graph” but simplified (5–8 boxes).
    - One clear system overview figure (box/dataflow diagram) in the thesis (Implementation or System Design)?
- Bullet list: “Inputs → Core capabilities → Use-case plugins → Robot execution”.



### 5.1 Hardware and setup
- Cameras  
- Robot  
- Input devices  

### 5.2 Camera calibration pipeline
- Intrinsic and extrinsic calibration  
- Coordinate frames used  

### 5.3 Input tracking implementation (pen HW / FW / SW)
- Tracking pipeline  
- Calibration strategy (mention of global optimization acceptable)  
- Runtime performance notes  

### 5.4 Scene detection implementation
- Techniques used (fiducials, ArUco, ChArUco, etc.)  
- Outputs provided to other modules  

### 5.5 Robot module implementation
- Kassow robot integration (CBun / CBunX)  
    - Kassow cobot useful, since 7axes are more likely to avoid singularities
- Supported motion and limited tool control  
    - state your current interface (motion + limited IO) and what you didn’t implement
- Missing features and reasons  

### 5.6 UI implementation
- maybe this is already covered in the analysis enough, but maybe the persistency -> Chapter Persistency Handling
    - json saving
        - We save project state in a zip file (.aergo) that contains a JSON description of the mapping etc. and custom files (each module gives a JSON describing it + optionally some CUSTOM binary files, so that we dont blow up the JSON with base64). 
        - Similarly, we save the programs in a zip file (.paergo).
    - Module data - modules can have data folders, so when a module is created, the name of its dll/so file is taken and there is an attempt to find a folder of such name in the "data" folder, if such exists, we give the path to that folder to the module, otherwise we give it nullptr. Thus modules can have data (.stl or web files for the frontend module or saved states for the frontend module)

- Existing UI (CBunX integration)  
- Supported user interactions  
- Program builder / sequences implementation details:
    - Compile to primitives was planned, cancelled due to conditional/context checks
    - See "Diploma Thesis Archive/Linear Program"
    - What’s implemented + limitations (preview stale scene, no robot-to-start)

- Persistance implementation
    - Saving/loading (.aergo / .paergo) SHOULD BE in implementation

- Module mapping planned/implemented in UI
    - for experimental reasons
         - mapping itself could be static, but activation couldnt. calibration couldnt. 

### 5.7 Usecase implementation

- Describe how the main usecases are implemented - what they actually do

### 5.8 AI Usage

- Describe how i have used AI / which parts are written by me, which parts by chatgpt, which parts by cursor. 
- AI usually used as a first draft later refined by me, but some parts were left mostly intact (seam detection for example).

### 5.9 Usage

- project available on github
- usage guide?

---

## 6. User Workflow

Concrete, narrative-driven chapter replacing user documentation.

[safety notes; conservative speeds; E-STOP readiness; 1–2 user stories]

### 6.1 System setup
- Load modules  
- Map channels  
- Activate and calibrate  
- Verify visualization and readiness  
- Safety notes and operating constraints (small box / paragraph)
    - Safety / “experimental, no real safeties, conservative speeds, E-STOP”
    - See "Diploma Thesis Archive/Linear Program"

### 6.2 User story A: seam welding
- Step-by-step user actions  
- System feedback and visualization  

### 6.3 User story B: pick & place
- Equivalent step-by-step workflow  

> Target length: ~4–6 pages including figures.

---

## 7. Evaluation / Experiments

Minimal but credible validation.

[test conditions + safety constraints; threats to validity: not an integrator; qualitative workflow timing]

See chapter 2 (like https://pmc.ncbi.nlm.nih.gov/articles/PMC9583918/ for example of experiments)

### 7.1 E1: Tracking stability and repeatability
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
- plots + table

### 7.2 E2: End-to-end workflow trials
- End-to-end workflow metrics (fast, strong narrative), for 2-3 representative tasks (welding and pick&place)
    - time-to-define-trajectory (rough, even if only you as operator) - start → ready-to-execute
    - number of user actions (clicks/holds/steps)
    - failure modes encountered (lost tracking, wrong pose, UI confusion)
- 10-20 short "define seam and execute" trials -> workflow timing + failure taxonomy

- Time to program  
- Failure modes and taxonomy  
- Honest single-operator limitation  

### 7.3 E3: Real robot validation
- what was tested, what wasn’t, why
    - what motions were executed
    - safety constraints (speed limits, workspace, emergency stop)
    - what wasn't tested and why

- Executed tasks  
- Safety envelope  
    - No collision checking / no certified safety envelope planning in the software.
    - Conservative default speeds.
    - Cooperative robot reduces risk but does not eliminate it.
    - Camera-on-flange collision risk exists.
    - Operator must be ready to hit E-STOP; experiments were run with safety constraints.

    - Test conditions / safety constraints (what limits you used)
- Validity / threats to validity (1 paragraph)
    - I’m not a teach pendant expert; integrators do complex programs
    - See "Diploma Thesis Archive/Linear Program"
- Untested aspects  

---

## 8. Discussion and Limitations

Separate prototype limitations from inherent constraints.

SEE FUTURE WORK FOR MORE RESOURCES

[where it shines (welding); where it’s weaker (general programming); CBun vs independent runtime tradeoff; limitations + future direction to context-aware (voice+hand+intent)]

- What we achived - describe the results of the usecases pick and place / move works, but not too useful in this setup; weld is / could be really useful (compare with the SmoothTool?)

- What worked well (notably welding authoring)  
    - Where spatial authoring helps most (qualitative findings) - Why welding looks like the “killer app”, others feel less useful
        - Could be efficient for welding, for others less so in the current state
        - Qualitative “what we learned”: where spatial authoring shines (welding seam definition / fast point placement)
    - spatial input speed, modularity, fast prototyping
        - How the platform enables swapping components - hand tracking, MR UI, better sensing
    - could be extended to standalone spatial programming tool or as part of teach-pendant extension
        - The "teach pose in world" has been verified as a really good solution
    - Built a middleware that can be used/extended for other work - we can replace any part of the system to improve it without breaking compatibility with the rest of the system as long as the interfaces are maintained. And since the interfaces are module-module, they truly and cleanly separate the modules from each other.
        - "Beyond the interaction concept, the thesis delivers a modular runtime…”
- What did not (accuracy, occlusion, UI roughness, one-shot nature)  
    - Where it breaks down - scene accuracy, UI polish, “one-shotness”
    - Qualitative “what we learned”: where it struggles (scene detection precision; complex program logic; UI overhead)
    - UX issues with displaying errors...
        - system reports success on robot torque deviation and joint limits
    - Tracking accuracy / stability: pen is usable but noisy; scene pose may be systematically off; absolute accuracy is hard to prove quickly.
    - Visible corner-cutting in UI / UX; “one-shot program tree” doesn’t fully match the system’s potential;
    - Demo limitations - some tasks are more "proof of flexibilityu" than "best solutions"
    - Platform is strong, but not production-ready.
    - scene detection limitations
    - scene visualization limitations
    - all other interface based limitations
    - robot communication limitations (non path planning, validation)
    - tool io missing
- System
    - motion planning (to avoid obstacles)
        - to avoid obstacles, but also kept getting issue with joint range exceeded!
    - path validation infrastructure
    - improve robot interface -> these should be in developer documentation to keep thesis focused
        - in KR trajectory move was limiting...
        - Robot Interface ToolIO - capability flags / versioning / tool abstraction.
    - cross-platform design
        - compilable both on windows and linux, but camera module developed only for windows; BLE cross-platform, but behaves differently on linux (doesnt connect)
- What is inherent vs improvable with better sensing or UI  
- Expressiveness / applicability limits
    - See "Diploma Thesis Archive/Linear Program"
- “Could have been a Kassow CBun plugin” (and why you didn’t) - Vendor integration vs research flexibility
    - Thesis contribution is spatial authoring + reusable acquisition/execution pipeline, not “a Kassow feature”.
    - See "Diploma Thesis Archive/Linear Program"
- Safety limitations / not production-ready
    - Safety / “experimental, no real safeties, conservative speeds, E-STOP”
    - See "Diploma Thesis Archive/Linear Program"
- Applicability to industrial programming workflows
    - I’m not a teach pendant expert; integrators do complex programs
    - See "Diploma Thesis Archive/Linear Program"

---

## 9. Conclusion and Future Work

- Explicit confirmation of A / B / C goals - Summarize A/B/C achieved
- Key insight: spatial authoring is particularly effective for process tasks like welding  
    - Key takeaway / strongest use case - welding
    - spatial authoring is promising for certain classes (welding; potentially pick&place with better scene semantics)

- Future work: context-aware intent (gesture+voice), improved sensing, better calibration, richer program logic, ROS comparison, MR UI

Future work:
- How to make pick&place stronger (better scene understanding, intent, etc.)
- Richer context awareness (gesture + voice + scene)  
- Improved sensing and calibration  
- Tool abstraction
- Optional comparison to ROS-based approaches  
- Compile to primitives was planned, cancelled due to conditional/context checks
    - Export / compilation to robot program as future work
    - See "Diploma Thesis Archive/Linear Program"

Future work
- Input and intent
    - Hand tracking drop-in replacement
    - Using VR controllers instead (connected with the UI Quest 3 integration)
        - UI = Quest 3 overlay; AR automatically; scene tracking somehow from the cameras; pen input = one of the controllers; scene alignment = second controller is robot mounted (issue with quest 3 due to its mixed hand/controller tracking algorithms).
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
        - HMD? Expensive and weird, but way easier for visualization and usage.
    - UI cleanup (blocking tasks, repeated visualization READ_FULL calls, code cleanup / better decomposition etc.)
    - UX issues with displaying errors...
        - system reports success on robot torque deviation and joint limits
    - improve visualization interface
- System
    - motion planning (to avoid obstacles)
        - to avoid obstacles, but also kept getting issue with joint range exceeded!
    - path validation infrastructure - together with ^
    - improve robot interface -> these should be in developer documentation to keep thesis focused
        - in KR trajectory move was limiting...
        - Robot Interface ToolIO - capability flags / versioning / tool abstraction.
    - cross-platform design
        - compilable both on windows and linux, but camera module developed only for windows; BLE cross-platform, but behaves differently on linux (doesnt connect)
- Post-thesis vision: AR-first + hand tracking + LLM + high-level task planning + obstacle-aware synthesis, built as modules on top of this pipeline
    - this would be the ideal programming system, high level, speech-first, optimally actually building the program in the background
    - also talk limitations - main issue is robot, gripper, camera, welding tool etc. compatibility
        - we would need to build a system that can be extended by these tools in a way that the system understands all these tools (system has to be able to understand tools) -> general interfaces and some general hooks into the LLM's for user speech and gesture based programming
    - would require motion planning, path validation, proper full path visualization, 

---

## Appendices

- Main appendix: developer docs - should be "A short developer appendix that freezes the interfaces + architecture intent (so someone can build on it)."
    - Build and tooling notes + licencing
        - packages used and versions and vcpkg
    - full system graph
    - Message and interface tables (message structure,  serialized message blob form, expected communication graphs)
    - .aergo / .paergo structure
        - module data folders structure
    - technical limitations of the system here! not in results. If we have this section, we shouldnt clutter the main system with technical limitations like faulty UX etc.
    - mention github

- Full system graph  
- Message and interface tables (message structure,  serialized message blob form, expected communication graphs)
- Build and tooling notes + licencing
- Solver and mathematical details (if required)  
- .aergo / .paergo structure
    - module data folders structure


## Notes

- Do not forget to lock down the vcpkg



## Appendix: Developer Docs

- Project/Developer Documentation - decide on the ordering of these, make it nice and logical (graph overview at start or end? etc.)
    - Middleware structure - make this clean and diagram-heavy
        - Core runtime + module lifecycle
        - Core code is "ugly" - because core matters less than modules. Modules need clean code because they are "fixed". Once implemented they cannot be changed. It's much harder to change the module base since that requires rewriting of all modules. Whereas changing the core requires nothing (or small change in less modules). 
        - Message types + routing/mapping
        - Serialization of state (modules + connections)
        - Activation, configuration, defaults, error handling

        - Module lifecycle (load → activate → run → stopThreads)
        - Communication primitives (pub/sub + req/resp) and when used
        - Shared blob rationale (camera-rate data)
        - Minimal interface summary (tables, not prose)
        - “How to add a module/use-case” in 8–12 bullet steps
            - This appendix is what turns “messy repo” into “platform someone can build on”.
            - Everything else (mega-graph, full message schemas) is optional.
    - Interface structure (for each interface)
    - One big graph of the full / complete setup how everything communicates
    - Example module implementation (module usecase), developer workflow - “how to add a new module/use case”
    - QA/tooling notes (tests, CMake Ninja Multisystem usage, vs code setup, windows vs linux use), build instructions (see before + note the vcpkg usage and length of first build), run instructions
    - Dependencies (+ licencing, + freeze vcpkg version)