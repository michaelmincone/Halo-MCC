# Parkour traits and geometry evidence

Investigation date: 2026-10-14. Offline only; no MCC/Halo launch, gametype creation, map creation, publication, or in-game success claim. `baseline_profile.json` is a proposed ordinary Spartan/no-ability calibration profile. `calibration_matrix.json` is a protocol, not a test report.

## Fixed movement profile

ReachVariantTool (RVT) distinguishes these serialized values:

| Field | Concrete ordinary profile | Unchanged |
|---|---:|---:|
| `options.team.species` | All Spartans = 1; All Elites = 2 | Player preference = 0 (not a fixed species) |
| Base `movement.speed` | 100% = enum 6 | 0 |
| Base `movement.gravity` | 100% = enum 3 | 0 |
| Base `movement.jumpHeight` | 100% = integer 100 | -1; optional field with presence bit |
| `offense.ability` | None = -1; Sprint = 0 | -3 |
| `offense.abilityUsage` | Disabled = 1; Enabled = 3 | 0 |

Evidence: `variant-tool/ReachVariantTool/native/src/ReachVariantTool/game_variants/components/player_traits.h:11` (abilities), `:27` (usage), `:156` (speed), `:177` (gravity), `:318` (fields), `:328` (jump); `.../custom_game_options.h:173` (species); `.../ui/main_window/page_player_traits.ui:1036` (-1 special text, percent suffix, editable range through 400); `.../game_variants/components/player_traits.cpp:181` (deserialization). RVT is an independent editor; these mappings establish what to inspect/set, not the engine's gravity/jump-multiplier formula.

An `Unchanged` entry is a separate sentinel and cannot be read as an explicit 100% value. Resolve the effective base/override value. Explicit 100% base movement plus neutral overrides is the proposed standard, rather than depending on defaults/preferences. The exact overlay precedence is not established by these source records, so conflicting concrete overrides require engine investigation or runtime validation.

Audit all sources of changes: `options.map.baseTraits` and red/blue/yellow powerups (`custom_game_options.h:135`, `powerups.h:5`); respawn traits and duration (`custom_game_options.h:76`); both species' loadout palettes (`loadouts.h:5`); Megalo trait definitions (`types/multiplayer.h:97`) and conditional `apply_traits` calls (`components/megalo/actions.cpp:131`). RVT says scripted traits must be reapplied every frame (`actions.cpp:134`), so different script branches can alter movement throughout the course. For base abilities, RVT says the trait selects the ability at spawn (`help/editor/main_window/traits.html:247`); pickup/drop/loadouts can change equipment later. RVT's help says Weapon Pickup also covers armor abilities (`traits.html:259`); map flags separately enable armor ability/powerup pickups (`help/editor/main_window/options-map.html:207`). Inspect biped replacement actions too (`components/megalo/actions.cpp:452`).

There is no independent ordinary sprint-speed toggle in these serialized movement traits; Sprint is an armor ability. An ability course needs its own profile including cooldown/energy/startup. The Double Jump field is labeled unused (`player_traits.h:88`) and RVT's help states that its tests found no effect (`help/editor/main_window/traits.html:283`); it cannot justify a double-jump course.

## WU, origins, and platform dimensions

Mjolnir transfers map positions directly into Blender world-matrix translations: `forge/Mjolnir-Forge-Editor/Addon/mjolnir.py:489`, `:534`, `:602`. Columns are local right / forward / up / position; right = forward cross up. Consequently one Blender coordinate unit equals one map world unit (WU) in this pipeline. Use WU internally; no metres/feet conversion is necessary. Object scales must remain 1 for stock, unmodded map pieces. Terrain is different: its library object already carries scale about 0.328, applied exactly once by `forge/map-checks/stray_check.py:33`; do not apply that terrain scale again to stock piece dimensions or map positions.

Read-only `measure_platforms.py` extracted only scalar dimensions and horizontal surface-layer statistics from the linked stock library; `platform_dimensions.json` records the library SHA256. These are real authoring/render dimensions, **not recovered engine collision dimensions**. Useful examples (neutral upright pose, top relative to object origin):

| Stock piece | Render AABB dimensions WU | Bottom / maximum top WU |
|---|---|---|
| Block, 1x1 | 1.018196 × 1.018210 × 1 | -0.5 / +0.5 |
| Block, 1x1, Flat | 1.017620 × 1.017620 × 0.2 | -0.1 / +0.1 |
| Block, 1x1, Short | 1.017615 × 1.017627 × 0.5 | 0 / +0.5 |
| Block, 1x1, Tall | 1.018216 × 1.018217 × 2.5 | -1 / +1.5 |
| Block, 1x1, Tall And Thin | 0.5 × 1.000001 × 3.000480 | -1.500240 / +1.500240 |
| Block, 2x2, Flat | 2 × 2 × 0.255 | -0.145 / +0.11 |
| Block, 3x3, Flat | 3 × 3.000001 × 0.299468 | -0.199468 / +0.1 |
| Block, 4x4, Flat | 4 × 4 × 0.2 | -0.1 / +0.1 |
| Block, 5x5, Flat | 5 × 5 × 0.2 | -0.1 / +0.1 |
| Platform, Large | 4 × 4.000001 × 3 | -2 / +1 |

Origins are not uniformly centered. Maximum top is not always a filled plane: the render meshes include recessed layers, bevels and trim. AABB max-Z/XY cannot certify a landing rectangle; horizontal-layer XY bounds also do not prove a filled rectangle. Use actual collision surfaces when available, or calibrate conservative usable regions on the chosen stock pieces. Each piece's decoded orientation transforms those surfaces and offsets. Sideways walls, rails and angled/irregular pieces need their own geometry/contact treatment.

Use **surface edge-to-edge** gap and **surface-to-surface** height delta, not origins, nominal piece names or centre distances alone. For level aligned rectangles, origin separation equals edge gap plus the two relevant half-widths; for yawed/irregular surfaces measure the actual projected launch/landing boundaries. Select valid takeoff and landing regions, inset them by the player collision footprint plus a chosen allowance, and assess required travel between those regions. Do not rely on theoretical edge-catching to call a normal jump reliable.

## Actual simple flat-block collision evidence

`probe_platform_collision.py` follows actual installed stock `bloc` → `hlmt` → `phmo` and `coll` references with bounded read-only reads. `platform_collision.json` saves scalar measurements, node identity checks, primitive counts, top polygon area, source offsets, cache SHA256 and schema URLs/hashes. It saves no collision vertices/planes/meshes. Primary schemas are pinned to Assembly commit `fd14ef3c46135e9422966c6a64cd926fb0bd23fb`: `sources/hlmt.xml:7` (references), `:1175` (nodes); `sources/coll.xml:47` (regions/permutations/BSP), `:97` (planes), `:117` (surfaces), `:135` (edges), `:143` (vertices); sibling `../physics/sources/phmo.xml:273` (rigid bodies), `:391` (shape), `:916` (convex polyhedra), `:994` (packed four-vectors), `:1002` (plane equations).

All five examined **Flat** block sizes are simple single fixed (motion type 5) root convex polyhedra: eight corners, six axis-aligned planes; model root node has identity translation/rotation/scale. Their separate collision BSPs confirm filled rectangular top surfaces (summed polygon area matches rectangle, no invalid/slip top flags):

| Flat block | Object / model / phmo / coll tag IDs | BSP top above origin WU | BSP nominal footprint WU | Conservative phmo core flat footprint WU |
|---|---|---:|---|---|
| 1x1 Flat | 7977 / 7978 / 7981 / 7980 | 0.100000151 | 1 × 1 | about 0.9672 × 0.9672 |
| 2x2 Flat | 8031 / 8032 / 8036 / 8035 | 0.115775906 | 2 × 2 | about 1.9672 × 1.9672 |
| 3x3 Flat | 8082 / 8083 / 8087 / 8086 | 0.100000151 | 3 × 3 | about 2.9672 × 2.9672 |
| 4x4 Flat | 8113 / 8114 / 8117 / 8116 | 0.100000151 | 4 × 4 | about 3.9672 × 3.9672 |
| 5x5 Flat | 8139 / 8140 / 8143 / 8142 | 0.100000151 | 5 × 5 | about 4.9672 × 4.9672 |

The phmo convex radius is 0.0164000001 WU. Each core top plane plus this radius agrees with the separate BSP top within 1.3e-8 WU. Treat the core XY footprint as a conservative flat region (then inset for the player and an allowance), so a checker need not rely on rounded edge contact. **1x1 Flat and 5x5 Flat are the simplest recommended calibration pieces**; 5x5 gives a wide launch/landing deck. This establishes stored geometry, not the engine's contact tolerances or tested jump range. Upright top placement uses origin Z = desired surface Z minus the measured top offset. Rotated/tilted placement must transform the collision shape.

The 2x2 Flat's actual collision top is +0.115775906, different from render top +0.11; its collision bottom is -0.11, also different from render bottom -0.145. Ordinary 1x1 is less clean: phmo nominal top is about +0.5, while its detailed `coll` BSP reaches +0.52 with only 0.64 WU² at the highest layer; do not infer a full planar landing surface or which runtime contact representation wins from its render AABB. The simple Flat baseline avoids this conflict.

## Existing checks do not certify jumps

`forge/map-checks/dump_meshes.py:27` reads Blender polygon vertices via `matrix_basis`; there is no read of `coll`/`phmo` data. `stray_check.py:51` constructs BVHs from those polygons. Prior geometry audits already state that source meshes are not engine collision tags (`forge/maps/wrong-way/research/audit_course_geometry.py:145`). Neither a rendering nor those BVHs establish runtime step-up, collision capsule contacts, front-edge catches or crouched clearance.

`bounds_check.py:209` samples only road/spawn locations. At `:217`, every 5x5 road gets half-extents 2.5/2.5; every other road gets 1/2.5. It adds +0.5 and +clearance above the object origin (`:220`), not recovered platform tops or jump arcs. Thus a generic bounds-check pass can miss an airborne ceiling/kill-zone crossing, and its platform assumptions can be wrong for parkour blocks. Supply actual decoded standing-surface and full airborne-body samples to `bounds_check.evaluate()` (`:229`), retaining required 2-WU boundary margin; `forge/maps/banshee-rings/research/air_bounds.py:17` provides an existing custom air-sampling pattern. Discrete samples still require sufficiently fine/adaptive coverage or conservative swept-segment checks; sparse arc endpoints/apex alone are not proof.

Stable platform physics must be locked and verified: the UI distinguishes Normal/movable, Fixed and Phased (`mjolnir.py:345`). Raw map physics encodes Phased as **3**, although the UI item index is 2 (`mjolnir.py:39`); do not mix them. Whether a particular piece/pose behaves correctly still requires game validation. The placement box enforced by compatibility checks is larger than the safe play area; check trigger volumes, shell ceiling and player/body trajectory, including falls/recovery and spawns. Follow `CLAUDE.md:4` through its final map-build/report requirements, stock object/per-item/budget limits, support rules and versioning.

## Concise rules recommended for rules.md

Required: lock and hash the tested gametype/profile; trace every movement override; use decoded stock geometry in WU; measure edges/top surfaces and leave body/landing allowance; calculate jumps with actual approach speed/height and declared technique; check full swept player clearance and play boundaries; satisfy existing export/support/compatibility/render checks; calibrate representative jumps/chains in the actual game and preserve trial results. Until calibrated, label reachability **predicted/unverified**, never guaranteed.

Good to have: a labelled gap/height/run-up ladder, trajectory/landing overlays in Blender, repeatable camera/video measurements, checkpoints with short retry times, and a difficulty allowance below the repeatable success boundary. Retest the profile after engine, gametype, ability, species, stock-piece or relevant geometry changes. The operational matrix is in `calibration_matrix.json`; its 0.05-WU sweep and 10/10-repeatability criterion are suggested design policies, not engine constants.
