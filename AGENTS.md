# Halo Reach Forge maps

Paths are relative to this workspace. Use these rules for any map built or edited
here. Race tracks also follow [race rules](forge/racetrack_rules.md); parkour maps
follow [parkour rules](forge/parkour/rules.md).

## Essentials

- Never launch MCC or Halo on this Mac. Work offline.
- Preserve originals and earlier versions. Save each map and Blender project with
  a new version number; never overwrite an existing `.mvar` or `.blend`.
- Use stock Forge World pieces at their native scale. Allow at most **651 saved
  objects, including spawns**. For counts beyond ordinary Forge quotas, follow
  the [repeated-object method](forge/object_limit.md#repeated-stock-objects-above-forge-quotas).
  Older tools' 650/255 limits are not engine loading limits.
- Keep all playable surfaces, driving routes and spawns inside the safe zone,
  outside kill zones and below the soft ceiling, with clearance. Placement bounds
  and a passing file audit alone do not establish a safe play area.
- Every piece needs a purpose and support from terrain or another piece. Add
  decoration or floating construction only when requested.
- Fix the build script and regenerate when something is wrong; avoid patching
  individual pieces by index.
- Do not install or publish anything. Keep untested game behavior explicitly
  unverified; record user-reported results with the exact map, version and date.

## Blender and object previews

Use `forge/Mjolnir-Forge-Editor/Addon/` and its own default provider for new builds.
Select the full library named in
`forge/object-support/research/full-library-build.json`, currently
`forge/object-support/assets/full-v04/Halo Reach.blend`. Set the add-on's Library
path or `MJOLNIR_LIBRARY` to that file; a saved Library path takes precedence.
Older shared exporters and vendor copies are not the default for new builds.

All **348 Forge World types** have previews. Before choosing pieces, consult
`forge/object-catalog/catalog-full.json` and visually inspect candidate images.
Paths in that catalog are relative to `forge/object-catalog/`. The searchable
gallery is `forge/object-catalog/index.html`; `sheets.json` indexes its 21 picture
sheets. No regeneration is needed. Check selected pieces use the full library;
use Refresh Object Previews for old projects while preserving their placements.

This palette applies to Forge World; other maps keep their own stock palettes.
Helper meshes and static materials are approximate. See
[usage and verification](forge/object-support/RELEASE.md) for setup, export options
and runtime limitations.

## Build workflow

1. **Plan:** use `forge/maps/<name>/plan.md` to record the site, layout, piece
   counts and play-area clearance before construction.
2. **Build:** use the Blender add-on and a read-only template. Save an editable
   `.blend`, a new `.mvar` and a `course_manifest.json` with each object's role in
   slot order: road, barrier, support, decor, checkpoint or spawn. Floors and
   walkable surfaces count as road.
3. **Check:** decode the exported file and follow `forge/map-checks/README.md`.
   Run stray/support, playable-bounds and Xbox compatibility checks. Fix file and
   geometry errors; explain nonapplicable checks and documented quota-policy
   exceptions. Race checks apply only to race maps.
4. **Inspect:** render the whole map and open every view. Fix visible problems
   and rebuild, even when numerical checks pass.
5. **Report:** link the outputs and renders, summarize checks and explain what
   remains unverified in game. Offline success does not prove Xbox loading,
   editing, resaving or gameplay.
