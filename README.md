# Halo MCC offline Forge build kit

Everything available locally for the build workflow in [AGENTS.md](AGENTS.md):

- The current Mjolnir add-on, its default provider, source, tools and tests.
- `forge/object-support/`: the full 348-type Blender library, original terrain
  library, extracted models/materials/textures, packages and verification evidence.
- `forge/object-catalog/`: the searchable gallery, 348 previews and 21 picture sheets.
- `forge/map-checks/`: decoding, bounds, support/stray checks and inspection renders.
- `forge/tools/`: shared tools, cached safe/kill/ceiling data, native record
  configurations, terrain, palette prices and dimensions.
- Race, parkour and repeated-object instructions, source research and calibration protocol.
- The 76 original/default Halo 3, Halo 4 and Reach `.mvar` files.

## Start

```sh
git clone https://github.com/michaelmincone/Halo-MCC.git
cd Halo-MCC
git lfs pull
python3 forge/tools/check_workspace.py --full
```

[BUILDING.md](forge/BUILDING.md) explains Blender, library selection, portable
commands and the remaining historical gaps. Large `.blend` files and release
ZIPs use Git LFS; use an LFS checkout. No files are installed, no game is launched,
and game loading, live editing/resaving and gameplay remain unverified offline.

Some old race/example/extraction scripts referenced by the existing instructions
were already missing from the source workspace. They are listed explicitly in
[historical-gaps.json](forge/historical-gaps.json); their checks are not waived or
reported as passing. Core offline map-building inputs are included.
