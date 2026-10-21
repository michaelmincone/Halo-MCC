# Building from this repository

Clone the private repository with Git LFS enabled, then run:

```sh
git lfs pull
python3 forge/tools/check_workspace.py --full
```

Blender and Python are external applications. This repository contains the
project's source, models, textures, terrain, stock templates, catalog and check
data. No Halo installation is needed for the ordinary offline Forge World
build/export/check workflow. Nothing here launches or installs MCC.

Read [AGENTS.md](../AGENTS.md) before building. The current add-on is a complete
source snapshot at `forge/Mjolnir-Forge-Editor/Addon/`, including its pure Python
default provider. Its original Git commit is recorded in `build-kit.json`.
Use the full library at
`forge/object-support/assets/full-v04/Halo Reach.blend`, as selected by
`object-support/research/full-library-build.json`. Blender's saved Library path
takes precedence over `MJOLNIR_LIBRARY`; set it to this checkout's full library
or clear it before using the environment override.

The original add-on library is also included. Its terrain is used for support
checks; object mesh dumps use the full 348-type library. Libraries and packaged
ZIPs are stored in Git LFS. GitHub's source ZIP alone may contain LFS pointers;
use an LFS checkout for building.

## Tools and commands

Set `BLENDER` to your Blender executable, or put `blender` on PATH. The optional
`forge/tools/python` wrapper uses `FORGE_PYTHON` when set, otherwise Blender's
bundled interpreter on macOS or `python3`. Core decoding, bounds and static Xbox
audits use Python's standard library. Contact-sheet/gallery regeneration needs
Pillow; NumPy is used by some research tools and is bundled with Blender.
Using the existing gallery requires neither package.

Create your plan and versioned outputs under `forge/maps/<name>/`. Use a
read-only template from `forge/stock-mvars/haloreach/map_variants/`. New builds
must use the current add-on, rather than the historical shared exporter.

```sh
python3 -I forge/map-checks/decode.py NEW.mvar objects.json
python3 forge/map-checks/bounds_check.py objects.json course_manifest.json bounds.json --margin 2
"$BLENDER" -b --factory-startup --python-exit-code 1 --python forge/map-checks/dump_meshes.py -- objects.json meshes.json
"$BLENDER" -b --factory-startup --python-exit-code 1 --python forge/map-checks/stray_check.py -- objects.json course_manifest.json meshes.json stray.json
python3 forge/tools/xbox_compatibility_audit.py --variant NEW.mvar --manifest course_manifest.json --report-prefix xbox
```

The bounds checker defaults to the checked-in, exact snapshot of Forge World's
safe zones, all 31 kill volumes and its soft ceiling. `--cache` still accepts
the supported original `forge_halo.map` for an independent read-only comparison.
The static Xbox audit uses archived native record configurations derived from
the installed shipped variants; this does not add alternate `.mvar` maps to
the repository. Historical 650/quota policy checks remain explicit and do not
replace the 651-slot policy in AGENTS.md.

Run the render/inspection steps in [map-checks/README.md](map-checks/README.md)
and open every produced view. Offline success does not establish Xbox loading,
live editing, resaving, driving, jumping or gameplay behavior.

## Historical gaps

Some instructions already referenced files that had been lost from the local
workspace before this upload. They are listed in `historical-gaps.json`:
the old WRONG WAY drivability sweep, Grid cube example generator and cannon
cache-inspection helper. Their absence must not be treated as a passing check.

The ordinary build uses the included compiled full library, extracted assets,
terrain, bounds and record snapshots, so it does not need the cannon extraction
helper. Re-extracting assets from original game caches is optional research and
still needs that historical helper and a separately supplied game installation.
Race rules still require their drivability checks; an unavailable historical
race sweep must be restored or replaced and verified before declaring a race
fully checked. The repeated-object method remains documented in
[object_limit.md](object_limit.md), including the exact dated user observation.
