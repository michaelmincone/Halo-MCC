# Halo 3 and Halo 4 Forge object limits

Research date: October 14, 2026, America/New_York. This answers whether adding Halo 3/4 support to the Blender add-on would allow substantially more independently saved, editable Forge pieces. No game was launched. Installed game files, existing maps, and add-on code were not modified.

The strongest available evidence supports **640 saved placement slots in Halo 3** and **651 in Halo 4**. Those are total placement-table capacities, not allowances for that many construction blocks in addition to spawns, weapons, objectives, and defaults. Extending the Blender add-on to stock Halo 3/4 formats would therefore not supply a route to thousands of independently saved pieces. A separate, modded Halo 3 PC runtime does document such a route.

| Target | Best supported ordinary saved capacity | Evidence and qualification |
| --- | --- | --- |
| Halo 3, retail format and MCC versions 13/14 handled by the reviewed converter | 640 records, including scenario/default placements | Two independent format projects agree. The MCC converter uses the same fixed representation. Missing local engine files prevent direct allocator/save/load confirmation for this installation. |
| Halo 4, retail format and MCC versions 50/51 handled by Halo Map Studio | 651 records, indices 0–650 | Independent retail and MCC implementations use this fixed table. This research does not prove that stock Forge exposes all 651 slots or that a 651-object variant loads and remains editable on Xbox. |
| Reach, comparison only | 651 native records; this add-on defaults to 650 | The earlier local Reach investigation verified the fixed table in native encode, decode, allocation, and save routines. The add-on policy and native capacity differ by one. |

## Halo 3 evidence

[Blam Network's pinned map-variant structure](https://github.com/Blam-Network/blf/blob/4e5974eec45c863b4c6123717e4228c01f2ac850/blf_lib/src/blam/halo3/v12070_08_09_05_2031_halo3_ship/saved_games/scenario_map_variant.rs) declares a `StaticArray<s_variant_object_datum, 640>`, separate scenario/variant counts, and a separate quota table. Its packed reader and writer use those records. The object count is encoded in ten bits; the range of that integer alone does not establish storage for 1,023 objects.

The [MCC-to-360 converter](https://github.com/Blam-Network/blf/blob/4e5974eec45c863b4c6123717e4228c01f2ac850/blf_cli/src/commands/convert_halo3mcc_map_variants.rs) recognizes MCC body versions 13/14, then translates identifiers and other MCC-specific data into version 12. It decodes into the same 640-record representation. Inspection found no expanded-record truncation step: the decoder indexes the declared count into a default 640-element array. This establishes what those implemented MCC formats support; it is not an exhaustive proof against a future unsupported format.

[TagTool's independently declared structure](https://github.com/TheGuardians/TagTool/blob/ce2dc6ac13072b160752af618ea1dc143e2727ac/TagTool/BlamFile/MapVariant.cs) also has 640 object slots. Its generator reserves scenario slots before adding placements. Consequently, the useful capacity is map-dependent: deleted scenario objects must be represented correctly, and their slots cannot simply be assumed freely reusable. The local source snapshot and exact revision are recorded in `public/SOURCE_MANIFEST.json`.

The supplementary ManagedDonkey source also has a 640-record array, but it targets **Halo Online ms23**, not Halo 3 MCC. It is lineage corroboration only. See `halo3/FINDINGS.md` for the explicit boundary and pinned source references.

[Bungie's February 6, 2009 developer update](https://halo.bungie.org/bwu/index.html?item=214) separately describes monetary budget and total-object limits, including Sandbox defaults continuing to affect capacity after deletion. This is primary evidence for the original Xbox 360 behavior; it does not prove that every detail is unchanged in current MCC.

## Halo 4 evidence

[Blam Network's Halo 4 structure](https://github.com/Blam-Network/blf/blob/4e5974eec45c863b4c6123717e4228c01f2ac850/blf_lib/src/blam/halo4/v20810_12_09_22_1647_main/saved_games/scenario_map_variant.rs) declares `k_maximum_variant_objects = 651` and a fixed object array. [Halo Map Studio's separate MCC codec](https://github.com/Sopitive/HaloMapStudio/blob/d6ced849f73663d4aa1500afeb585c102e914eda/crates/hms-app/src/h4/mvar.rs) reads and writes 651 slots for the supported Halo 4 versions. Its current source supports versions 50/51; a version-51 refusal statement in its published prose is stale relative to that source.

[The author's Halo 4 documentation](https://sopitive.github.io/HaloMapStudio/halo4.html) identifies objects past 651 slots as a save problem and reports a saved variant loading in MCC. That demonstrates an offline editing workflow, not a maximum-capacity Xbox test. It also reports that budget and per-item Maximum Allowed can be exceeded by its editor on the tested PC workflow. These are separate constraints: changing a cost or quota does not add another serialized placement.

No source inspected establishes a larger stock Halo 4 table. No local Halo 4 engine or authentic local Halo 4 variant was available for independent native or game-loading verification. Do not present slot 650 as a verified extra usable stock-Forge piece; retain a conservative export policy until a full-capacity load/edit/save/reload test establishes it.

## Modded Halo 3 exception

[Project Reclaimer's current Forge documentation](https://projectreclaimer.dev/forge#frozen-objects) claims up to **5,000 separately saved frozen scenery objects beside the normal 640 placements**. Frozen objects can be edited; grabbing or unfreezing one needs a free ordinary placement. Certain gameplay objects cannot freeze. Each peer recreates frozen scenery locally.

Its [download requirements](https://projectreclaimer.dev/download) require a compatible Windows client, Steam Halo 3, and matching client versions. This is a separate PC runtime, not a demonstrated stock Xbox `.mvar` extension. Its source is private, no public extra-record schema was located, and we have not tested the claimed capacity. A focused semantic extraction of those requirements is saved as `public/reclaimer/download-focused-findings.json`.

The [v0.8.10 release](https://github.com/ProjectReclaimer/project-reclaimer-releases/releases/tag/v0.8.10) documents the original frozen-object feature. [v0.8.15](https://github.com/ProjectReclaimer/project-reclaimer-releases/releases/tag/v0.8.15) documents constrained reuse of deleted default slots and persistence of those deletions, requiring updated peers. The later campaign-canvas feature is distinct from this capacity mechanism.

This is a concrete lead for a future Blender exporter targeting Reclaimer's saved format. It would require access to that format or an import interface and verification of save/edit/reload behavior. It does not establish that an ordinary Xbox can download and interpret the extra records.

## What the local binaries established

The installed MCC root is:

`/Users/michaelmincone/Library/Application Support/CrossOver/Bottles/Steam/drive_c/Program Files (x86)/Steam/steamapps/common/Halo The Master Chief Collection`

Both `halo3/` and `halo4/` exist but are empty. A separate bounded inventory found no named Halo 3/4 engine DLLs or Editing Kit executables in readable home-directory locations, Applications, Users/Shared, or mounted volumes. Some broad home-directory paths were unreadable, so this does not exclude inaccessible files, archives, renamed binaries, unmounted disks, or remote storage. The installed build tag is `2025.08.16.178512.1-Release`.

REA 6.4.0 returned `target_unavailable` for both expected engine DLL paths. Full replies are preserved as `rea/missing-halo3.json` and `rea/missing-halo4.json`. It successfully bound the common MCC executable to Ghidra 12.1.4 and recorded its hash. The REA session was closed; **no native REA whole-program analysis was performed**.

Ghidra independently decompiled two bounded common-core exception-table ranges with `-noanalysis`, a 1 GiB Java heap, and two CPUs:

- `0x14043ce28`–`0x14043da36`: variant-directory enumeration, including Halo 3 and Halo 4 paths.
- `0x14043eaac`–`0x14043ecaf`: file loading and delegation through an interface at vtable offset `+8`.

Both completed successfully. They establish front-end routing, not a game-specific placement cap. The narrow negative result in these two bodies is not an exhaustive statement about their callees or the whole executable. C, assembly, references, script, logs, and hash checks are preserved under `halo3/`.

The original common executable remained unchanged, SHA-256:

`be70d6dcd1a884f10ceb342a7a2dcb35ee0fa43181b66a1d19c3d830e9834691`

The older [Reach investigation](../object-limit-2026-10-14/INVESTIGATION.md) has direct native evidence for Reach only. It must not be described as Halo 3/4 binary evidence.

## Practical consequence for the Blender extension

The game profile must track total saved slots, scenario/default occupancy, each palette quota, monetary budget, and any separate runtime constraints. Counting only visible building blocks is insufficient. Official changes to budgets or available object types are not proof of a larger saved table.

[July 2020 official patch notes](https://support.halowaypoint.com/hc/en-us/articles/360045689232-Halo-The-Master-Chief-Collection-Patch-Notes-7-14-20) announce Forge budget increases and additional objects. [September 2020 notes](https://support.halowaypoint.com/hc/en-us/articles/360049316032-Halo-The-Master-Chief-Collection-Patch-Notes-09-22-2020) fix Halo 3 saving near the total-object limit. The reviewed later notes contain no explicit larger Halo 3/4 serialized table; the bounded source list and snapshots are in `public/PUBLIC_FINDINGS.md`.

For stock MCC/Xbox work, plan around Halo 3's 640-record format and Halo 4's 651-record format, with stricter usable counts where the game, defaults, quotas, or budgets require them. A generic Blender setting such as `max_objects = 5000` cannot make stock loaders understand extra placement records.

For a much larger Halo 3 PC build, Reclaimer is a documented candidate worth evaluating separately. Its author-reported additional persistence is materially different from temporary respawn copies or objects created during gameplay.

Direct native confirmation requires the matching legally installed Halo 3 and Halo 4 engine DLLs and sample variants. The decisive stock-Xbox test would load the full-capacity candidate, edit the final object independently, save, exit, reload, and verify that edit. Neither that test nor a working Halo 3/4 Blender extension was produced by this investigation.

Supporting evidence: `public/PUBLIC_FINDINGS.md`, `public/SOURCE_MANIFEST.json`, `halo3/FINDINGS.md`, `halo3/local-install-inventory.json`, `halo3/ghidra-core/manifest.json`, `halo3/completion-check.json`, and `rea/` lifecycle replies. Each source snapshot records its URL and hash; binary VAs refer only to the matching hashed common executable.
