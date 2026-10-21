## New features

### Join a campaign co-op game in progress

Players can now join a co-op campaign game while a mission is being played. When someone joins, everyone sees one loading screen that says who is joining and comes back exactly where the game was, with the new player next to the others. The host sends the game to every player first, so a join takes a few seconds longer than a normal load.

### Scripted game modes: Gun Game, Growth and One in the Chamber

Three new game modes come with the game. In **Host Game**, choose **GAME TYPE**, select **Slayer** and pick one of its variants:

- **Gun Game**: every kill moves you up a ladder of ten weapons, from the assault rifle to the energy sword. Dying keeps your place; the tenth kill wins.
- **Growth**: every kill makes you bigger, stronger and tougher, by a quarter of your victim's size, up to three times your normal size. Dying shrinks you back.
- **One in the Chamber**: a Magnum with one bullet that kills in one hit, and one more bullet for every kill, melee kills included. Three lives each, no shields, no other weapons.

Players who join don't need anything but this version: the mode runs on the host.

**Make your own.** A game mode is a Slayer game type file with a small script: what happens when a player spawns, gets a kill or dies. Scripts can change a player's size, damage, health, weapon and ammo, and keep numbers per player, such as a kill count. The three modes are installed as editable files in `Documents\My Games\Project Reclaimer\Game Modes\Project Reclaimer`: copy one, give it a new name, change it and choose **REFRESH** in the game type picker. `project-reclaimer.exe mode-check <file>` checks a file before you host it. Scripted modes work in playlists and on dedicated servers too.

The scripting guide at https://projectreclaimer.dev/modes explains the language step by step, with a complete starter mode, recipes for changing the bundled modes and troubleshooting.

Scripts can only change gameplay within set limits: they have no access to files, the network or your PC.

### Freeze Forge objects

Maps can now go past 640 objects. Scenery you place with **Fixed** (or **Phased**) physics freezes as soon as you let go of it: it stays exactly where it is, looks and collides the same, and is saved with the map, but no longer takes up one of the map's placements or counts toward the 255 of one object. A map keeps up to 5,000 frozen objects. The game now holds four times as many objects as Halo 3 did, so a map full of frozen objects still leaves players, weapons, vehicles, grenades and bodies all the room they had.

To move or edit a frozen object, just grab it: it becomes a normal object in your hands again, and freezes again when you let go. Delete and copy work on frozen objects too. Objects with Normal physics stay normal objects, since they can move. You can also freeze any scenery from its properties (**Freeze**), or every copy of one object from the Objects tab (**Freeze all**), and turn automatic freezing off on the Map tab.

Everyone in the game builds the frozen objects on their own PC, so they don't use any of Halo 3's network traffic. Players need this version to join a game on a map with frozen objects.

### Password-protected servers and lobbies

Set **Host Settings → Server password** to require a password when joining your game lobby. Players already in the game stay; clear the field to open the lobby again.

Dedicated hosts can set `password` under `[defaults]` for every server, or in a `[[server]]` block for one (`password = ""` opens that one again), or `RECLAIMER_DEDICATED_PASSWORD` in Docker's `.env`. It is separate from the remote console's password, and doesn't hide a server: use `hidden` for that.

The server browser marks protected servers **PRIVATE** and asks for the password when you join, including by address or join link. A wrong password can be tried again. Both hosts and players need this version for private games; servers without a password still take older versions.

### Random starting weapons

In **Edit Game Options → Traits**, set **Starting primary weapon** or **Starting secondary weapon** to **Random**. Players then spawn with a new random weapon every time they respawn. The pick uses the regular multiplayer weapons (no turrets, flamethrower or missile pod), and a random secondary is never the same as the primary. Random also works for respawn, role and powerup traits, in saved game types and in playlist entries (`"player.primary_weapon": "Random"`).

## Changes

- **HUD text uses Halo 3's own HUD font.** Names, scores and other HUD text now use the font Halo 3's HUD was designed with, read from your installed game, with the controller button symbols kept. A few characters that font lacks come from a second font of the game's. The font cache rebuilds once on the next launch.
- **The starting weapon choice "None" is now called "Map default".** It always gave players the map's own starting weapons (on Guardian, an assault rifle and no secondary), never an empty hand, and its name now says so. Playlist entries that set a starting weapon to `"None"` should use `"Map default"` instead.

## Bug fixes

- **Arrival no longer closes the game at its end.** Fixed the campaign's first mission, Arrival, closing the game as its closing cinematic ended, when the mission sets the player's look inversion.
- **Select and play Hoth and Geonosis.** Fixed selecting mod maps that reuse an original Halo 3 map's ID, including Hoth and Geonosis from the Battlefront Pack. These maps could appear in the map picker but fail to apply to the lobby. Switching back to an original map loads that map again.
- **Campaign no longer closes when an enemy dies.** Fixed campaign missions closing the game when an enemy or ally died in a way Halo 3 reports as a kill. The game's kill, death and score reports are now accepted and ignored instead of ending the mission.
- **Campaign progress saves again.** Fixed campaign missions not keeping checkpoints after Forge's larger object budget, so progress could not be continued and players couldn't join a game in progress. Saved games from earlier versions can't be continued and are no longer offered; play their mission again from the mission list.
- **Picking up a skull no longer closes the game.** Fixed campaign missions closing the game when a player picked up one of the hidden skulls, such as the Blind skull on Sierra 117.
- **Copy buttons now copy to the clipboard.** The **COPY** buttons for your Player ID in Settings and your hosted server's address now put the text on the Windows clipboard so you can paste and share it.
- **Hidden games stay out of the server browser, and hosting needs one port.** A game you host with **Hidden server** turned on could still show up in other players' server browsers. Hidden games are now never listed; players join them with **Direct Connect**. A game that was listed before you hid it drops off the list within three minutes.

  Games you host **Online** now report to the public master servers directly instead of running a master of their own, so they only need **UDP 11774**, the game port. The TCP port 11775 is no longer used, and its setting is gone from **Host Settings**; you can remove its port forward. Dedicated servers still run their machine's master on TCP 49175.
- **HUD scores line up again.** Fixed HUD text spacing and line heights that could misalign the scores and cut off game type names. The player and team scores at the bottom right now line up with their chevrons and color bars. The font cache rebuilds once on the next launch.
- **Powerups work in game types with default rules.** Picking up the overshield, active camouflage or custom powerup did nothing in games that used a game type's default rules. Now the overshield makes you invulnerable for 5 seconds while your shields charge to double, active camouflage makes you invisible for 30 seconds, and the custom powerup gives 150% speed for 10 seconds, as in Halo 3. Game types loaded from a variant file keep their own powerup settings, and Edit Game Options can still change all three.
- **Placing an object no longer sometimes places two.** When the server or a player's PC stalled for a moment, for example the first time an object of a new kind was placed, the game could treat what was sent during the stall as lost and send it again. The server then carried it out twice, so one Place in Forge made two objects. The game now waits longer before sending anything again, so a short stall no longer repeats actions. Both the server and the players need this update.

## Install

Requires Halo: The Master Chief Collection with Halo 3 installed; no game files are included.

Double-click `project-reclaimer-v0.8.10.exe` to start the game. It finds Halo 3 in any Steam library and opens without a console window; its log is `Documents\My Games\Project Reclaimer\Logs\client.log`.

