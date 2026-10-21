# Reach parkour building rules

For stock **MCC Reach / Forge World** maps made with this workspace's Blender exporter. Also follow [the general map rules](../../AGENTS.md). Physics and simple platform geometry are extracted from the installed game; **jump distances remain uncalibrated until tested in MCC**.

## Required

1. **Lock the movement profile.** Default to All Spartans, explicit 100% speed/gravity/jump, no armor abilities, ability use/pickup disabled, and ordinary forward running jumps from stationary, upright platforms. Specify whether crouch jumps are required. Audit respawn, loadout, powerup, objective and scripted trait overrides; resolve `Unchanged` through its parent. Record map/gametype hashes, build and input method. Elites, abilities, slopes and other settings need separate calibration. Avoid stun/damage during calibrated jumps; native stun can reduce jump velocity.

2. **Measure collision surfaces in WU.** This exporter uses **1 Blender coordinate unit = 1 WU**. Keep stock piece scale 1. Measure usable edge gaps and landing-top minus takeoff-top height, including each piece's origin offset and decoded orientation. Use recovered collision tops, not render bounds. Upright 1x1 Flat and 5x5 Flat have collision tops at origin Z + approximately **0.10000015 WU**; 2x2 Flat is **+0.11577591 WU**. Their conservative flat core widths are nominal width minus **0.0328 WU**. Inset launch/landing regions for the body and an allowance; do not depend on rounded-edge catches.

3. **Check every required jump and its approach.** Use actual takeoff speed, height delta, usable landing width/depth, front-face clearance and space to stop/turn for the next jump. A platform can be overshot even when its gap is below the maximum. The [estimator](jump_model.py) provides continuous ballistic calculations and arc points, not a Reach simulation. Its default launch/landing setbacks are radius + **0.10 WU**, with another **0.10 WU** landing reserve and **0.10 WU** below-apex rise margin. These are provisional design allowances, not tested engine tolerances. Its **0.285 WU** ideal run-up minimum needs calibration; do not treat it as sufficient in-game.

4. **Check the whole player path.** Sweep the standing body through overhead/side obstacles, supports, safe/kill zones and soft ceilings, including launch, landing and intended falls/respawns. Retain the general **2 WU** play-boundary margin. Existing platform bounds checks and sparse arc samples do not prove continuous clearance. Recheck decoded exported positions, stock limits/budget, stable physics, support, spawns and renders; save a new version for every map change.

5. **Calibrate before calling a course reliable.** On the target MCC system, use the [compact protocol](../research/parkour-2026-10-14/traits-geometry/minimal_calibration.md): measure movement, bracket gap successes/failures, test the course's rises/drops/run-ups, then test narrow landings and chained jumps. Record counts and dimensions. Use **10/10 controlled successes in two sessions** as the acceptance policy for each required jump family, then leave a documented margin based on measured error and landing variation. Validate cases outside those used to fit the model. A successful attempt alone is insufficient. Retest changed profiles, geometry or game builds. MCC stays closed on this Mac.

## Baseline inputs

Stock Spartan cache/native values, rounded; velocities WU/s, acceleration WU/s², lengths WU:

| Input | Value |
|---|---:|
| Forward / backward or sideways run | 2.2 / 1.98 |
| Walking field / crouched forward | 0.512 / 0.9 |
| Ground / airborne acceleration | 8.5 / 1.05 |
| Jump velocity / default gravity | 2.3 / 4.1712594 |
| Collision radius / standing / crouched height | 0.175 / 0.65 / 0.50 |

The ideal level jump gives **0.634 WU** foot rise, **1.103 s** airtime and **2.426 WU** center travel. These are **not allowed platform gaps**. The native zero biped gravity scale defaults to 1.0; do not multiply gravity by zero. Jump percentages act on velocity; changing them requires a new profile, calculation and calibration.

## Good to have

- Wide landing/rest pads, checkpoints and quick retries.
- Blender arc and usable-landing overlays; labeled gap/run-up markers.
- Video measurements, a second tester and host/client tests for multiplayer.
- A per-jump manifest with dimensions, technique, checks and calibration status.

[Evidence, reproducible commands and remaining limits](../research/parkour-2026-10-14/README.md). **Current status: offline inputs verified; no MCC calibration trials performed.**
