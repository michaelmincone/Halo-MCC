# Shared map tools

For new full-palette Blender builds, follow the workspace `AGENTS.md` and use
`../Mjolnir-Forge-Editor/Addon/` with the 348-model library selected by
`../object-support/research/full-library-build.json`. The shared `mjolnir_forge`
provider and `forge_export.py` described below are historical tools; they have not
been upgraded to the new 348-type creation/property/orientation implementation.
Do not inject that older provider into the current add-on. The complete picture
catalog is `../object-catalog/catalog-full.json` and `../object-catalog/index.html`.

Rebuilt on 2026-10-16 after `forge/maps/wrong-way/` (and the other older map folders) went missing. They held the
tilt-capable add-on copy, the Python environment, `palette_costs.json`, the Xbox audit and `xbox-logo/research/piece_boxes.json`
that every builder and check used. Everything here replaces those and was checked against the Statue of Liberty v01
export, the newest map whose evidence survived.

| File | Replaces | What it is | How it was checked |
|---|---|---|---|
| `mjolnir_forge/mvarlib/` | `maps/wrong-way/vendor/mjolnir_forge/mvarlib` | The add-on's `mvarlib` with tilted pieces enabled: `codecs.tilt_reference`, `up_encode`, `orientation_encode`; `edit.py` writes them. | The orientation rule was recovered from 1,284 tilted slots in STATUE OF LIBERTY v01 and GEORGE FLOYD v01/v02 (decoded forward matches exactly). Re-encoding the statue's 616 authored poses gives the same raw bits as its file. |
| `forge_export.py` | the export half of every `build_*.py` | `export(pieces, dest, stem, title, description)`: pieces (world poses) to a new `.mvar` on the shipped Paradiso template, with `course_manifest_vNN.json`, `build_summary_vNN.json`, `pieces_vNN.json`; runs `bounds_check` first; refuses to overwrite. | Re-exporting the statue's `pieces_v01.json` decodes to 616 records identical to its `objects.json`. |
| `python` | `maps/wrong-way/.venv/bin/python` | Python 3.13 with numpy (Blender's bundled interpreter). | |
| `palette_costs.json` (`make_palette_costs.py`) | `maps/wrong-way/research/palette_costs.json` | Price and shared maximum per palette entry, same row keys. Made from `forge/forge_world_objects.md`, which was generated from the old file. | Matches the statue's Xbox audit for every entry it used. |
| `piece_boxes.json` (`make_piece_boxes.py`) | `maps/xbox-logo/research/piece_boxes.json` | Local min/max box of all 191 Forge World pieces with a model in `Halo Reach.blend`. | Identical to the boxes in the statue's `stock_meshes.json` for its 29 types. |
| `xbox_compatibility_audit.py` | `maps/wrong-way/research/xbox_compatibility_audit.py` | Static audit with the old check names. Writes `<prefix>.json/.md` into `--out-dir` (default: current folder). The Race check runs only with `--race`. Classes, physics and spawn flags are compared with Bungie's own records in the installed Forge World variants, so teleporters that copy Bungie's records pass. | Passes the statue v01 (old audit: 13/15, its 2 failures were the teleporters it did not know). Fixed the same day with the shipped Paradiso as control: `--race` counts Hill Markers labelled `race_flag` (1..N) and Initial Spawns labelled `race_spawn`; a shaped class-0 object passes the scaling check when its record is one Bungie ships; structure physics may be any value Bungie ships for that piece. Paradiso then still fails only the checks that describe our export format (it keeps its `_fsm` block and team-coloured pieces). |

`forge/map-checks/decode.py` imports the current add-on provider from `Mjolnir-Forge-Editor/Addon/`. The legacy exporter and static audit retain their historical provider and policy checks. See [portable setup](../BUILDING.md).

Run builders with `forge/tools/python`. Example:

```sh
T="$PWD/forge/tools"
python3 -I ../../map-checks/decode.py MAP.mvar objects.json
python3 $T/xbox_compatibility_audit.py --variant MAP.mvar --manifest course_manifest_v01.json --report-prefix xbox_audit
```

For repeated-object builds beyond ordinary Forge quotas, follow the [over-quota recipe](../object_limit.md#repeated-stock-objects-above-forge-quotas) and adapt [`maps/grid-cube/scripts/build.py`](../maps/grid-cube/scripts/build.py). The user reported its 648-Grid, 651-slot map working on 2026-10-18; its counter is 136, so a multiple of 256 is unnecessary. `forge_export.py` and the standard audit still enforce ordinary quotas/650 policy; retain expected policy failures separately from file-integrity checks.

Not rebuilt: the WRONG WAY drivability sweep (`research/v04_smoothness`), the corkscrew `plot_inbounds.py` and terrain grids,
and each lost map's own scripts. Tilted Grids are included in the user-reported working cube; other tilted pieces remain unverified unless separately tested.
