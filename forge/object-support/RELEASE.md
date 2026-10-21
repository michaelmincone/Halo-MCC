# Mjolnir full Forge World palette

The 1.1 development build exposes all 348 recognized stock object types, including
weapons, vehicles, equipment, structures, gadgets, markers and MCC additions.
The generated full library has 348 modeled collections and preserves the original
asset library unchanged. The visual catalog is `../object-catalog/index.html`.

## Use in Blender

1. When ready to install, choose the local extension zip through Blender's
   **Preferences → Get Extensions → Install from Disk**. This task does not install it.
2. Set the add-on's **Library path** to the full `Halo Reach.blend` identified by
   `research/full-library-build.json`. A package built with that library can use
   its bundled Resources copy instead when Library path is empty.
3. For an already-open Blender project, click **Refresh Object Previews** in the
   add-on preferences. This changes preview bindings while keeping placements and
   Forge properties. Newly imported maps use the chosen library directly.
4. Import a genuine Forge World `.mvar`, then use **Add → Forge Object**. All five
   shipped Forge World templates can extend to the complete native palette when
   newly requested objects need missing entries. Original files remain unchanged.
5. Imported legacy weapons with class-zero properties offer **Enable Weapon
   Settings** before editing spare clips. This is explicit and undoable; a no-change
   import/export remains byte exact.
6. Export to a new `.mvar` version. Publication and Xbox testing remain the user's steps.

## Native sources and previews

The read-only cache audit matches every one of the 348 definitions. REA/Ghidra
establishes the complete palette hash and named-location serializer, and numeric
defaults come from the referenced stock object definitions. Native preview
geometry, model variants, child attachments and texture bindings are extracted
locally. Source file hashes and derived evidence are recorded in `research/`.

The static material preview handles native transparency and separates specialized
shield passes from ordinary bodywork. It approximates the game's shading; it does
not run game particles, animation, reactive shields, screen filters or physics.
Invisible-block helper boxes are approximate editor geometry, not authoritative
collision bounds. One compass texture uses the first valid native frame for its
static preview.
The stock Falcon sensor attachment names a child marker absent from its native
render model; the preview uses that child's model origin and records this fallback.

## Verification status

See `research/all-template-verification.json` for all 348 types and typed fields
on all five shipped templates, including position quantization, native prices and
byte-exact unchanged round trips. See `research/preview-workflow-verification.json`
for real Blender library switching, settings preservation, weapon controls,
named-location sentinels, and byte-exact exports after save/reopen.

Completed checks: 1,268 tests on each Python 3.9 and 3.13 (zero failures/errors,
three documented pre-existing skips each); 19 stub and 23 real-provider Blender
checks (no skips); all 348 modeled instances and all five template round trips;
preview refresh and save/reopen preservation; 348 nonblank gallery images and
21 reviewed sheets. Package CRCs and source/library hashes pass, and the packaged
code creates all 348 modeled types in an isolated startup profile.

The browser URL policy prevented a live gallery UI check. Its local images,
embedded catalog and picture sheets were verified. Xbox loading, live
editing/resaving and gameplay behavior remain unverified by this offline work.

## Local files

- Full add-on with models: `release/full-library/mjolnir_forge-1.1.0.zip`
  (175,329,614 bytes; SHA-256
  `57f2f6869723044e6499aeaec183b072af09c840262f0640c6a4c8f4c134bc15`).
- Code-only add-on: `release/code-only/mjolnir_forge-1.1.0.zip`
  (212,201 bytes; SHA-256
  `bcaa234100b1d9ba5b9650723957c87fa9ab52f450e62e2cc9f7bf9b15dfad57`).
- Full object library: `assets/full-v04/Halo Reach.blend`.
- All-object gallery: `../object-catalog/index.html`.
- Complete evidence matrix: `plan.md` and `research/release-verification.json`.

These are local review artifacts. Your real Blender profile was not modified.
