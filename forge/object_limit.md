# Halo Reach Forge object limit

Checked 2026-10-14 against the installed `haloreach/haloreach.dll` (SHA-256 `738dd2d2…0b894`, the same build as `publisher/investigation`) and `MCC-Win64-Shipping.exe`. Static reading only: the earlier REA/Ghidra decompilation in `publisher/investigation/research/rea-reach/decompiled/` plus targeted disassembly of single functions. No whole-program analysis, and the game was not launched. Addresses are preferred virtual addresses for this build.

**2026-10-18 observation:** the user reports that [GRID CUBE XXL v01](maps/grid-cube/output/Report_v01.md) works, following this chat's Xbox compatibility discussion. That exact file contains **648 Grids plus three spawn objects (651 slots)**, quota row `0 / 136 / 136`, and an expanded z-coordinate encoding range. The agent did not run the game; console/build, test procedure and edit/resave results were not specified. This supersedes the earlier 255-per-category conclusion and the blanket untested status of this map.

## Answer

The limit is built into the map format, and it is **651 objects**, not 650.

- **The file.** The map decoder `0x18006d468` reads exactly 651 object records (loop count `0x28b`). There is no object-count field: each of the 651 slots is one "present" bit, followed by the object if the bit is set. A 652nd object has nowhere to go. The encoder `0x18006d04c` writes the same 651. The one real 343 map we have (Breakneck "Headstrong", `real-mvar-samples/`) decodes as 651 slots, 610 used.
- **In memory.** The game keeps the map as 651 fixed 76-byte records (offsets `0x14fc` to `0xd640`, exclusive). Forge duplication validation and the saved-record setter reject index 651 or greater. Range checks differ between accessor branches; the fixed allocator and save/codec loops establish the persistence limit.
- **In Forge.** Placing an object goes through `0x18006e7bc`. It first checks the palette entry's own maximum, then asks `0x18006e0c8` for the first free slot out of 651, and fails when all 651 are used. That is the only routine that claims a new slot. Its only direct caller is Forge's place-object routine for a player (`0x180076608`). The other caller of the slot finder, `0x18006cd14`, rebuilds a variant from the map's default objects.
- **On load.** `0x18006c948` checks the version, map id and palette, and deletes objects whose palette entry or variant is invalid. It has no object-count check beyond the 651 slots.
- **Per palette entry.** The quota table has at most 256 rows of three 8-bit values. Its counters stop at 255, but the separate object array can contain more placements referencing the same row: Request4 has 256 walls with count 0; the working Grid cube has 648 Grids with count 136. All categories together still share 651 saved slots.
- **File size is not the limit.** The payload holds 0x7000 bytes. Headstrong's 610 objects use 106,487 bits (about 13 KB), so 651 objects fit easily.
- **MCC itself.** The MCC executable has no object-table code. Its few 650/651 constants are unrelated lookup tables. All map parsing happens in `haloreach.dll`.

Our former "650 at most" rule comes from the original Mjolnir add-on (`forge.py`: `maxObjectCount = 650`). The user now reports a working externally authored 651-slot map. Adding further objects through Forge's menus and preserving the result through edits/resaving were not separately confirmed.

## Repeated stock objects above Forge quotas

Use [the working Grid cube generator](maps/grid-cube/scripts/build.py) as the implementation reference when a design needs many copies of one stock piece. This is direct saved-object authoring, not minimum-quota or gametype spawning.

1. Start from a valid Forge World template and write one occupied slot per actual placement. Resolve each stock `(folder, item)` ID from the palette tables and preserve the correct cached class, physics and type-specific extras. Keep **all placements, starts and respawns combined at or below 651**; reserve spawn slots before filling the map.
2. Count placements **by shared palette/quota row**, including other item variants using that row. For a row with actual count `N`, reproduce the working builder's `(minimum, maximum, placed) = (0, N & 255, N & 255)`. **A zero remainder or a multiple of 256 is not required:** 648 Grids worked with remainder 136. Keep real object counts in the manifest.
3. Reproduce its budget bookkeeping: `saved_spent = sum(price[q] * (actual_count[q] & 255))`, retaining the native maximum budget. Report the full nominal cost separately. Keep stock placement bounds by default; if an explicitly out-of-bounds design needs larger coordinate encoding bounds, update those bounds and their position bit widths together, as the generator does. This does not move safe/kill zones or the soft ceiling.
4. Serialize through `MapVariant`, refreshing the header/fixed fields, lengths and payload hash and dropping stale `_fsm` data. Strictly reparse the output, independently verify its slots/poses/quotas, check geometry and starts, and retain the stock audit's expected policy failures. The normal shared exporter still rejects these counts; adapt the map-local generator rather than reducing the design to an ordinary quota.

User confirmation covers the exact Grid cube file and its combination of features. Other object types/counts, runtime rendering/physics limits and edit/resave behavior need their own observations. This method permits more copies **within 651 saved objects**, not an unlimited total.

## Legitimate ways to get more onto a map

1. **Use slot 651 and exceed category authoring quotas when needed.** The working Grid cube demonstrates both in an externally authored map; follow the repeated-object method above.
2. **Make each slot cover more.** Use the largest pieces that do the job and build on Forge World's own terrain and structures (they use no slots). For ordinary Forge authoring, spread pieces across categories to stay within its menu quotas; those quotas are not the saved-placement capacity.
3. **Spawn extra objects at runtime from a custom gametype.** A Reach gametype script can create objects while the game runs (`place_at_me` in ReachVariantTool). Those objects don't go through Forge's place-object routine, so they take no map slot. Bungie's own stock Race spawns a Banshee for each player this way, on maps that place none. The map stays an ordinary 651-slot Forge file; the extra objects come from a second file, a game variant made with ReachVariantTool. No game file is changed and no check is bypassed. The limits:
   - The objects exist only while that gametype is being played. They are never saved into the map, so they can't be edited in Forge.
   - Each one is placed relative to an object already on the map, at most 12.7 Forge units away per step, and takes that object's facing. Exact placement needs an attach-and-detach trick.
   - The game's own caps on live objects still apply (next section).
   - No script-edited gametype has been tested on Xbox in this project yet.

**No supported file-only path was found** for more than 651 independently saved placements. A serialized quota field remains eight bits, but its wrapped count does not limit the number of saved records referencing that row. Enlarging the object table itself would require corresponding engine changes, which a File Share map does not install on Xbox. This is a conclusion about inspected formats and paths, not an exhaustive proof about every possible engine bug.

For the user's requirement that every extra piece be independently saved and editable, runtime/gametype spawning and quota-driven respawn copies do not count as solutions. The [expanded investigation](research/object-limit-2026-10-14/INVESTIGATION.md) records byte-injection experiments, native load/save/editor evidence, the rejected respawn avenue, and the unfulfilled Xbox verification requirements.

## How far runtime spawning can go

Checked the same day, same DLL, by reading the game's fixed-size pools (every call to the pool creator `0x180012fcc`, with its name, count and entry size) and the gametype script's create-object action.

**The script side doesn't stop it.**
- The script's create-object action (opcode 2 in the action switch `0x1800f2dac`) is `0x1801f12e0`. It builds a placement, sets the label if one is given, and calls the engine's object creator `0x18046d6e0`. It never touches the 651-slot map table.
- Scripts have a 512-entry table for per-object script data (`megalo_objects`, 148 bytes each). The create action doesn't use it. An entry is only claimed when the script stores a variable on a particular object (`0x18018eaf4`, which allocates lazily). So spawned pieces shouldn't carry per-object variables.
- A script holds at most 1024 actions (ReachVariantTool's limits), but a "for each object with label" loop repeats its actions once per object, so one create action can run hundreds of times.
- Pieces spawned without the `never_garbage_collect` flag can be cleaned up by the game. The flag sets a bit on the object (`+0x143`).

**The engine's own pools set the ceiling.**

| Pool | Size | What it means |
|---|---:|---|
| `object` | 2048 | Every live object at once: map pieces, spawned pieces, players, weapons, vehicles, grenades, projectiles. A hard cap. |
| `objects` memory | 0x226000 bytes (about 2.15 MB) | Shared memory for all object data. A crate-type object's base record is 432 bytes and scenery is 484, before nodes and physics, so this pool is probably sized for about the same 2048 (inferred, not measured). |
| `havok components` | 1500 | Physics for solid objects. Created per object by `0x18017d5b0` (called from `0x18009a670`). |
| Physics world | about 1700 bodies | When the physics count reaches 1700 (`0x18009ade4`) or the 1500 pool is full, the game runs its object-cleanup routine (`0x18009c398` calling `0x1801cb880` at rising levels) to free some. |
| `sim. object glue` | 2048 | Network tracking, one per object. Matches the object cap. |

So the most a running game can hold is about **1,500 solid objects**, shared with players, weapons and vehicles, and never more than 2,048 objects of any kind. On top of the 651 placed pieces, that leaves room for roughly 700 to 800 spawned solid pieces in a normal game, about 1,400 to 1,450 solid pieces in total. What the game does if cleanup can't free anything (all pieces protected from cleanup) wasn't proven from the code; it could drop physics, delete pieces or stall. The network side for online play (how many objects a host can keep in sync) also wasn't measured. Both need a test in the game.

"Thousands" of solid pieces at once is beyond what the game's pools allow, so it isn't reachable without modding the game. About twice today's 650 is the realistic ceiling, unverified until tested.
