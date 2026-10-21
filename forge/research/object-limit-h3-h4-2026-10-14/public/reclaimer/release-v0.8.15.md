## New features

### Advanced graphics and split-screen detail

**Settings → Advanced graphics** sets how much detail the game draws. **Shadows**, **Dynamic lights**, **Effects**, **Draw distance**, **Level of detail**, **Decals** and **Water** each go from Low (or Off) to High or Ultra, and a **Preset** sets them all at once. High is what the game drew before; Ultra lets every object cast a shadow and keeps effects and detailed models much further away. **Texture filtering** sharpens floors and walls seen at an angle with up to 16× anisotropic filtering, and **Antialiasing** and **Motion blur** can now be turned off.

Split screen has a section of its own, because Halo 3 draws split screen with less detail: no shadows or decals, simpler water and fewer lights, lower again with three or four players. **Auto** keeps that. Choose any other level to give every player on the screen the same detail one player gets at that level. Changes apply as soon as you apply them, also during a game.

### Forge maps hold more objects once their own are deleted

Deleting or freezing one of a map's own objects now frees its slot. Once every other slot is taken, a new object of the same kind (a weapon for a weapon, scenery for scenery, a crate or block for a crate) takes it, and the map's object stays deleted when the map is saved, reloaded and played. The Forge HUD and the Map tab count these slots in what the map can hold. ElDewrito maps that had too many objects for their base map now convert too: 858 of a collection of 1,025 do, up from 817. Players need this version or later to play a map that uses these slots.

### Change a map's sky in Forge

The Forge menu's **Map** tab has a **Sky** row: put any installed multiplayer map's sky over the map you edit, Valhalla's over Guardian or Sandtrap's over Foundry. The host chooses for everyone and the change shows at once. The map saves the sky, and games on it show it too. The map keeps its own light and fog. Players need this version or later to play a map saved with another map's sky.

## Changes

- **Forge shows its object limits instead of the budget.** While you edit, the bottom-right of the HUD shows the two limits that matter where the budget meter was: **DYNAMIC OBJECTS**, placed objects against how many the map can hold, and **STATIC OBJECTS**, frozen objects against the 5,000 it can keep. The Forge menu's **Map** tab shows the same two. The budget is gone from the HUD and the menu, along with the price on each object and the spent column: no map comes near it.

## Bug fixes

- **Automatic port forwarding finds the router again.** Hosting Online could say **Manual setup may be needed** even with UPnP on in the router. After another program on the PC had looked for devices on the network through Windows, such as the Network folder or a media or casting app, the game's search for the router stayed on the PC for minutes and never reached the router. The game now searches over the connection that reaches the internet, so the router opens the game's ports again. Dedicated servers with `upnp = true` forward their ports again too.

## Install

The game client requires Halo: The Master Chief Collection with Halo 3 installed; no game files are included.

Double-click `project-reclaimer-v0.8.15.exe` to start the game. It finds Halo 3 in any Steam library and opens without a console window; its log is `Documents\My Games\Project Reclaimer\Logs\client.log`.

For remote server administration, double-click `reclaimer-rcon-v0.8.15.exe`, enter the host, RCON port and password, and connect. The RCON client needs no game installation. See the attached `RCON.md` for setup and commands.

