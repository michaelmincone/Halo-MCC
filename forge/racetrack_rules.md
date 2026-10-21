# Race track rules

Follow these on top of [../AGENTS.md](../AGENTS.md) when the map is a race track. Paths are relative to `Halo-MCC/`, as in AGENTS.md.

They exist because WRONG WAY shipped with pillars holding up nothing, walls floating in midair, stacked duplicate pieces and barriers piled into each other. An AI had placed every coordinate by formula and never looked at the result.

## Plan the course

1. Besides the general plan, `plan.md` lists:
   - the sections in driving order, each a straight (length), a turn (radius and angle) or a ramp (rise over length);
   - deck heights, road width and road piece type per section;
   - where barriers go.
2. Put every climb and descent on a straight, and keep turns level. Flat Forge pieces cannot make a turn that also climbs or falls without leaning out of the turn or leaving steps at the joints.
   - Exception: a helix (corkscrew) when Mike asks for one, as in `forge/maps/corkscrew/`. Keep every joint exactly on the helix, hold one grade through the joints, keep pieces short against the radius, and pass every drivability limit below.
3. Pick one road piece type and width per section, by design. Count quotas for the whole plan up front. Never switch piece types or barrier types partway because a quota counter ran out.
4. Keep parallel roads far enough apart that their decks and barriers do not overlap.

## Placing pieces

- Road pieces chain end to end. Each piece starts exactly where the previous one ends, at the same height, with matching slope at the joint.
- Level pieces use the exact vertical orientation (up = 0, 0, 1), so rotation rounding adds no lip. Use tilt only for ramps, and flag it in the report.
- Every barrier belongs to one road piece and sits on that piece's edge.
  - One map holds at most 255 objects per palette category. Railings share the "decorative" category, so a long route cannot be railed everywhere. Plan curbs (Block, 5x1, Short) on the straights.
  - Generate barriers once along the whole route, not separately per section.
  - Trim them where sections meet so no two barriers overlap.
- Every support holds something up: its top touches the underside of a named deck, and its bottom rests on terrain or on another support. Supports never sit in a driving lane.
- Never place two pieces of the same type in nearly the same spot.
- If a piece is wrong, fix the generator or target the piece by section and name, then rebuild everything.
- `course_manifest.json` also carries:
  - each object's `section`;
  - for barriers and supports, the road piece they attach to;
  - `sections[]` with `name`, `points` and `constructed`, in the WRONG WAY format so the existing tools run unchanged.

## Extra checks

1. **Stray pieces**: besides the general checks, `stray_check.py` fails on barrier gaps and barrier pile-ups.
2. **Drivability**: run `forge/maps/wrong-way/research/v04_smoothness/sweep.py` in both `box` and `render` mode, plus `verify.py`. Add any new road piece type to `DECK` in `sweep.py`. `forge/maps/wrong-way/research/v05/check_v05.sh` runs all of this, and `limits.py` there scores it. The limits below apply to `box` mode, the collision surface. `render` mode is reported as the visual worst case: the 5x5's render mesh has a 0.018 WU recessed panel, which adds that much to every 5x5 seam. The limits are based on what v04 and v05 reached:

   | Measure | Limit |
   |---|---|
   | Upward lip on the central driving line | 0.04 WU |
   | Drop | 0.08 WU |
   | Grade change per joint | 8° |
   | Off-camber | 5° |
   | Holes in the lane, as `sweep.py` counts them | none |
   | Clearance between stacked decks | 3.5 WU or more |
3. **Look at the whole lap**: run `forge/map-checks/inspect_render.py` without a `views.json`. It makes a framed view of every section and a driver's-eye view every 25 WU around the lap; `contact_sheets.py` tiles them. Open every image and ask: could a car leave the road anywhere it shouldn't?
4. **Report**: add lap time and vehicle physics to the list of things still unverified in the game.
