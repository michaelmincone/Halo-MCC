# Reach parkour investigation

2026-10-14. Deliverable: [concise building rules](../../parkour/rules.md) and a
[reusable ideal jump estimator](../../parkour/jump_model.py). Everything was
offline; no game files, existing maps or gametypes were changed. MCC was not
launched and nothing was published. **No in-game calibration trials occurred.**

## What the four-part investigation established

| Part | Result | Remaining condition |
|---|---|---|
| Fixed settings | Explicit All-Spartan / 100% speed, gravity and jump / no-ability profile; list of trait and loadout overrides to audit | Save/inspect the actual gametype and record its hash before calibration |
| Actual physics | Stock player representations, movement values, capsule sizes, native gravity/default-scale behavior and jump trait/stun application | Full Havok integration, sprint/momentum and all trait precedence were not reconstructed |
| Geometric model | Height-dependent descending landing time, finite landing interval, overshoot, approach to raised faces, run-up estimate and arc points | Obstacles, continuous body sweeps, bounds and exported piece transforms must be checked by the map builder |
| Calibration | [Four-step protocol](traits-geometry/minimal_calibration.md), [optional matrix](traits-geometry/calibration_matrix.json) and [results template](../../parkour/calibration_results.template.json) | Execute and record trials on target MCC; predictions remain unverified until then |

The investigation delivers a repeatable build-and-validation process. It does
not establish a universally certified maximum gap, a playable course, or an
exact recreation of the engine. Rules require measurements before reliability
claims and require retesting when the inputs change.

## Target identity and actual values

- Forge World cache: `Jun 21 2023 15:35:31`, 332,328,960 bytes,
  SHA-256 `12270ddad452bce9afaef6000d5a18f2ba7c363ffbe7fcb59375619dbeebfcf4`.
- PC `haloreach.dll`: SHA-256
  `738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894`.
- Assembly ReachMCC schemas: commit
  `fd14ef3c46135e9422966c6a64cd926fb0bd23fb`.
- TagTool unit/semantic reference: commit
  `ce2dc6ac13072b160752af618ea1dc143e2727ac`.

Exact cache bytes, offsets, player representation links and pinned source hashes
are in [physics evidence](physics/stock-forge-world-physics.json) and its
[short explanation](physics/README.md). The stock Spartan has forward run 2.2,
backward/sideways run 1.98, walking field 0.512, crouched forward 0.9 WU/s;
ground/airborne acceleration 8.5/1.05 WU/s²; jump velocity 2.3 WU/s; capsule
radius 0.175 and standing/crouched heights 0.65/0.50 WU. Elite values differ:
forward 2.6, jump 2.65, radius 0.18 and heights 0.79/0.65. The wiki's shared
Reach/4 table is insufficient for these distinctions, collision size and gravity;
its listed sneak acceleration also differs from this cache's 6.1/7.1 values.

Both stock players use the player-physics flag; zero scale fields must not be
interpreted as zero gravity or zero acceleration. Both Forge World BSP gravity
scales are 1.0 and their custom-gravity flags are disabled.

## Native evidence

[Native values](native/native-values.json) pin the binary, exact scalar bytes and
bounded leaf disassembly. [The targeted Ghidra manifest](native/movement-gravity/manifest.json)
confirms the imported/source hashes agree, source execution/modification is
false, and nine selected PE ranges decompiled. Analysis used Ghidra 12.1.4 with
whole-program autoanalysis disabled, reusing an existing imported database in
read-only mode. Function types remain inferred; assembly corroborates the
following narrow conclusions:

- `0x18014fc94` initializes, and `0x18014fd88` / `0x18019c588` reset, physics
  state at TLS+0x330 with float bits `0x40857af5` = **4.17125940322876**.
  The handler bound to `physics_set_gravity`, `0x18019c604`, multiplies its
  argument by the same constant and stores the result in that state.
- `0x1804a5484` starts entity gravity scale at **1.0**, substitutes biped
  `+0x668` only if positive, and applies a positive runtime object `+0xdb4`
  multiplier. The stock cached zero therefore falls back to 1.0. This leaf has
  no PE unwind entry; its complete bounded decoded view through RET is retained,
  with direct branch targets checked inside that view.
- `0x18014fe2c` returns the selected scenario BSP `+0xa8` gravity scale, or 1.0
  for the invalid-BSP sentinel. `0x1804f1e44` / `0x1804f1ee8` use BSP/entity
  scaling and the stored gravity for a trajectory calculation. This calculation
  is engine trajectory evidence, not proof of the actual per-tick player integrator.
- `0x180538914` reads biped jump `+0x4f0`, applies a stun factor using the tag's
  `+0x308` jumping penalty, and multiplies by the runtime jump trait divided by
  **100**, with zero/default handling. The stock Spartan/Elite stun-jumping
  penalties independently read as 1.0. The code raises the velocity's projection
  along the unit's up direction to the requested jump velocity. It also handles
  inherited/support velocity and subsequent player checks. Percentage changes
  cannot be assumed to scale physical apex height linearly.

REA 6.4.0 bound the correct native target, but whole-program startup failed with
`No space left on device`. The complete failed reply and a compact diagnostic
are retained in `rea/2-search_strings.json` and `native/rea-failure-summary.json`.
Pending REA work was canceled; the owned server and orphaned retry JVM were
closed, with runtime identity matched to the failed reply's run ID. No REA
decompilation success is claimed. The focused Ghidra fallback supplied the
successful analysis above; existing source/program databases were not saved over.

## Geometry and design policy

[Traits/geometry findings](traits-geometry/FINDINGS.md) establish the raw Blender
translation-to-WU mapping and actual stock `bloc → hlmt → phmo/coll` chains.
Five Flat block sizes have a single Fixed root convex hull and filled rectangular
collision tops. Root node transforms are identity; convex radius is 0.0164 WU.
The core flat footprint is nominal width minus 0.0328 WU. Core top plus convex
radius agrees with the independent collision-BSP top within 1.3e-8 WU.
1x1/5x5 Flat tops are origin+0.100000151 WU; 2x2 Flat is +0.115775906 and differs
from its render mesh. Ordinary 1x1 has more complicated/conflicting contact
representations; it is excluded from the simple calibration baseline.

For constant horizontal speed and continuous gravity, the estimator uses
`z(t)=v_jump*t−g*t²/2`, choosing the descending root at the target height. It
subtracts explicit center setbacks/reserves and checks both ends of the finite
landing interval. It tests raised-face approach using the player radius and an
explicit outer-face extension beyond the supplied usable flat region. Arc export
includes the exact apex. Samples still do not establish continuous collision.

Default calculated values are apex 0.634101 WU, level airtime 1.102784 s and
center displacement 2.426126 WU. Default allowances yield about 1.776126 WU
maximum usable-edge gap onto an infinite level platform; a finite platform can
still be missed. Minimum run-up 0.284706 WU assumes constant ground acceleration.
**All are ideal, uncalibrated results.** Insets/reserves, rise margins and the
10/10 success criterion are engineering policy, not recovered engine constants.

Generic `bounds_check.py` assumes platform sizes and samples above object
origins; it does not check collision-top polygons or airborne trajectories.
Render-mesh BVHs likewise do not establish engine contact. The rules explicitly
require actual decoded geometry and continuous/conservative body clearance.

## Reproduce and verify

From the workspace root:

```sh
python3 forge/research/parkour-2026-10-14/physics/extract_reach_physics.py --output /tmp/reach-parkour-physics-recheck.json
python3 forge/research/parkour-2026-10-14/traits-geometry/probe_platform_collision.py --output /tmp/reach-parkour-collision-recheck.json
publisher/investigation/.tools/python/bin/python forge/research/parkour-2026-10-14/native/inspect_native_values.py
python3 -m unittest discover -s forge/parkour -p 'test_jump_model.py' -v
python3 forge/parkour/jump_model.py --gap 1.7 --platform-width 0.9672
```

Use a fresh collision-probe output path; the probe deliberately refuses to
overwrite an existing report. The estimator CLI's exit 0 means JSON was computed; inspect
`gap_check.ideal_design_policy_pass`. A passing estimate is never calibration.
Ghidra can be replayed with `bash forge/research/parkour-2026-10-14/native/run-targeted.sh NEW_PASS_NAME ADDRESS...`;
existing destinations are rejected. Source hash guards reject changed binaries.

Validation artifacts record cache offset/shape/guard checks, collision internal
consistency and independent model cases for unreachable heights, descending
roots, raised faces, narrow-platform overshoot and input/CLI behavior. They
validate extraction/math; they are separate from the empty gameplay trial log.
