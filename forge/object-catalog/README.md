# Halo Reach Forge object gallery

Open `index.html` in a browser. The gallery works directly from this folder without a server.
It lists all 348 recognized types, with 348 previews rendered from the full Mjolnir library, searchable by
name, category and type ID. Click any picture to enlarge it. Labeled contact sheets are in
`sheets/` and linked at the bottom of the gallery.

The current add-on browser and full library cover all 348 Forge World types. The
library is selected by `../object-support/research/full-library-build.json`,
currently `../object-support/assets/full-v04/Halo Reach.blend`. Use
`catalog-full.json` for the complete machine-readable list and individual image
paths, and `sheets.json` for the 21 labeled picture sheets. Image paths are relative
to this folder. New Codex chats in the Halo-MCC project are directed to these files
by the workspace `AGENTS.md`.

Pictures use the library's materials and textures under neutral preview lighting. Invisible
blocks and spawn/objective markers use their editor helper meshes. Each picture is framed
separately; their displayed sizes are not relative. Dimensions in the detail view come from
the library geometry, in Forge world units. Static shading is approximate;
invisible-block helper boxes are not authoritative collision bounds. All five
shipped Forge World templates have offline 348-type export coverage in the
current add-on, documented in `../object-support/RELEASE.md`. Gameplay, Xbox
loading and live editing/resaving remain unverified.

Generated offline on 2026-10-19. The game was not launched and the asset library was not
modified. Native additional geometry and textures were extracted read-only from
the local game cache; the underlying Halo assets belong to their original owners.

To regenerate:

```sh
python3 forge/object-catalog/build_gallery.py --full
```

This rebuilds the gallery and sheets from existing pictures. No rendering is needed
to use the catalog. To update native previews after a library change, use the
resumable, small-batch `forge/object-support/refresh_new_previews.py`; avoid one
large Blender render process on this Mac. The full gallery uses `full-textured/`.
`images/` and `textured/` retain earlier previews.
