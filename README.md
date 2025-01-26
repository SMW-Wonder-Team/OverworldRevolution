Thank you for downloading Overworld Revolution! This may be a complicated patch to use, but great things await if you can master using it. Compared to before, the possibilities for your custom overworld are virtually endless with this patch.
If you need assistance, feel free to ask in the release thread on SMWCentral's "Resources & Tool Releases" forum or message me on Discord (I'm yoshifanatic1).

===Table of Contents===
- Notes About Lunar Magic
- For UberASM Tool Support
- For AddmusicK Support
- For SRAM/BW-RAM Plus Support
- For Lunar Magic's "VRAM Patch" Optimization Patch Support
- Supporting Other Patches
- Custom Sprite Programming
- Script Editing
	- Setting Up A Warp
	- Using Multiple Songs Per Map
- Tips
- Known Bugs
- Credits

===Notes About Lunar Magic===
- DO NOT UNDER ANY CIRCUMSTANCES CLICK THE SAVE BUTTON IN THE OVERWORLD EDITOR! You will not only corrupt the Overworld Revolution patch, but you'll also create leaked freespace.

- If you saved an overworld in the editor before using this patch, my patch will remove all the overworld hijacks LM inserts as of version 3.40, along with all the leftover vanilla overworld data. But, only if its the first time applying the patch.

- The original level sprites are not supported for overworld maps. Placing them in a level acting as an overworld map can crash the game (unless they happen to be sprites whose IDs correspond to the overworld sprites' IDs). For this reason, I HIGHLY recommend deleting the original level data on the sublevels you intend on using for your overworld.

- You need to make Lunar Magic insert various level related ASM hacks before you can use OR. The provided .mwl files will insert all of the necessary ones, so I recommend inserting at least one.

- You can use the overworld editor for layer 3 tilemap editing, title screen editing, credits editing, and installing/uninstalling the title screen recording ASM. Everything else should be avoided since they require saving the overworld.
My patch allows you to edit everything else the overworld editor can do anyway.

- Do not use the vertical level modes for your overworld. My code doesn't support them. Change the horizontal level mode to 1B (19 for layer 2 maps) if you want the vanilla vertical layout.

- Rename the .s16, .mwt, mw2, and .ssc files to match your ROM's name. This will allow LM to display the overworld sprites in the level editor.

- Since levels and overworlds now share global ExAnimations, you probably should disable global ExAnimations for your overworld maps. If you press Ctrl+Alt+F7 in the main editor, you can enable the ability to sacrifice the global ExAnimations for more local ExAnimation slots.
That way, you'll still have access to the same number of ExAnimation slots for your overworld maps.

- If you set a secondary entrance to go to the overworld with "Teleport to location index (0-FF)" set, you'll need to use a script that checks !RAM_SMW_Overworld_TeleportToLocationIndex to determine what to do. It won't work on its own otherwise.

- Unlike levels, every overworld map must have a custom palette. If you don't, then there is no "default" palette that will load and you'll just get a blacked out screen (not counting any dynamically loaded colors).

- You can use the original level objects in your overworld maps for their aesthetics. But, you'd be better off with custom objects made specifically for the overworld (assuming FuSoYa ever implements custom object support into Lunar Magic...)

- Disabling vertical scrolling will cause the camera to lock onto the topmost row of subscreens. Likewise, disabling horizontal scrolling will lock the camers to the leftmost column of subscreens. 



===For UberASM Tool Support===
- My patch supports UberASM 2.0. Don't use an earlier version.

- Apply Overworld Revolution after using UberASM Tool. My patch will detect UberASM's presence to slightly change its behavior.

- Go into the base folder, open up main.asm, then comment out the "incsrc overworld.asm" in both. This will stop UberASM Tool from inserting its overworld related hijacks. You'll also need to comment out the two hijacks that insert a JML to "CallOverworldMainEnd" and "CallOverworldInit" in main.asm.

- Insert your overworld UberASM code as level ASM, not as overworld ASM.

- Add the extra indented code to each of the following routines in level.asm:

CallLevelInit:
    sep #$30
    phb
    %CallLevelResources($00)
    plb
	LDA.w $0DE1|!addr	;\ Overworld Revolution specific code
	BEQ.b +			;|
	RTL			;|
	+:			;/
; return back from hijack -- first instruction back sets A/X/Y back to 8-bit, which we've already done
; restore clobbered jsr $00919B
    phk
    pea .return-1
    pea $84CF-1
    jml $00919B|!bank
.return
    jml $00A5F3|!bank

CallLevelMain:
    phb

    ; TODO: this may wind up calling 7F8000 twice in mode 7 boss fights; check on this
    lda $13D4|!addr
    bne +
    jsl $7F8000
+

    %CallLevelResources($02)
    plb
	LDA.w $0DE1|!addr	;\ Overworld Revolution specific code
	BEQ.b +			;|
	RTL			;|
	+:			;/
; return back from hijack
    lda $13D4|!addr
    beq +
    jml $00A25B|!bank
+    
    jml $00A28A|!bank

CallLevelEnd:
    sta $1C                 ; restore clobbered

    phb
    %CallLevelResources($04)
    plb
	LDA.w $0DE1|!addr	;\ Overworld Revolution specific code
	BEQ.b +			;|
	RTL			;|
	+:			;/
; return back from hijack, which just jumps to the OAM prep routine

    jml $008494|!bank

- Add the extra indented code to each of the following routines in nmi.asm:

; level nmi
; run for GMs 13 & 14
.Level:
    if !UberLevelNMI
        lda $0100|!addr
        cmp #$13
        beq +
        cmp #$14
        	BEQ.b +		;\ Overworld Revolution specific code
        	CMP.b #$0D	;|
        	BEQ.b +		;|
        	CMP.b #$0E	;|
        	BEQ.b +		;|
		JMP.w .Return	;/
    +
    endif

===For AddmusicK Support===
- Apply Overworld Revolution after using AddmusicK. My patch will detect AddmusicK's presence to slightly change its behavior.

- Go into Tweaks.asm and comment out the org commands and their respective code that modify bank $04 (ie. org $04XXXX). This will allow you to re-run AddmusicK without needing to reapply Overworld Revolution.

- Also comment out the hijack at $00A0B3 in tweaks.asm. That one will mess up overworld loading otherwise.

- Make sure to tweak all the sound and music ID defines in compliance with AddmusicK's changes. Look at "Addmusic_list.txt" and "Addmusic_sound effects.txt".



===For SRAM/BW-RAM Plus Support===
- Set !Define_SMW_Global_UsingAltSaveSystem to !TRUE in my patch. This will stop my patch from modifying the save/load routines.

- I recommend putting an incsrc command near the top of OverworldRevolution.asm to the main SRAM/BW-RAM Plus patch. That way, you can directly reference its code from within Overworld Revolution.

- Go to "LoadSaveFileData" in OverworldRevolution.asm and replace the warn command with code that will JSL to the save system's load file routine (as well as perform any setup needed beforehand).

- For BW-RAM Plus specifically, change the RTS above the "load_init_vals:" label with RTL, and the JSR to load_routine with a JSL. That will allow you to JSL to load_routine if you insert an incsrc command to BW-RAM Plus in OverworldRevolution.asm.

- For SRAM Plus specifically, comment out the changes to $1EA2-$1FD5/$7EA2-$7FD5 that this patch makes, because my patch also remaps these and changes how the routine at $009F06 works.



===For Lunar Magic's "VRAM Patch" Optimization Patch Support===
- Add "	cmp #$0E : beq .ok" below the "	lda $0100|!addr ". That will allow this patch to run on the overworld.

- Apply Overworld Revolution after applying this patch. My patch will detect it to slightly change its behavior.



===Supporting Other patches===
- Because my patch reworks the overworld completely, no existing patches that modify the overworld will work. The vast majority of patches that affect other parts of the game should be fine.

- If you want to detect my patch is inserted, do if read4($048000) == $524F4659. That value is "YFOR" in Ascii. You can optionally check the 16-bit value at $048004 for a version number.

- RAM related changes:
+ $13BF, $1F11, and $1F12 are now 16-bit.
+ $0DD6 is now the current character x 2 instead of x 4.
+ $1DEA and $13CE don't need to be set when exiting to the overworld.
+ The bits in $1EA2 have changed. Look in "ExpandAvailableLevelAndEventSlots.asm" for info.
+ The save buffer at $1F49 is no longer used. It's now used to hold the extra save data if !Define_SMW_Overworld_EnableMoreLevelsAndEvents is enabled. This also means a custom save file loading routine is used to properly handle game overs.
+ $1EA2's flags are arrannged differently and this table can be indexed with 16-bit X/Y.
+ $7F0A00-$7F7FFF is completely unused ($7F0000-$7F7FFF if the SA-1 patch is used).
+ RAM tables $1F2F, $1F3C, and $1FEE are unused (or only $1FEE if !Define_SMW_Overworld_EnableMoreLevelsAndEvents is enabled). Their bits are now stored in $1EA2. 
+ The overworld specific uses of $7EC800-$7EFFFF are unused. This is particularly notable for $7ED000-$7ED7FF, as that was the translevel numbers for the overworld tilemap (ie. $13BF's value)

- Code changes:
+ Anything found in bank 04 normally is overwritten with the new overworld stuff and/or cleared out. Comment out any hijacks in those patches that write to/read from bank 04.
+ Gamemode 0C's area ($00A06B-$00A194) has been completely altered. Use UberASM instead for custom gamemode 0C code, if possible.
+ Overworld sprites are no longer loaded on title screen load at $009AA4. This may trip up some patches.

- The following UberASM codes/patches are implemented in some form in my patch.
Directly integrated:
+ (Patch) SA-1 Pack (MaxTile implementation only) by Vitor Vilela
+ (Patch) Bonus Game Midpoint Fix by yoshifanatic
+ (Patch) Widescreen Overworld by Medic

My patch has the same functionality, but with a different, usually better, implementation:
+ (Tool) Lunar Magic (Overworld ASM hacks) by FuSoYa
+ (Tweak) Disable Intro Level by Kevin
+ (Tweak) HDMA Break Fix (Overworld portion of it only) by Kevin
+ (Tweak) Disable exchanging Lives with 2nd Player by Stivi
+ (Tweak) Overworld Mario Background with 16x16 Tiles by Kevin
+ (Tweak) Disable Overworld Lives by Kevin
+ (Tweak) Change Overworld Arrow Palette by Thomas
+ (Tweak) Change Exits Count by Kevin
+ (Tweak) Modify Intro Message Timer by MarkAlarm
+ (Tweak) Remove Yoshi's Rescue Message by Kevin
+ (Tweak) Change Level Name Palette by Thomas
+ (Tweak) Change Overworld Life Counter Palette by Thomas
+ (Tweak) Change Life Exchange Palettes by Thomas
+ (Tweak) Event Path Fade Speed by Kevin
+ (Tweak) Partial Overworld Red Yoshi Fix by Heitor Porfirio
+ (Patch) Manual Overworld Insert by yoshifanatic
+ (Patch) 100 Exits by Alcaro
+ (Patch) Boost Overworld Events (for SA-1) by Kevin
+ (Patch) Switch Palace RAM Optimizer by Sonikku
+ (Patch) Overworld Exit Smoother by Alcaro
+ (Patch) Easier OW Mario Editor by Ladida
+ (Patch) Free $7F0000 (OW Event Restore) by Erik and Kaijyuu
+ (Patch) Free 7F4000 by RPG Hacker
+ (Patch) Castle Destruction Fix by Thomas
+ (Patch) Separate Overworld Luigi Graphics by Erik
+ (Patch) Overworld Music Disable Fix by imamelia
+ (Patch) Remove Overworld Border Mario by Kevin
+ (Patch) Custom Overworld Border Player Background by Kevin
+ (Patch) Player's BG OW Tile/Palette Changer by wiiqwertyuiop
+ (Patch) Extended Overworld Level Names by Smallhacker
+ (UberASM) Update Player Animation During Overworld Load by Kevin, zuccha
+ (UberASM) Reload Layer 3 During Submap Transitions by Kevin

Script editing offers similar functionality:
+ (Tweak) RPG Overworld by Telinc1
+ (Tweak) Disable Automatic Movement on Level Completion by Telinc1
+ (Tweak) Silent Overworld After Boss Fix by Kevin
+ (Tweak) Remove "MARIO START!" by Stivi
+ (Tweak) Always Use "MARIO/LUIGI START!" by Heitor Porfirio
+ (Tweak) Remove Clouds on Main Map by Heitor Porfirio
+ (Tweak) Change Submap To Delay the Monty Mole's Jumping Out by Heitor Porfirio
+ (Tweak) Don't Override "No Yoshi Intro" for Levels 10D, 10E, 110, 111, 11C by Kevin
+ (Patch) Per-Level Overworld Music Fadeout Disable by Kevin
+ (Patch) Per-Level Bone-Throwing flags for Dry Bones by Erik
+ (Patch) Restore and Customize Overworld Intro March by Kevin
+ (Patch) Custom Overworld Hardcoded Paths by Kevin
+ (Patch) Overworld Layer 1 Events by Kevin
+ (Patch) Per-Level Overworld Music Fadeout Disable by Kevin
+ (Patch) Different Submap Switching Transition by Kevin
+ (Patch) Multiple Overworld Earthquakes by Ersanio
+ (Patch) Change Castle Re-Entry Input by Thomas
+ (Patch) Continue Music by MarioFanGamer
+ (Patch) Per Level "Mario Start!" Enable/Disable by Kevin
+ (Patch) Event Camera Scroll by Kevin
+ (Patch) Overworld Event Debugger by Koopster
+ (Patch) Bring Up Save Prompt by Pressing Select by Koopster
+ (Patch) Level Dependent Yoshi Message by Alcaro
+ (Patch) Event Path Reveal Speed Customizer by Koopster
+ (Patch) Level Depending On Ram Address by Deflaktor
+ (Patch) Level Depending On Event by Deflaktor
+ (Patch) Multiple Songs on Main Map by smkdan
+ (Patch) Overworld Speed Changer by wye, carol
+ (Patch) Level Specific Speeds for Monty Moles and Hammers by Lui
+ (Patch) Enter Level/Pipe/Star Road Sounds by Ersanio and Moltz
+ (Patch) Yoshi Coin Overworld Tile Locks by Thomas
+ (Patch) Free overworld by TheBiob
+ (Patch) Autosave by Alcaro
+ (Patch) Level 24 Hack by imamelia
+ (UberASM) Press R to Change Power-up on Overworld by AmperSam
+ (UberASM) Press R to Switch Mario and Luigi Overworld by Bensalot
+ (UberASM) Autosave + Bring Up Save Prompt by pressing Select by Alcaro, Erik, westslasher2
+ (UberASM) Overworld Songs Based on Event by Kevin
+ (UberASM) Ultimate Overworld Level Flags by Nowieso



===Custom Sprite Programming===
Here are some specifics for programming your own custom overworld sprites:

- A is 16-bit, X/Y is 8-bit.
- Sprite RAM tables are arranged into 32-bit entries. Only the X/Y/Z position tables take advantage of that, while every other instance is two 16-bit tables grouped together.
- The Data Bank Register is automatically set before calling the sprite. No need to do a PHB : PHK : PLB : JSR.w Sub : PLB bank wrapper. Just make sure that the DBR is $00-$3F/$80-$BF before exiting the sprite code.
- X is used to index sprite RAM tables. X is automatically restored after exiting the sprite code, so you don't need to preserve/restore it before exiting the sprite code. 
- The graphics routine should be the last thing processed by the sprite, not the first. If it's not, you'll need to set X/Y to 8-bit and restore X using !RAM_SMW_Sprites_CurrentlyProcessedOverworldSprite before exiting your graphics routine.
- All sprites call SubOffscreen prior to being called.
- MaxTile is used for sprite OAM handling, even if not using the SA-1 patch. The base SNES version of it doesn't support legacy mode, but should otherwise function the same.
- Refer to SpriteHandlingMain.asm to see how to utilize the various sharedroutines overworld sprites have.
- If a sprite has a non-zero Z position, it will automatically draw a shadow.
- $9D works slightly differently compared to in levels. $01 = Freeze sprites, like in levels. $02 = Sprites are not processed at all.



===Script Editing===
In order to enable a lot of the functionality my patch offers, overworld Mario is programmed using a custom scripting language. This means that stuff like path movement, events, entering a level, exiting a level, and more are fully programmable. So, if you want more than just the vanilla overworld scripting, you're going to need to learn how to use it.

You should be able to learn by example by looking at how the script commands are used, their names, and their descriptions/macro definitions in Defines.asm. Take advantage of the fact that the default scripts recreate every aspect of the vanilla overworld.

However, if necessary, I'll add explanations here as needed if anything seems unintuitive or needs further clarification.


=Setting Up A Warp=
There are two ways to do this. Method 1 buffers an entrance ID (can be a main or secondary entrance), followed by one of two commands depending on whether you want the warp to take you to a level or an overworld map.

	%ScriptCommand_SetWarpDestination(MainEntrance, $0000)
	%ScriptCommand_BeginLevelWarp()

	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $0000)
	%ScriptCommand_BeginOverworldWarp()

Note that the default shared level entry, path exit, pipe warp, and star warp scripts already end in these warp commands. Call those scripts unless you're planning on defining custom behavior for these warps.

Method 2 allows you to teleport the overworld player to the specified coordinates, triggering a warp if the destination is not in the current map:

	%ScriptCommand_TeleportOverworldPlayerToCoords(!Define_SMW_YoshisHouse_XPosOfTile, !Define_SMW_YoshisHouse_YPosOfTile, !Define_SMW_Overworld_YoshisIslandSublevel)

=Using Multiple Songs Per Map=
Using the following command in a script will force the overworld to use the song specified until a #$00 is stored into !RAM_SMW_Overworld_MusicOverride to disable this behavior.

	%ScriptCommand_OverrideCurrentMapMusic(GhostHouse)

This song ID is saved to SRAM, so it will persist even if you reload the save file.

Because this command forces every map of the overworld to use the specified song, if you need a different song for a different map, you'll need to change the value in !RAM_SMW_Overworld_MusicOverride before loading the new map.
You can do that with this command to buffer the change so it'll take effect when the new map loads:

	ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Overworld_MusicOverride, CaveDrums)



===Tips===
- Using the "Wait X Frames" command to wait 1 frame allows the script to delay further processing for the current frame. Good for when you want to divide certain tasks to run on different frames or for loops that only need to run once per frame.
Certain commands will do this on their own if their function would logically happen over multiple frames.

- For debugging purposes, you could use the "End Script" command to make Mario enter a free walking state to ignore paths.

- Using this patch requires a lot of planning. It may help to plan out how your levels will connect before commiting to it in your scripts.

- You can copy overworld tilemap data from LM's overworld editor into the map16 editor with ctrl+c/ctrl+v. Good for if you have an existing overworld you want to convert or work around the limitations of editing map16 data.

- When editing events, it may help to copy/paste the tiles you'll use into an empty part of the map16 data so you can visualize how the individual tiles connect.



===Known Bugs===
- Closing a message box in a level when using the SA-1 patch sometimes causes 1 frame of V-Blank lag. To avoid this, make use of any patches that increase V-Blank time, particularly the 'Lunar Magic's "VRAM Patch" Optimization' patch I already recommended using.

- Events sometimes cause flicking at the top of the screen. This is caused by V-Blank lag when too much is being done during V-Blank. Same fix as the above, but you can also mitigate it further by limiting how many tiles you update at a time, disabling the path fade effect, and limiting how many tiles/palettes ExAnimation updates.

- The path transition effect sometimes has some glitchy scanlines when removing the border. This is a vanilla bug that's more noticable when this effect is expanded to fill the full screen. SMW doesn't double buffer its windowing HDMA effects, and fixing this is kind of beyond the scope of my patch.



===Credits===
Here are all the people that helped make this patch possible:
- Yoshifanatic (Main patch maker)
- Soul (Guy that got me motivated to make this patch)
- Vitor Vilela (MaxTile implementation)
- Medic ("Widescreen Overworld" patch)
- Atari2.0/JackTheSpades/Tattletale (PIXI's ChangeMap16 routine).
- FuSoYa (Lunar Magic's level related ASM hacks)
- LMPuny (Main beta tester)
- DPBOX (Main beta tester)
- Stivi (Main beta tester)
- Rykon-V73 (Minor beta tester)
- h.carrell (Minor beta tester)


