# Halo 3 local-engine evidence audit

Observed 2026-10-14. Read-only research. No game, engine, or downloaded code was executed; no installed binary, map, or add-on source was modified. The applicable ancestor `CLAUDE.md` files were read.

## Outcome

**Halo 3's engine is absent from the declared local installation, so local REA/Ghidra evidence cannot establish this installation's Halo 3 allocator, save codec, or runtime pool.** The `halo3/` directory exists and has zero recursive entries. `halo3/halo3.dll`, map cache files, and built-in/hopper map variants are missing. This is an evidence limitation, not evidence for a higher or lower placement cap.

The separate public-format investigation supplies direct Halo 3 format evidence. This subtask does not substitute Halo Online or Reach code for Halo 3 MCC code.

## Reproducible local evidence

- [probe_local_install.py](probe_local_install.py) inventories explicit target paths and hashes existing support files without changing them.
- [local-install-inventory.json](local-install-inventory.json) records the empty directory and missing expected files.
- The installed build tag reads `2025.08.16.178512.1-Release` / `Release`.
- The common front end `MCC/Binaries/Win64/MCC-Win64-Shipping.exe` exists, SHA-256 `be70d6dcd1a884f10ceb342a7a2dcb35ee0fa43181b66a1d19c3d830e9834691`. Its current hash matches the earlier read-only PE inventory used by the scanner/disassembler.
- `Data/BuiltInData/Halo3.json` exists and maps names/IDs/game categories; it declares no saved-placement count. `Halo3Controller.json` and common settings are present too. These common/front-end data do not imply the game engine depot is installed.
- An additional bounded filename scan of CrossOver Bottles and Local_Documents found no alternate `halo3*.dll`, `halo3*.exe`, or Halo 3 cache files. The separate installation-inventory worker owns any broader alternate-installation audit.

Reproduce the local probe from the workspace root:

```sh
publisher/investigation/.tools/python/bin/python forge/research/object-limit-h3-h4-2026-10-14/halo3/probe_local_install.py
```

## Common MCC core: routing, not a cap

Using the existing Python `pefile`/Capstone tooling, three exception-directory extents were disassembled from the installed common front end. Full assembly is in `mcc-core-disassembly/`; scan candidates are in `mcc-core-candidate-xrefs.json`. The candidate scanner also includes its stock authentication references; only the following game/variant rows are relevant here.

| Function extent (preferred VA, end exclusive) | Confirmed assembly anchor | What it establishes |
| --- | --- | --- |
| `0x14034766c`–`0x140347a8b` | `0x140347989` references string `Halo3Forge` at `0x14329d7a0` | Front-end mode/feature naming, not placement capacity. |
| `0x14043ce28`–`0x14043da36` | `0x14043cfd2` loads `halo3\map_variants` at `0x1432ac040`; next sequence loads `*.mvar` and invokes file enumeration | The common file browser routes engine index 2 to the Halo 3 map-variant directory; index 3 routes to Halo 4. It does not define an object-record array. |
| `0x14043eaac`–`0x14043ecaf` | `0x14043ebb3` loads `CreateMapVariantFromFile` at `0x1432abf30`; `0x14043ec63` invokes `call qword ptr [rax+8]` after loading an input interface's vtable | Common map-variant loading goes through an interface. This extent neither proves a Halo 3-specific object-array width nor resolves its missing game-engine implementation. |

At the parent investigator's request, Ghidra 12.1.4 imported the **common front end** and decompiled only the final two extents with `-noanalysis`, a 1 GiB JVM heap, and two CPUs. [run-core-targeted.sh](run-core-targeted.sh) reproduces this operation. [ghidra-core/manifest.json](ghidra-core/manifest.json) confirms the source/import SHA-256 match, both successful decompilations, the 1,073,741,824-byte heap ceiling, two available processors, and 761/140 instructions respectively. C, Ghidra assembly, reference lists, and headless logs are preserved.

The C confirms the engine-index path selection and indirect call through the input interface. Neither selected extent contains a 640/650/651-record allocator, object-record encode/decode loop, or saved-placement count comparison. The first operates on linked lists of variant/front-end entries, and the second opens/transforms a file and delegates it through an interface. This is a statement about those **two reviewed bodies**, not an exhaustive statement about all transitive callees. The source binary was not launched or changed, and whole-program autoanalysis was disabled. There are no Halo 3 **game-engine** VA, assembly, or C artifacts in this directory, and the report must not claim otherwise.

## Supplementary Halo Online source cross-check

Pinned public repository: [twist84/ManagedDonkey at `65eb5b2aafac16ebb33f213c1286eda5fa1e4446`](https://github.com/twist84/ManagedDonkey/tree/65eb5b2aafac16ebb33f213c1286eda5fa1e4446). Source files and SHA-256 hashes are preserved in [manageddonkey-source-manifest.json](manageddonkey-source-manifest.json).

- The repository [README](https://github.com/twist84/ManagedDonkey/blob/65eb5b2aafac16ebb33f213c1286eda5fa1e4446/README.md) explicitly targets **Halo Online ms23 1.106708**, rather than Halo 3 MCC.
- [`scenario_map_variant.hpp`](https://github.com/twist84/ManagedDonkey/blob/65eb5b2aafac16ebb33f213c1286eda5fa1e4446/game/source/saved_games/scenario_map_variant.hpp#L164-L181) contains distinct scenario/variant counts and `c_static_array<s_variant_object_datum, 640> m_variant_objects`, followed by quota storage. It asserts a native object record size of `0x54` and total native map-variant size of `0xE090`. These layouts are for that source's target and cannot be applied to the installed 64-bit MCC game engines.
- [`scenario_map_variant.cpp`](https://github.com/twist84/ManagedDonkey/blob/65eb5b2aafac16ebb33f213c1286eda5fa1e4446/game/source/saved_games/scenario_map_variant.cpp#L63-L100) calls the ms23 binary's decoder at `0x00582550`. A **commented, nonexecuting reconstruction** reads the two object counts as 10-bit values and walks 640 records. The encoder is likewise a thunk to `0x005829A0`. This repository does not supply the reviewed allocator/encoder implementation needed to prove Halo 3 MCC editability.
- Caution: the commented reconstruction uses `VALID_INDEX(m_number_of_variant_objects, 640)`. It must not be promoted to an exact inclusive/exclusive count-validation claim without inspecting that target binary. Array width and the exact maximum accepted count are related but distinct evidence.

This independently corroborates the **640-record engine lineage**, while the stronger game-specific evidence should come from the separate Halo 3 BLF source/converter review and original Bungie technical discussion. It provides no evidence that stock Halo 3 MCC can save more than 650 editable placements, or that a runtime pool size can expand a Forge variant's saved record array.

## Unresolved and required for direct binary confirmation

1. A legally installed Halo 3 MCC engine DLL and matching map/variant files, with their source hashes, would permit the requested direct static allocator + decoder + encoder examination.
2. The current Xbox MCC build's binary/save behavior is a separate compatibility target from a PC DLL or a historical retail 360 format. No Xbox or game-loading experiment was performed.
3. Runtime objects, effects, attached children, physics entities, and Forge placement records must not be conflated. This subtask did not establish a Halo 3 MCC runtime object pool limit.
