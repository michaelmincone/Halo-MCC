# Reach Forge placements beyond 651: investigation

Started 2026-10-14, America/New_York. This investigation follows the explicit request to pursue more than 650/651 objects, overriding the normal project's 650-object build policy for research. Existing maps, add-on source, and installed game binaries are unchanged. MCC was not launched and nothing was published.

The requested outcome is a Blender-authored Reach Forge map that uploads to MCC File Share and loads on an ordinary Xbox, with more than 651 usable construction objects and without a spawning gametype. The user subsequently clarified that **every extra piece must be independently saved and editable in Forge**. Runtime respawn copies cannot satisfy this requirement. **The requested outcome has not been achieved.**

## Findings so far

The strongest evidence supports a fixed limit of **651 independently saved Forge placements**, not an editable object-count field. The installed PC encoder and decoder agree with independently researched public Reach formats. Enlarging the exporter policy, adding bytes, and putting another object record in the payload do not increase that table.

No viable mechanism meeting the clarified requirement has been found. Minimum-quota respawning can be investigated as a way to create more live instances, but it provides no additional independently saved records and is excluded by the user's clarification. Work on respawn probe maps was stopped before any files or directories were created. Historical respawn evidence below is retained as a rejected avenue, not a pending implementation plan.

## Target and evidence boundary

- Installed target: `haloreach/haloreach.dll` in the user's Steam CrossOver bottle.
- SHA-256: `738dd2d24ea3aea12e1ee9aa4a61094bf116027d42004c35a19e5048608b0894`.
- All function addresses below are preferred virtual addresses for this exact PC binary.
- REA 6.4.0 and Ghidra 12.1.4 were used for 35 new function decompilations, all successful. The new session's target binding is preserved in `rea/1-open_binary.json`; complete replies and provenance are in the six `*-batch.json` files, with readable derived C in `rea/decompiled/`. The full evidence bundle is `rea/evidence-bundle.json`.
- Existing complete REA evidence and derived C live under `publisher/investigation/research/rea-reach/`. New bounded Capstone listings are in `disassembly/`; each listing records the matching binary digest and PE exception-table range.
- These are static PC findings and offline file experiments. They do not establish an Xbox execution result, successful upload, stable physics, or exhaustive absence of possible engine bugs.

## Ordinary file and memory representation

| Question | Evidence | Result |
|---|---|---|
| Is 650 the native format capacity? | Native decode `0x18006d468`, encode `0x18006d04c`; original add-on's editor policy | Native table is 651; the export policy defaults to 650. |
| Can a file field increase the slots? | Decoder's literal `0x28b` loop, then quota rows | No count field controls the object loop. The 9-bit count is the palette-quota count. |
| Can unused payload space hold another usable object? | `probe_file_capacity.py` and `file-capacity-results.json` | A record before quotas changes quota data; a record after quotas becomes unused tail. Neither adds a slot. |
| Do additional BLF chunks merge maps? | Existing REA C `0x18017af00`, new assembly `0x18038def8` | Import stops at the first matching `mvar` chunk and decodes once. |
| Does `_cmp` create a larger map? | Existing C `0x1803c5ca0` / `0x1803c608c` | Compression expands chunk bytes before the same importer. |
| Does a raw/alternate native API use a larger table? | Existing C `0x18006a168` / `0x180069f14` | Native clone/import copies exactly `0xd9bc` bytes. |
| Does failed decoding fall back to a bigger format? | Existing C `0x18017af00` / `0x180069f14` | Metadata/default reset does not change the failure result; normal importer rejects it. |
| Can scenario defaults become extra authored slots? | New listings `0x18006cd14` -> `0x18006daf4` -> `0x18006e0c8` | Default recreation still requests a free slot and stops that placement when the finder returns -1. |
| Are unknown stock/compound tags additional placement channels? | Native palette validation plus public format structure | A stock object may contain multiple meshes or children, but the record supplies one authored transform. No demonstrated channel for arbitrary extra Blender placements was found. |

The decoder initializes each object as a 76-byte (`0x4c`) record; 651 such records occupy native offsets `0x14fc` through `0xd640` exclusive. Quotas follow at `0xd640`. Raising a loop constant alone would overwrite quota storage. An engine modification would need changed allocation/layout and all consuming code; a File Share map does not deliver that modified engine to Xbox.

The native save wrapper `0x18017ac38` clears the `0x7000`-byte payload before invoking the fixed encoder. Extra tail bytes retained by a third-party editor are not an extension mechanism that native saving preserves as placements.

## Reproducible file experiments

Run from the repository root:

```sh
python3 forge/research/object-limit-2026-10-14/probe_file_capacity.py
```

The script reads the original Breakneck sample without writing any map files. It uses the installed export library and the independent fixture decoder. Its experimental placements are parser probes, not an Xbox-ready map design.

| Experiment | Result |
|---|---|
| Export 650 with policy 650 | 650 placements, valid independently checked hash |
| Export 651 with policy 650 | Refused as `E_TOO_MANY` |
| Export 651 with policy 651 | All 651 slots occupied; final index 650; valid independently checked hash |
| Export 652 with policy 1000 | Refused as `E_NO_FREE_SLOT` |
| Insert an extra full object record immediately before quota rows | Both decoders still report 651 placements; 70 quota rows change |
| Append an extra full object record after quota rows | Both decoders still report 651 placements; quotas unchanged; nonzero unused tail |

For the two injected-record cases, the stored length was expanded to the full legal `0x7000`-byte capacity, and hashes were recalculated and independently verified. All original 651 object bit records remain identical. The original sample SHA-256 remains `e514a53b61977a897ac9dbf7225085aa01b5b255f3c8079b5938ef87579bb254`.

The two existing exporter regression cases were also run and passed:

```sh
cd forge/Mjolnir-Forge-Editor/tests/unit
python3 -m unittest \
  test_real_mvar_write.TestAddFiveBlocks.test_the_forty_first_slot_exists_so_only_the_limit_stops_it \
  test_real_mvar_write.TestAddFiveBlocks.test_40_additions_fit_and_41_are_too_many
```

## Minimum-quota runtime lead

**Rejected for the requested outcome:** the user requires independent saved/Forge-editable pieces. The following records the historical investigation; no further respawn prototypes are planned.

Bounded disassembly traces this path:

1. `0x18017c64c` compares live count against a palette entry's minimum and maximum.
2. `0x18017bb54` permits replenishment when the tracked object is absent or eligible as disturbed/used, the maximum allows another, and the timer has elapsed or the minimum is unmet.
3. `0x18017c75c` selects a respawn record, or reuses the supplied record, and calls `0x18017bcf8` once. Its table has 715 runtime records; this is not the map's saved placement table.
4. `0x18017bcf8` calls `0x18006ed04` to create from an existing map slot and records the returned object datum.
5. `0x18017cb04`, consumed by `0x18017c094`, checks disturbance relative to the saved position. A squared distance threshold of 0.25 was observed, equivalent to a distance of 0.5 native units. Exact engine eligibility and cleanup remain to be confirmed.

Thus raising the minimum does not simply materialize additional independent fixed walls. An eligible live object must first be disturbed/used or missing. Gravity-driven duplication is a hypothesis for normal-physics stock objects; even if successful, additional locations would result from physics rather than additional saved object transforms. The 715-record table is not evidence of 715 Forge slots or a maximum number of live copies.

New REA/Ghidra pseudocode confirms the respawn path. Registration checks an engine-object-type mask `0x50e`, multiplayer properties, object flags and a valid saved/scenario index. The engine callback used by `0x18017cddc` returns true for engine indices 1/2 and false for indices 3/4; exact pointer chains and bytes are in `respawn-mode-gate.json`. The early TLS-state value-4 guard is not established as a Forge-mode check and should not be described as one.

The runtime count in `0x18017c4fc` is filtered by resolved object tag, while minimum/maximum come from the shared quota row. Different crate variants sharing one row may therefore be replenished separately. This is an inference about the inspected code, not an observed duplication result.

The read-only `stock-tag-probe/probe_stock_tags.py` extracts 258 `bloc` variants from the installed Forge World cache (`forge_halo.map`, SHA-256 `12270ddad452bce9afaef6000d5a18f2ba7c363ffbe7fcb59375619dbeebfcf4`). The extraction was rerun in the parent session and reproduced `stock_tag_probe.json` exactly. Stock building blocks and bridge-family tags use Fixed rigid-body motion metadata; movable crates and pallets use Box motion. Changing a map physics field has not been proven to make a Fixed building tag fall.

Dynamic Covenant Crate tag 7882 has default respawn 5 and abandonment 60. Another candidate, small space crate tag 7876 (quota 67, variant 1), has dynamic Box motion with both default timers zero. `0x18017c870` uses a saved slot's explicit respawn setting for an authored slot, so a nonzero respawn override needs testing for such a candidate. A zero returned timer can disable that respawn registration. Minimum unmet does not bypass every eligibility or retention check.

The historical proposed experiment was a tiny map with one movable crate, explicit nonzero respawn, quota `(minimum=3, maximum=3, placed=1)`, and a contained landing more than 0.5 native units below the source, compared with minimum-0 and fixed-physics controls. It was cancelled after the user clarified the saved/editable requirement. No probe map was created, uploaded or played; `forge/maps/object-limit-probe` does not exist.

Useful geometry, normal/fixed physics override semantics, automatic positioning and live-instance retention are untested questions for a different outcome. They no longer justify additional work toward this goal.

REA Evidence IDs for the new batches:

- Load/default/quota functions: `ev_bf172c53cb7fd170dcda4cff360240afb771b2427674f509bd2be9c400e774f5`.
- Respawn core: `ev_dd1b3d06d451548f3596eb5885b5191f4dcce91494442cbeaba19fc12a735698`.
- Respawn eligibility: `ev_2c3e3b5591bf5a3e114367f09dcdbc51b3c0eaa865025115a66c60f50064a3b3`.
- Settings/application: `ev_1d462e6be7311fd967eefb19d7ed3023a3e496963a6118c4c23031d59ea48010`.
- Object creation: `ev_03242fd474b5bfd9b5cd7476c32d52800dcc224d1278510d1e91a9608ac3e0c2`.
- Multiplayer/physics setup: `ev_0b466879f8171a12d02081074261691c3dcaf721c25c5611b17c508e9f943e21`.

## Independent primary sources

- [Blam Network Reach codec](https://github.com/Blam-Network/blf/blob/main/blf_lib/src/blam/haloreach/v12065_11_08_24_1738_tu1actual/saved_games/scenario_map_variant.rs): fixed `k_maximum_variant_objects = 651` and a fixed array, encoded/decoded before quotas.
- [DavidJCobb's independently researched Reach decoder](https://github.com/DavidJCobb/ReachVariantEditor/blob/master/html/src/raw/map_variant_mvar.js): fixed `0x28B` object iteration.
- [Halo Map Studio codec](https://github.com/Sopitive/HaloMapStudio/blob/main/crates/hms-app/src/mvar.rs): another 651-slot implementation, citing native Reach editing-kit/360 symbol evidence.
- [Halo Map Studio format documentation](https://sopitive.github.io/HaloMapStudio/maps-and-variants.html#the-651-object-budget): explicitly describes the 651-slot saved-object budget.
- [Mjolnir ForgeBridge](https://github.com/Waffle1434/Mjolnir-Forge-Editor/blob/master/ForgeLib/ForgeBridge.cs): published editor bridge uses `maxObjects = 650`.
- [Official MCC UGC support](https://support.halowaypoint.com/hc/en-us/articles/360049447211-Halo-The-Master-Chief-Collection-Legacy-User-Generated-Content-UGC-Support): platform-neutral File Share storage. File transport compatibility does not expand the receiving engine's map representation.

## Acceptance and next evidence

A successful method must deliver more than 651 independently saved, individually Forge-editable construction pieces on stock Xbox after downloading one ordinary map from File Share, without a spawning gametype or runtime replenishment substitution. No supported mechanism was found in the investigated codecs, load paths, editor allocation or save paths.

The runtime object/physics-pool figures in `forge/object_limit.md` have not been reverified as Xbox limits in this investigation. They cannot be used as proof that a 1,500-piece map is feasible.

The goal is **blocked and unachieved**, following three goal turns with the same fixed saved-placement constraint. A final current-state check confirmed that the installed DLL still matches the analyzed digest, every referenced evidence artifact exists, the ten additional editing/save functions decompiled, and no cancelled respawn prototype or pending owned analysis process remains. An independent read-only audit found no concrete credible next action meeting the saved/editable scope.

This report does not claim that the requested map has been created or that every possible engine bug has been excluded. Continued meaningful investigation requires new concrete evidence of a stock-Xbox compatible additional saved-placement mechanism, an extended-format artifact or a verified alternative loader, or a user-authorized scope change. No change to the user's requirement has been assumed.

## Independent saved identities: follow-up evidence

After the user clarified the requirement, a bounded Ghidra pass inspected the actual binary's Forge editing and save routines without whole-program autoanalysis. Full function assembly, references, inferred C, and a source-hash manifest are in `saved-editability/ghidra/`.

All nine selected functions decompiled successfully; an additional saved-identity propagation function decompiled in `saved-editability/ghidra-linkage/`. Both manifests confirm the imported program's hash matches the current source DLL and that the source executable was neither executed nor modified. The [public-format follow-up](public-format-followup.md) also found no demonstrated extended Reach format or documented placement expansion in the reviewed primary sources.

- Local save `0x180156974` copies/normalizes the active variant through `0x18006c290`, then uses `0x18017ac38` -> `0x18006d04c`. The save normalization examines exactly 651 source records, compacts eligible records, clears runtime datums and recounts quotas. It does not convert every live engine object into an additional saved placement.
- API export `0x1800692cc` reaches the same fixed native representation and encoder.
- Free-slot allocator `0x18006e0c8` scans exactly 651 entries of 76 bytes and returns `-1` when none is free. Forge placement `0x180076608` -> `0x18006e7bc` uses it.
- Forge duplication validation `0x180076834` requires the selected object's saved index to be below 651. Duplication `0x180076984` routes through ordinary placement and that allocator.
- Saved-record setter `0x18006e638` refuses index 651 or greater. It updates one 76-byte record, then calls `0x18006f4f0` to propagate properties to live instances sharing that saved index. Live clones therefore do not acquire independently editable saved identities from their runtime existence.
- Range checks differ between accessor branches; the conclusion does not depend on claiming every native lookup always checks a range. Fixed normalization, encoding, decoding and allocation are the relevant persistence constraints.

No addon limit change was made, because an exporter policy cannot enlarge the receiving Xbox engine's allocation or save loops. The separate 650/651 discrepancy remains a possible one-piece improvement, but it does not meet the user's requested outcome above 651.
