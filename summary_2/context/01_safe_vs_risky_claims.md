# Safe Vs Risky Claims

## Safe Discussion

- The thesis can reasonably say that spatial authoring reduces friction for some frequently changing tasks.
- The thesis can reasonably say that the architecture is its own result, not just a container for the use cases.
- The thesis can reasonably say that pick-and-place demonstrates flexibility, even if it is not the ideal target use case.
- The thesis can reasonably say that welding is the strongest fit for the current prototype.
- The thesis can reasonably say that the system is best understood as task-oriented rather than language-oriented.
- The thesis can reasonably say that the work points toward human-robot collaboration where humans provide spatial intent and robots provide repetitive execution.
- The thesis can reasonably say that the current prototype is a proof of concept with useful results, not a production platform.

## Safe If Softened

- `The system could be used as a different kind of integrator` should become `the system suggests a deployment model closer to a reusable task-specific integration layer`.
- `The system is ideal for one-off welding` should become `the system appears especially well matched to repetitive, frequently re-taught welding-like tasks`.
- `The system is faster than teach-pendant workflows` should become `the system plausibly reduces setup friction compared with manual re-teaching workflows`, unless measured data is added.
- `The system is more practical than existing industrial tooling` should become `the system offers a different trade-off that may be attractive for some task classes`.
- `Pick-and-place is not useful` should become `pick-and-place is better treated as a flexibility demonstration than as the main practical sweet spot`.
- `The architecture is commercial-grade` should become `the architecture is reusable and extensible, but still experimental`.
- `The robot is like a human assistant` should become `the system points toward a human-in-the-loop workflow where the robot handles repeated physical execution`.
- `The system can easily be exported to robot-side execution` should become `the architecture suggests a possible path toward export, but this is not yet implemented or validated`.

### Phrasing patterns for softening
- Use `suggests`, `points toward`, `appears to`, `may be`, `could support`, `is particularly well suited to`.
- Prefer `for this prototype` or `in the current setup` when the claim is implementation-specific.
- Prefer `qualitatively` when discussing speed, usability, or workflow efficiency.
- Prefer `one plausible deployment model` over `the deployment model`.

## Needs Source Check

- `The thesis should discuss an integrator-like deployment model` needs careful grounding in the introduction and related work before it becomes a strong chapter claim.
- `The system should be described as a reusable task-package layer for factories` needs source support if it is to be stated as more than an author interpretation.
- `The thesis should mention export to robot-side execution as a future direction` needs a source check unless it is phrased as a new authorial idea.
- `Linux-specific BLE problems` need source verification before they are introduced into Chapter 6 or 7.
- `UI freezes, reload bugs, or desynchronization bugs` need source verification before they are described as thesis findings.
- `Exact timing claims such as 30 seconds to teach a weld` need measurement or should stay out.

## Keep Out Unless Separately Verified

- `The system is faster than SmoothTool` should stay out without direct comparison data.
- `The system is a replacement for industrial integrators` should stay out.
- `The system provides true robot-human integration` should stay out as written; it is too strong and too vague.
- `The current prototype is commercially viable` should stay out.
- `The system is proven globally accurate` should stay out.
- `The pick-and-place use case proves general dynamic programming capability` should stay out.
- `The linear command model is a meaningless limitation` should stay out; it is better handled as a deliberate trade-off.

## Boundary Summary

- Keep the discussion grounded in what was built, what it means, and where it is useful.
- Keep the conclusion compact and modest.
- Keep high-level interpretive ideas if they are clearly softened.
- Keep hard performance, commercial, and comparison claims out unless the thesis text or measurements support them.

