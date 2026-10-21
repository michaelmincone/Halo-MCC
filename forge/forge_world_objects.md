# Forge World objects the Mjolnir add-on can place

> **Historical baseline (2026-10-13).** The availability columns and limitations
> below describe the earlier add-on. The local `codex/full-forge-world` 1.1 build
> now browses and previews all 348 types and exports them on all five verified
> Forge World templates. See [current support and usage](object-support/RELEASE.md),
> the [348-picture catalog](object-catalog/index.html), and
> [native format evidence](Mjolnir-Forge-Editor/docs/mvar/FULL_PALETTE.md).
> Xbox loading, editing and resaving of the expanded palette remain unverified.

Every native Halo Reach object the Blender add-on in `Mjolnir-Forge-Editor/` knows for **Forge World** (map id 3006), grouped by the game's own Forge categories. Generated on 2026-10-13 from files only; Halo was not launched.

**348 objects in 145 palette entries.** 194 of them are in the add-on's Add menu; the rest can only come from an imported map or a build script. On the Paradiso template, the add-on's export accepts 177 of them as new objects (32 of those on an assumed class). 146 cannot be added as new objects on any installed Forge World template.

## Where each column comes from

| Column | Source | Known by the add-on? |
|---|---|---|
| Type ID, Name, Internal name | `Addon/mvarlib/data/stock_objects.json` (generated from `Addon/objects.py`). Type ID = palette entry × 256 + variant. | Yes. Export refuses any id not in this table. |
| Blender Add menu | `Addon/mvarlib/data/palette_tree.json` (the `Forge World Palette` collection of `Halo Reach.blend`). Only these objects have a model and appear in Add > Forge Object. | Yes |
| Can add new on | The add-on's own export rule (`mvarlib/edit.py`, `learn_class` and `_class_for`) run against each installed Forge World template. See "Rules for new objects". | Yes |
| Paradiso row max | The quota row stored in `hr_forgeWorld_paradiso.mvar`, the template WRONG WAY was built from. | Yes, as a template value. Export refuses going over it unless "Raise quota maximum (unverified)" is ticked. |
| Shared max, Price | The installed game cache `forge_halo.map` (build Jun 21 2023), read earlier by `maps/wrong-way/research/extract_palette_costs.py` into `palette_costs.json`. | **No.** The add-on has no prices and no stock maxima. The Xbox audit (`xbox_compatibility_audit.py`) checks these. |

"Shared max" and "Price" belong to the palette entry, so all variants in one entry share one count. Example: entry 70 (`structure_blocks`) allows 300 blocks in total across all 26 block shapes, at 10 each. A ″ mark means "same entry as the row above".

## Rules for new objects (what the add-on enforces)

- **650 objects** at most on the whole map, and only ids from the stock table above.
- **Template.** The add-on never makes a map from nothing. It edits a Forge World `.mvar` you import, so what you can add depends on that file. The installed Forge World templates:

  | Template | File | Palette entries in file | Objects | Budget |
  |---|---|---:|---:|---:|
  | Asylum | `hr_forgeWorld_asylum.mvar` | 89 | 458 | 10000 |
  | Hemorrhage | `hr_forgeWorld_hemorrhage.mvar` | 89 | 473 | 10000 |
  | Paradiso | `hr_forgeWorld_paradiso.mvar` | 144 | 629 | 30000 |
  | Pinnacle | `hr_forgeWorld_pinnacle.mvar` | 89 | 378 | 10000 |
  | The Cage | `hr_forgeWorld_theCage.mvar` | 89 | 414 | 10000 |

  The four older templates stop at entry 88, so the **MCC additions (entries 89 to 143) can only be placed on Paradiso**. Entry 144 (Location Name) is in no template.
- **Object class.** Each new object needs its hidden object class. The add-on learns it from an object of the same entry already in the template. If none exists, it assumes class 0 for items in the Structure and Scenery menu groups (with a warning) and refuses everything else (`E_CACHED_TYPE_UNKNOWN`). That is why many weapons, vehicles and gadgets show "none" or only some templates. Deleting the template's objects does not lose this; it learns from the unmodified template.

  The WRONG WAY copy of the add-on (`maps/wrong-way/vendor/mjolnir_forge`) also accepts a class the build asks for when the template already holds that exact object with that class. That adds Hill Marker on Hemorrhage and Paradiso, Initial Spawn on Asylum, Hemorrhage and The Cage, Respawn Point on Asylum and The Cage, Kill Boundary on Pinnacle, and Soft Kill Boundary on The Cage. The "Can add new on" column uses the stock add-on's rule.
- **Quota rows.** The shipped templates store maximum = what they already hold (Paradiso holds 34 blocks, so its block row max is 34). Without "Raise quota maximum (unverified)" you can only re-add up to that number after deleting the template's own pieces. With it on, the row is raised, but the file stores each row in 8 bits, so **255 per entry is the hard cap** even where the game allows 300. Whether the game accepts a raised row is unverified.
- **Budget.** The add-on copies the spent-budget word unchanged; it cannot price items. Paradiso's budget is 30,000; the others 10,000.

## Marked unsupported or unverified by the add-on

- **Location Name** (id 36864, entry 144): class 19, whose stored form is disputed (`E_TYPE19_UNDETERMINED`), and its entry is beyond every installed template (`E_FOLDER_RANGE`). Cannot be placed.
- **Tilted pieces**: the stock add-on refuses any tilted orientation (`E_TILT_UNSUPPORTED`). Writing a new or changed yaw is also gated behind "Allow unverified rotation export". Applies to every object.
- **Symmetry, Place at Start, Game Specific**: cannot be changed from the template value (`E_FLAG_UNVERIFIED`).
- **Assumed class 0** (Structure and Scenery with no template example): accepted with warning `W_CACHED_TYPE_ASSUMED`; never confirmed in the game.
- **Disputed ids**: none on Forge World (only Breakneck and Tempest have them).
- **Invisible block names** (entries 78 to 88): most of the add-on's display names do not match the sizes in the internal names (for example `block_5x5_flat_invis` is listed as "Block, 4x4x4, Invisible"). Which is right is unverified; check in Forge before relying on a size. None of them can be added as new objects on any installed template anyway (no example to learn the class from).
- **Not in the Add menu** ("not offered" below): no model in `Halo Reach.blend`, so they cannot be added from Blender's Add menu. A script can still add them by name (they appear as arrows), subject to the class rule.

## Weapons, Human

Game category `ff_weapons_human`, 10 palette entries, 10 objects.

| Type ID | Name | Internal name | Entry | Shared max | Price | Paradiso row max | Blender Add menu | Can add new on |
|---:|---|---|---:|---:|---:|---:|---|---|
| 0 | Assault Rifle | `assault_rifle` | 0 `assault_rifle` | 16 | 10 | 0 | not offered | none (no example to learn its class from) |
| 256 | DMR | `dmr` | 1 `dmr` | 16 | 10 | 8 | not offered | all 5 |
| 512 | Grenade Launcher | `grenade_launcher` | 2 `grenade_launcher` | 16 | 10 | 1 | not offered | Paradiso, The Cage |
| 768 | Magnum | `magnum` | 3 `magnum` | 16 | 10 | 0 | not offered | Hemorrhage, Pinnacle |
| 1024 | Rocket Launcher | `rocket_launcher` | 4 `rocket_launcher` | 16 | 20 | 0 | not offered | Pinnacle |
| 1280 | Shotgun | `shotgun` | 5 `shotgun` | 16 | 20 | 0 | not offered | Asylum, Hemorrhage, Pinnacle, The Cage |
| 1536 | Sniper Rifle | `sniper_rifle` | 6 `sniper_rifle` | 16 | 20 | 2 | not offered | all 5 |
| 1792 | Spartan Laser | `spartan_laser` | 7 `spartan_laser` | 16 | 50 | 1 | not offered | Paradiso |
| 2048 | Frag Grenade | `wep_nade_frag` | 8 `wep_nade_frag` | 32 | 5 | 6 | not offered | Hemorrhage, Paradiso, Pinnacle, The Cage |
| 2304 | Mounted Machinegun | `wep_machinegun` | 9 `wep_machinegun` | 8 | 75 | 2 | not offered | Asylum, Paradiso |

## Weapons, Covenant

Game category `ff_weapons_covenant`, 14 palette entries, 14 objects.

| Type ID | Name | Internal name | Entry | Shared max | Price | Paradiso row max | Blender Add menu | Can add new on |
|---:|---|---|---:|---:|---:|---:|---|---|
| 2560 | Concussion Rifle | `concussion_rifle` | 10 `concussion_rifle` | 16 | 20 | 2 | not offered | Hemorrhage, Paradiso |
| 2816 | Energy Sword | `energy_sword` | 11 `energy_sword` | 16 | 20 | 0 | not offered | Asylum |
| 3072 | Fuel Rod Gun | `wep_flakcannon` | 12 `wep_flakcannon` | 16 | 50 | 0 | not offered | none (no example to learn its class from) |
| 3328 | Gravity Hammer | `gravity_hammer` | 13 `gravity_hammer` | 16 | 20 | 0 | not offered | none (no example to learn its class from) |
| 3584 | Focus Rifle | `focus_rifle` | 14 `focus_rifle` | 16 | 50 | 0 | not offered | none (no example to learn its class from) |
| 3840 | Needle Rifle | `needle_rifle` | 15 `needle_rifle` | 16 | 10 | 4 | not offered | Asylum, Hemorrhage, Paradiso, The Cage |
| 4096 | Needler | `needler` | 16 `needler` | 16 | 20 | 2 | not offered | all 5 |
| 4352 | Plasma Launcher | `wep_plasmalauncher` | 17 `wep_plasmalauncher` | 16 | 50 | 0 | not offered | Hemorrhage, The Cage |
| 4608 | Plasma Pistol | `plasma_pistol` | 18 `plasma_pistol` | 16 | 10 | 3 | not offered | all 5 |
| 4864 | Plasma Repeater | `plasma_repeater` | 19 `plasma_repeater` | 16 | 10 | 6 | not offered | all 5 |
| 5120 | Plasma Rifle | `plasma_rifle` | 20 `plasma_rifle` | 16 | 10 | 0 | not offered | none (no example to learn its class from) |
| 5376 | Spiker | `spike_rifle` | 21 `spike_rifle` | 16 | 10 | 0 | not offered | none (no example to learn its class from) |
| 5632 | Plasma Grenade | `wep_nade_plasma` | 22 `wep_nade_plasma` | 32 | 5 | 8 | not offered | Hemorrhage, Paradiso, Pinnacle, The Cage |
| 5888 | Plasma Turret | `wep_plasmaturret` | 23 `wep_plasmaturret` | 8 | 75 | 0 | not offered | none (no example to learn its class from) |

## Armor Abilities

Game category `ff_armor_abilities`, 7 palette entries, 7 objects.

| Type ID | Name | Internal name | Entry | Shared max | Price | Paradiso row max | Blender Add menu | Can add new on |
|---:|---|---|---:|---:|---:|---:|---|---|
| 6144 | Active Camouflage | `active_camoflage` | 24 `arm_camo` | 16 | 50 | 0 | not offered | none (no example to learn its class from) |
| 6400 | Armor Lock | `armor_lockup` | 25 `arm_lock` | 16 | 50 | 0 | not offered | none (no example to learn its class from) |
| 6656 | Drop Shield | `drop_shield` | 26 `arm_dropshield` | 16 | 50 | 0 | not offered | none (no example to learn its class from) |
| 6912 | Evade | `evade_elite` | 27 `arm_evade` | 16 | 50 | 0 | not offered | none (no example to learn its class from) |
| 7168 | Hologram | `hologram` | 28 `arm_hologram` | 16 | 50 | 0 | not offered | The Cage |
| 7424 | Jet Pack | `jet_pack` | 29 `arm_jetpack` | 16 | 50 | 1 | not offered | Paradiso |
| 7680 | Sprint | `sprint_spartan` | 30 `arm_sprint` | 16 | 50 | 0 | not offered | none (no example to learn its class from) |

## Vehicles

Game category `ff_vehicles`, 9 palette entries, 11 objects.

| Type ID | Name | Internal name | Entry | Shared max | Price | Paradiso row max | Blender Add menu | Can add new on |
|---:|---|---|---:|---:|---:|---:|---|---|
| 7936 | Banshee | `banshee` | 31 `banshee` | 16 | 100 | 2 | not offered | Paradiso |
| 8192 | Falcon | `falcon` | 32 `falcon` | 16 | 100 | 0 | not offered | Hemorrhage |
| 8448 | Ghost | `ghost` | 33 `ghost` | 16 | 75 | 2 | not offered | Hemorrhage, Paradiso |
| 8704 | Mongoose | `mongoose` | 34 `mongoose` | 16 | 50 | 7 | not offered | Hemorrhage, Paradiso |
| 8960 | Revenant | `revenant` | 35 `revenant` | 16 | 100 | 0 | not offered | Hemorrhage |
| 9216 | Scorpion | `scorpion` | 36 `scorpion` | 16 | 150 | 2 | not offered | Paradiso |
| 9472 | Shade Turret | `shade` | 37 `shade` | 16 | 150 | 0 | not offered | none (no example to learn its class from) |
| 9728 | Warthog, Default | `warthog_default` | 38 `warthogs` | 16 | 150 | 2 | not offered | Hemorrhage, Paradiso |
| 9729 | Warthog, Gauss | `warthog_gauss` | ″ | ″ | ″ | ″ | not offered | Hemorrhage, Paradiso |
| 9730 | Warthog, Rocket | `warthog_rocket` | ″ | ″ | ″ | ″ | not offered | Hemorrhage, Paradiso |
| 9984 | Wraith | `wraith` | 39 `wraith` | 16 | 150 | 0 | not offered | Hemorrhage |

## Gadgets

Game category `ff_gadgets`, 14 palette entries, 46 objects.

| Type ID | Name | Internal name | Entry | Shared max | Price | Paradiso row max | Blender Add menu | Can add new on |
|---:|---|---|---:|---:|---:|---:|---|---|
| 10240 | Fusion Coil | `exp_fusioncoil` | 40 `gadget_explosive` | 32 | 50 | 0 | Gadgets > Explosives | Hemorrhage |
| 10241 | Landmine | `exp_landmine` | ″ | ″ | ″ | ″ | Gadgets > Explosives | Hemorrhage |
| 10242 | Plasma Battery | `exp_battery` | ″ | ″ | ″ | ″ | Gadgets > Explosives | Hemorrhage |
| 10243 | Propane Tank | `exp_propanetank` | ″ | ″ | ″ | ″ | Gadgets > Explosives | Hemorrhage |
| 10496 | Health Station | `health_station` | 41 `gadget_healthstation` | 16 | 25 | 5 | Gadgets | all 5 |
| 10752 | Camo Powerup | `powerup_blue` | 42 `gadget_powerups` | 16 | 50 | 0 | Gadgets > Powerups | none (no example to learn its class from) |
| 10753 | Overshield | `powerup_red` | ″ | ″ | ″ | ″ | Gadgets > Powerups | none (no example to learn its class from) |
| 10754 | Custom Powerup | `powerup_yellow` | ″ | ″ | ″ | ″ | Gadgets > Powerups | none (no example to learn its class from) |
| 11008 | Cannon, Man | `mancannon_normal` | 43 `gadget_mancannons` | 32 | 100 | 4 | Gadgets > Cannons, Men | Paradiso, Pinnacle, The Cage |
| 11009 | Cannon, Man, Heavy | `mancannon_heavy` | ″ | ″ | ″ | ″ | Gadgets > Cannons, Men | Paradiso, Pinnacle, The Cage |
| 11010 | Cannon, Man, Light | `mancannon_light` | ″ | ″ | ″ | ″ | Gadgets > Cannons, Men | Paradiso, Pinnacle, The Cage |
| 11011 | Cannon, Vehicle | `mancannon_vehicle` | ″ | ″ | ″ | ″ | Gadgets > Cannons, Men | Paradiso, Pinnacle, The Cage |
| 11012 | Gravity Lift | `mancannon_gravlift` | ″ | ″ | ″ | ″ | Gadgets > Cannons, Men | Paradiso, Pinnacle, The Cage |
| 11264 | One Way Shield 2 | `door_oneway_small` | 44 `door_oneway_small` | 12 | 200 | 0 | not offered | none (no example to learn its class from) |
| 11520 | One Way Shield 3 | `door_oneway_medium` | 45 `door_oneway_medium` | 12 | 200 | 0 | not offered | none (no example to learn its class from) |
| 11776 | One Way Shield 4 | `door_oneway_large` | 46 `door_oneway_large` | 12 | 200 | 0 | not offered | none (no example to learn its class from) |
| 12032 | FX:Colorblind | `sfx_1` | 47 `gadget_sfx` | 4 | 250 | 0 | not offered | none (no example to learn its class from) |
| 12033 | FX:Next Gen | `sfx_2` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 12034 | FX:Juicy | `sfx_3` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 12035 | FX:Nova | `sfx_4` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 12036 | FX:Olde Timey | `sfx_5` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 12037 | FX:Pen And Ink | `sfx_6` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 12038 | FX:Purple | `purple` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 12039 | FX:Green | `green` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 12040 | FX:Orange | `orange` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 12288 | Shield Door, Small | `door_shield_small` | 48 `door_shield_small` | 12 | 200 | 0 | not offered | none (no example to learn its class from) |
| 12544 | Shield Door, Medium | `door_shield_medium` | 49 `door_shield_medium` | 12 | 200 | 0 | not offered | none (no example to learn its class from) |
| 12800 | Shield Door, Large | `door_shield_large` | 50 `door_shield_large` | 12 | 200 | 0 | not offered | none (no example to learn its class from) |
| 13056 | Receiver Node | `teleporter_reciever` | 51 `gadget_teleporters` | 24 | 25 | 4 | Gadgets > Teleporters | Hemorrhage, Paradiso, Pinnacle |
| 13057 | Sender Node | `teleporter_sender` | ″ | ″ | ″ | ″ | Gadgets > Teleporters | Hemorrhage, Paradiso, Pinnacle |
| 13058 | Two-Way Node | `teleporter_2way` | ″ | ″ | ″ | ″ | Gadgets > Teleporters | none (no example to learn its class from) |
| 13312 | Die | `toys_die` | 52 `gadget_toys` | 30 | 100 | 0 | Gadgets > Toys | none (no example to learn its class from) |
| 13313 | Golf Ball | `toys_golfball` | ″ | ″ | ″ | ″ | Gadgets > Toys | none (no example to learn its class from) |
| 13314 | Golf Club | `toys_golfclub` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 13315 | Kill Ball | `toys_killball` | ″ | ″ | ″ | ″ | Gadgets > Toys | none (no example to learn its class from) |
| 13316 | Soccer Ball | `toys_soccerball` | ″ | ″ | ″ | ″ | Gadgets > Toys | none (no example to learn its class from) |
| 13317 | Tin Cup | `toys_tincup` | ″ | ″ | ″ | ″ | Gadgets > Toys | none (no example to learn its class from) |
| 13568 | Light, Red | `ff_light_red` | 53 `gadget_lights` | 8 | 250 | 0 | Gadgets > Lights | Asylum, The Cage |
| 13569 | Light, Blue | `ff_light_blue` | ″ | ″ | ″ | ″ | Gadgets > Lights | Asylum, The Cage |
| 13570 | Light, Green | `ff_light_green` | ″ | ″ | ″ | ″ | Gadgets > Lights | Asylum, The Cage |
| 13571 | Light, Orange | `ff_light_orange` | ″ | ″ | ″ | ″ | Gadgets > Lights | Asylum, The Cage |
| 13572 | Light, Purple | `ff_light_purple` | ″ | ″ | ″ | ″ | Gadgets > Lights | Asylum, The Cage |
| 13573 | Light, Yellow | `ff_light_yellow` | ″ | ″ | ″ | ″ | Gadgets > Lights | Asylum, The Cage |
| 13574 | Light, White | `ff_light_white` | ″ | ″ | ″ | ″ | Gadgets > Lights | Asylum, The Cage |
| 13575 | Light, Red, Flashing | `ff_light_red_flash` | ″ | ″ | ″ | ″ | not offered | Asylum, The Cage |
| 13576 | Light, Yellow, Flashing | `ff_light_yellow_flash` | ″ | ″ | ″ | ″ | not offered | Asylum, The Cage |

## Spawning

Game category `ff_spawning`, 8 palette entries, 10 objects.

| Type ID | Name | Internal name | Entry | Shared max | Price | Paradiso row max | Blender Add menu | Can add new on |
|---:|---|---|---:|---:|---:|---:|---|---|
| 13824 | Initial Spawn | `spawning_initial` | 54 `spawning_initial` | 250 | 0 | 116 | Spawning | Paradiso, Pinnacle |
| 14080 | Respawn Point | `spawning_respawn` | 55 `spawning_respawn` | 250 | 0 | 186 | Spawning | Hemorrhage, Paradiso, Pinnacle |
| 14336 | Initial Loadout Camera | `spawning_camera` | 56 `spawning_camera` | 32 | 0 | 3 | not offered | all 5 |
| 14592 | Respawn Zone | `respawn_zone` | 57 `respawn_zone` | 20 | 0 | 10 | not offered | all 5 |
| 14848 | Respawn Zone, Weak | `respawn_zone_weak` | 58 `respawn_zone_weak` | 20 | 0 | 0 | not offered | none (no example to learn its class from) |
| 15104 | Respawn Zone, Anti | `respawn_zone_anti` | 59 `respawn_zone_anti` | 20 | 0 | 0 | not offered | none (no example to learn its class from) |
| 15360 | Safe Boundary | `spawning_safe` | 60 `spawning_boundaries_safe` | 5 | 0 | 1 | not offered | all 5 |
| 15361 | Soft Safe Boundary | `spawning_safe_soft` | ″ | ″ | ″ | ″ | not offered | all 5 |
| 15616 | Kill Boundary | `spawning_kill` | 61 `spawning_boundaries_kill` | 64 | 0 | 0 | not offered | Asylum, Hemorrhage, The Cage |
| 15617 | Soft Kill Boundary | `spawning_kill_soft` | ″ | ″ | ″ | ″ | not offered | Asylum, Hemorrhage, Pinnacle |

## Objectives

Game category `ff_objectives`, 3 palette entries, 3 objects.

| Type ID | Name | Internal name | Entry | Shared max | Price | Paradiso row max | Blender Add menu | Can add new on |
|---:|---|---|---:|---:|---:|---:|---|---|
| 15872 | Flag Stand | `obj_flag_base` | 62 `obj_flag_base` | 50 | 0 | 23 | Objectives | all 5 |
| 16128 | Capture Plate | `obj_plate` | 63 `obj_plate` | 50 | 0 | 9 | Objectives | all 5 |
| 16384 | Hill Marker | `obj_hill_marker` | 64 `obj_hill_marker` | 75 | 0 | 58 | Objectives | Asylum, Pinnacle, The Cage |

## Scenery

Game category `ff_scenery`, 5 palette entries, 15 objects.

| Type ID | Name | Internal name | Entry | Shared max | Price | Paradiso row max | Blender Add menu | Can add new on |
|---:|---|---|---:|---:|---:|---:|---|---|
| 16640 | Barricade, Small | `ff_scn_barricade_small` | 65 `ff_scn_barricades` | 36 | 50 | 0 | Scenery | all 5 (class assumed) |
| 16641 | Barricade, Large | `ff_scn_barricade_large` | ″ | ″ | ″ | ″ | Scenery | all 5 (class assumed) |
| 16642 | Covenant Barrier | `ff_scn_covenantbarrier` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 16643 | Portable Shield | `ff_scn_cov_shield` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 16896 | Camping Stool | `ff_scn_camping_stool` | 66 `ff_scn_camping_stool` | 30 | 10 | 0 | not offered | none (no example to learn its class from) |
| 17152 | Crate, Heavy Duty | `ff_scn_space_crate` | 67 `ff_scn_crates` | 50 | 25 | 0 | not offered | none (no example to learn its class from) |
| 17153 | Crate, Heavy, Small | `ff_scn_space_crate_small` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 17154 | Covenant Crate | `ff_scn_cov_crate` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 17155 | Crate, Half Open | `ff_scn_cov_crate_a` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 17408 | Sandbag Wall | `ff_scn_sandbag_wall` | 68 `ff_scn_sandbags` | 36 | 25 | 0 | Scenery | all 5 (class assumed) |
| 17409 | Sandbag, Turret Wall | `ff_scn_sandbag_turret` | ″ | ″ | ″ | ″ | Scenery | all 5 (class assumed) |
| 17410 | Sandbag Corner, 45 | `ff_scn_sandbag_45` | ″ | ″ | ″ | ″ | Scenery | all 5 (class assumed) |
| 17411 | Sandbag Corner, 90 | `ff_scn_sandbag_90` | ″ | ″ | ″ | ″ | Scenery | all 5 (class assumed) |
| 17412 | Sandbag Endcap | `ff_scn_sandbag_end` | ″ | ″ | ″ | ″ | Scenery | all 5 (class assumed) |
| 17664 | Street Cone | `ff_scn_street_cone` | 69 `ff_scn_street_cone` | 60 | 10 | 0 | Scenery | all 5 (class assumed) |

## Structure

Game category `ff_structure`, 8 palette entries, 110 objects.

| Type ID | Name | Internal name | Entry | Shared max | Price | Paradiso row max | Blender Add menu | Can add new on |
|---:|---|---|---:|---:|---:|---:|---|---|
| 17920 | Block, 1x1 | `block_1x1` | 70 `structure_blocks` | 300 | 10 | 34 | Structure > Building Blocks | all 5 (assumed on some) |
| 17921 | Block, 1x1, Flat | `block_1x1_flat` | ″ | ″ | ″ | ″ | Structure > Building Blocks | all 5 (assumed on some) |
| 17922 | Block, 1x1, Short | `block_1x1_short` | ″ | ″ | ″ | ″ | Structure > Building Blocks | all 5 (assumed on some) |
| 17923 | Block, 1x1, Tall | `block_1x1_tall` | ″ | ″ | ″ | ″ | Structure > Building Blocks | all 5 (assumed on some) |
| 17924 | Block, 1x1, Tall And Thin | `block_1x1_tall_thin` | ″ | ″ | ″ | ″ | Structure > Building Blocks | all 5 (assumed on some) |
| 17925 | Block, 1x2 | `block_1x2` | ″ | ″ | ″ | ″ | Structure > Building Blocks | all 5 (assumed on some) |
| 17926 | Block, 1x4 | `block_1x4` | ″ | ″ | ″ | ″ | Structure > Building Blocks | all 5 (assumed on some) |
| 17927 | Block, 2x1, Flat | `block_2x1_flat` | ″ | ″ | ″ | ″ | Structure > Building Blocks | all 5 (assumed on some) |
| 17928 | Block, 2x2 | `block_2x2` | ″ | ″ | ″ | ″ | Structure > Building Blocks | all 5 (assumed on some) |
| 17929 | Block, 2x2, Flat | `block_2x2_flat` | ″ | ″ | ″ | ″ | Structure > Building Blocks | all 5 (assumed on some) |
| 17930 | Block, 2x2, Short | `block_2x2_short` | ″ | ″ | ″ | ″ | Structure > Building Blocks | all 5 (assumed on some) |
| 17931 | Block, 2x2, Tall | `block_2x2_tall` | ″ | ″ | ″ | ″ | Structure > Building Blocks | all 5 (assumed on some) |
| 17932 | Block, 2x3 | `block_2x3` | ″ | ″ | ″ | ″ | Structure > Building Blocks | all 5 (assumed on some) |
| 17933 | Block, 2x4 | `block_2x4` | ″ | ″ | ″ | ″ | Structure > Building Blocks | all 5 (assumed on some) |
| 17934 | Block, 3x1, Flat | `block_3x1_flat` | ″ | ″ | ″ | ″ | Structure > Building Blocks | all 5 (assumed on some) |
| 17935 | Block, 3x3 | `block_3x3` | ″ | ″ | ″ | ″ | Structure > Building Blocks | all 5 (assumed on some) |
| 17936 | Block, 3x3, Flat | `block_3x3_flat` | ″ | ″ | ″ | ″ | Structure > Building Blocks | all 5 (assumed on some) |
| 17937 | Block, 3x3, Short | `block_3x3_short` | ″ | ″ | ″ | ″ | Structure > Building Blocks | all 5 (assumed on some) |
| 17938 | Block, 3x3, Tall | `block_3x3_tall` | ″ | ″ | ″ | ″ | Structure > Building Blocks | all 5 (assumed on some) |
| 17939 | Block, 3x4 | `block_3x4` | ″ | ″ | ″ | ″ | Structure > Building Blocks | all 5 (assumed on some) |
| 17940 | Block, 4x4 | `block_4x4` | ″ | ″ | ″ | ″ | Structure > Building Blocks | all 5 (assumed on some) |
| 17941 | Block, 4x4, Flat | `block_4x4_flat` | ″ | ″ | ″ | ″ | Structure > Building Blocks | all 5 (assumed on some) |
| 17942 | Block, 4x4, Short | `block_4x4_short` | ″ | ″ | ″ | ″ | Structure > Building Blocks | all 5 (assumed on some) |
| 17943 | Block, 4x4, Tall | `block_4x4_tall` | ″ | ″ | ″ | ″ | Structure > Building Blocks | all 5 (assumed on some) |
| 17944 | Block, 5x1, Short | `block_5x1_flat` | ″ | ″ | ″ | ″ | Structure > Building Blocks | all 5 (assumed on some) |
| 17945 | Block, 5x5, Flat | `block_5x5_flat` | ″ | ″ | ″ | ″ | Structure > Building Blocks | all 5 (assumed on some) |
| 18176 | Bridge, Small | `bridge_2x1` | 71 `structure_bridges` | 150 | 10 | 18 | Structure > Bridges And Platforms | all 5 (assumed on some) |
| 18177 | Bridge, Medium | `bridge_2x2` | ″ | ″ | ″ | ″ | Structure > Bridges And Platforms | all 5 (assumed on some) |
| 18178 | Bridge, Large | `bridge_2x3` | ″ | ″ | ″ | ″ | Structure > Bridges And Platforms | all 5 (assumed on some) |
| 18179 | Bridge, XLarge | `bridge_2x5` | ″ | ″ | ″ | ″ | Structure > Bridges And Platforms | all 5 (assumed on some) |
| 18180 | Bridge, Diagonal | `bridge_diag` | ″ | ″ | ″ | ″ | Structure > Bridges And Platforms | all 5 (assumed on some) |
| 18181 | Bridge, Diag, Small | `bridge_diag_short` | ″ | ″ | ″ | ″ | Structure > Bridges And Platforms | all 5 (assumed on some) |
| 18182 | Dish | `dish` | ″ | ″ | ″ | ″ | Structure > Bridges And Platforms | all 5 (assumed on some) |
| 18183 | Dish, Open | `dish_door` | ″ | ″ | ″ | ″ | Structure > Bridges And Platforms | all 5 (assumed on some) |
| 18184 | Corner, 45 Degrees | `corner_45` | ″ | ″ | ″ | ″ | Structure > Bridges And Platforms | all 5 (assumed on some) |
| 18185 | Corner, 2x2 | `plat_2x2_corner` | ″ | ″ | ″ | ″ | Structure > Bridges And Platforms | all 5 (assumed on some) |
| 18186 | Corner, 4x4 | `plat_4x4_corner` | ″ | ″ | ″ | ″ | Structure > Bridges And Platforms | all 5 (assumed on some) |
| 18187 | Landing Pad | `plat_landing_pad` | ″ | ″ | ″ | ″ | Structure > Bridges And Platforms | all 5 (assumed on some) |
| 18188 | Platform, Ramped | `plat_ramped` | ″ | ″ | ″ | ″ | Structure > Bridges And Platforms | all 5 (assumed on some) |
| 18189 | Platform, Large | `plat_4x4_tower` | ″ | ″ | ″ | ″ | Structure > Bridges And Platforms | all 5 (assumed on some) |
| 18190 | Platform, XL | `cylinder_small` | ″ | ″ | ″ | ″ | Structure > Bridges And Platforms | all 5 (assumed on some) |
| 18191 | Platform, XXL | `cylinder_large` | ″ | ″ | ″ | ″ | Structure > Bridges And Platforms | all 5 (assumed on some) |
| 18192 | Platform, Y | `plat_y` | ″ | ″ | ″ | ″ | Structure > Bridges And Platforms | all 5 (assumed on some) |
| 18193 | Platform, Y, Large | `plat_y_large` | ″ | ″ | ″ | ″ | Structure > Bridges And Platforms | all 5 (assumed on some) |
| 18194 | Sniper Nest | `sniper_nest` | ″ | ″ | ″ | ″ | Structure > Bridges And Platforms | all 5 (assumed on some) |
| 18195 | Staircase | `stair_case` | ″ | ″ | ″ | ″ | Structure > Bridges And Platforms | all 5 (assumed on some) |
| 18196 | Walkway, Large | `walkway` | ″ | ″ | ″ | ″ | Structure > Bridges And Platforms | all 5 (assumed on some) |
| 18432 | Bunker, Small | `bunker_low` | 72 `structure_buildings` | 36 | 150 | 5 | Structure > Buildings | all 5 |
| 18433 | Bunker, Small, Covered | `bunker_covered` | ″ | ″ | ″ | ″ | Structure > Buildings | all 5 |
| 18434 | Bunker, Box | `bunker_full` | ″ | ″ | ″ | ″ | Structure > Buildings | all 5 |
| 18435 | Bunker, Round | `bunker_gulch` | ″ | ″ | ″ | ″ | Structure > Buildings | all 5 |
| 18436 | Bunker, Ramp | `bunker_stairs` | ″ | ″ | ″ | ″ | Structure > Buildings | all 5 |
| 18437 | Pyramid | `pyramid` | ″ | ″ | ″ | ″ | Structure > Buildings | all 5 |
| 18438 | Tower, 2 Story | `tower` | ″ | ″ | ″ | ″ | Structure > Buildings | all 5 |
| 18439 | Tower, 3 Story | `tower_3_story` | ″ | ″ | ″ | ″ | Structure > Buildings | all 5 |
| 18440 | Tower, Tall | `tower_tall` | ″ | ″ | ″ | ″ | Structure > Buildings | all 5 |
| 18441 | Room, Double | `room_double` | ″ | ″ | ″ | ″ | Structure > Buildings | all 5 |
| 18442 | Room, Triple | `room_triple` | ″ | ″ | ″ | ″ | Structure > Buildings | all 5 |
| 18688 | Antenna, Small | `antenna` | 73 `structure_decorative` | 300 | 50 | 56 | Structure > Decorative | all 5 |
| 18689 | Antenna, Satellite | `antenna_dish` | ″ | ″ | ″ | ″ | Structure > Decorative | all 5 |
| 18690 | Brace | `brace` | ″ | ″ | ″ | ″ | Structure > Decorative | all 5 |
| 18691 | Brace, Large | `brace_large` | ″ | ″ | ″ | ″ | Structure > Decorative | all 5 |
| 18692 | Brace, Tunnel | `brace_tunnel` | ″ | ″ | ″ | ″ | Structure > Decorative | all 5 |
| 18693 | Column | `ff_column` | ″ | ″ | ″ | ″ | Structure > Decorative | all 5 |
| 18694 | Cover | `crenelation` | ″ | ″ | ″ | ″ | Structure > Decorative | all 5 |
| 18695 | Cover, Crenellation | `crenelation_notched` | ″ | ″ | ″ | ″ | Structure > Decorative | all 5 |
| 18696 | Cover, Glass | `cover_glass` | ″ | ″ | ″ | ″ | Structure > Decorative | all 5 |
| 18697 | Glass Sail | `wtf_is_this_thing` | ″ | ″ | ″ | ″ | Structure > Decorative | all 5 |
| 18698 | Railing, Small | `railing_short` | ″ | ″ | ″ | ″ | Structure > Decorative | all 5 |
| 18699 | Railing, Medium | `railing_medium` | ″ | ″ | ″ | ″ | Structure > Decorative | all 5 |
| 18700 | Railing, Long | `railing_long` | ″ | ″ | ″ | ″ | Structure > Decorative | all 5 |
| 18701 | Teleporter Frame | `teleporter_frame` | ″ | ″ | ″ | ″ | Structure > Decorative | all 5 |
| 18702 | Strut | `ff_strut` | ″ | ″ | ″ | ″ | Structure > Decorative | all 5 |
| 18703 | Large Walkway Cover | `walkway_cover` | ″ | ″ | ″ | ″ | Structure > Decorative | all 5 |
| 18944 | Door | `door` | 74 `structure_doors` | 150 | 10 | 8 | Structure > Doors, Windows, And Walls | all 5 |
| 18945 | Door, Double | `door_double` | ″ | ″ | ″ | ″ | Structure > Doors, Windows, And Walls | all 5 |
| 18946 | Window | `window` | ″ | ″ | ″ | ″ | Structure > Doors, Windows, And Walls | all 5 |
| 18947 | Window, Double | `window_double` | ″ | ″ | ″ | ″ | Structure > Doors, Windows, And Walls | all 5 |
| 18948 | Wall | `wall` | ″ | ″ | ″ | ″ | Structure > Doors, Windows, And Walls | all 5 |
| 18949 | Wall, Double | `wall_double` | ″ | ″ | ″ | ″ | Structure > Doors, Windows, And Walls | all 5 |
| 18950 | Wall, Corner | `wall_corner` | ″ | ″ | ″ | ″ | Structure > Doors, Windows, And Walls | all 5 |
| 18951 | Wall, Curved | `wall_curved` | ″ | ″ | ″ | ″ | Structure > Doors, Windows, And Walls | all 5 |
| 18952 | Wall, Coliseum | `wall_coliseum` | ″ | ″ | ″ | ″ | Structure > Doors, Windows, And Walls | all 5 |
| 18953 | Window, Colesium | `window_coliseum` | ″ | ″ | ″ | ″ | Structure > Doors, Windows, And Walls | all 5 |
| 18954 | Tunnel, Short | `tunnel_short` | ″ | ″ | ″ | ″ | Structure > Doors, Windows, And Walls | all 5 |
| 18955 | Tunnel, Long | `tunnel_long` | ″ | ″ | ″ | ″ | Structure > Doors, Windows, And Walls | all 5 |
| 19200 | Bank, 1x1 | `bank_1x1` | 75 `structure_inclines` | 300 | 10 | 16 | Structure > Inclines | all 5 (assumed on some) |
| 19201 | Bank, 1x2 | `bank_1x2` | ″ | ″ | ″ | ″ | Structure > Inclines | all 5 (assumed on some) |
| 19202 | Bank, 2x1 | `bank_2x1` | ″ | ″ | ″ | ″ | Structure > Inclines | all 5 (assumed on some) |
| 19203 | Bank, 2x2 | `bank_2x2` | ″ | ″ | ″ | ″ | Structure > Inclines | all 5 (assumed on some) |
| 19204 | Ramp, 1x2 | `ramp_1x2` | ″ | ″ | ″ | ″ | Structure > Inclines | all 5 (assumed on some) |
| 19205 | Ramp, 1x2, Shallow | `ramp_1x2_shallow` | ″ | ″ | ″ | ″ | Structure > Inclines | all 5 (assumed on some) |
| 19206 | Ramp, 2x2 | `ramp_2x2` | ″ | ″ | ″ | ″ | Structure > Inclines | all 5 (assumed on some) |
| 19207 | Ramp, 2x2, Steep | `ramp_2x2_steep` | ″ | ″ | ″ | ″ | Structure > Inclines | all 5 (assumed on some) |
| 19208 | Ramp, Circular, Small | `ramp_circular_small` | ″ | ″ | ″ | ″ | Structure > Inclines | all 5 (assumed on some) |
| 19209 | Ramp, Circular, Large | `ramp_circular_large` | ″ | ″ | ″ | ″ | Structure > Inclines | all 5 (assumed on some) |
| 19210 | Ramp, Bridge, Small | `ramp_bridge_small` | ″ | ″ | ″ | ″ | Structure > Inclines | all 5 (assumed on some) |
| 19211 | Ramp, Bridge, Medium | `ramp_bridge_medium` | ″ | ″ | ″ | ″ | Structure > Inclines | all 5 (assumed on some) |
| 19212 | Ramp, Bridge, Large | `ramp_bridge_large` | ″ | ″ | ″ | ″ | Structure > Inclines | all 5 (assumed on some) |
| 19213 | Ramp, XL | `ramp_4x2` | ″ | ″ | ″ | ″ | Structure > Inclines | all 5 (assumed on some) |
| 19214 | Ramp, Stunt | `ramp_stunt` | ″ | ″ | ″ | ″ | Structure > Inclines | all 5 (assumed on some) |
| 19456 | Rock, Small | `rock_small` | 76 `structure_natural` | 150 | 10 | 12 | Structure > Natural | all 5 (assumed on some) |
| 19457 | Rock, Flat | `rock_flat` | ″ | ″ | ″ | ″ | Structure > Natural | all 5 (assumed on some) |
| 19458 | Rock, Medium 1 | `rock_med1` | ″ | ″ | ″ | ″ | Structure > Natural | all 5 (assumed on some) |
| 19459 | Rock, Medium 2 | `rock_med2` | ″ | ″ | ″ | ″ | Structure > Natural | all 5 (assumed on some) |
| 19460 | Rock, Spire 1 | `rock_spire1` | ″ | ″ | ″ | ″ | Structure > Natural | all 5 (assumed on some) |
| 19461 | Rock, Spire 2 | `rock_spire2` | ″ | ″ | ″ | ″ | Structure > Natural | all 5 (assumed on some) |
| 19462 | Rock, Seastack | `rock_seastack` | ″ | ″ | ″ | ″ | Structure > Natural | all 5 (assumed on some) |
| 19463 | Rock, Arch | `rock_arch` | ″ | ″ | ″ | ″ | Structure > Natural | all 5 (assumed on some) |
| 19712 | Grid | `ff_grid` | 77 `ff_grid` | 4 | 100 | 0 | Structure | all 5 (class assumed) |

## Invisible blocks

Game category `structure_blocks`, 11 palette entries, 11 objects.

| Type ID | Name | Internal name | Entry | Shared max | Price | Paradiso row max | Blender Add menu | Can add new on |
|---:|---|---|---:|---:|---:|---:|---|---|
| 19968 | Block, 2x2, Invisible | `block_2x2_invis` | 78 `block_2x2` | 50 | 0 | 0 | Hidden > Invisible | none (no example to learn its class from) |
| 20224 | Block, 1x1, Invisible | `block_1x1_invis` | 79 `block_1x1` | 50 | 0 | 0 | Hidden > Invisible | none (no example to learn its class from) |
| 20480 | Block, 2x2x2, Invisible | `block_3x3_invis` | 80 `block_3x3` | 50 | 0 | 0 | Hidden > Invisible | none (no example to learn its class from) |
| 20736 | Block, 4x4x2, Invisible | `block_4x4_invis` | 81 `block_4x4` | 50 | 0 | 0 | Hidden > Invisible | none (no example to learn its class from) |
| 20992 | Block, 4x4x4, Invisible | `block_5x5_flat_invis` | 82 `block_5x5_flat` | 50 | 0 | 0 | Hidden > Invisible | none (no example to learn its class from) |
| 21248 | Block, 2x1, Flat, Invisible | `block_3x3_flat_invis` | 83 `block_3x3_flat` | 50 | 0 | 0 | Hidden > Invisible | none (no example to learn its class from) |
| 21504 | Block, 1x1, Flat, Invisible | `block_2x2_flat_invis` | 84 `block_2x2_flat` | 50 | 0 | 0 | Hidden > Invisible | none (no example to learn its class from) |
| 21760 | Block, 1x1, Small, Invisible | `block_1x1_flat_invis` | 85 `block_1x1_flat` | 50 | 0 | 0 | Hidden > Invisible | none (no example to learn its class from) |
| 22016 | Block, 2x2, Flat, Invisible | `block_4x4_flat_invis` | 86 `block_4x4_flat` | 50 | 0 | 0 | Hidden > Invisible | none (no example to learn its class from) |
| 22272 | Block, 4x2, Flat, Invisible | `block_4x4_tall_invis` | 87 `block_4x4_tall` | 50 | 0 | 0 | Hidden > Invisible | none (no example to learn its class from) |
| 22528 | Block, 4x4, Flat, Invisible | `block_5x1_flat_invis` | 88 `block_5x1_flat` | 50 | 0 | 0 | Hidden > Invisible | none (no example to learn its class from) |

## MCC additions: Vehicles

Game category `ff_thorage_vehicles`, 10 palette entries, 12 objects.

| Type ID | Name | Internal name | Entry | Shared max | Price | Paradiso row max | Blender Add menu | Can add new on |
|---:|---|---|---:|---:|---:|---:|---|---|
| 22784 | Falcon, Nose Gun | `ff_thorage_falcon_default` | 89 `ff_thorage_falcons` | 16 | 100 | 0 | not offered | none (no example to learn its class from) |
| 22785 | Falcon, Grenadier | `ff_thorage_falcon_grenade` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 22786 | Falcon, Transport | `ff_thorage_falcon_no_guns` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 23040 | Warthog, Transport | `ff_thorage_warthog_troop` | 90 `ff_thorage_warthog_troop` | 16 | 150 | 0 | not offered | none (no example to learn its class from) |
| 23296 | Sabre | `ff_thorage_sabre` | 91 `ff_thorage_sabre` | 16 | 150 | 0 | not offered | none (no example to learn its class from) |
| 23552 | Seraph | `ff_thorage_seraph` | 92 `ff_thorage_seraph` | 16 | 150 | 0 | not offered | none (no example to learn its class from) |
| 23808 | Cart, Electric | `ff_thorage_electric_cart` | 93 `ff_thorage_electric_cart` | 16 | 75 | 0 | not offered | none (no example to learn its class from) |
| 24064 | Forklift | `ff_thorage_forklift` | 94 `ff_thorage_forklift` | 16 | 75 | 0 | not offered | none (no example to learn its class from) |
| 24320 | Pickup | `ff_thorage_pickup` | 95 `ff_thorage_pickup` | 16 | 100 | 0 | not offered | none (no example to learn its class from) |
| 24576 | Truck Cab | `ff_thorage_truck_cab` | 96 `ff_thorage_truck_cab` | 16 | 150 | 0 | not offered | none (no example to learn its class from) |
| 24832 | Van, Oni | `ff_thorage_oni_van` | 97 `ff_thorage_oni_van` | 16 | 75 | 0 | not offered | none (no example to learn its class from) |
| 25088 | Shade, Fuel Rod | `ff_thorage_shade_flak_cannon` | 98 `ff_thorage_shade_flak_cannon` | 8 | 150 | 0 | not offered | none (no example to learn its class from) |

## MCC additions: Gadgets

Game category `ff_thorage_gadgets`, 17 palette entries, 22 objects.

| Type ID | Name | Internal name | Entry | Shared max | Price | Paradiso row max | Blender Add menu | Can add new on |
|---:|---|---|---:|---:|---:|---:|---|---|
| 25344 | Cannon, Man, Forerunner | `mancannon_normal_forerunner` | 99 `gadget_mancannons` | 24 | 100 | 0 | Gadgets > Cannons, Men | none (no example to learn its class from) |
| 25345 | Cannon, Man, Heavy, Forerunner | `mancannon_heavy_forerunner` | ″ | ″ | ″ | ″ | Gadgets > Cannons, Men | none (no example to learn its class from) |
| 25346 | Cannon, Man, Light, Forerunner | `mancannon_light_forerunner` | ″ | ″ | ″ | ″ | Gadgets > Cannons, Men | none (no example to learn its class from) |
| 25347 | Gravity Lift, Forerunner | `ff_cex_gravlift_forerunner` | ″ | ″ | ″ | ″ | Gadgets > Cannons, Men | none (no example to learn its class from) |
| 25348 | Gravity Lift, Tall, Forerunner | `ff_cex_gravlift_tall_forerunner` | ″ | ″ | ″ | ″ | Gadgets > Cannons, Men | none (no example to learn its class from) |
| 25349 | Cannon, Man, Human | `ff_cex_mancannon_human` | ″ | ″ | ″ | ″ | Gadgets > Cannons, Men | none (no example to learn its class from) |
| 25600 | One Way Shield 1 | `door_oneway_xsmall` | 100 `door_oneway_xsmall` | 36 | 200 | 0 | not offered | none (no example to learn its class from) |
| 25856 | One Way Shield 5 | `door_oneway_xlarge` | 101 `door_oneway_xlarge` | 36 | 200 | 0 | not offered | none (no example to learn its class from) |
| 26112 | Shield Wall, Small | `ff_scn_laserwall_small` | 102 `ff_scn_laserwall_small` | 36 | 200 | 0 | not offered | none (no example to learn its class from) |
| 26368 | Shield Wall, Medium | `ff_scn_laserwall_medium` | 103 `ff_scn_laserwall_medium` | 36 | 200 | 0 | not offered | none (no example to learn its class from) |
| 26624 | Shield Wall, Large | `ff_scn_laserwall_large` | 104 `ff_scn_laserwall_large` | 36 | 200 | 0 | not offered | none (no example to learn its class from) |
| 26880 | Shield Wall, X-Large | `ff_scn_laserwall_xlarge` | 105 `ff_scn_laserwall_xlarge` | 36 | 200 | 0 | not offered | none (no example to learn its class from) |
| 27136 | One Way Shield 2 (MCC) | `door_oneway_small_mcc` | 106 `door_oneway_small` | 36 | 200 | 0 | not offered | none (no example to learn its class from) |
| 27392 | One Way Shield 3 (MCC) | `door_oneway_medium_mcc` | 107 `door_oneway_medium` | 36 | 200 | 0 | not offered | none (no example to learn its class from) |
| 27648 | One Way Shield 4 (MCC) | `door_oneway_large_mcc` | 108 `door_oneway_large` | 36 | 200 | 0 | not offered | none (no example to learn its class from) |
| 27904 | Shield Door, Small (MCC) | `door_shield_small_mcc` | 109 `door_shield_small` | 36 | 200 | 0 | not offered | none (no example to learn its class from) |
| 28160 | Shield Door, Small 1 (MCC) | `door_shield_small1_mcc` | 110 `door_shield_small1` | 36 | 200 | 0 | not offered | none (no example to learn its class from) |
| 28416 | Shield Door, Large (MCC) | `door_shield_large_mcc` | 111 `door_shield_large` | 36 | 200 | 0 | not offered | none (no example to learn its class from) |
| 28672 | Shield Door, Large 1 (MCC) | `door_shield_large1_mcc` | 112 `door_shield_large1` | 36 | 200 | 0 | not offered | none (no example to learn its class from) |
| 28928 | Ammo Cabinet | `ff_thorage_ammo_box` | 113 `ff_thorage_ammo_box` | 12 | 250 | 0 | Gadgets | none (no example to learn its class from) |
| 29184 | Spnkr Ammo | `ff_thorage_rocket_ammo` | 114 `ff_thorage_rocket_ammo` | 12 | 50 | 0 | not offered | none (no example to learn its class from) |
| 29440 | Sniper Ammo | `ff_thorage_sniper_ammo` | 115 `ff_thorage_sniper_ammo` | 12 | 50 | 0 | not offered | none (no example to learn its class from) |

## MCC additions: Scenery

Game category `ff_thorage_scenery`, 17 palette entries, 34 objects.

| Type ID | Name | Internal name | Entry | Shared max | Price | Paradiso row max | Blender Add menu | Can add new on |
|---:|---|---|---:|---:|---:|---:|---|---|
| 29696 | Jersey Barrier | `ff_scn_jerseybarrier` | 116 `ff_scn_barricades` | 36 | 50 | 0 | Scenery > Barricades | Paradiso (class assumed) |
| 29697 | Jersey Barrier, Short | `ff_scn_jerseybarrier_short` | ″ | ″ | ″ | ″ | Scenery > Barricades | Paradiso (class assumed) |
| 29698 | Heavy Barrier | `dlc_invasion_heavy_shield` | ″ | ″ | ″ | ″ | Scenery > Barricades | Paradiso (class assumed) |
| 29952 | Crate, Small, Closed | `ff_scn_crate_small_closed` | 117 `ff_scn_crates` | 50 | 25 | 0 | Scenery > Crates | Paradiso (class assumed) |
| 29953 | Crate, Metal, Multi | `ff_scn_crate_metal` | ″ | ″ | ″ | ″ | Scenery > Crates | Paradiso (class assumed) |
| 29954 | Crate, Metal, Single | `ff_scn_crate_metal_single` | ″ | ″ | ″ | ″ | Scenery > Crates | Paradiso (class assumed) |
| 29955 | Crate, Fully Open | `ff_scn_cov_crate_b` | ″ | ″ | ″ | ″ | Scenery > Crates | Paradiso (class assumed) |
| 29956 | Crate, Forerunner, Small | `ff_cex_crate_forerunner_sm` | ″ | ″ | ″ | ″ | Scenery > Crates | Paradiso (class assumed) |
| 29957 | Crate, Forerunner, Large | `ff_cex_crate_forerunner_lg` | ″ | ″ | ″ | ″ | Scenery > Crates | Paradiso (class assumed) |
| 30208 | Pallet | `ff_scn_pallet` | 118 `ff_scn_pallets` | 36 | 50 | 0 | Scenery > Palletes | Paradiso (class assumed) |
| 30209 | Pallet, Large | `ff_scn_pallet_large` | ″ | ″ | ″ | ″ | Scenery > Palletes | Paradiso (class assumed) |
| 30210 | Pallet, Metal | `ff_scn_pallet_metal` | ″ | ″ | ″ | ″ | Scenery > Palletes | Paradiso (class assumed) |
| 30464 | Driftwood 1 | `dlc_medium_driftwood_a` | 119 `structure_decorative` | 36 | 25 | 0 | Structure > Natural | Paradiso (class assumed) |
| 30465 | Driftwood 2 | `dlc_medium_driftwood_b` | ″ | ″ | ″ | ″ | Structure > Natural | Paradiso (class assumed) |
| 30466 | Driftwood 3 | `dlc_medium_driftwood_c` | ″ | ″ | ″ | ″ | Structure > Natural | Paradiso (class assumed) |
| 30720 | Phantom | `ff_thorage_phantom` | 120 `ff_vehicles` | 24 | 100 | 0 | not offered | none (no example to learn its class from) |
| 30721 | Spirit | `ff_thorage_spirit` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 30722 | Pelican | `ff_thorage_pelican` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 30723 | Drop Pod, Elite | `ff_thorage_drop_pod_elite` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 30724 | Anti Air Gun | `ff_thorage_anti_air_cannon` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 30976 | Cargo Truck, Destroyed | `ff_thorage_cargo_truck_destroyed` | 121 `ff_thorage_destroyed` | 12 | 100 | 0 | not offered | none (no example to learn its class from) |
| 30977 | Falcon, Destroyed | `ff_thorage_falcon_destroyed` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 30978 | Warthog, Destroyed | `ff_thorage_warthog_destroyed` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 31232 | Folding Chair | `ff_scn_chair_folding` | 122 `ff_scn_chair_folding` | 30 | 10 | 0 | not offered | none (no example to learn its class from) |
| 31488 | Dumpster | `ff_scn_dumpster` | 123 `ff_scn_dumpster` | 30 | 10 | 0 | Scenery | Paradiso (class assumed) |
| 31744 | Dumpster, Tall | `ff_scn_dumpster_tall` | 124 `ff_scn_dumpster_tall` | 30 | 10 | 0 | Scenery | Paradiso (class assumed) |
| 32000 | Equipment Case | `ff_thorage_equipment_case` | 125 `ff_thorage_equipment_case` | 30 | 10 | 0 | not offered | none (no example to learn its class from) |
| 32256 | Monitor | `ff_thorage_monitor_flush` | 126 `ff_thorage_monitor_flush` | 30 | 10 | 0 | not offered | none (no example to learn its class from) |
| 32512 | Plasma Storage | `ff_scn_cov_storage` | 127 `ff_scn_cov_storage` | 30 | 10 | 0 | not offered | none (no example to learn its class from) |
| 32768 | Camping Stool, Covenant | `ff_scn_cov_stool` | 128 `ff_scn_cov_stool` | 30 | 10 | 0 | not offered | none (no example to learn its class from) |
| 33024 | Covenant Antenna | `ff_scn_cov_antenna` | 129 `ff_scn_cov_antenna` | 30 | 10 | 0 | not offered | none (no example to learn its class from) |
| 33280 | Fuel Storage | `ff_thorage_fuel_storage` | 130 `ff_thorage_fuel_storage` | 30 | 10 | 0 | not offered | none (no example to learn its class from) |
| 33536 | Engine Cart | `dlc_slayer_cart_a` | 131 `dlc_slayer_cart_a` | 30 | 10 | 0 | not offered | none (no example to learn its class from) |
| 33792 | Missile Cart | `dlc_slayer_cart_b` | 132 `dlc_slayer_cart_b` | 30 | 10 | 0 | not offered | none (no example to learn its class from) |

## MCC additions: Structure

Game category `ff_thorage_structure`, 5 palette entries, 36 objects.

| Type ID | Name | Internal name | Entry | Shared max | Price | Paradiso row max | Blender Add menu | Can add new on |
|---:|---|---|---:|---:|---:|---:|---|---|
| 34048 | Bridge | `dlc_bridge_down` | 133 `structure_bridges` | 150 | 10 | 0 | Structure > Bridges And Platforms | Paradiso (class assumed) |
| 34049 | Platform, Covenant | `ff_cex_platform_cov` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 34050 | Catwalk, Straight | `ff_cex_catwalk_straight` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 34051 | Catwalk, Short | `ff_cex_catwalk_short` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 34052 | Catwalk, Bend, Left | `ff_cex_catwalk_bend_left` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 34053 | Catwalk, Bend, Right | `ff_cex_catwalk_bend_right` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 34054 | Catwalk, Angled | `ff_cex_catwalk_angled` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 34055 | Catwalk, Large | `ff_cex_catwalk_lg` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 34304 | Bunker, Overlook | `ff_cex_bunker` | 134 `structure_buildings` | 36 | 150 | 0 | Structure > Buildings | Paradiso (class assumed) |
| 34305 | Gunners Nest | `ff_cex_gunner_nest` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 34560 | Cover, Small | `ff_cex_cover_sm` | 135 `structure_decorative` | 300 | 50 | 0 | not offered | none (no example to learn its class from) |
| 34561 | Block, Large | `ff_cex_large_block` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 34562 | Blocker, Hallway | `ff_cex_hallway_blocker` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 34563 | Column, Stone | `ff_cex_stone_column` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 34564 | Tombstone | `ff_cex_tombstone` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 34565 | Cover, Large, Stone | `ff_cex_stone_block` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 34566 | Cover, Large | `ff_cex_cover_lg` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 34567 | Walkway Cover | `ff_thorage_cover_sm` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 34568 | Walkway Cover, Short | `ff_cex_walkway_cover_short` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 34569 | Cover, Large, Human | `ff_thorage_cover_lg` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 34570 | I-Beam | `ff_cex_i_beam` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 34816 | Wall (MCC) | `wall_mcc` | 136 `structure_doors` | 150 | 10 | 0 | Structure > Doors, Windows, And Walls | Paradiso (class assumed) |
| 34817 | Door (MCC) | `door_mcc` | ″ | ″ | ″ | ″ | Structure > Doors, Windows, And Walls | Paradiso (class assumed) |
| 34818 | Door, Human | `ff_cex_door_human` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 34819 | Door A, Forerunner | `ff_cex_door_forerunner_a` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 34820 | Door B, Forerunner | `ff_cex_door_forerunner_b` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 34821 | Door C, Forerunner | `ff_thorage_door_c` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 34822 | Door D, Forerunner | `ff_thorage_door_d` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 34823 | Door E, Forerunner | `ff_thorage_door_e` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 34824 | Door F, Forerunner | `ff_thorage_door_f` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 34825 | Door G, Forerunner | `ff_thorage_door_g` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 34826 | Door H, Forerunner | `ff_thorage_door_h` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 34827 | Wall, Small, Forerunner | `ff_cex_wall_sm_forerunner` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 34828 | Wall, Large, Forerunner | `ff_cex_wall_lg_forerunner` | ″ | ″ | ″ | ″ | not offered | none (no example to learn its class from) |
| 35072 | Rock, Spire 3 | `dlc_medium_stone_b` | 137 `structure_natural` | 150 | 10 | 0 | Structure > Natural | Paradiso (class assumed) |
| 35073 | Tree, Dead | `ff_cex_tree_life` | ″ | ″ | ″ | ″ | Structure > Natural | Paradiso (class assumed) |

## MCC additions: Hidden

Game category `ff_thorage_hidden`, 3 palette entries, 3 objects.

| Type ID | Name | Internal name | Entry | Shared max | Price | Paradiso row max | Blender Add menu | Can add new on |
|---:|---|---|---:|---:|---:|---:|---|---|
| 35328 | Generator | `ff_thorage_generator` | 138 `ff_thorage_generator` | 50 | 0 | 0 | Hidden | none (no example to learn its class from) |
| 35584 | Vending Machine | `ff_thorage_vending_machine` | 139 `ff_thorage_vending_machine` | 50 | 0 | 0 | Hidden | none (no example to learn its class from) |
| 35840 | Dinghy | `ff_thorage_dinghy` | 140 `ff_thorage_dinghy` | 50 | 0 | 0 | not offered | none (no example to learn its class from) |

## MCC additions: More

Game category `ff_thorage_more`, 4 palette entries, 4 objects.

| Type ID | Name | Internal name | Entry | Shared max | Price | Paradiso row max | Blender Add menu | Can add new on |
|---:|---|---|---:|---:|---:|---:|---|---|
| 36096 | Target Designator | `ff_thorage_airstrike` | 141 `ff_thorage_airstrike` | 1 | 150 | 0 | not offered | none (no example to learn its class from) |
| 36352 | Pelican, Hovering | `ff_thorage_pelican_flyable` | 142 `ff_thorage_pelican_flyable` | 16 | 150 | 0 | not offered | none (no example to learn its class from) |
| 36608 | Phantom, Hovering | `ff_thorage_phantom_flyable` | 143 `ff_thorage_phantom_flyable` | 16 | 150 | 0 | not offered | none (no example to learn its class from) |
| 36864 | Location Name | `obj_location_name` | 144 `obj_location_name` | 64 | 0 | none | not offered | none (entry not in any template) |
