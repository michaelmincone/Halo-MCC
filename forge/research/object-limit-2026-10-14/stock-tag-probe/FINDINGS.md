# Stock geometry and map-only replenishment probe

**Scope update:** the user requires every extra piece to be independently saved and editable in Forge. Respawn copies are excluded. The proposed test below was cancelled before any probe maps or files were created and is retained only as historical research.

Offline observations on 2026-10-14. No MCC launch, game-file edit, installation,
File Share publication or Xbox test was performed.

`stock_tag_probe.json` records 258 stock Forge World `bloc` variants from the
installed cache, SHA-256
`12270ddad452bce9afaef6000d5a18f2ba7c363ffbe7fcb59375619dbeebfcf4`.
The script reuses the existing bounded `extract_palette_costs.extract` parser.
Its additional reads follow object -> model -> physics model and record their
schema offsets. It does not execute target code.

To reproduce without overwriting evidence:

```sh
python3 forge/research/object-limit-2026-10-14/stock-tag-probe/probe_stock_tags.py
```

An optional `--output NEW_PATH.json` writes a new file and refuses an existing
path. Schema sources are the Assembly project's `ReachMCC/bloc.xml`,
`hlmt.xml` and `phmo.xml`; exact URLs and offsets are in the JSON.

## Findings

- All 26 variants of `structure_blocks` (quota row 70), and all 29 variants
  across the two `structure_bridges` rows (71 and 133), have default rigid-body
  Motion Type 5, Fixed. Block 1x1 is object tag 7958 -> model 7959 -> physics
  model 7975. Its multiplayer metadata has respawn 0, abandonment 0, and flag
  0x2, Phased Physics In Forge. Selecting Normal in a map record has not been
  shown to make such a fixed tag fall; runtime override behavior remains open.
- Movable stock scenery exists. Covenant Crate (row 67, variant 2, tag 7882)
  is object type 10, Crate, with default Motion Type 2, Box, respawn 5 and
  abandonment 60. Space Crate tag 7867 has Box motion, respawn 30 and
  abandonment 30. Several Thorage crates and all three pallet variants have
  Box motion. These are more credible candidates for a falling/replenishing
  experiment than ordinary structural blocks.
- `0x18017b8d0` admits runtime object types 1, 2, 3, 8 and 10 via mask 0x50E,
  provided the multiplayer extension and other conditions pass. Actual
  structural and loose-crate tags are type 10, so type alone does not exclude
  them. Registration does not by itself prove replenishment or retention.
- The native active-engine callback used by `0x18017cddc` permits engine table
  indices 1 and 2 and denies 3 and 4. Table `0x180b95f78` points at globals
  `0x180b934c0`, `0x180b96038`, `0x180b9c9a8`, `0x180b95fb0` for indices 1..4.
  Their vtable +0x318 callbacks are respectively true (`0x180036940`), true,
  false (`0x180036930`), false. The other update guard at TLS+0x48 object+0x11
  equals 4 must not be labeled Forge without identifying that field. The
  distributed-client simulation interpretation is plausible but not proved
  here from this Reach build.

## Native replenishment path

The root's preserved REA C and disassembly give this chain:

1. `0x18017c094` updates live-object status and calls `0x18017bb54` for
   registered source placements.
2. `0x18017cb04` recognizes displacement of at least 0.5 native world units:
   squared distance from saved placement >=0.25, constant at `0x180a8ac90`.
   The status is recorded at +6 in a tracked-live-object record.
3. `0x18017bb54` considers replenishment when the previous object is missing,
   disturbed or used. An unmet minimum can bypass the remaining respawn
   timer; it does not bypass this eligibility check.
4. `0x18017c64c` compares live counts with the folder's minimum and maximum.
   `0x18017c4fc` counts by resolved stock object tag. A shared quota row's
   values can therefore apply separately to different tag variants.
5. `0x18017c75c` searches 715 runtime spawn records and chooses one source
   placement, then `0x18017bcf8` calls `0x18006ed04` once to recreate it.
   The recreation uses the existing map slot's transform, not another saved
   transform. The resulting live datum is tracked independently.

This is a credible route to investigate **more live objects from one map
without a special gametype**. It is not evidence of more than 651 independently
saved Forge placements. Once the latest instance moves away, a replacement
could appear at its saved source while previous instances remain in the world.
Their survival, physics, respawn bookkeeping and replication need execution
evidence. Unmoved fixed geometry does not reach the disturbance route simply
because minimum exceeds placed count.

An explicit nonzero map-record respawn value matters: `0x18017c870` selects the
record's respawn byte, and `0x18017bb54` disables a source request if the returned
spawn time is zero. Default structural metadata has zero spawn time.

## Proposed bounded experiment (not executed)

Use a new tiny versioned map with one eligible dynamic Covenant Crate, a safe
contained landing area, and normal player spawns. Use unmodified stock Slayer
and then compare Forge separately. Set the crate's explicit respawn property
to 5, its physics bits to Normal, and quota row 67 to minimum 3, maximum 3,
placed 1. Place its source more than 0.5 WU above its eventual landing position.
Keep a player near the settled copies and observe for longer than 60 seconds.

Compare a control with minimum 0 and otherwise identical bytes. Establish:

- whether gravity actually moves this stock crate and permits replenishment;
- whether three solid copies coexist and persist, rather than being deleted;
- whether the cap stops additional copies and what abandonment does;
- whether the saved map still has one crate slot and reload regenerates copies;
- whether the same behavior survives File Share download and an Xbox load.

Only after this succeeds should a separate 651-slot fixture be attempted to
verify a live count above 651. Fixed structural pieces, extra saved transforms,
and arbitrary Blender-authored placement of the new copies remain unresolved.
