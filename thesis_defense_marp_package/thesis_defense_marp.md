---
marp: true
theme: default
paginate: true
size: 16:9
title: Defining Robot Trajectories Using Augmented Reality
description: Master's thesis defense presentation
style: |
  :root {
    --accent: #2563eb;
    --accent-dark: #1d4ed8;
    --accent-soft: #e0ecff;
    --muted: #64748b;
    --ink: #111827;
    --paper: #ffffff;
    --panel: #f8fafc;
    --line: #cbd5e1;
  }

  section {
    font-family: "Aptos", "Segoe UI", Arial, sans-serif;
    color: var(--ink);
    background: var(--paper);
    padding: 54px 70px;
    justify-content: flex-start;
  }

  h1 {
    font-size: 52px;
    letter-spacing: -0.01em;
    line-height: 1.03;
    margin: 0 0 18px;
  }

  h2 {
    font-size: 42px;
    letter-spacing: -0.01em;
    margin: 0 0 22px;
  }

  h3 {
    font-size: 28px;
    margin: 0 0 14px;
    color: var(--accent-dark);
    font-weight: 700;
  }

  p, li {
    font-size: 27px;
    line-height: 1.25;
  }

  ul, ol {
    margin-top: 14px;
  }

  li {
    margin: 10px 0;
  }

  strong {
    color: var(--accent);
  }

  em {
    color: var(--accent-dark);
  }

  .small {
    font-size: 20px;
    color: var(--muted);
  }

  .tiny {
    font-size: 16px;
    color: var(--muted);
  }

  .tag {
    display: inline-block;
    padding: 6px 12px;
    border-radius: 6px;
    background: var(--accent-soft);
    color: var(--accent-dark);
    font-size: 20px;
    font-weight: 700;
    margin-right: 8px;
    margin-bottom: 8px;
  }

  .callout {
    border-left: 6px solid var(--accent);
    padding-left: 20px;
    font-size: 31px;
    line-height: 1.25;
  }

  .muted-callout {
    border-left: 5px solid var(--line);
    padding-left: 18px;
    color: var(--muted);
    font-size: 24px;
  }

  .split {
    display: grid;
    grid-template-columns: 1.08fr 0.92fr;
    gap: 34px;
    align-items: center;
  }

  .split-even {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 34px;
    align-items: center;
  }

  .split-60 {
    display: grid;
    grid-template-columns: 0.95fr 1.35fr;
    gap: 28px;
    align-items: center;
  }

  .text-image-right {
    display: grid;
    grid-template-columns: 0.92fr 1.08fr;
    gap: 34px;
    align-items: center;
  }

  .text-image-left {
    display: grid;
    grid-template-columns: 1.08fr 0.92fr;
    gap: 34px;
    align-items: center;
  }

  .image-below {
    display: grid;
    grid-template-rows: auto 1fr;
    gap: 18px;
    height: 100%;
  }

  .image-grid-2 {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 16px;
    align-items: stretch;
  }

  .image-grid-3 {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 16px;
    align-items: stretch;
  }

  .image-grid-4 {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 14px;
    align-items: stretch;
  }

  .frame {
    border: 1px solid var(--line);
    border-radius: 6px;
    overflow: hidden;
    background: var(--panel);
  }

  .frame img {
    display: block;
    width: 100%;
    max-height: 100%;
    object-fit: contain;
  }

  .caption {
    font-size: 17px;
    color: #475569;
    padding: 8px 10px;
  }

  .plain-img img,
  img.plain-img {
    display: block;
    width: 100%;
    height: auto;
  }

  .contain-img img,
  img.contain-img {
    width: 100%;
    max-height: 410px;
    object-fit: contain;
  }

  .cover-img img,
  img.cover-img {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }

  .wide-img img,
  img.wide-img {
    width: 100%;
    max-height: 360px;
    object-fit: contain;
  }

  .large-img img,
  img.large-img {
    width: 100%;
    max-height: 470px;
    object-fit: contain;
  }

  .center {
    text-align: center;
  }

  .lead {
    display: flex;
    flex-direction: column;
    justify-content: center;
  }

  .visual-slide {
    display: flex;
    flex-direction: column;
    justify-content: center;
  }

  .motivation-arm {
    position: absolute;
    right: 55px;
    top: 70px;
    width: 44%;
    max-height: 78%;
    object-fit: contain;
  }

  .motivation-pendant {
    position: absolute;
    right: 70px;
    bottom: 38px;
    width: 25%;
    max-height: 28%;
    object-fit: contain;
  }
  .motivation-fixed {
    position: relative;
    height: 100%;
  }

  .motivation-fixed-left {
    position: absolute;
    left: 0;
    top: 0;
    width: 58%;
  }

  .motivation-fixed-pendant {
    display: block;
    width: 78%;
    margin: 52px auto 0 auto;
  }

  .motivation-fixed-robot {
    position: absolute;
    right: 0;
    top: -10px;
    height: 98%;
    width: auto;
    object-fit: contain;
  }
  
  .scene-layout {
    display: grid;
    grid-template-columns: 0.95fr 1.05fr;
    gap: 40px;
    align-items: center;
    margin-top: 34px;
  }

  .scene-stack {
    display: flex;
    flex-direction: column;
    gap: 14px;
    align-items: flex-end;
  }

  .scene-frame {
    width: 82%;
    height: 150px;
  }

  .scene-frame img {
    display: block;
    width: 100% !important;
    height: 115px !important;
    max-height: none !important;
    object-fit: cover !important;
    object-position: center;
  }

  .scene-frame .caption {
    height: 35px;
    padding: 7px 10px;
  }

  .video-frame {
    position: relative;
    border: 1px solid var(--line);
    border-radius: 8px;
    overflow: hidden;
    background: #0f172a;
    height: 385px;
  }

  .video-frame img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    opacity: 0.92;
  }

  .play-button {
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    width: 98px;
    height: 98px;
    border-radius: 50%;
    background: rgba(37, 99, 235, 0.88);
    color: #fff;
    font-size: 54px;
    line-height: 98px;
    text-align: center;
    padding-left: 6px;
  }

  .placeholder {
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 260px;
    border: 2px dashed var(--line);
    color: var(--muted);
    background: var(--panel);
    border-radius: 8px;
    font-size: 22px;
  }

  .two-column-list {
    columns: 2;
    column-gap: 44px;
  }

  .compact li {
    font-size: 23px;
    margin: 6px 0;
  }

  .result-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 22px;
  }

  .result-grid h3 {
    margin-top: 0;
  }

  .backup h2::before {
    content: "Backup · ";
    color: var(--muted);
  }

  /* HARD FIX for the Scene Sensing slide */
  section.scene-slide {
    padding: 0 !important;
    position: relative !important;
    display: block !important;
  }

  section.scene-slide h2 {
    position: absolute !important;
    left: 70px !important;
    top: 54px !important;
    margin: 0 !important;
  }

  section.scene-slide .scene-content {
    position: absolute !important;
    left: 70px !important;
    right: 70px !important;
    top: 145px !important;
    display: grid !important;
    grid-template-columns: 0.95fr 1.05fr !important;
    gap: 40px !important;
    align-items: start !important;
  }

  section.scene-slide .scene-stack {
    display: flex !important;
    flex-direction: column !important;
    gap: 14px !important;
    align-items: flex-end !important;
    padding-top: 0 !important;
  }

  section.scene-slide .scene-frame {
    width: 82% !important;
    height: 155px !important;
  }

  section.scene-slide .scene-frame img {
    display: block !important;
    width: 100% !important;
    height: 120px !important;
    max-height: none !important;
    object-fit: cover !important;
    object-position: center !important;
  }

  section.scene-slide .scene-frame .caption {
    height: 35px !important;
    padding: 7px 10px !important;
    font-size: 17px !important;
  }

  /* FINAL scene slide fix: normal top layout, uncropped images */
  section.scene-slide {
    padding: 54px 70px !important;
    position: relative !important;
    display: block !important;
  }

  section.scene-slide h2 {
    position: static !important;
    margin: 0 0 34px 0 !important;
  }

  section.scene-slide .scene-content {
    position: static !important;
    display: grid !important;
    grid-template-columns: 1fr 410px !important;
    gap: 52px !important;
    align-items: start !important;
    margin-top: 0 !important;
  }

  section.scene-slide .scene-stack {
    display: flex !important;
    flex-direction: column !important;
    gap: 16px !important;
    align-items: center !important;
    padding-top: 0 !important;
  }

  section.scene-slide .scene-frame {
    width: 410px !important;
    height: auto !important;
  }

  section.scene-slide .scene-frame img {
    display: block !important;
    width: 100% !important;
    height: auto !important;
    max-height: none !important;
    object-fit: contain !important;
    object-position: center !important;
  }

  section.scene-slide .scene-frame .caption {
    height: auto !important;
    padding: 8px 10px !important;
    font-size: 17px !important;
    line-height: 1.15 !important;
  }

  /* final tuning: smaller + slightly higher image column */
  section.scene-slide .scene-content {
    grid-template-columns: 1fr 360px !important;
    gap: 58px !important;
    align-items: start !important;
  }

  section.scene-slide .scene-stack {
    width: 360px !important;
    align-items: stretch !important;
    margin-top: -18px !important;
  }

  section.scene-slide .scene-frame {
    width: 360px !important;
    height: auto !important;
  }

  section.scene-slide .scene-frame img {
    width: 100% !important;
    height: auto !important;
    max-height: 190px !important;
    object-fit: contain !important;
  }
  
---

<!--
Dobrý den, jmenuji se Jakub Medek. Ve své diplomové práci jsem se zabýval zadáváním trajektorií robota pomocí prostorového vstupu inspirovaného rozšířenou realitou. 
-->

<!--
Layout toolbox / simple organizing logic:

1) Side-by-side content:
<div class="split-even">
<div>Text or bullets</div>
<div><img class="contain-img" src="assets/image.png"></div>
</div>

2) Text left, image right with more image space:
<div class="text-image-right">...</div>

3) Text above, image below:
<div class="image-below">
<div>Short text</div>
<img class="wide-img" src="assets/image.svg">
</div>

4) Two-picture collage:
<div class="image-grid-2">
  <div class="frame"><img src="assets/a.png"><div class="caption">A</div></div>
  <div class="frame"><img src="assets/b.png"><div class="caption">B</div></div>
</div>

5) Four-picture collage:
<div class="image-grid-4"> ... four .frame blocks ... </div>

6) Full-width technical figure:
<img class="large-img" src="assets/full_system.svg">

7) Placeholder for missing image/video:
<div class="placeholder">PLACEHOLDER: image or video goes here</div>

Image convention used here:
- vector/diagram assets are referenced as assets/*.svg
- screenshots/photos/renders are referenced as assets/*.png
- the provided package also includes PNG fallbacks; replace SVG wrappers with your real vector exports if available
-->

<!-- _class: lead -->

# Defining Robot Trajectories Using Augmented Reality

**Jakub Medek**  
Supervisor: RNDr. David Obdržálek, Ph.D.

Master's thesis, 2026

---

<div class="motivation-fixed">

<div class="motivation-fixed-left">

## Motivation

- Collaborative robots can work closer to humans
- Programming still often exposes low-level steps
- Can we define the task **more intuitively**?

<img class="motivation-fixed-pendant"
     src="assets/kassow_robot_pendant.png"
     alt="Kassow teach pendant">

</div>

<img class="motivation-fixed-robot"
     src="assets/kassow_robot_arm.png"
     alt="Kassow robot arm">

</div>

<!--
Narozdíl od klasických průmyslových robotických manipulátorů jsou kolaborativní manipulátory schopné pracovat v prostředích, kde se lidé pohybují v okolí robota. To mimo jiné umožňuje značně jednodušší použití robotů v úlohách, které se často mění nebo kde je člověk součástí procesu.

Samotné programování ale pořád může být poměrně nízko-úrovňové - typicky se jedná o definici programu pomocí bodů a trajektorií v prostoru, ovládání externích nástrojů a nastavení parametrů. I za předpokladu znalosti programovacího jazyka robota je tato úloha časově náročná. 

Tím se dostáváme k hlavní otázce práce - úloha programování robota je silně prostorová, nemůže tedy uživatel zadat konkrétní část dané úlohy přímo v prostoru místo toho aby vytvářel program krok za krokem?
-->

---

## From Spatial Intent to Robot Task

- The user does not define the whole program. 
- The user defines <strong>spatial intent</strong> and requried <strong>task specific parameters</strong>.

<img class="large-img" src="assets/pipeline.svg" alt="Spatial authoring pipeline">

<!--
V rámci práce nejde pouze o slepé přehrání nahrané trajektorie, nýbrž o zadání záměru - např. uživatel zadá svár pro svaření nebo vybraný objekt a systém určí trajektorii / program robota.

Systém tento vstup zkombinuje s daty o scéně a s logikou konkrétní úlohy, neboli use casu. Use case rozhoduje, co vstup znamená, a rozšíří ho na robotické příkazy.

[extra]
Například čára nakreslená perem ve svařovacím use casu se změní na approach, začátek svařování, pohyb při svařování, konec svařování a depart. U pick-and-place může být póza interpretována relativně k detekovanému objektu.
-->

---

## Target Tasks

<div class="split-even">
<div>

### Pick-and-place

**Define**:
  - pick pose (above object)
  - place pose

**Infer**:
  - pick object type
  - pick offset
  - place pose

**Runtime (dynamic)**: 
  - *detect* objects 
  - *move* to defined object and *pick*
  - *move* to place pose and *place*

</div>
<div>

### Seam welding

**Define**:
  - rough seam trajectory

**Infer**:
  - object positions
  - possible seam placements
  - intended seam placement

**Runtime (predefined/fixed)**:
  - *move* to approach
  - *move* to start, *start welding*
  - *move* to end, *stop welding*
  - *move* to depart

</div>
</div>

<!--

Tato práce se soustředí na předem připravené, úlohově orientované "use-casy". Každý use case určuje, jaké vstupy potřebuje a jak se tyto vstupy interpretují. Uživatel pak zvolí existující use-case a zadá prostorový vstup a případně další parametry.

Použil jsem dvě reprezentativní skupiny úloh. Pick-and-place reprezentuje manipulační úlohu, kde se pozice objektů ve scéně typicky mění mezi vytvořením a během programu. Svařování naopak reprezentuje statickou úlohu, zaměřenou na přesnou trajektorii robota. Svařování je zároveň typická úloha pro často se měnící zadání, např. v malovýrobě. 

-->

---

## Design Goals

- robot programming using spatial input
- extensible system where new use-cases can re-use existing infrastructure
- demonstrate approach on two representative usecases (Pick-and-place, Seam Welding)

<!--

Vytvořený systém by měl podporovat
- Využití primárně prostorového vstupu pro definici parametrů.
- Jednoduché rozšíření o další use-case moduly.
- Ukázat řešení na dvou reprezentativních use-case modulech.

-->

---

## What the System Needs

<div class="split">
<div>

- **6DoF input** for poses and trajectories
- **Scene detection** for objects and their poses
- **UI** for parameters, confirmation, and visualization
- **Robot interface** for execution
- **Use case plugins** for task-specific logic

</div>

<img src="assets/base_components.svg" alt="Base system components">
</div>

<!--
Z těchto dvou úloh přirozeně vychází požadavky na systém. Uživatel potřebuje prostorové vstupní zařízení. Systém potřebuje informace o scéně, protože samotný prostorový vstup nestačí pro pochopení záměru uživatele. UI řeší volbu usecase, extra parametry a potvrzení. Robotické rozhraní spouští výsledný program. A nakonec je nutná podpora pro samotné usecase moduly.

Detailněji si probereme prostorový vstup, detekci scény a volbu kamery.
-->

---

## Spatial Input

<div class="text-image-right">
<div>

### Considered options

- hand tracking
- VR / AR controllers
- fiducial marker tracking

### Selected input

**custom tracked 6DoF pen**

- camera-tracked
- physical buttons for intent
- usable directly in the workspace

</div>

<div class="frame">
<img src="assets/pen_real_photo.jpg" alt="Tracked pen prototype">
<div class="caption">Tracked pen prototype with marker cube and buttons.</div>
</div>
</div>

<!--
Vstup musí poskytovat 6DoF pozice a trajektorie v prostoru. Zároveň musí definovat způsob, jak může uživatel říct, že chce zaznamenat pozici nebo začít a ukončit trajektorii. (UMYSL UZIVATELE)

Zvažoval jsem sledování ruky, VR ovladače a marker tracking.

Pro implementovaný prototyp jsem nakonec zvolil vlastní sledované pero. Pero má ARuCO markery a fyzická tlačítka - tedy sledování je s pomocí existujících knihoven poměrně jednoduché a tlačítka umožňují jasně definovaný vstup.
-->

---

<!-- _class: scene-slide -->

## Scene Sensing, Camera Setup

<div class="scene-content">

<div>

### Scene sensing
- Considered:
  - Model-based pose estimation
  - Scanning & reconstruction
  - Commercial systems
- Chosen: *fiducial tagged boxes*

### Camera setup
- Single/multi; robot-mounted/fixed...
- *Single stereo robot-mounted camera*

</div>

<div class="scene-stack">

<div class="frame scene-frame">
<img src="assets/scene_box_bg.png" alt="Tagged box scene representation">
<div class="caption">tagged box scene representation</div>
</div>

<div class="frame scene-frame">
<img src="assets/camera_mount_bg.png" alt="Robot-mounted stereo camera mount">
<div class="caption">robot-mounted stereo camera mount</div>
</div>

</div>

</div>
</div>

<!--
Detekce scény je sama o sobě komplikovaný problém, proto jsem záměrně použil omezenou reprezentaci: objekty s ARuCo markery. Tím se práce soustředí na prostorové zadávání a modulární systém a ne na obecnou detekci objektů.

Pro detekci vstupu i scény využíváme kameru - pro kameru existuje několik možností: uvažoval jsem primárně jedna či více, upevněná na robotu nebo v prostoru a mono nebo stereo.

Pro práci jsem zvolil jednu stereo kameru připevňenou na robotu. To umožňuje lepší detekci hloubky než mono kamera, stabilní hand-eye kalibraci vůči robotu a značně jednoduší systém než podpora více kamer. Přesnost hloubky je důležitá pro prostorový vstup i lokalizaci scény.
-->

---

## Modular Architecture: Why It Matters

<div class="text-image-left">
<div class="frame">
<img src="assets/four_parts.svg" alt="Four conceptual parts of modular system">
<div class="caption">not a hardcoded demo: contracts, core, interfaces, modules</div>
</div>

<div>

- the core contains no task-specific logic
- modules communicate through explicit interfaces
- input, scene, UI, robot, and use cases can be replaced
- the same infrastructure supports multiple tasks

</div>
</div>

<!--
[Speaker notes | CZ]
Architektura je podstatná část práce. Implementovaný systém není jedna natvrdo napsaná demo aplikace. Je to modulární runtime.

Core pouze načítá moduly, propojuje je, routuje zprávy, spravuje lifecycle a sdílenou infrastrukturu. Neví nic o svařování ani o pick-and-place. Konkrétní chování je v modulech a use casech.

To je důležité proto, že součástí práce bylo experimentování. A také proto, že budoucí use casy mají znovu použít stejné snímání, UI, robotické rozhraní a execution infrastrukturu, místo aby se celý systém psal znovu.

[Original plan note | EN]
Use four_parts.png. Optionally place a small “not a hardcoded demo” caption. The architecture is a major part of the work.
-->

---

## Instantiated Prototype System

<img class="large-img" src="assets/full_system.svg" alt="Full instantiated system graph">

<div class="muted-callout">
Stereo camera → calibration → pen + scene detection → use case → robot interface → Kassow robot
</div>

<!--
[Speaker notes | CZ]
Toto je plný runtime graf použitý v prototypu. Cílem tohoto slidu není vysvětlit každou hranu, ale ukázat rozsah systému.

Camera stream a stav robota se používají pro kalibraci. Kalibrovaný camera stream jde do sledování pera i detekce scény. Use case moduly používají pen intent, data scény a robotické rozhraní. UI orchestruje setup, vizualizaci, potvrzení, spuštění a persistenci.

Hlavní pointa je, že high-level pipeline ze začátku je zde instanciována jako konkrétní moduly.

[Original plan note | EN]
Use full_system.png as the main visual. Do not explain every edge. The purpose of the slide is to show scope, not to explain every connection.
-->

---

## Workflow: From Setup to Authoring

<div class="split">
<div>

1. build the module graph
2. activate robot and camera
3. calibrate the camera setup
4. choose a use case
5. author and confirm a program
6. execute or save

</div>

<div class="frame">
<img src="assets/setup_steps.png" alt="Setup workflow screenshots">
<div class="caption">module-by-module setup mirrors the architecture</div>
</div>
</div>

<!--
[Speaker notes | CZ]
Tento slide je hlavně kvůli férovosti vůči workflow. Systém neodstraňuje veškerý setup. Na začátku je pořád potřeba sestavit graf modulů, aktivovat hardware a provést kalibraci.

Výhoda přichází až potom, když je připravená pipeline. Pak lze nové instance úloh zadávat uvnitř use casu místo toho, aby se pokaždé znovu stavěly jako low-level robotické procedury.

Zde je také důležitá persistence: graf modulů i vytvořené programy lze uložit a znovu načíst, takže opakované použití nemusí začínat prázdným systémem.

[Original plan note | EN]
Use setup_steps.png as collage. If the image is too dense, use it as a background/collage and place the six steps as large labels.
-->

---

## Demonstration Preview

<div class="split">
<div>

1. The system captures the scene
2. The user provides spatial input with the pen
3. The use case creates a robot command
4. The command can be confirmed, executed, and saved

</div>

<div class="video-frame">
  <img src="assets/video_screenshot.png" alt="Demo video screenshot">
  <div class="play-button">▶</div>
</div>
</div>

<!--
[Speaker notes | CZ]
Tady bych chtěl brzy ukázat výsledný workflow, protože potom bude zbytek systému srozumitelnější. Video nemá vysvětlovat každý detail UI. Hlavní myšlenka je, že prostorová akce v pracovním prostoru se změní na strukturovanou robotickou úlohu.

Během videa bych to aktivně komentoval: tady se načte scéna, tady se zachytí vstup perem, tady use case vytvoří příkaz a tady ho lze zkontrolovat nebo spustit.

[Original plan note | EN]
This is where the video belongs. Use a clean video placeholder on the slide: one large frame/screenshot from the video, with a play icon or “Demo video” label. Video: ideally 60–75 seconds. Narrated total: about 90 seconds.
-->

---

## Use Case Results

<div class="result-grid">
<div>

### Seam welding

- the user sketches the intended seam
- the use case creates an approach–weld–depart procedure

</div>
<div>

### Pick-and-place

- the user defines pick and place poses
- the command stores relation to the object
- the scene is refreshed at execution time

</div>
</div>

<div class="frame">
<img src="assets/usecase_usage.png" alt="Use case usage screenshots">
</div>

<!--
[Speaker notes | CZ]
Tyto dva use casy ukazují různé silné stránky.

Svařování je nejčistší fit pro tento přístup: měnící se část úlohy je geometrie švu. Uživatel tuto geometrii zadá přímo v prostoru a use case ji rozšíří na okolní robotickou proceduru.

Pick-and-place ukazuje objektově relativní interpretaci. Příkaz nemusí ukládat pouze fixní world-frame pick pose. Může uložit vybraný objekt a transformaci pick pose relativně k tomuto objektu, a potom při spuštění znovu načíst scénu.

[Original plan note | EN]
Use usecase_usage.png or two screenshots from the video/UI. Split slide into two clear halves. Welding is the clearest fit; pick-and-place demonstrates object-relative interpretation.
-->

---

## Conclusion and Boundaries

<div class="split-even compact">
<div>

### Result

An end-to-end prototype for **spatial authoring of prepared robot tasks**.

Demonstrated:

- custom tracked 6DoF pen
- stereo sensing and calibration
- modular runtime
- pick-and-place and seam welding
- execution on a collaborative robot

</div>
<div>

### Boundaries

- qualitative evaluation
- simplified tagged-object scene detection
- no collision planning
- tool actions approximated by fixed delays
- not a general robot-programming language

</div>
</div>

<!--
[Speaker notes | CZ]
Odpověď na výzkumnou otázku je v rámci připravených use casů pozitivní. Systém ukazuje, že prostorový vstup, snímání scény, úlohově specifická interpretace a robotické spuštění mohou být spojeny do jednoho end-to-end workflow.

Zároveň to není tvrzení o production-ready systému. Vyhodnocení je kvalitativní, vnímání scény je záměrně zjednodušené a širší nasazení by vyžadovalo lepší sensing, abstrakci nástrojových akcí, plánování pohybu, collision checking a systematičtější evaluaci.

Na závěr bych řekl, že hlavním přínosem je konkrétní implementovaný základ pro in-workspace spatial authoring kolaborativních robotických úloh.

[Original plan note | EN]
Use a clean “result collage”: robot arm + pen + full system small + video screenshot. The answer to the research question is positive within the prepared-use-case scope. At the same time, this is not a claim of production readiness.
-->

---

## Why not ROS?

<div class="split-even">

<div>

### Reasons for a custom runtime

- **Explicit module graph control**
   - UI-driven graph construction
   - possible programmatic graph construction

- **Data ownership and performance**
   - large camera frames
   - shared payloads instead of repeated deep copies

- **Lower initial integration risk**
   - known C++ stack
   - thesis-specific interfaces

</div>

<div>

### Retrospective assessment

- **ROS would improve reusability**
   - more standard ecosystem
   - easier for others to understand

- **Some assumptions were conservative**
   - flexibility likely achievable in ROS
   - performance may also be solvable

- **Still justified for this thesis**
   - the custom runtime is part of the contribution
   - it made the contracts and workflow explicit

</div>

</div>

<!--
Krátká odpověď je, že ROS by určitě byla rozumná alternativa. Je to standardní ekosystém, ostatní robotici ho znají, existuje spousta hotových nástrojů a z hlediska budoucí rozšiřitelnosti by to pravděpodobně zjednodušilo převzetí projektu někým dalším.

V době návrhu jsem ale řešil hlavně to, že jsem chtěl mít velmi explicitní kontrolu nad tím, jak se systém skládá z modulů. V mém systému není graf modulů jen pevná konfigurace napsaná předem. Může ho vytvářet uživatel přes UI, a stejný mechanismus by šel použít i pro to, aby graf vytvořil jiný řídicí modul při startu systému. Chtěl jsem tedy mít pod kontrolou lifecycle modulů, jejich rozhraní, směrování zpráv a mapování kanálů.

Druhý důvod byla práce s velkými daty, hlavně s kamerovými snímky. Chtěl jsem se vyhnout tomu, aby se obrazová data zbytečně hluboce kopírovala mezi částmi systému. Proto jsem navrhl sdílené payloady s shallow copy / reference counting pro velká data. ROS podobné problémy samozřejmě umí nějak řešit také, ale pro rozsah práce mi vlastní runtime dával jasnou kontrolu nad tím, co se přesně děje.

Třetí důvod byl praktický. Rozhodnutí padalo poměrně brzy v životě práce, kdy ještě nebyly úplně zřejmé všechny důsledky návrhu. Měl jsem jistější C++ stack a vlastní runtime se tehdy zdál jako menší integrační riziko než stavět celý systém na ROSu, který jsem neznal dostatečně do hloubky.

Zpětně bych ROS zvažoval vážněji, hlavně kvůli standardizaci, nástrojům a tomu, že by projekt byl srozumitelnější pro širší robotickou komunitu. Zároveň si ale myslím, že vlastní runtime je v kontextu této práce obhajitelný, protože není jen pomocná infrastruktura. Explicitní modulové kontrakty, mapování kanálů, vlastnictví dat a skládání aplikace z modulů jsou součástí výsledku práce.


-->

---

<!-- _class: backup -->

## Official Assignment Mapping

- **Survey:** AR/VR and robot-programming workflows
- **Design:** spatial authoring + task-oriented use cases
- **Implementation:** modular C++ runtime + modules
- **Pilot application:** Kassow robot, tracked pen, tagged scene boxes
- **Evaluation:** qualitative evaluation on pick-and-place and seam welding

<!--
[Speaker notes | CZ]
Tento slide bych použil jen pokud bude potřeba explicitně napojit prezentaci na zadání. Ukazuje, že všechny části zadání jsou pokryté: rešerše, návrh, implementace, pilotní aplikace a vyhodnocení.

[Original plan note | EN]
Use only if needed. Official assignment mapping.
-->

---

<!-- _class: backup -->

## Channel Mapping / Communication Model

<div class="split">
<div>

- publish / subscribe for streams
- request / response for explicit queries
- directed channel mapping, not global broadcast
- UI can inspect and build the graph

</div>

<div class="frame">
<img src="assets/channel_mapping.svg" alt="Channel mapping example">
</div>
</div>

<!--
[Speaker notes | CZ]
Toto je backup pro dotazy na architekturu. Publish/subscribe se používá pro kontinuální data, například camera stream. Request/response se používá pro věci, které mají proběhnout na vyžádání, například detekce scény. Důležité je, že spojení mezi moduly jsou explicitně mapovaná.

[Original plan note | EN]
Talk about publish/subscribe for streams and request/response for explicit actions only if asked about architecture.
-->

---

<!-- _class: backup -->

## Calibration

<div class="split-even">
<div>

- camera intrinsics
- stereo extrinsics
- hand-eye calibration
- Charuco target
- recalibrate if the mount changes

</div>

<div class="frame">
<img src="assets/camera_mount_bg.png" alt="Robot-mounted camera mount">
</div>
</div>

<!--
[Speaker notes | CZ]
Kalibrace propojuje obrazová data s robotickými souřadnicemi. Zahrnuje intrinsics kamer, stereo vztah mezi kamerami a vztah mezi kamerou a robotickou přírubou. Pokud se mechanický mount změní, je potřeba kalibraci zopakovat.

[Original plan note | EN]
Use camera_mount_bg.png and maybe calibration board screenshot/PDF. Key points: intrinsics, stereo extrinsics, hand-eye calibration, Charuco target, re-calibrate if mount changes.
-->

---

<!-- _class: backup -->

## Pen Tracking Details

<div class="split-even">
<div>

- ArUco marker detection
- multi-camera pose candidates
- reprojection scoring
- Ceres refinement
- smoothing
- button-derived intent events

</div>

<div class="frame">
<img src="assets/pen_full_bg.png" alt="Tracked pen prototype">
</div>
</div>

<!--
[Speaker notes | CZ]
Toto je technický backup ke sledování pera. Pero má několik markerů, takže lze získávat kandidátní pózy z obrazu, vyhodnocovat je podle reprojekční chyby, zpřesňovat optimalizací a potom výstup lehce filtrovat. Fyzická tlačítka dávají explicitní intent events.

[Original plan note | EN]
Key points: ArUco detection, multi-camera pose candidates, reprojection scoring, Ceres refinement, one-euro smoothing, button-derived intents.
-->

---

<!-- _class: backup -->

## What Is Not Implemented

- no general robot-programming language
- no automatic arbitrary intent recognition
- no full object detection
- no collision checking
- no real welding / gripper tool abstraction
- no formal user study

<!--
[Speaker notes | CZ]
Tento slide je užitečný pro vymezení hranic. Systém není obecný programovací jazyk pro roboty a nesnaží se automaticky hádat libovolný záměr uživatele. Je to prototyp pro připravené use casy s explicitní úlohovou logikou.

[Original plan note | EN]
This backup is useful because it shows you know the boundary clearly.
-->
