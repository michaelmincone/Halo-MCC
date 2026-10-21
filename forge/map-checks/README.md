# Map checks

Offline, read-only checks for Halo Reach map variants (`.mvar`). Nothing here launches MCC or changes a map. The process these checks belong to is in [../../AGENTS.md](../../AGENTS.md).

See [portable setup](../BUILDING.md) first. Run from the checkout root with reports in a scratch folder, always on the exported `.mvar` (never on the Blender scene):

```sh
B=/Applications/Blender.app/Contents/MacOS/Blender
T="$PWD/forge/map-checks"  # run from the repository root
python3 -I $T/decode.py MAP.mvar objects.json
python3 $T/bounds_check.py objects.json course_manifest.json bounds_report.json --margin 2
$B -b --factory-startup --python-exit-code 1 --python $T/dump_meshes.py -- objects.json stock_meshes.json
$B -b --factory-startup --python-exit-code 1 --python $T/stray_check.py -- objects.json course_manifest.json stock_meshes.json stray_report.json
$B -b --factory-startup --python $T/stray_render.py -- objects.json course_manifest.json stock_meshes.json stray_report.json $PWD/MAP
```

- `decode.py` turns the map into poses (`objects.json`), using the current add-on provider in `../Mjolnir-Forge-Editor/Addon/`.
- `dump_meshes.py` writes the stock meshes for every piece type in the map (`stock_meshes.json`). The drivability tools in `../maps/wrong-way/research/v04_smoothness/` need this file in the folder they run from.
- `stray_check.py` needs the build's `course_manifest.json` with one entry per slot carrying `role` (road, barrier, support, decor, checkpoint, spawn) and `section`. It fails the build for:
  - **unsupported**: support pieces whose top touches no deck underside.
  - **floating**: support or decor resting on neither terrain nor a road or barrier.
  - **duplicates**: two pieces of the same type stacked inside each other.
  - **clipping**: support or decor passing through a road or barrier.
  - **barrier_gap**: a barrier more than 0.10 WU from any road.
  - **barrier_pile**: barriers from two sections, or non-neighbouring barriers, overlapping.

  It also warns when decks from different parts of the route overlap.
- `bounds_check.py` (plain `python3`, no Blender) reads Forge World's play-area limits from the checked-in exact `../tools/forge_world_bounds.json` snapshot (or a supported original `forge_halo.map` passed with `--cache`) and checks every place a player can be on the map. It samples points 0.5 WU and 2.5 WU above every road piece, and above every spawn and vehicle. Each point must be:
  - inside the soft safe zone, where leaving starts the "return to the battlefield" countdown;
  - inside the acceleration soft ceiling, an invisible shell that pushes players back (over the play area it sits 36–75 WU high);
  - outside all 31 kill zones.
  Use `--margin 2` to require 2 WU of room from every limit. On Bungie's five shipped Forge World variants it passes for all 1,240 spawn points, and it passes on WRONG WAY v06; CORKSCREW v01 fails. `../maps/corkscrew/research/plot_inbounds.py` draws the limits on a map.
- `inspect_render.py` renders the whole map for a visual inspection: one framed view per section and a driver's-eye view every 25 WU around the lap, plus optional fixed cameras from a `views.json`. `contact_sheets.py` tiles the driver views six to a page.
- `stray_render.py` renders an angled overview and a top view. Failed pieces are red, barrier problems orange and overlapping decks yellow. Extra views can be added as `name:x,y,z:tx,ty,tz:ortho`.

Optional manifest fields:
- On barriers, `chain` and `chain_index` name the line each barrier belongs to. Neighbours in one line may touch.
- On road pieces, `route_index` gives driving order, used for the deck-overlap warning, when it differs from slot order.
- On joined wall panels, `surface_group` and `surface_normal_axis` (0/1/2 for native X/Y/Z) describe a two-dimensional shell. The declared normal must be the native mesh's thinnest axis. Panels become neighbours only with actual mesh contact within 0.05 WU, centres within 3.8 WU and plane angles no more than 60 degrees. The complete contact component must meet a floor or terrain; non-local intersections still fail. Declared shells do not fall back to slot-order neighbours. This opt-in mode supports the gyroid's integrated curved walls; ordinary barrier lines retain their existing rules.

`python3 forge/map-checks/test_surface_joints.py` runs eight focused tests of the real shell predicates, including rejected crossings, disconnected panels, invalid axes and the original ordered-barrier behavior. GYROID v01 and MENGER v04 provide decoded-mesh integration controls.

`python3 forge/map-checks/test_duplicate_check.py` runs five duplicate-proximity controls. Duplicate centres must be within 35% along **every native dimension**, and the meshes must intersect with almost identical orientations. The older longest-dimension radius incorrectly rejected the legitimate joints of short, wide road strips; HOT WHEELS LOOP exposed this with 104 false positives. Real coincident and slightly displaced copies remain rejected.

Baselines:
- `WrongWay_smooth_v04.mvar` fails: 21 unsupported structures, 22 duplicates, 4 clipping pieces, 3 barrier gaps, 54 barrier pile-ups and 2 deck overlaps.
- `WrongWay_smooth_v05.mvar` passes with all zeros.

Fixed 2026-10-13: the terrain is now loaded at its real 0.328 scale. Earlier runs used it unscaled, which affected only the floating and barrier-gap checks.
