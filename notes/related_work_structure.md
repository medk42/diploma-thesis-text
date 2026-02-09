## Baselines + where AR/MR fits (1–2 paragraphs)
- One paragraph: pendant/OLP/hand-guiding recap (no deep dive).
- One paragraph: what AR/MR tries to improve (in-situ context, faster iteration), and why it’s hard (registration etc. → cite the review).

## AR/MR for robot programming: from waypoint teaching to higher-level authoring (4–5 paragraphs)
- Offline vs online AR workspaces (Thoo).
- MR waypoint/path authoring (Gadre).
- Intent-ish behavior authoring (PRogramAR).
- Each paragraph ends with 1 sentence positioning your thesis (“we instead… task-oriented interpretation + shared execution layer”).

## Input modalities and multimodality (2–3 paragraphs)
- Why hands vs tools vs voice (types of intent).
- One concrete multimodal example (Kulecki).
- Close: your choice (tracked pen/tool + external sensing + use-case interpretation).

## Positioning summary (0.5 page)
- What your thesis does differently: spatial authoring of motions + tool actions, task-oriented programs, real robot demo, reusable pipeline.


TbD = teach by demonstration (= just move through and show path)
PbP = point by point (= define poses, linear move between; maybe different with MoveIt!)
StR = simulate then run
StRO = simulate then run, overlayed
CtT = calibrate then transfer (design offline, then calibrate offline and online and StR)
SIM = pure simulation, no real robot interaction
COLL_DET = collision detection
HMLV - High-Mix Low-Volume


VILLANI201866: Villani et al., 2018 - SURVEY, overview of common robot programming approaches - first online, offline; then multi-modal, virtual, augmented reality.

Makhataeva2020: Makhataeva & Varol, 2020 - SURVEY, AR applications in robotics (not just programming!)

DIANATFAR2021407: Dianatfar et al., 2021 - SURVEY, review of VR/AR solutions in human-robot collaboration

IFR2023TraditionalVsNew: Bieller (IFR), 2023 - programming slow (50-70%), OFFLINE PROGRAMMING, align to scene, collision avoidance



Ikeda2024: Ikeda & Szafir, 2024 - AR/HOLOLENS; INTENT; TWIN(ON,StRO), PRogramAR, trigger-action rules (if-then or while-do); add zones, if-object-in-zone then-move-to-zone; steamvr trackers for objects; Motion Planner MoveIt!

Ong2020: Ong et al., 2020 - AR/DK2; TbD, PbP, CAD edge/feature; COLL_DET; TWIN(ON,StRO); (head-track, OptiTrack pen, kinect2 workspace); OMPL MoveIt!

Devic2024: Dević et al., 2024  - AR,VR/PHONE,RiftS; TbD, PbP; TWIN(OFF,SIM); HMLV; simulate + debug support (system checks attainability); custom path planning/IK

Thoo2021: Thoo et al., 2021 - AR/PHONE; ???; TWIN(OFF,CtT); HMLV - they simulate the real environment for offline programming which essentially turns their system into full offline programming tool, but in AR (MENTION)
    
????????: Maccio et al., 2024 - AR/HoloLens, SPEECH; TbD; TWIN(ON,playback); IK unknown; (hand drag digital twin; open/close gripper, start/stop kinesthetic teaching voice; record/playback)

Muller2024: Mueller et al., 2024 - AR/VivePro; COMPLEX; TWIN(OFF,CtT,Next Room); Bio-IK solver; HMLV; (SmartPd pen (theirs), using OptiTrack (sub-mm accuracy)); "Real-er" approach: calibrate, SmartPd is end-effector, create frames (pose, flags (grip, release, approach...), type (PtP, spline), ref coord system), build trajectories (PtP, spline = welding), validate (sim, check reachability, singularities, collisions), calibrate real robot, recompute all joints, validate again, export to source code, execute, https://www.mdpi.com/2218-6581/13/3/35

Vysocky2023:  Czech guys - GESTURE/HAND; PbP; TWIN(ON); MediaPipe; good results, but no intent, "Similar to one part of my system (pick and place), however, I'd like my system to be more general", https://www.mdpi.com/1424-8220/23/9/4219



????????: Kulecki et al., 2022 - GESTURE+SPEECH; simple; MediaPipe; gesture (point = select object; outreached hand = handover pose), voice (grasp = grasp selected object; give to hand = move to hand, open gripper; go home = predefined configuration; go there = move to detected hand)

Lin2023: Lin et al., 2023 - GESTURE+SPEECH; GIRAF, human language+deictic gesture instructions



DONE
    Zhang et al., 2023 - HAND_TRACK, HEAT, TracePen mention; probability heavy

    D-Point pen
        https://github.com/Jcparkyn/dpoint/tree/main
        https://hackaday.com/2023/11/14/d-point-a-digital-pen-with-optical-inertial-tracking/
        https://rijnieks.com/blog/2023-11-25-replicating-dpoint/

    Wandelbots (product, 2022) - TracePen

    Mueller et al., 2024 and Ong et al., 2020 use OptiTrack, mention it here, to get sub mm accuracy


    Where? - will not use Neura, probably neither SmoothRobotics (would need to compare in intro and conclusion, extra work, not too related)
        Neura robotics - MAIRA - mention?
        smooth robotics - developing a use-case is efficient as can be seen with smooth robotics, developing an in-depth welding use-case significantly simplified using the UR cobot for welding tasks. Our approach would like to explore this concept - in much less depth - but applied generally and with spatial intent instead of typical teach pendant programming. 

intro - mention some surveys, then HMLV?


Visualization: AR (hololens vs phone) or VR
Programming: lead-through (controller), or PbP - occasionally stuff like CAD detect OR PRogramAR
Robot control: full on planning, MoveIt!
Programming environment: online (often simulate then run) or offline (full digital twin, issue of scene alignmnet and working in scene)
Issue of robot alignment!

Typical problems: 
    align robot and scene
    offline - we have to see scene to program it, otherwise it's just motions - that is covered in XYZ papers
        - mention but as "Offline AR programming approaches similar problems that classical offline programming does, that is representing the scene accurately. Thoo et al. and XYZ developed a system to do this.

    digital twin is SIMPLER for AR (you do not need to solve the robot-ar device calibration/transformation. But it makes working in the robot's workspace impossible unless you clone the environment. It has same issues as offline programming does - you need an exact clone of the environment - but once you have that, AR programming with simple intent / snapping poses could be very efficient. However that is pretty much my system. 



FIRST - read the chat and update this note, THEN map this note into outline, THEN map related work into outline, THEN update/iterate outline with chat outline and outline outline; Then write simple related work

go through this again, add info where relevant
go through it again, outline what we can use in introduction and where
go through it again and build relevant work outline; also point out which work we will use in hand / pen detection (or later)
read response from chat -> merge
read outline -> merge
write ch2

design ch3 - what we will talk about and how and what will we decide
deep research on ^ - i will give it the links i know (hand tracking, etc.) and my decisions (tablet, web, WT, single vs multi camera; and let it build a case for all of it supported by research where relevant). 