# Minimum in-game calibration task

Protocol only: no map created and no game trials run. Perform on the user's supported MCC/Xbox system; `CLAUDE.md` forbids MCC/Halo launches on this Mac.

Use the exact saved/hash-recorded multiplayer variant: All Spartans, explicit 100% speed/gravity/jump, no armor ability use, and no movement changes from respawn traits, powerups, loadouts, script branches or objectives. Record engine build, map/gametype SHA256, input method, and allowed crouch technique.

Use upright stock **Block, 5x5, Flat** launch/landing decks, plus **Block, 1x1, Flat** for representative narrow landings. Their measured stored collision tops are +0.100000151 WU above object origins; 5x5 nominal footprint is 5×5 and 1x1 is 1×1 WU. Use the recovered convex-core footprint, then inset for the player collision radius and allowance. Keep all body paths safely inside the play area and below the ceiling.

1. On a wide deck, measure standing jump apex/airtime and running displacement/airtime. Include uncrouched and allowed crouch-assisted jumps; verify the model's time/velocity units.
2. With a repeatable full running approach, test level edge gaps near the model prediction. Narrow with 0.05-WU steps to a repeated-success versus failure bracket. Reset the launch state each time.
3. Repeat representative gaps with landing-height offsets of -0.5, 0, +0.25 and +0.5 WU (omit anything above predicted apex); measure top-to-top heights. Repeat at the actual narrow landing size.
4. Test from rest and from the course's actual short approach; test a representative two/three-jump chain with a turn. Verify overhead clearance and the recovery/respawn route after a miss.

Use at least 10 controlled trials per candidate near a boundary; record counts and positions, not a lone best jump. The required acceptance policy is 10/10 successes in each of two sessions for every required jump family. These counts/spacing increments are design policies, not Reach constants. Keep normal course gaps below that boundary by an allowance derived from model error and launch/landing variation; validate a few combinations that were not used to fit the model.

The resulting evidence must say which approaches, heights, piece types and techniques worked. Until these trials exist, the checker is a prediction. Sprint/Evade/Jetpack, Elite players, slopes/tilts and materially different settings require separate calibration.
