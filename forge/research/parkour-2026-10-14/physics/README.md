# Stock Reach MCC movement evidence

`stock-forge-world-physics.json` records bounded, read-only extraction of the
installed `haloreach/maps/forge_halo.map`. It includes exact tag names, tag IDs,
file offsets, relative field offsets, little-endian bytes and decoded values.
Nothing launched MCC or wrote to the game installation.

## Identity and reproduction

- Cache build: `Jun 21 2023 15:35:31` (Assembly identifies Reach MCC Update 13).
- Cache size: `332328960` bytes.
- SHA-256: `12270ddad452bce9afaef6000d5a18f2ba7c363ffbe7fcb59375619dbeebfcf4`.
- Scenario type: `1` = multiplayer; Forge sandbox coordinate origin `(0,0,0)`.
- Assembly schema commit: `fd14ef3c46135e9422966c6a64cd926fb0bd23fb`.
- TagTool semantic/unit reference commit: `ce2dc6ac13072b160752af618ea1dc143e2727ac`.
- Every downloaded source has a pinned URL and SHA-256 in `sources/manifest.json`.

From the workspace root:

```sh
python3 forge/research/parkour-2026-10-14/physics/extract_reach_physics.py \
  --output forge/research/parkour-2026-10-14/physics/stock-forge-world-physics.json
```

`--cache PATH` allows an explicit input. The script rejects other build strings,
out-of-range reads, invalid block/tag counts, invalid representation indices and
modified pinned schemas. It does not guess another cache version's offsets.

## Verified cache values

`globals\globals` is `matg` tag **5**, metadata at `0x0d81c298`. Its Player
Information block at `matg+0x468` contains two `0xF4` entries. Player
Representation at `matg+0x474` connects representation 0 to Spartan/player row 0,
representation 1 to Elite/player row 1, and representation 2 to Monitor/player
row 0. These references exclude the hologram bipeds, which also exist in the map.

| Cache field | Spartan row 0 | Elite row 1 | Field unit |
|---|---:|---:|---|
| Walking Speed | 0.512 | 0.65 | WU/s |
| Run Forward | 2.2 | 2.6 | WU/s |
| Run Backward / Sideways | 1.98 | 2.34 | WU/s |
| Run Acceleration | 8.5 | 9.5 | WU/s² |
| Sneak Forward | 0.9 | 1.11 | WU/s |
| Sneak Backward / Sideways | 0.81 | 1.0 | WU/s |
| Sneak Acceleration | 6.1 | 7.1 | WU/s² |
| Airborne Acceleration | 1.05 | 1.05 | WU/s² |
| Seconds to Start / Full Speed | 0 / 1 | 0 / 1 | s |
| Full Speed Multiplier | 1.623 | 1.4 | multiplier |

Spartan is `objects\characters\spartans\spartans`, `bipd` tag **12419**,
metadata `0x12c5fe5c`. Elite is `objects\characters\elite\elite`, `bipd` tag
**13614**, metadata `0x12f853a0`.

| Cache field / biped-relative offset | Spartan | Elite | Field unit |
|---|---:|---:|---|
| Jump Velocity `+0x4F0` | 2.3 | 2.65 | WU/s |
| Stun Jumping Penalty `+0x308` | 1.0 | 1.0 | multiplier; 1 prevents jumping while fully stunned |
| Height Standing `+0x5EC` | 0.65 | 0.79 | WU |
| Height Crouching `+0x5F0` | 0.50 | 0.65 | WU |
| Radius `+0x5F4` | 0.175 | 0.18 | WU |
| Crouch Transition Time `+0x534` | 0.3 | 0.2 | s |
| Maximum Slope Angle `+0x62C` | 50 | 50 | degrees after conversion |
| Uphill / Downhill Falloff Angle | 45 / 45 | 45 / 45 | degrees after conversion |
| Uphill / Downhill Velocity Scale | 0.5 / 1.5 | 0.5 / 1.5 | multiplier |
| Minimum Soft / Hard Landing Velocity | 0.5 / 6.25 | 0.5 / 6.25 | WU/s |
| Maximum Hard Landing Velocity | 8.5 | 8.5 | WU/s |
| Maximum Soft / Hard Landing Time | 0.5 / 0.7 | 0.5 / 0.7 | s |

The cached Havok pill shapes independently agree with the dimensions: the
Spartan capsules extend from z=0 to 0.65/0.50, with radius 0.175; the Elite
capsules from z=0 to 0.79/0.65, with radius 0.18. XML endpoint labels are retained
even where its field called "Bottom" contains the higher endpoint. Geometric
extents use the min/max of both endpoints and add the capsule radius.

## Necessary interpretation limits

- Both playable bipeds have physics flags `+0x5E8 = 4`, whose set bit is **Use
  Player Physics**. Their cached Ground Adhesion Velocity Scale (`+0x664`),
  Gravity Scale (`+0x668`), Airborne Reaction Time Scale (`+0x660`) and Airborne
  Acceleration Scale (`+0x66C`) are all zero. Zero does **not** establish zero
  runtime gravity/air control. Resolving their default/bypass behavior requires
  the executable's player-physics path.
- Absolute world gravity is not a field in these extracted `matg`/`bipd` records.
  The parent investigation's executable analysis establishes it separately.
- The two scenario Structure BSP records (`scnr+0x50`, stride `0xAC`) both have
  Custom Gravity Scale `+0xA8 = 1.0`. Their flags `+0x50` are 512 and 3584;
  **Custom Gravity Scale bit 13 is off in both**. Forge World therefore has no
  enabled per-BSP custom-gravity override in these records.
- These are stock multiplayer cache records. They do not prove campaign values,
  weapon/ability movement restrictions, trait overrides, crouch input timing,
  sprint/momentum integration or actual edge-landing behavior. In particular,
  the full-speed multiplier is **not** a reason to multiply ordinary running
  range without tracing which runtime state activates it.
- WU here means game cache world units. The rule author should verify the
  Blender/exporter mapping and measure collision surfaces, rather than import a
  meters/feet conversion or trust rendered piece dimensions.
- These values are inputs to a trajectory estimate, not a certified maximum
  platform gap. In-game calibration under the exact intended variant remains
  necessary before promising reliable jumps.

Validation: extraction completed successfully; representation links resolve to
the expected live player bipeds; shapes match their authored standing/crouching
heights; raw values/offsets were cross-read directly from the cache. A separate
validation record is saved in `validation.json`.
