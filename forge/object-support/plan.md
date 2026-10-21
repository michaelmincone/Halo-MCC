# Full Forge World object support

Completed offline on 2026-10-19. Implementation branch:
`codex/full-forge-world` in `forge/Mjolnir-Forge-Editor`.

## Delivered

- Complete 348-type browser, independent of the original 194-leaf model tree.
- Verified native definitions for all 348 types / 145 scenario palette entries.
  Native defaults, class-specific properties, named locations, prices and palette
  extension cover all five shipped Forge World templates. Unknown revisions retain
  their conservative rules. Imported records remain lossless unless edited.
- Full versioned library at `assets/full-v04/Halo Reach.blend`: 348 modeled
  collections, 411 packed images. Missing native geometry, variants, attachments
  and textures were extracted read-only. Markers and volumes use editor models.
- Native 3D orientation codecs, supported by fresh REA/Ghidra and disassembly.
  Legacy Blender pose migration preserves no-op/move-only exported orientations.
- Preview refresh preserves placements and properties. Legacy class-zero weapons
  can explicitly enable native weapon settings. Existing `.blend` files and
  original assets were preserved.
- All 348 objects pictured in `../object-catalog/index.html`, with category/search
  controls, enlarged views and 21 labeled picture sheets.
- Private local packages in `release/code-only/` and `release/full-library/`.
  No actual user-profile installation or publication was performed.

## Evidence and acceptance

| Requirement | Result | Evidence in `research/` |
|---|---|---|
| Every recognized type maps to stock scenario definitions | 348 / 348, 145 entries | `native_palette_audit.json` |
| Missing model extraction and supplementary library | 348 modeled collections; 411 packed images | `full-library-build.json` |
| Browser and actual modeled placement in Blender 5.2.1 | All 348 created, exported and decoded with full-v04 | `blender_support_full_palette.json`, `final-blender-support.log` |
| All five shipped templates | 348 types per template; typed fields, varied 3D poses, budget 21,220 / 30,000, exact no-op bytes | `all-template-verification.json` |
| Preview changes and project persistence | Export objects and whole exported bytes preserved after refresh/save/reopen | `preview-workflow-verification.json` |
| Legacy orientation migration | No-op bytes, moved orientation bits and refreshed export bytes preserved | `legacy-orientation-verification.json` |
| Required source guards, syntax and unit suites | 1,268 tests on each Python 3.9 / 3.13; zero failures/errors, three documented pre-existing skips each; protected files unchanged | `final-required-checks.log` |
| Full Blender regression | 19 stub + 23 real-provider tests; no failures or skips; original fingerprints unchanged | `final-blender-suite.log` |
| Catalog assets | 348 valid nonblank pictures, 21 sheets, embedded data matches; all sheets visually reviewed | `gallery-verification.json` |
| Package and startup | ZIP CRCs pass; code matches source; bundled library hash matches full-v04; isolated startup creates all 348 modeled objects | `release-verification.json`, `package-startup.log` |

The browser URL policy blocked live observation of the local gallery. No browser
workaround was attempted; its local data, pictures and rendered sheets were
verified offline. Interactive browser behavior is not claimed as UI-tested.

## Native research

Fresh REA/Ghidra sessions were closed and evidence bundles retained under
`research/rea-full-palette/` and `research/rea-orientation/`.

- Native palette count/hash: `0x18006c710`, `0x18006bd5c`.
  Native complete count = 145; CRC = `0x8b33e8ac`. Both older shipped count/CRC
  controls reproduce exactly.
- Class-19 named locations: writer `0x18006f7f0`, reader `0x18006fa9c`;
  eight-bit index-plus-one, including `-1` as zero.
- Native orientation: basis `0x1800dbff4`, up encoder `0x180070bd8`,
  orientation writer `0x1800706e8`. Six-face quantization and tie behavior were
  checked against the disassembly, with float32 arithmetic.

See `../Mjolnir-Forge-Editor/docs/mvar/FULL_PALETTE.md` for the format amendment.
The frozen original format specification and API surface remain unchanged.

## Preserved originals and limitations

Original `Addon/Resources/Halo Reach.blend` SHA-256 remains
`a76e1d74d985975aae475de82484af8d6431e613f5fd9d1eed7ee5add211e6ad`.
Full-v04 SHA-256 is
`382d90d5337ec7cd797bab3bddde589929423692fef1dd3c633ce83b09cf57c1`.
Game cache / DLL and schema hashes are recorded by the native audit. No game
binary or cache was patched or executed. MCC was never launched.

Previews approximate static native shading. Animation, particles, reactive shields,
screen filters and physics are not simulated. Invisible-block helper boxes are
approximate editor geometry, not authoritative collision bounds. The compass uses
its first valid native frame; one Falcon child marker is absent in the native
model, so its sensor preview uses the model origin. These fallbacks are recorded.

Xbox loading, live editing/resaving, behavior of added MCC objects, location-name
presentation, and gameplay remain unverified. Encoding stock definitions offline
is not proof of those runtime behaviors. Existing quota/rotation opt-ins remain
explicit. Exporter policy is still 650 objects, distinct from the file's 651 slots.
Nothing was installed in the real Blender profile or published.
