include

!FALSE = $00
!TRUE = $01

; Global Settings
!Define_SMW_MessageText_UsingAltMessagingSystem = !FALSE				; Set this to !TRUE if you are using a custom message system, like VWF Dialogues or b4vwf. This will remove the code for my message system so you can integrate the one you're using into this patch.
!Define_SMW_Global_UsingAltSaveSystem = !FALSE							; Set this to !TRUE if you are using a custom save system, like SRAM/BW-RAM Plus. This will remove the code for my save system so you can integrate the one you're using into this patch.																		;/ If you plan on using a different save system like SRAM/BW-RAM Plus, you may need to make some adjustments to this and that patch.
!Define_SMW_Global_UsingAltFileSelectMenu = !FALSE						; Set this to !TRUE if you are using a custom file select menu. This will disable the hijacks that affect it so my patch won't interfere with your changes.
!Define_SMW_Overworld_StartOfEventTileMap16 = $1200					; Where the map16 tiles intended for events is stored. This makes it easy to remap them if the default page is already in use in your hack.
!Define_SMW_Overworld_StartOfInteractiveTileMap16 = $0200				; Where the map16 tiles intended to be interacted with are stored.
!Define_SMW_Overworld_EndOfInteractiveTileMap16 = $0295				; The last map16 tile ID of the interactable tiles. This is to prevent glitches if an invalid tile is being touched.
!Define_SMW_Overworld_AllowEditingTheBackAreaColor = !FALSE						; When !FALSE, this prevents editing the back area color so the continue/end screen and overworld prompts won't cause visual issues.
																				; Set this to !TRUE only if you don't plan on using the default continue/end screen or overworld prompts and want to use this color.

; Level/Event Count Settings
!Define_SMW_Counter_TotalExits = 96												; How many exits you need to display the special 96 tile in the file select menu.
!Define_SMW_Overworld_EnableMoreLevelsAndEvents = !FALSE						;\ Set this to !TRUE and the number of available level slots and events will increase from 96/120 to 256/256.
																				;/ Note that enabling this will alter the save file format and parts of the save system to accomidate for the increased number of bits needed.
!Define_SMW_FileSelect_ExitCountDisplay = !ExitCountDisplay_FixedVanilla	; Determines how the file select menu displays its exit count.
	!ExitCountDisplay_FixedVanilla = $00									; Allows displaying up to a 3 digit exit counts correctly. Basically what vanilla should support, but doesn't.
	!ExitCountDisplay_5Digits = $01											; Allows displaying up to a 5 digit exit counts correctly.
!Define_SMW_FileSelect_ExitCountPalette = $06									; Palette row used for the exit count of files without 100% exits. Valid values are $00-$07
!Define_SMW_FileSelect_MaxExitCountPalette = $06								; Palette row used for the exit count of files with 100% exits. Valid values are $00-$07
!Define_SMW_FileSelect_SpecialTilesAtMaxExits = !TRUE							; Set this to !TRUE to enable displaying the 96* tiles when 100% exits are gotten.
!Define_SMW_Overworld_SaveCollectablesToSRAM = !TRUE							; Set this to !FALSE if you want the vanilla behavior of Yoshi Coins, 1up checkpoints, and 3-up moon collection flags not being saved to SRAM.

; Overworld Player Settings
!Define_SMW_Overworld_MarioStartingMap = !Define_SMW_Overworld_YoshisIslandSublevel
!Define_SMW_Overworld_MarioStartingAnimation = !Const_SMW_OWPlayerAnimation_Walking
!Define_SMW_Overworld_MarioStartingXPos = (!Define_SMW_YoshisHouse_XPosOfTile<<4)+$00
!Define_SMW_Overworld_MarioStartingYPos = (!Define_SMW_YoshisHouse_YPosOfTile<<4)+$10
!Define_SMW_Overworld_LuigiStartingMap = !Define_SMW_Overworld_YoshisIslandSublevel
!Define_SMW_Overworld_LuigiStartingAnimation = !Const_SMW_OWPlayerAnimation_Walking
!Define_SMW_Overworld_LuigiStartingXPos = (!Define_SMW_YoshisHouse_XPosOfTile<<4)+$00
!Define_SMW_Overworld_LuigiStartingYPos = (!Define_SMW_YoshisHouse_YPosOfTile<<4)-$06
!Define_SMW_Overworld_MarioGFXVRAMAddress = $6060						;\ The address in VRAM the player graphics are uploaded to. Valid values are between $6XX0-$7XX0.
!Define_SMW_Overworld_LuigiGFXVRAMAddress = $6080						;/ Note that the player sprites upload a 16x16 tile, so the three 8x8 tiles to the right and below this address are written to.
!Define_SMW_Overworld_MarioPalette = $0A								; The palette row used by overworld Mario. Valid values are $08-$0F.
!Define_SMW_Overworld_LuigiPalette = $0B								; The palette row used by overworld Luigi. Valid values are $08-$0F.

; Path Movement Settings
; You're not limited to just 2 speeds. You can create more of these defines if desired.
!Define_SMW_Overworld_WalkingSubpixelSpeed = $D0						; How many subpixels Mario moves while walking
!Define_SMW_Overworld_WalkingSpeedMultiplier = "MultiplyBy1"			; How many times the above speed is applied per frame while walking.
!Define_SMW_Overworld_ClimbingSubpixelSpeed = $80						; How many subpixels Mario moves while climbing
!Define_SMW_Overworld_ClimbingSpeedMultiplier = "MultiplyBy1"			; Same as the other multiplier setting, except for climbing.
!Define_SMW_Overworld_EnableAutoTurningWhileWalking = !TRUE			; Set to !FALSE to disable Mario from turning automatically when walking.

; Intro Level Settings
!Define_SMW_Overworld_EnableIntroLevel = !TRUE							; Set this to !FALSE to go straight to the overworld when starting a new game.
!Define_SMW_Overworld_IntroLevelTimer = $B0								; How many frames to wait before being able to close the intro message text box. Has no effect if the intro level is disabled.

; Overworld Border Settings
!Define_SMW_Overworld_BorderSetting = !BorderSetting_Full				; Determines how the game accounts for certain things related to the border, such as the camera scroll boundaries, border sprite background, and the path transition effect HDMA.
	!BorderSetting_Full = $00										; This allows you to use the vanilla border.
	!BorderSetting_Widescreen = $01									; This allows you to use the border given by Medic's "Widescreen Overworld" patch.
	!BorderSetting_None = $02										; This allows you to remove the border altogther.

; Level Name Settings
!Define_SMW_Overworld_DisplayLevelName = !TRUE							; Determines whether to display level name on the overworld border.
!Define_SMW_Overworld_LevelNameXPos = $000B							;\ The X/Y position of where the level name is drawn on the overworld border.
!Define_SMW_Overworld_LevelNameYPos = $0004							;/ Note that these are grid based values, using 8x8 tile positions.
!Define_SMW_Overworld_LevelNameStringSize = $0014						; How long the level names are. Default is 20 characters.
!Define_SMW_Overworld_LevelNamePalette = $06							; The palette row used by the level names. Valid values are $00-$07.
!Define_SMW_Overworld_LevelNameType = !LevelNameType_Layer3			; Whether to draw the level name using layer 3 or sprite tiles.
	!LevelNameType_Layer3 = $00
	!LevelNameType_Sprite = $01

!Define_SMW_Overworld_ScrollArrowPalette = $06							; The palette row used by the scroll arrows. Valid values are $00-$07.
!Define_SMW_Overworld_ScrollArrowType = !ScrollArrowType_Layer3			; Whether to draw the scroll arrows using layer 3 or sprite tiles.
	!ScrollArrowType_Layer3 = $00
	!ScrollArrowType_Sprite = $01

; Overworld Life Counter Settings
!Define_SMW_Overworld_DisplayLifeCounter = !TRUE						; Determines whether to display the life counter on the overworld border.
!Define_SMW_Overworld_LifeCounterXPos = $0007							;\ The X/Y position of where the life counter is drawn on the overworld border.
!Define_SMW_Overworld_LifeCounterYPos = $0004							;/ Note that these are grid based values, using 8x8 tile positions.
!Define_SMW_Overworld_LifeCounterPalette = $06							; The palette row used by the life counter. Valid values are $00-$07.

; Border Mario Settings
!Define_SMW_Overworld_DisplayBorderMario = !TRUE						; Determines whether Mario is drawn on the overworld border
!Define_SMW_Overworld_DisplayBorderMarioBackground = !TRUE				; Determines whether to draw the sprite border background behind Mario. Border Mario must be enabled for this to have any effect.
!Define_SMW_Overworld_BorderMarioBackgroundPalette = $0B				; The palette row used by the sprite border background behind Mario. Valid values are $08-$0F.
!Define_SMW_Overworld_BorderMarioXPos = $001E							;\ The X/Y position the border Mario will be drawn. Also affects where the border background behind Mario is drawn.
!Define_SMW_Overworld_BorderMarioYPos = $0006							;/ Note that these are pixel based values.

; LM "Extra Options" Settings
; Most of the setting in that window as of LM 3.40 are present, except for a few. Specifically:
;- "Allow hardcoded default layer 1 paths." - The path movement system has been completely reworked, so now ALL paths function similar to hardcoded paths.
;- "Hide second ghost of sprite slot C until event passed." - The scripting system makes it possible to make ANY overworld sprite spawn through an event with no restrictions.
;- "Merge GFX slots FG1 and FG2 into SP3 and SP4 to create room for 2 more FG slots." - The VRAM patch works on overworld maps now, giving the same benefit without the tradeoff.
!Define_SMW_Overworld_AllowStartSelectToExitPassedLevels = !TRUE				; Affects whether you can use start+select to exit already beaten levels.
!Define_SMW_Overworld_AllowMapScrollingWithStart = !TRUE						; Affects whether you can press start to enable free scrolling on maps with layer 1 scrolling enabled.
!Define_SMW_Overworld_AllowLifeExchange = !TRUE								; Affects whether you Mario/Luigi can exchange lives in 2-player mode.
	!Define_SMW_Overworld_UseLRForLifeExchange = !TRUE							; If the life exchange is enabled, this affects whether you can use L/R to bring up the life exchange window. If !FALSE, the life exchange window can only be accessed on game over.
!Define_SMW_Overworld_EnableLevel024Gimmick = !TRUE							; Affects whether Level 024 (Chocolate Island 2) has its gimmick of redirecting you based on coins collected/time remaining.
!Define_SMW_Overworld_SaveLuigiPosition = !FALSE								; Affects whether Luigi is allowed to save his position separately from Mario.
!Define_SMW_Overworld_EnableFadeEffect = !TRUE									; Affects whether the path fade effect is used during events. It's HIGHLY recommended that you set this to !FALSE, as this effect uses a lot of resources.
	!Define_SMW_Overworld_NormalPathRevealDelay = $0A							;\ Affects the speed at which events reveal themselves. Note that his has no effect if the path fade effect is enabled.
	!Define_SMW_Overworld_SlowPathRevealDelay = $20								;/ Also, any event can use any path reveal speed, so you're not limited to just 2 speeds.
	!Define_SMW_Overworld_EnableSpriteTransparency = !TRUE						; Affects whether transparency is enabled for sprtes using palette rows C-F. This setting has no effect if the path fade effect is enabled.
!Define_SMW_Overworld_UseLightningPaletteFromROM = !FALSE						; Affects where the lightning effect animation created by overworld sprite 10 gets its palette data from. !TRUE = ROM. !FALSE = Palette Row 2.

; Redundant LM "Extra Options" Settings
; These are the settings that technically aren't necessary for this patch to include, due to script editing.
; But, I'm including them anyway for convienience if you don't plan on editing the relevant scripts.
!Define_SMW_Overworld_AllowCastleReEntryWithLR = !TRUE							; Affects whether you can re-enter destroyed castles/fortresses with L+R.
!Define_SMW_Overworld_SaveGameAfterIntroMessage = !TRUE						; Affects whether the game saves after Mario does his intro march.
!Define_SMW_Overworld_EnableSavePromptOnLevels = !TRUE							; Affects whether castles/fortresses/switch palaces/ghost houses/specific levels trigger a save prompt.
																				
; Event ID defines that determine which level exits trigger which events.
; Unlike vanilla, secret exit event IDs are independent from the normal exit event IDs. So, you don't need to rearrange the IDs if you later decide to add a secret exit to some level.
; Also, instead of being limited to event IDs $0000-$0078, you can assign IDs all the way up to $00FF, unless you're willing to expand the event flag table.
!Define_SMW_YoshisHouse_NormalExitEventID = $0000
!Define_SMW_YoshisIsland1_NormalExitEventID = $0001
!Define_SMW_YellowSwitchPalace_NormalExitEventID = $0002
!Define_SMW_YoshisIsland2_NormalExitEventID = $0003
!Define_SMW_YoshisIsland3_NormalExitEventID = $0004
!Define_SMW_YoshisIsland4_NormalExitEventID = $0005
!Define_SMW_IggysCastle_NormalExitEventID = $0006
!Define_SMW_DonutPlains1_NormalExitEventID = $0007
!Define_SMW_DonutPlains1_SecretExit1EventID = $0008
!Define_SMW_DonutPlains2_NormalExitEventID = $0009
!Define_SMW_DonutPlains2_SecretExit1EventID = $000A
!Define_SMW_DonutGhostHouse_NormalExitEventID = $000B
!Define_SMW_DonutGhostHouse_SecretExit1EventID = $000C
!Define_SMW_DonutPlains3_NormalExitEventID = $000D
!Define_SMW_DonutPlains4_NormalExitEventID = $000E
!Define_SMW_MortonsCastle_NormalExitEventID = $000F
!Define_SMW_DonutSecret1_NormalExitEventID = $0010
!Define_SMW_DonutSecret1_SecretExit1EventID = $0011
!Define_SMW_DonutSecretHouse_NormalExitEventID = $0012
!Define_SMW_DonutSecretHouse_SecretExit1EventID = $0013
!Define_SMW_DonutSecret2_NormalExitEventID = $0014
!Define_SMW_VanillaDome1_NormalExitEventID = $0015
!Define_SMW_VanillaDome1_SecretExit1EventID = $0016
!Define_SMW_VanillaDome2_NormalExitEventID = $0017
!Define_SMW_VanillaDome2_SecretExit1EventID = $0018
!Define_SMW_VanillaGhostHouse_NormalExitEventID = $0019
!Define_SMW_VanillaDome3_NormalExitEventID = $001A
!Define_SMW_VanillaDome4_NormalExitEventID = $001B
!Define_SMW_LemmysCastle_NormalExitEventID = $001C
!Define_SMW_VanillaSecret1_NormalExitEventID = $001D
!Define_SMW_VanillaSecret1_SecretExit1EventID = $001E
!Define_SMW_VanillaSecret2_NormalExitEventID = $001F
!Define_SMW_VanillaSecret3_NormalExitEventID = $0020
!Define_SMW_VanillaFortress_NormalExitEventID = $0021
!Define_SMW_ButterBridge1_NormalExitEventID = $0022
!Define_SMW_ButterBridge2_NormalExitEventID = $0023
!Define_SMW_LudwigsCastle_NormalExitEventID = $0024
!Define_SMW_CheeseBridgeArea_NormalExitEventID = $0025
!Define_SMW_CheeseBridgeArea_SecretExit1EventID = $0026
!Define_SMW_CookieMountain_NormalExitEventID = $0027
!Define_SMW_GreenSwitchPalace_NormalExitEventID = $0028
!Define_SMW_RedSwitchPalace_NormalExitEventID = $0029
!Define_SMW_ForestOfIllusion1_NormalExitEventID = $002A
!Define_SMW_ForestOfIllusion1_SecretExit1EventID = $002B
!Define_SMW_ForestOfIllusion2_NormalExitEventID = $002C
!Define_SMW_ForestOfIllusion2_SecretExit1EventID = $002D
!Define_SMW_ForestOfIllusion3_NormalExitEventID = $002E
!Define_SMW_ForestOfIllusion3_SecretExit1EventID = $002F
!Define_SMW_ForestGhostHouse_NormalExitEventID = $0030
!Define_SMW_ForestGhostHouse_SecretExit1EventID = $0031
!Define_SMW_ForestOfIllusion4_NormalExitEventID = $0032
!Define_SMW_ForestOfIllusion4_SecretExit1EventID = $0033
!Define_SMW_ForestSecretArea_NormalExitEventID = $0034
!Define_SMW_ForestFortress_NormalExitEventID = $0035
!Define_SMW_Level01E_NormalExitEventID = $0036			; Unused
!Define_SMW_BlueSwitchPalace_NormalExitEventID = $0037
!Define_SMW_ValleyOfBowser1_NormalExitEventID = $0038
!Define_SMW_ValleyOfBowser2_NormalExitEventID = $0039
!Define_SMW_ValleyOfBowser2_SecretExit1EventID = $003A
!Define_SMW_ValleyGhostHouse_NormalExitEventID = $003B
!Define_SMW_ValleyGhostHouse_SecretExit1EventID = $003C
!Define_SMW_ValleyOfBowser3_NormalExitEventID = $003D
!Define_SMW_ValleyOfBowser4_NormalExitEventID = $003E
!Define_SMW_ValleyOfBowser4_SecretExit1EventID = $003F
!Define_SMW_LarrysCastle_NormalExitEventID = $0040
!Define_SMW_ValleyFortress_NormalExitEventID = $0041
!Define_SMW_BackDoor_NormalExitEventID = $0042			;\ Unused
!Define_SMW_Level112_NormalExitEventID = $0043			;|
!Define_SMW_Level10C_NormalExitEventID = $0044			;|
!Define_SMW_FrontDoor_NormalExitEventID = $0045			;/
!Define_SMW_ChocolateIsland2_NormalExitEventID = $0046
!Define_SMW_ChocolateIsland2_SecretExit1EventID = $0047
!Define_SMW_ChocolateIsland3_NormalExitEventID = $0048
!Define_SMW_ChocolateIsland3_SecretExit1EventID = $0049
!Define_SMW_ChocolateFortress_NormalExitEventID = $004A
!Define_SMW_ChocolateIsland4_NormalExitEventID = $004B
!Define_SMW_ChocolateIsland5_NormalExitEventID = $004C
!Define_SMW_WendysCastle_NormalExitEventID = $004D
!Define_SMW_SunkenGhostShip_NormalExitEventID = $004E
!Define_SMW_ChocolateSecret_NormalExitEventID = $004F
!Define_SMW_Level137_NormalExitEventID = $0050		; Unused
!Define_SMW_StarWorld1_NormalExitEventID = $0051
!Define_SMW_StarWorld1_SecretExit1EventID = $0052
!Define_SMW_Level12F_NormalExitEventID = $0053		; Unused
!Define_SMW_StarWorld2_NormalExitEventID = $0054
!Define_SMW_StarWorld2_SecretExit1EventID = $0055
!Define_SMW_Level12E_NormalExitEventID = $0056		; Unused
!Define_SMW_StarWorld3_NormalExitEventID = $0057
!Define_SMW_StarWorld3_SecretExit1EventID = $0058
!Define_SMW_Level133_NormalExitEventID = $0059		; Unused
!Define_SMW_StarWorld4_NormalExitEventID = $005A
!Define_SMW_StarWorld4_SecretExit1EventID = $005B
!Define_SMW_Level138_NormalExitEventID = $005C		; Unused
!Define_SMW_StarWorld5_NormalExitEventID = $005D
!Define_SMW_StarWorld5_SecretExit1EventID = $005E
!Define_SMW_Level131_NormalExitEventID = $005F		; Unused
!Define_SMW_SodaLake_NormalExitEventID = $0060
!Define_SMW_RoysCastle_NormalExitEventID = $0061
!Define_SMW_ChocolateIsland1_NormalExitEventID = $0062
!Define_SMW_ChocoGhostHouse_NormalExitEventID = $0063
!Define_SMW_Level129_NormalExitEventID = $0064		; Unused
!Define_SMW_Gnarly_NormalExitEventID = $0065
!Define_SMW_Tubular_NormalExitEventID = $0066
!Define_SMW_WayCool_NormalExitEventID = $0067
!Define_SMW_Awesome_NormalExitEventID = $0068
!Define_SMW_Groovy_NormalExitEventID = $0069
!Define_SMW_Mondo_NormalExitEventID = $006A
!Define_SMW_Outrageous_NormalExitEventID = $006B
!Define_SMW_Funky_NormalExitEventID = $006C
!Define_SMW_Level124_NormalExitEventID = $006D		; Unused

; "Boss Sequence Levels" setting defines
; Note that any level can now have an earthquake sequence or trigger a secret exit from killing a boss through script editing.
; Look at the "Exit Level" scripts for level 018 and level 013 respectively.
!Define_SMW_Cutscene_LevelThatTriggersIggyCastleCutscene = !Define_SMW_LevelIndex_IggysCastle
!Define_SMW_Cutscene_LevelThatTriggersMortonsCastleCutscene = !Define_SMW_LevelIndex_MortonsCastle
!Define_SMW_Cutscene_LevelThatTriggersLemmyCastleCutscene = !Define_SMW_LevelIndex_LemmysCastle
!Define_SMW_Cutscene_LevelThatTriggersLudwigCastleCutscene = !Define_SMW_LevelIndex_LudwigsCastle
!Define_SMW_Cutscene_LevelThatTriggersRoyCastleCutscene = !Define_SMW_LevelIndex_RoysCastle
!Define_SMW_Cutscene_LevelThatTriggersWendyCastleCutscene = !Define_SMW_LevelIndex_WendysCastle
!Define_SMW_Cutscene_LevelThatTriggersLarryCastleCutscene = !Define_SMW_LevelIndex_LarrysCastle
!Define_SMW_Cutscene_Level1ThatTriggersCredits = !Define_SMW_LevelIndex_BackDoor
!Define_SMW_Cutscene_Level2ThatTriggersCredits = !Define_SMW_LevelIndex_FrontDoor

; Sublevel IDs for each map used for the overworld. Note that all your overworld maps should use consecutive sublevel IDs, as various pointer tables expect them to be in order.
!Define_SMW_Overworld_FirstMapSublevel = $0025
!Define_SMW_Overworld_MainMapSublevel = !Define_SMW_Overworld_FirstMapSublevel+$00
!Define_SMW_Overworld_YoshisIslandSublevel = !Define_SMW_Overworld_FirstMapSublevel+$01
!Define_SMW_Overworld_VanillaDomeSublevel = !Define_SMW_Overworld_FirstMapSublevel+$02
!Define_SMW_Overworld_ForestOfIllusionSublevel = !Define_SMW_Overworld_FirstMapSublevel+$03
!Define_SMW_Overworld_ValleyOfBowserSublevel = !Define_SMW_Overworld_FirstMapSublevel+$04
!Define_SMW_Overworld_SpecialWorldSublevel = !Define_SMW_Overworld_FirstMapSublevel+$05
!Define_SMW_Overworld_StarWorldSublevel = !Define_SMW_Overworld_FirstMapSublevel+$06

; The grid position/Map/map16 tile of every interactable tile. These are meant to assist with editing scripts that reference the same value associated with one of these tiles, so you only need to edit 1 define instead of multiple scripts.
; To get the X/Y position bytes, put the mouse cursor on the tile, and write down the coordinates Lunar Magic displays in the bottom left corner of the main window.

!Define_SMW_Level000_XPosOfTile = $0000
!Define_SMW_Level000_YPosOfTile = $0000
!Define_SMW_Level000_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_Level000_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$00
!Define_SMW_VanillaSecret2_XPosOfTile = $000C
!Define_SMW_VanillaSecret2_YPosOfTile = $0003
!Define_SMW_VanillaSecret2_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_VanillaSecret2_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$01
!Define_SMW_VanillaSecret3_XPosOfTile = $000E
!Define_SMW_VanillaSecret3_YPosOfTile = $0003
!Define_SMW_VanillaSecret3_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_VanillaSecret3_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$02
!Define_SMW_TopSecretArea_XPosOfTile = $0005
!Define_SMW_TopSecretArea_YPosOfTile = $0008
!Define_SMW_TopSecretArea_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_TopSecretArea_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$03
!Define_SMW_DonutGhostHouse_XPosOfTile = $0005
!Define_SMW_DonutGhostHouse_YPosOfTile = $000A
!Define_SMW_DonutGhostHouse_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_DonutGhostHouse_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$04
!Define_SMW_DonutPlains3_XPosOfTile = $0009
!Define_SMW_DonutPlains3_YPosOfTile = $000A
!Define_SMW_DonutPlains3_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_DonutPlains3_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$05
!Define_SMW_DonutPlains4_XPosOfTile = $000B
!Define_SMW_DonutPlains4_YPosOfTile = $000C
!Define_SMW_DonutPlains4_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_DonutPlains4_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$06
!Define_SMW_MortonsCastle_XPosOfTile = $000D
!Define_SMW_MortonsCastle_YPosOfTile = $000C
!Define_SMW_MortonsCastle_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_MortonsCastle_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$07
!Define_SMW_GreenSwitchPalace_XPosOfTile = $0001
!Define_SMW_GreenSwitchPalace_YPosOfTile = $000D
!Define_SMW_GreenSwitchPalace_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_GreenSwitchPalace_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$08
!Define_SMW_DonutPlains2_XPosOfTile = $0003
!Define_SMW_DonutPlains2_YPosOfTile = $000D
!Define_SMW_DonutPlains2_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_DonutPlains2_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$09
!Define_SMW_DonutSecret1_XPosOfTile = $0005
!Define_SMW_DonutSecret1_YPosOfTile = $000E
!Define_SMW_DonutSecret1_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_DonutSecret1_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$0A
!Define_SMW_VanillaFortress_XPosOfTile = $0010
!Define_SMW_VanillaFortress_YPosOfTile = $0003
!Define_SMW_VanillaFortress_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_VanillaFortress_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$0B
!Define_SMW_ButterBridge1_XPosOfTile = $0014
!Define_SMW_ButterBridge1_YPosOfTile = $0003
!Define_SMW_ButterBridge1_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_ButterBridge1_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$0C
!Define_SMW_ButterBridge2_XPosOfTile = $0016
!Define_SMW_ButterBridge2_YPosOfTile = $0003
!Define_SMW_ButterBridge2_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_ButterBridge2_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$0D
!Define_SMW_LudwigsCastle_XPosOfTile = $001A
!Define_SMW_LudwigsCastle_YPosOfTile = $0003
!Define_SMW_LudwigsCastle_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_LudwigsCastle_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$0E
!Define_SMW_CheeseBridgeArea_XPosOfTile = $0014
!Define_SMW_CheeseBridgeArea_YPosOfTile = $0005
!Define_SMW_CheeseBridgeArea_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_CheeseBridgeArea_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$0F
!Define_SMW_CookieMountain_XPosOfTile = $0017
!Define_SMW_CookieMountain_YPosOfTile = $0005
!Define_SMW_CookieMountain_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_CookieMountain_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$10
!Define_SMW_SodaLake_XPosOfTile = $0014
!Define_SMW_SodaLake_YPosOfTile = $0008
!Define_SMW_SodaLake_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_SodaLake_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$11
!Define_SMW_Level012_XPosOfTile = $0000
!Define_SMW_Level012_YPosOfTile = $0000
!Define_SMW_Level012_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_Level012_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$12
!Define_SMW_DonutSecretHouse_XPosOfTile = $0007
!Define_SMW_DonutSecretHouse_YPosOfTile = $0010
!Define_SMW_DonutSecretHouse_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_DonutSecretHouse_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$13
!Define_SMW_YellowSwitchPalace_XPosOfTile = $0002
!Define_SMW_YellowSwitchPalace_YPosOfTile = $0011
!Define_SMW_YellowSwitchPalace_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_YellowSwitchPalace_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$14
!Define_SMW_DonutPlains1_XPosOfTile = $0005
!Define_SMW_DonutPlains1_YPosOfTile = $0011
!Define_SMW_DonutPlains1_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_DonutPlains1_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$15
!Define_SMW_Level016_XPosOfTile = $0000
!Define_SMW_Level016_YPosOfTile = $0000
!Define_SMW_Level016_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_Level016_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$16
!Define_SMW_Level017_XPosOfTile = $0000
!Define_SMW_Level017_YPosOfTile = $0000
!Define_SMW_Level017_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_Level017_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$17
!Define_SMW_SunkenGhostShip_XPosOfTile = $000E
!Define_SMW_SunkenGhostShip_YPosOfTile = $0017
!Define_SMW_SunkenGhostShip_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_SunkenGhostShip_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$18
!Define_SMW_Level019_XPosOfTile = $0000
!Define_SMW_Level019_YPosOfTile = $0000
!Define_SMW_Level019_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_Level019_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$19
!Define_SMW_WendysCastle_XPosOfTile = $000C
!Define_SMW_WendysCastle_YPosOfTile = $001B
!Define_SMW_WendysCastle_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_WendysCastle_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$1A
!Define_SMW_ChocolateFortress_XPosOfTile = $000F
!Define_SMW_ChocolateFortress_YPosOfTile = $001B
!Define_SMW_ChocolateFortress_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_ChocolateFortress_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$1B
!Define_SMW_ChocolateIsland5_XPosOfTile = $000C
!Define_SMW_ChocolateIsland5_YPosOfTile = $001D
!Define_SMW_ChocolateIsland5_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_ChocolateIsland5_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$1C
!Define_SMW_ChocolateIsland4_XPosOfTile = $000F
!Define_SMW_ChocolateIsland4_YPosOfTile = $001D
!Define_SMW_ChocolateIsland4_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_ChocolateIsland4_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$1D
!Define_SMW_Level01E_XPosOfTile = $0000
!Define_SMW_Level01E_YPosOfTile = $0000
!Define_SMW_Level01E_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_Level01E_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$1E
!Define_SMW_ForestFortress_XPosOfTile = $0016
!Define_SMW_ForestFortress_YPosOfTile = $0010
!Define_SMW_ForestFortress_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_ForestFortress_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$1F
!Define_SMW_RoysCastle_XPosOfTile = $0018
!Define_SMW_RoysCastle_YPosOfTile = $0012
!Define_SMW_RoysCastle_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_RoysCastle_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$20
!Define_SMW_ChocoGhostHouse_XPosOfTile = $0015
!Define_SMW_ChocoGhostHouse_YPosOfTile = $0016
!Define_SMW_ChocoGhostHouse_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_ChocoGhostHouse_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$21
!Define_SMW_ChocolateIsland1_XPosOfTile = $0018
!Define_SMW_ChocolateIsland1_YPosOfTile = $0016
!Define_SMW_ChocolateIsland1_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_ChocolateIsland1_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$22
!Define_SMW_ChocolateIsland3_XPosOfTile = $0013
!Define_SMW_ChocolateIsland3_YPosOfTile = $001B
!Define_SMW_ChocolateIsland3_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_ChocolateIsland3_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$23
!Define_SMW_ChocolateIsland2_XPosOfTile = $0015
!Define_SMW_ChocolateIsland2_YPosOfTile = $001B
!Define_SMW_ChocolateIsland2_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_ChocolateIsland2_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$24
!Define_SMW_IggysCastle_XPosOfTile = $000A
!Define_SMW_IggysCastle_YPosOfTile = $0004
!Define_SMW_IggysCastle_MapOfTile = !Define_SMW_Overworld_YoshisIslandSublevel
!Define_SMW_IggysCastle_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$25
!Define_SMW_YoshisIsland4_XPosOfTile = $000C
!Define_SMW_YoshisIsland4_YPosOfTile = $0006
!Define_SMW_YoshisIsland4_MapOfTile = !Define_SMW_Overworld_YoshisIslandSublevel
!Define_SMW_YoshisIsland4_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$26
!Define_SMW_YoshisIsland3_XPosOfTile = $000A
!Define_SMW_YoshisIsland3_YPosOfTile = $0008
!Define_SMW_YoshisIsland3_MapOfTile = !Define_SMW_Overworld_YoshisIslandSublevel
!Define_SMW_YoshisIsland3_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$27
!Define_SMW_YoshisHouse_XPosOfTile = $0007
!Define_SMW_YoshisHouse_YPosOfTile = $0009
!Define_SMW_YoshisHouse_MapOfTile = !Define_SMW_Overworld_YoshisIslandSublevel
!Define_SMW_YoshisHouse_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$28
!Define_SMW_YoshisIsland1_XPosOfTile = $0004
!Define_SMW_YoshisIsland1_YPosOfTile = $000A
!Define_SMW_YoshisIsland1_MapOfTile = !Define_SMW_Overworld_YoshisIslandSublevel
!Define_SMW_YoshisIsland1_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$29
!Define_SMW_YoshisIsland2_XPosOfTile = $000A
!Define_SMW_YoshisIsland2_YPosOfTile = $000A
!Define_SMW_YoshisIsland2_MapOfTile = !Define_SMW_Overworld_YoshisIslandSublevel
!Define_SMW_YoshisIsland2_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$2A
!Define_SMW_VanillaGhostHouse_XPosOfTile = $0009
!Define_SMW_VanillaGhostHouse_YPosOfTile = $0003
!Define_SMW_VanillaGhostHouse_MapOfTile = !Define_SMW_Overworld_VanillaDomeSublevel
!Define_SMW_VanillaGhostHouse_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$2B
!Define_SMW_Level108_XPosOfTile = $0000
!Define_SMW_Level108_YPosOfTile = $0000
!Define_SMW_Level108_MapOfTile = !Define_SMW_Overworld_VanillaDomeSublevel
!Define_SMW_Level108_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$2C
!Define_SMW_VanillaSecret1_XPosOfTile = $0004
!Define_SMW_VanillaSecret1_YPosOfTile = $0005
!Define_SMW_VanillaSecret1_MapOfTile = !Define_SMW_Overworld_VanillaDomeSublevel
!Define_SMW_VanillaSecret1_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$2D
!Define_SMW_VanillaDome3_XPosOfTile = $000D
!Define_SMW_VanillaDome3_YPosOfTile = $0005
!Define_SMW_VanillaDome3_MapOfTile = !Define_SMW_Overworld_VanillaDomeSublevel
!Define_SMW_VanillaDome3_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$2E
!Define_SMW_DonutSecret2_XPosOfTile = $0001
!Define_SMW_DonutSecret2_YPosOfTile = $0003
!Define_SMW_DonutSecret2_MapOfTile = !Define_SMW_Overworld_ValleyOfBowserSublevel
!Define_SMW_DonutSecret2_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$2F
!Define_SMW_Level10C_XPosOfTile = $0000
!Define_SMW_Level10C_YPosOfTile = $0000
!Define_SMW_Level10C_MapOfTile = !Define_SMW_Overworld_ValleyOfBowserSublevel
!Define_SMW_Level10C_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$30
!Define_SMW_FrontDoor_XPosOfTile = $0008
!Define_SMW_FrontDoor_YPosOfTile = $0005
!Define_SMW_FrontDoor_MapOfTile = !Define_SMW_Overworld_ValleyOfBowserSublevel
!Define_SMW_FrontDoor_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$31
!Define_SMW_BackDoor_XPosOfTile = $000A
!Define_SMW_BackDoor_YPosOfTile = $0005
!Define_SMW_BackDoor_MapOfTile = !Define_SMW_Overworld_ValleyOfBowserSublevel
!Define_SMW_BackDoor_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$32
!Define_SMW_ValleyOfBowser4_XPosOfTile = $0005
!Define_SMW_ValleyOfBowser4_YPosOfTile = $0007
!Define_SMW_ValleyOfBowser4_MapOfTile = !Define_SMW_Overworld_ValleyOfBowserSublevel
!Define_SMW_ValleyOfBowser4_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$33
!Define_SMW_LarrysCastle_XPosOfTile = $0008
!Define_SMW_LarrysCastle_YPosOfTile = $0007
!Define_SMW_LarrysCastle_MapOfTile = !Define_SMW_Overworld_ValleyOfBowserSublevel
!Define_SMW_LarrysCastle_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$34
!Define_SMW_ValleyFortress_XPosOfTile = $000A
!Define_SMW_ValleyFortress_YPosOfTile = $0007
!Define_SMW_ValleyFortress_MapOfTile = !Define_SMW_Overworld_ValleyOfBowserSublevel
!Define_SMW_ValleyFortress_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$35
!Define_SMW_Level112_XPosOfTile = $0000
!Define_SMW_Level112_YPosOfTile = $0000
!Define_SMW_Level112_MapOfTile = !Define_SMW_Overworld_ValleyOfBowserSublevel
!Define_SMW_Level112_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$36
!Define_SMW_ValleyOfBowser3_XPosOfTile = $0005
!Define_SMW_ValleyOfBowser3_YPosOfTile = $0009
!Define_SMW_ValleyOfBowser3_MapOfTile = !Define_SMW_Overworld_ValleyOfBowserSublevel
!Define_SMW_ValleyOfBowser3_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$37
!Define_SMW_ValleyGhostHouse_XPosOfTile = $0008
!Define_SMW_ValleyGhostHouse_YPosOfTile = $0009
!Define_SMW_ValleyGhostHouse_MapOfTile = !Define_SMW_Overworld_ValleyOfBowserSublevel
!Define_SMW_ValleyGhostHouse_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$38
!Define_SMW_ValleyOfBowser2_XPosOfTile = $000A
!Define_SMW_ValleyOfBowser2_YPosOfTile = $0009
!Define_SMW_ValleyOfBowser2_MapOfTile = !Define_SMW_Overworld_ValleyOfBowserSublevel
!Define_SMW_ValleyOfBowser2_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$39
!Define_SMW_ValleyOfBowser1_XPosOfTile = $000C
!Define_SMW_ValleyOfBowser1_YPosOfTile = $0009
!Define_SMW_ValleyOfBowser1_MapOfTile = !Define_SMW_Overworld_ValleyOfBowserSublevel
!Define_SMW_ValleyOfBowser1_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$3A
!Define_SMW_ChocolateSecret_XPosOfTile = $0008
!Define_SMW_ChocolateSecret_YPosOfTile = $000B
!Define_SMW_ChocolateSecret_MapOfTile = !Define_SMW_Overworld_ValleyOfBowserSublevel
!Define_SMW_ChocolateSecret_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$3B
!Define_SMW_VanillaDome2_XPosOfTile = $0009
!Define_SMW_VanillaDome2_YPosOfTile = $0007
!Define_SMW_VanillaDome2_MapOfTile = !Define_SMW_Overworld_VanillaDomeSublevel
!Define_SMW_VanillaDome2_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$3C
!Define_SMW_VanillaDome4_XPosOfTile = $000D
!Define_SMW_VanillaDome4_YPosOfTile = $0007
!Define_SMW_VanillaDome4_MapOfTile = !Define_SMW_Overworld_VanillaDomeSublevel
!Define_SMW_VanillaDome4_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$3D
!Define_SMW_VanillaDome1_XPosOfTile = $0006
!Define_SMW_VanillaDome1_YPosOfTile = $0009
!Define_SMW_VanillaDome1_MapOfTile = !Define_SMW_Overworld_VanillaDomeSublevel
!Define_SMW_VanillaDome1_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$3E
!Define_SMW_RedSwitchPalace_XPosOfTile = $000B
!Define_SMW_RedSwitchPalace_YPosOfTile = $0009
!Define_SMW_RedSwitchPalace_MapOfTile = !Define_SMW_Overworld_VanillaDomeSublevel
!Define_SMW_RedSwitchPalace_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$3F
!Define_SMW_LemmysCastle_XPosOfTile = $000D
!Define_SMW_LemmysCastle_YPosOfTile = $0009
!Define_SMW_LemmysCastle_MapOfTile = !Define_SMW_Overworld_VanillaDomeSublevel
!Define_SMW_LemmysCastle_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$40
!Define_SMW_ForestGhostHouse_XPosOfTile = $0007
!Define_SMW_ForestGhostHouse_YPosOfTile = $0004
!Define_SMW_ForestGhostHouse_MapOfTile = !Define_SMW_Overworld_ForestOfIllusionSublevel
!Define_SMW_ForestGhostHouse_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$41
!Define_SMW_ForestOfIllusion1_XPosOfTile = $0009
!Define_SMW_ForestOfIllusion1_YPosOfTile = $0004
!Define_SMW_ForestOfIllusion1_MapOfTile = !Define_SMW_Overworld_ForestOfIllusionSublevel
!Define_SMW_ForestOfIllusion1_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$42
!Define_SMW_ForestOfIllusion4_XPosOfTile = $0005
!Define_SMW_ForestOfIllusion4_YPosOfTile = $0007
!Define_SMW_ForestOfIllusion4_MapOfTile = !Define_SMW_Overworld_ForestOfIllusionSublevel
!Define_SMW_ForestOfIllusion4_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$43
!Define_SMW_ForestOfIllusion2_XPosOfTile = $000B
!Define_SMW_ForestOfIllusion2_YPosOfTile = $0007
!Define_SMW_ForestOfIllusion2_MapOfTile = !Define_SMW_Overworld_ForestOfIllusionSublevel
!Define_SMW_ForestOfIllusion2_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$44
!Define_SMW_BlueSwitchPalace_XPosOfTile = $000D
!Define_SMW_BlueSwitchPalace_YPosOfTile = $0007
!Define_SMW_BlueSwitchPalace_MapOfTile = !Define_SMW_Overworld_ForestOfIllusionSublevel
!Define_SMW_BlueSwitchPalace_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$45
!Define_SMW_ForestSecretArea_XPosOfTile = $0005
!Define_SMW_ForestSecretArea_YPosOfTile = $0009
!Define_SMW_ForestSecretArea_MapOfTile = !Define_SMW_Overworld_ForestOfIllusionSublevel
!Define_SMW_ForestSecretArea_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$46
!Define_SMW_ForestOfIllusion3_XPosOfTile = $0009
!Define_SMW_ForestOfIllusion3_YPosOfTile = $0009
!Define_SMW_ForestOfIllusion3_MapOfTile = !Define_SMW_Overworld_ForestOfIllusionSublevel
!Define_SMW_ForestOfIllusion3_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$47
!Define_SMW_Level124_XPosOfTile = $0000
!Define_SMW_Level124_YPosOfTile = $0000
!Define_SMW_Level124_MapOfTile = !Define_SMW_Overworld_SpecialWorldSublevel
!Define_SMW_Level124_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$48
!Define_SMW_Funky_XPosOfTile = $0004
!Define_SMW_Funky_YPosOfTile = $0008
!Define_SMW_Funky_MapOfTile = !Define_SMW_Overworld_SpecialWorldSublevel
!Define_SMW_Funky_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$49
!Define_SMW_Outrageous_XPosOfTile = $0007
!Define_SMW_Outrageous_YPosOfTile = $0008
!Define_SMW_Outrageous_MapOfTile = !Define_SMW_Overworld_SpecialWorldSublevel
!Define_SMW_Outrageous_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$4A
!Define_SMW_Mondo_XPosOfTile = $000A
!Define_SMW_Mondo_YPosOfTile = $0008
!Define_SMW_Mondo_MapOfTile = !Define_SMW_Overworld_SpecialWorldSublevel
!Define_SMW_Mondo_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$4B
!Define_SMW_Groovy_XPosOfTile = $000D
!Define_SMW_Groovy_YPosOfTile = $0008
!Define_SMW_Groovy_MapOfTile = !Define_SMW_Overworld_SpecialWorldSublevel
!Define_SMW_Groovy_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$4C
!Define_SMW_Level129_XPosOfTile = $0000
!Define_SMW_Level129_YPosOfTile = $0000
!Define_SMW_Level129_MapOfTile = !Define_SMW_Overworld_SpecialWorldSublevel
!Define_SMW_Level129_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$4D
!Define_SMW_Gnarly_XPosOfTile = $0004
!Define_SMW_Gnarly_YPosOfTile = $000A
!Define_SMW_Gnarly_MapOfTile = !Define_SMW_Overworld_SpecialWorldSublevel
!Define_SMW_Gnarly_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$4E
!Define_SMW_Tubular_XPosOfTile = $0007
!Define_SMW_Tubular_YPosOfTile = $000A
!Define_SMW_Tubular_MapOfTile = !Define_SMW_Overworld_SpecialWorldSublevel
!Define_SMW_Tubular_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$4F
!Define_SMW_WayCool_XPosOfTile = $000A
!Define_SMW_WayCool_YPosOfTile = $000A
!Define_SMW_WayCool_MapOfTile = !Define_SMW_Overworld_SpecialWorldSublevel
!Define_SMW_WayCool_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$50
!Define_SMW_Awesome_XPosOfTile = $000D
!Define_SMW_Awesome_YPosOfTile = $000A
!Define_SMW_Awesome_MapOfTile = !Define_SMW_Overworld_SpecialWorldSublevel
!Define_SMW_Awesome_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$51
!Define_SMW_Level12E_XPosOfTile = $0000
!Define_SMW_Level12E_YPosOfTile = $0000
!Define_SMW_Level12E_MapOfTile = !Define_SMW_Overworld_StarWorldSublevel
!Define_SMW_Level12E_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$52
!Define_SMW_Level12F_XPosOfTile = $0000
!Define_SMW_Level12F_YPosOfTile = $0000
!Define_SMW_Level12F_MapOfTile = !Define_SMW_Overworld_StarWorldSublevel
!Define_SMW_Level12F_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$53
!Define_SMW_StarWorld2_XPosOfTile = $0006
!Define_SMW_StarWorld2_YPosOfTile = $0005
!Define_SMW_StarWorld2_MapOfTile = !Define_SMW_Overworld_StarWorldSublevel
!Define_SMW_StarWorld2_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$54
!Define_SMW_Level131_XPosOfTile = $0000
!Define_SMW_Level131_YPosOfTile = $0000
!Define_SMW_Level131_MapOfTile = !Define_SMW_Overworld_StarWorldSublevel
!Define_SMW_Level131_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$55
!Define_SMW_StarWorld3_XPosOfTile = $000A
!Define_SMW_StarWorld3_YPosOfTile = $0005
!Define_SMW_StarWorld3_MapOfTile = !Define_SMW_Overworld_StarWorldSublevel
!Define_SMW_StarWorld3_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$56
!Define_SMW_Level133_XPosOfTile = $0000
!Define_SMW_Level133_YPosOfTile = $0000
!Define_SMW_Level133_MapOfTile = !Define_SMW_Overworld_StarWorldSublevel
!Define_SMW_Level133_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$57
!Define_SMW_StarWorld1_XPosOfTile = $0005
!Define_SMW_StarWorld1_YPosOfTile = $0007
!Define_SMW_StarWorld1_MapOfTile = !Define_SMW_Overworld_StarWorldSublevel
!Define_SMW_StarWorld1_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$58
!Define_SMW_StarWorld4_XPosOfTile = $000B
!Define_SMW_StarWorld4_YPosOfTile = $0007
!Define_SMW_StarWorld4_MapOfTile = !Define_SMW_Overworld_StarWorldSublevel
!Define_SMW_StarWorld4_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$59
!Define_SMW_StarWorld5_XPosOfTile = $0008
!Define_SMW_StarWorld5_YPosOfTile = $0008
!Define_SMW_StarWorld5_MapOfTile = !Define_SMW_Overworld_StarWorldSublevel
!Define_SMW_StarWorld5_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$5A
!Define_SMW_Level137_XPosOfTile = $0000
!Define_SMW_Level137_YPosOfTile = $0000
!Define_SMW_Level137_MapOfTile = !Define_SMW_Overworld_StarWorldSublevel
!Define_SMW_Level137_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$5B
!Define_SMW_Level138_XPosOfTile = $0000
!Define_SMW_Level138_YPosOfTile = $0000
!Define_SMW_Level138_MapOfTile = !Define_SMW_Overworld_StarWorldSublevel
!Define_SMW_Level138_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$5C
!Define_SMW_Level139_XPosOfTile = $0000
!Define_SMW_Level139_YPosOfTile = $0000
!Define_SMW_Level139_MapOfTile = !Define_SMW_Overworld_StarWorldSublevel
!Define_SMW_Level139_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$5D
!Define_SMW_Level13A_XPosOfTile = $0000
!Define_SMW_Level13A_YPosOfTile = $0000
!Define_SMW_Level13A_MapOfTile = !Define_SMW_Overworld_StarWorldSublevel
!Define_SMW_Level13A_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$5E
!Define_SMW_Level13B_XPosOfTile = $0000
!Define_SMW_Level13B_YPosOfTile = $0000
!Define_SMW_Level13B_MapOfTile = !Define_SMW_Overworld_StarWorldSublevel
!Define_SMW_Level13B_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$5F
!Define_SMW_PipeWarp_DonutSecretHouseToDonutSecret2_XPosOfTile = $0009
!Define_SMW_PipeWarp_DonutSecretHouseToDonutSecret2_YPosOfTile = $0010
!Define_SMW_PipeWarp_DonutSecretHouseToDonutSecret2_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_PipeWarp_DonutSecretHouseToDonutSecret2_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$60
!Define_SMW_PipeWarp_DonutSecret2ToDonutSecretHouse_XPosOfTile = $0001
!Define_SMW_PipeWarp_DonutSecret2ToDonutSecretHouse_YPosOfTile = $0005
!Define_SMW_PipeWarp_DonutSecret2ToDonutSecretHouse_MapOfTile = !Define_SMW_Overworld_ValleyOfBowserSublevel
!Define_SMW_PipeWarp_DonutSecret2ToDonutSecretHouse_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$61
!Define_SMW_PipeWarp_DonutSecret2ToDonutPlains3_XPosOfTile = $0003
!Define_SMW_PipeWarp_DonutSecret2ToDonutPlains3_YPosOfTile = $0003
!Define_SMW_PipeWarp_DonutSecret2ToDonutPlains3_MapOfTile = !Define_SMW_Overworld_ValleyOfBowserSublevel
!Define_SMW_PipeWarp_DonutSecret2ToDonutPlains3_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$62
!Define_SMW_PipeWarp_DonutPlains3ToDonutSecret2_XPosOfTile = $000B
!Define_SMW_PipeWarp_DonutPlains3ToDonutSecret2_YPosOfTile = $000E
!Define_SMW_PipeWarp_DonutPlains3ToDonutSecret2_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_PipeWarp_DonutPlains3ToDonutSecret2_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$63
!Define_SMW_PipeWarp_VanillaSecret1ToVanillaSecret2_XPosOfTile = $0004
!Define_SMW_PipeWarp_VanillaSecret1ToVanillaSecret2_YPosOfTile = $0002
!Define_SMW_PipeWarp_VanillaSecret1ToVanillaSecret2_MapOfTile = !Define_SMW_Overworld_VanillaDomeSublevel
!Define_SMW_PipeWarp_VanillaSecret1ToVanillaSecret2_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$64
!Define_SMW_PipeWarp_VanillaSecret2ToVanillaSecret1_XPosOfTile = $000A
!Define_SMW_PipeWarp_VanillaSecret2ToVanillaSecret1_YPosOfTile = $0003
!Define_SMW_PipeWarp_VanillaSecret2ToVanillaSecret1_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_PipeWarp_VanillaSecret2ToVanillaSecret1_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$65
!Define_SMW_PipeWarp_LemmysCastleToCheeseBridgeArea_XPosOfTile = $000B
!Define_SMW_PipeWarp_LemmysCastleToCheeseBridgeArea_YPosOfTile = $000B
!Define_SMW_PipeWarp_LemmysCastleToCheeseBridgeArea_MapOfTile = !Define_SMW_Overworld_VanillaDomeSublevel
!Define_SMW_PipeWarp_LemmysCastleToCheeseBridgeArea_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$66
!Define_SMW_PipeWarp_CheeseBridgeAreaToLemmysCastle_XPosOfTile = $0011
!Define_SMW_PipeWarp_CheeseBridgeAreaToLemmysCastle_YPosOfTile = $0007
!Define_SMW_PipeWarp_CheeseBridgeAreaToLemmysCastle_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_PipeWarp_CheeseBridgeAreaToLemmysCastle_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$67
!Define_SMW_PipeWarp_ChocolateIsland2ToChocolateSecret_XPosOfTile = $0012
!Define_SMW_PipeWarp_ChocolateIsland2ToChocolateSecret_YPosOfTile = $0017
!Define_SMW_PipeWarp_ChocolateIsland2ToChocolateSecret_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_PipeWarp_ChocolateIsland2ToChocolateSecret_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$68
!Define_SMW_PipeWarp_ChocolateSecretToChocolateIsland2_XPosOfTile = $000D
!Define_SMW_PipeWarp_ChocolateSecretToChocolateIsland2_YPosOfTile = $000B
!Define_SMW_PipeWarp_ChocolateSecretToChocolateIsland2_MapOfTile = !Define_SMW_Overworld_ValleyOfBowserSublevel
!Define_SMW_PipeWarp_ChocolateSecretToChocolateIsland2_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$69
!Define_SMW_PipeWarp_ChocolateSecretToWendysCastle_XPosOfTile = $0005
!Define_SMW_PipeWarp_ChocolateSecretToWendysCastle_YPosOfTile = $000B
!Define_SMW_PipeWarp_ChocolateSecretToWendysCastle_MapOfTile = !Define_SMW_Overworld_ValleyOfBowserSublevel
!Define_SMW_PipeWarp_ChocolateSecretToWendysCastle_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$6A
!Define_SMW_PipeWarp_WendysCastleToChocolateSecret_XPosOfTile = $000A
!Define_SMW_PipeWarp_WendysCastleToChocolateSecret_YPosOfTile = $0018
!Define_SMW_PipeWarp_WendysCastleToChocolateSecret_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_PipeWarp_WendysCastleToChocolateSecret_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$6B
!Define_SMW_BridgeToDonutPlains_XPosOfTile = $000A
!Define_SMW_BridgeToDonutPlains_YPosOfTile = $0002
!Define_SMW_BridgeToDonutPlains_MapOfTile = !Define_SMW_Overworld_YoshisIslandSublevel
!Define_SMW_BridgeToDonutPlains_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$6E
!Define_SMW_BridgeToYoshisIsland_XPosOfTile = $0005
!Define_SMW_BridgeToYoshisIsland_YPosOfTile = $0015
!Define_SMW_BridgeToYoshisIsland_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_BridgeToYoshisIsland_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$6F
!Define_SMW_DoorToVanillaDome_XPosOfTile = $000D
!Define_SMW_DoorToVanillaDome_YPosOfTile = $0009
!Define_SMW_DoorToVanillaDome_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_DoorToVanillaDome_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$70
!Define_SMW_StarWarp_DonutSecretHouseToStarRoad1_XPosOfTile = $0007
!Define_SMW_StarWarp_DonutSecretHouseToStarRoad1_YPosOfTile = $0012
!Define_SMW_StarWarp_DonutSecretHouseToStarRoad1_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_StarWarp_DonutSecretHouseToStarRoad1_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$7A
!Define_SMW_StarWarp_StarRoad1ToDonutSecretHouse_XPosOfTile = $0003
!Define_SMW_StarWarp_StarRoad1ToDonutSecretHouse_YPosOfTile = $000A
!Define_SMW_StarWarp_StarRoad1ToDonutSecretHouse_MapOfTile = !Define_SMW_Overworld_StarWorldSublevel
!Define_SMW_StarWarp_StarRoad1ToDonutSecretHouse_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$7B
!Define_SMW_StarWarp_VanillaSecret1ToStarRoad2_XPosOfTile = $0001
!Define_SMW_StarWarp_VanillaSecret1ToStarRoad2_YPosOfTile = $0005
!Define_SMW_StarWarp_VanillaSecret1ToStarRoad2_MapOfTile = !Define_SMW_Overworld_VanillaDomeSublevel
!Define_SMW_StarWarp_VanillaSecret1ToStarRoad2_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$7C
!Define_SMW_StarWarp_StarRoad2ToVanillaSecret1_XPosOfTile = $0003
!Define_SMW_StarWarp_StarRoad2ToVanillaSecret1_YPosOfTile = $0005
!Define_SMW_StarWarp_StarRoad2ToVanillaSecret1_MapOfTile = !Define_SMW_Overworld_StarWorldSublevel
!Define_SMW_StarWarp_StarRoad2ToVanillaSecret1_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$7D
!Define_SMW_StarWarp_SodaLakeToStarRoad3_XPosOfTile = $0010
!Define_SMW_StarWarp_SodaLakeToStarRoad3_YPosOfTile = $000F
!Define_SMW_StarWarp_SodaLakeToStarRoad3_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_StarWarp_SodaLakeToStarRoad3_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$7E
!Define_SMW_StarWarp_StarRoad3ToSodaLake_XPosOfTile = $0008
!Define_SMW_StarWarp_StarRoad3ToSodaLake_YPosOfTile = $0003
!Define_SMW_StarWarp_StarRoad3ToSodaLake_MapOfTile = !Define_SMW_Overworld_StarWorldSublevel
!Define_SMW_StarWarp_StarRoad3ToSodaLake_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$7F
!Define_SMW_StarWarp_ForestFortressToStarRoad4_XPosOfTile = $0014
!Define_SMW_StarWarp_ForestFortressToStarRoad4_YPosOfTile = $0010
!Define_SMW_StarWarp_ForestFortressToStarRoad4_MapOfTile = !Define_SMW_Overworld_MainMapSublevel
!Define_SMW_StarWarp_ForestFortressToStarRoad4_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$80
!Define_SMW_StarWarp_StarRoad4ToForestFortress_XPosOfTile = $000D
!Define_SMW_StarWarp_StarRoad4ToForestFortress_YPosOfTile = $0005
!Define_SMW_StarWarp_StarRoad4ToForestFortress_MapOfTile = !Define_SMW_Overworld_StarWorldSublevel
!Define_SMW_StarWarp_StarRoad4ToForestFortress_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$81
!Define_SMW_StarWarp_FrontDoorToStarRoad5_XPosOfTile = $0005
!Define_SMW_StarWarp_FrontDoorToStarRoad5_YPosOfTile = $0005
!Define_SMW_StarWarp_FrontDoorToStarRoad5_MapOfTile = !Define_SMW_Overworld_ValleyOfBowserSublevel
!Define_SMW_StarWarp_FrontDoorToStarRoad5_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$82
!Define_SMW_StarWarp_StarRoad5ToFrontDoor_XPosOfTile = $000D
!Define_SMW_StarWarp_StarRoad5ToFrontDoor_YPosOfTile = $000A
!Define_SMW_StarWarp_StarRoad5ToFrontDoor_MapOfTile = !Define_SMW_Overworld_StarWorldSublevel
!Define_SMW_StarWarp_StarRoad5ToFrontDoor_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$83
!Define_SMW_StarWarp_StarRoad5ToGnarly_XPosOfTile = $0008
!Define_SMW_StarWarp_StarRoad5ToGnarly_YPosOfTile = $0005
!Define_SMW_StarWarp_StarRoad5ToGnarly_MapOfTile = !Define_SMW_Overworld_StarWorldSublevel
!Define_SMW_StarWarp_StarRoad5ToGnarly_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$84
!Define_SMW_StarWarp_GnarlyToStarRoad5_XPosOfTile = $0002
!Define_SMW_StarWarp_GnarlyToStarRoad5_YPosOfTile = $000A
!Define_SMW_StarWarp_GnarlyToStarRoad5_MapOfTile = !Define_SMW_Overworld_SpecialWorldSublevel
!Define_SMW_StarWarp_GnarlyToStarRoad5_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$85
!Define_SMW_StarWarp_FunkyToYoshisHouse_XPosOfTile = $0002
!Define_SMW_StarWarp_FunkyToYoshisHouse_YPosOfTile = $0008
!Define_SMW_StarWarp_FunkyToYoshisHouse_MapOfTile = !Define_SMW_Overworld_SpecialWorldSublevel
!Define_SMW_StarWarp_FunkyToYoshisHouse_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$86

; The map16 tile ID of tiles that don't have an associated position/share their position with other tiles above.
!Define_SMW_AirTile_Map16Tile = $0734
!Define_SMW_ClosedDoor_Map16Tile = $0736
!Define_SMW_DestroyedIggysCastle_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$87
!Define_SMW_DestroyedMortonsCastle_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$88
!Define_SMW_DestroyedLemmysCastle_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$89
!Define_SMW_DestroyedLudwigsCastle_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$8A
!Define_SMW_DestroyedRoysCastle_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$8B
!Define_SMW_DestroyedWendysCastle_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$8C
!Define_SMW_DestroyedLarrysCastle_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$8D
!Define_SMW_DestroyedVanillaFortress_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$8E
!Define_SMW_DestroyedForestFortress_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$8F
!Define_SMW_DestroyedChocolateFortress_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$90
!Define_SMW_DestroyedValleyFortress_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$91
!Define_SMW_FlattenedYellowSwitch_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$92
!Define_SMW_FlattenedGreenSwitch_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$93
!Define_SMW_FlattenedRedSwitch_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$94
!Define_SMW_FlattenedBlueSwitch_Map16Tile = !Define_SMW_Overworld_StartOfInteractiveTileMap16+$95

; These are the "translevel" numbers assigned to each level (ie. $7E13BF). This determines what messages are used for that level, its index in the level setting table (ie, $7E1EA2), and certain other things.
; Make sure all of these are unique, unless you intend on having 2 different levels be internally considered the same (ex. If you want a destroyed variant of a castle)
; You're not limited to just $0000-$5F like the vanilla game. You can assign indexes all the way up to $00FF, unless you're willing to expand the level status table further.
!Define_SMW_LevelIndex_Level000 = $0000
!Define_SMW_LevelIndex_VanillaSecret2 = $0001
!Define_SMW_LevelIndex_VanillaSecret3 = $0002
!Define_SMW_LevelIndex_TopSecretArea = $0003
!Define_SMW_LevelIndex_DonutGhostHouse = $0004
!Define_SMW_LevelIndex_DonutPlains3 = $0005
!Define_SMW_LevelIndex_DonutPlains4 = $0006
!Define_SMW_LevelIndex_MortonsCastle = $0007
!Define_SMW_LevelIndex_GreenSwitchPalace = $0008
!Define_SMW_LevelIndex_DonutPlains2 = $0009
!Define_SMW_LevelIndex_DonutSecret1 = $000A
!Define_SMW_LevelIndex_VanillaFortress = $000B
!Define_SMW_LevelIndex_ButterBridge1 = $000C
!Define_SMW_LevelIndex_ButterBridge2 = $000D
!Define_SMW_LevelIndex_LudwigsCastle = $000E
!Define_SMW_LevelIndex_CheeseBridgeArea = $000F
!Define_SMW_LevelIndex_CookieMountain = $0010
!Define_SMW_LevelIndex_SodaLake = $0011
!Define_SMW_LevelIndex_Level012 = $0012
!Define_SMW_LevelIndex_DonutSecretHouse = $0013
!Define_SMW_LevelIndex_YellowSwitchPalace = $0014
!Define_SMW_LevelIndex_DonutPlains1 = $0015
!Define_SMW_LevelIndex_Level016 = $0016
!Define_SMW_LevelIndex_Level017 = $0017
!Define_SMW_LevelIndex_SunkenGhostShip = $0018
!Define_SMW_LevelIndex_Level019 = $0019
!Define_SMW_LevelIndex_WendysCastle = $001A
!Define_SMW_LevelIndex_ChocolateFortress = $001B
!Define_SMW_LevelIndex_ChocolateIsland5 = $001C
!Define_SMW_LevelIndex_ChocolateIsland4 = $001D
!Define_SMW_LevelIndex_Level01E = $001E
!Define_SMW_LevelIndex_ForestFortress = $001F
!Define_SMW_LevelIndex_RoysCastle = $0020
!Define_SMW_LevelIndex_ChocoGhostHouse = $0021
!Define_SMW_LevelIndex_ChocolateIsland1 = $0022
!Define_SMW_LevelIndex_ChocolateIsland3 = $0023
!Define_SMW_LevelIndex_ChocolateIsland2 = $0024
!Define_SMW_LevelIndex_IggysCastle = $0025
!Define_SMW_LevelIndex_YoshisIsland4 = $0026
!Define_SMW_LevelIndex_YoshisIsland3 = $0027
!Define_SMW_LevelIndex_YoshisHouse = $0028
!Define_SMW_LevelIndex_YoshisIsland1 = $0029
!Define_SMW_LevelIndex_YoshisIsland2 = $002A
!Define_SMW_LevelIndex_VanillaGhostHouse = $002B
!Define_SMW_LevelIndex_Level108 = $002C
!Define_SMW_LevelIndex_VanillaSecret1 = $002D
!Define_SMW_LevelIndex_VanillaDome3 = $002E
!Define_SMW_LevelIndex_DonutSecret2 = $002F
!Define_SMW_LevelIndex_Level10C = $0030
!Define_SMW_LevelIndex_FrontDoor = $0031
!Define_SMW_LevelIndex_BackDoor = $0032
!Define_SMW_LevelIndex_ValleyOfBowser4 = $0033
!Define_SMW_LevelIndex_LarrysCastle = $0034
!Define_SMW_LevelIndex_ValleyFortress = $0035
!Define_SMW_LevelIndex_Level112 = $0036
!Define_SMW_LevelIndex_ValleyOfBowser3 = $0037
!Define_SMW_LevelIndex_ValleyGhostHouse = $0038
!Define_SMW_LevelIndex_ValleyOfBowser2 = $0039
!Define_SMW_LevelIndex_ValleyOfBowser1 = $003A
!Define_SMW_LevelIndex_ChocolateSecret = $003B
!Define_SMW_LevelIndex_VanillaDome2 = $003C
!Define_SMW_LevelIndex_VanillaDome4 = $003D
!Define_SMW_LevelIndex_VanillaDome1 = $003E
!Define_SMW_LevelIndex_RedSwitchPalace = $003F
!Define_SMW_LevelIndex_LemmysCastle = $0040
!Define_SMW_LevelIndex_ForestGhostHouse = $0041
!Define_SMW_LevelIndex_ForestOfIllusion1 = $0042
!Define_SMW_LevelIndex_ForestOfIllusion4 = $0043
!Define_SMW_LevelIndex_ForestOfIllusion2 = $0044
!Define_SMW_LevelIndex_BlueSwitchPalace = $0045
!Define_SMW_LevelIndex_ForestSecretArea = $0046
!Define_SMW_LevelIndex_ForestOfIllusion3 = $0047
!Define_SMW_LevelIndex_Level124 = $0048
!Define_SMW_LevelIndex_Funky = $0049
!Define_SMW_LevelIndex_Outrageous = $004A
!Define_SMW_LevelIndex_Mondo = $004B
!Define_SMW_LevelIndex_Groovy = $004C
!Define_SMW_LevelIndex_Level129 = $004D
!Define_SMW_LevelIndex_Gnarly = $004E
!Define_SMW_LevelIndex_Tubular = $004F
!Define_SMW_LevelIndex_WayCool = $0050
!Define_SMW_LevelIndex_Awesome = $0051
!Define_SMW_LevelIndex_Level12E = $0052
!Define_SMW_LevelIndex_Level12F = $0053
!Define_SMW_LevelIndex_StarWorld2 = $0054
!Define_SMW_LevelIndex_Level131 = $0055
!Define_SMW_LevelIndex_StarWorld3 = $0056
!Define_SMW_LevelIndex_Level133 = $0057
!Define_SMW_LevelIndex_StarWorld1 = $0058
!Define_SMW_LevelIndex_StarWorld4 = $0059
!Define_SMW_LevelIndex_StarWorld5 = $005A
!Define_SMW_LevelIndex_Level137 = $005B
!Define_SMW_LevelIndex_Level138 = $005C
!Define_SMW_LevelIndex_Level139 = $005D
!Define_SMW_LevelIndex_Level13A = $005E
!Define_SMW_LevelIndex_Level13B = $005F

!Define_SMW_MaxOverworldSpriteSlot = $7C							; The number of sprite slots available minus 1, then multiplied by 4. Default is 32

if read1($00FFD5) == $23
	!SA1ROM = !TRUE
	print "SA-1 detected. Adjusting the patch accordingly..."
	if read1($00FFD7) == $0D
		fullsa1rom
	else
		sa1rom
		if read1($00FFD7) < $0C		;\ For some strange reason, the ROM ends up 2.17 MB instead of 2 MB only when applying this to an SA-1 ROM.
			org $00FFD7				;| To work around this, I'm expanding the ROM to 4 MB if its not already.
				db $0C					;|
										;|
			org $BFFFFF				;|
				db $00					;/
		endif
	endif
	!Base1 = $3000
	!Base2 = $6000
	!FastROM = $000000
	!7F9A7B = $418800
	!7EC800 = $40C800
	!RAM_SMW_OAM_MaxTilePointerMax = $400180
	!RAM_SMW_OAM_MaxTilePointerHigh = $400190
	!RAM_SMW_OAM_MaxTilePointerNormal = $4001A0
	!RAM_SMW_OAM_MaxTilePointerLow = $4001B0
	!RAM_SMW_OAM_MaxTileMirrorMax = $006180
	!RAM_SMW_OAM_MaxTileMirrorHigh = $006190
	!RAM_SMW_OAM_MaxTileMirrorNormal = $0061A0
	!RAM_SMW_OAM_MaxTileMirrorLow = $0061B0
	!RAM_SMW_OAM_TileSizeBufferMax = $40B600
	!RAM_SMW_OAM_TileSizeBufferHigh = $40B680
	!RAM_SMW_OAM_TileSizeBufferNormal = $40B700
	!RAM_SMW_OAM_TileSizeBufferLow = $40B780
	!RAM_SMW_OAM_OAMBufferMax = $40B800
	!RAM_SMW_OAM_OAMBufferHigh = $40BA00
	!RAM_SMW_OAM_OAMBufferNormal = $40BC00
	!RAM_SMW_OAM_OAMBufferLow = $40BE00
	!RAM_SMW_IO_OAMBuffer #= $400000
	!RAM_SMW_Sprites_OAMTileSizeBuffer #= $400000
	!RAM_SMW_IO_OriginalOAMBuffer #= $006200
	!RAM_SMW_Sprites_OriginalOAMTileSizeBuffer #= $006420
	!RAM_SMW_OAM_MaxTileOAMBufferIndex1 = $003100
	!RAM_SMW_OAM_MaxTileOAMBufferIndex2 = $003102
	!RAM_SMW_SA1_SA1CodePointerLo = $003180
	!RAM_SMW_SA1_SA1CodePointerHi = !RAM_SMW_SA1_SA1CodePointerLo+$01
	!RAM_SMW_SA1_SA1CodePointerBank = !RAM_SMW_SA1_SA1CodePointerLo+$02
	!RAM_SMW_SA1_BeginSA1ProcessingRoutine = $001E80
	!RAM_SMW_SA1_SNESCodePointerLo = $000183
	!RAM_SMW_SA1_SNESCodePointerHi = !RAM_SMW_SA1_SNESCodePointerLo+$01
	!RAM_SMW_SA1_SNESCodePointerBank = !RAM_SMW_SA1_SNESCodePointerLo+$02
	!RAM_SMW_SA1_SNESDoneFlag = $00018A
	SMW_MaxtTile_Get_Slot = $0084B0
else
	lorom
	!SA1ROM = !FALSE
	!Base1 = $0000
	!Base2 = $0000
	!FastROM = $800000
	!7F9A7B = $7F9A7B
	!7EC800 = $7EC800
	!RAM_SMW_OAM_MaxTilePointerMax = $000B05
	!RAM_SMW_OAM_MaxTilePointerHigh = $000B15
	!RAM_SMW_OAM_MaxTilePointerNormal = $000B25
	!RAM_SMW_OAM_MaxTilePointerLow = $000B35
	!RAM_SMW_OAM_MaxTileMirrorMax = $000B05
	!RAM_SMW_OAM_MaxTileMirrorHigh = $000B15
	!RAM_SMW_OAM_MaxTileMirrorNormal = $000B25
	!RAM_SMW_OAM_MaxTileMirrorLow = $000B35
	!RAM_SMW_OAM_TileSizeBufferMax = $7F0000
	!RAM_SMW_OAM_TileSizeBufferHigh = $7F0080
	!RAM_SMW_OAM_TileSizeBufferNormal = $7F0100
	!RAM_SMW_OAM_TileSizeBufferLow = $7F0180
	!RAM_SMW_OAM_OAMBufferMax = $7F0200
	!RAM_SMW_OAM_OAMBufferHigh = $7F0400
	!RAM_SMW_OAM_OAMBufferNormal = $7F0600
	!RAM_SMW_OAM_OAMBufferLow = $7F0800
	!RAM_SMW_IO_OAMBuffer #= $7F0000
	!RAM_SMW_Sprites_OAMTileSizeBuffer #= $7F0000
	!RAM_SMW_IO_OriginalOAMBuffer #= $000200
	!RAM_SMW_Sprites_OriginalOAMTileSizeBuffer #= $000420
	!RAM_SMW_OAM_MaxTileOAMBufferIndex1 = $000B01
	!RAM_SMW_OAM_MaxTileOAMBufferIndex2 = $000B03
endif

if read4($0E8000) == $4B4D4140			; "@AMK"
	!AddmusicKFlag = !TRUE
	print "AddmusicK detected. Adjusting the patch accordingly..."
else
	!AddmusicKFlag = !FALSE
endif

if read4($02FFE2) == $44535453			; "STSD"
	!PIXIFlag = !TRUE
	print "PIXI detected. Adjusting the patch accordingly..."
	!RAM_SMW_Sprites_LoadStatus #= $7FAF00
else
	!PIXIFlag = !FALSE
	!RAM_SMW_Sprites_LoadStatus #= $001938
endif

if !SA1ROM == !TRUE
	!RAM_SMW_Sprites_LoadStatus #= $418A00
endif

if read4($01CD1E) == $52454255			; "UBER"
	print "UberASM detected. Adjusting the patch accordingly..."
	!UberASMFlag = !TRUE
	UberASMCode_Main = read3($00A243)
	UberASMCode_Init = read3($00A5EF)
	UberASMCode_End = read3($00A2EF)
else
	!UberASMFlag = !FALSE
endif

if read1($0081E2) == $5C				;\ Check if both LM's VRAM patch is inserted and its hijack in the stripe image loaded is removed.
	if read1($008751) == $C2			;/
		print "VRAM Optimizer patch detected. Adjusting the patch accordingly..."
		!VRAMPatchOptimizeFlag = !TRUE
	else
	!VRAMPatchOptimizeFlag = !FALSE
	endif
else
	!VRAMPatchOptimizeFlag = !FALSE
endif

; New RAM defines
!RAM_SMW_Overworld_RunIntroScriptFlag #= $000DA1|!Base2
!RAM_SMW_Player_OverworldXPosMarioIsGoingToLo #= $000DC7|!Base2
!RAM_SMW_Player_OverworldXPosMarioIsGoingToHi #= !RAM_SMW_Player_OverworldXPosMarioIsGoingToLo+$01
!RAM_SMW_Player_OverworldYPosMarioIsGoingToLo #= !RAM_SMW_Player_OverworldXPosMarioIsGoingToLo+$02
!RAM_SMW_Player_OverworldYPosMarioIsGoingToHi #= !RAM_SMW_Player_OverworldXPosMarioIsGoingToLo+$03
!RAM_SMW_Overworld_WarpToChosenEntranceFlag #= $000DCB|!Base2
!RAM_SMW_Overworld_CurrentPlayerSpeedOffset #= $000DCD|!Base2
!RAM_SMW_Player_CurrentCharacterX2Lo #= $000DD6|!Base2
!RAM_SMW_Player_CurrentCharacterX2Hi #= !RAM_SMW_Player_CurrentCharacterX2Lo+$01
!RAM_SMW_Overworld_MarioMovementState #= $000F4A|!Base2
!RAM_SMW_Overworld_LuigiMovementState #= $000F4C|!Base2
!RAM_SMW_Overworld_WarpDestination #= $000F4E|!Base2
!RAM_SMW_Overworld_MarioStarWarpSpeed #= $000F50|!Base2
!RAM_SMW_Overworld_MarioWaitTimer #= $000F52|!Base2
!RAM_SMW_Overworld_LuigiWaitTimer #= $000F54|!Base2
!RAM_SMW_Overworld_MarioFacingDirection #= $000F56|!Base2
!RAM_SMW_Overworld_LuigiFacingDirection #= $000F58|!Base2
; $00 = Up
; $02 = Down
; $04 = Left
; $06 = Right
!RAM_SMW_Overworld_MarioAnimationFrame #= $000F5A|!Base2
!RAM_SMW_Overworld_LuigiAnimationFrame #= $000F5C|!Base2
!RAM_SMW_Overworld_MarioL1TileTouched #= $000F5E|!Base2
!RAM_SMW_Overworld_MarioL2TileTouched #= $000F60|!Base2
!RAM_SMW_Overworld_MarioScriptState #= $000F62|!Base2
!RAM_SMW_Overworld_EventTileXPos #= $000F64|!Base2
!RAM_SMW_Overworld_EventTileYPos #= $000F66|!Base2
!RAM_SMW_Overworld_CameraState #= $000F9A|!Base2
!RAM_SMW_Overworld_CameraFocusXPos #= $000F9C|!Base2
!RAM_SMW_Overworld_CameraFocusYPos #= $000F9E|!Base2
!RAM_SMW_Overworld_TileScriptIndex #= $000FA0|!Base2
!RAM_SMW_Overworld_BackupOfColorMathAndWindowSettings #= $000FA2|!Base2
!RAM_SMW_Overworld_LevelNameIndex #= $000FA6|!Base2
!RAM_SMW_Overworld_ShowScrollArrows #= $000FA8|!Base2
!RAM_SMW_Overworld_SpriteSpawnData #= $000FAA|!Base2

!RAM_SMW_Player_OverworldSubXPosLo #= $001B78|!Base2
!RAM_SMW_Player_OverworldSubXPosHi #= !RAM_SMW_Player_OverworldSubXPosLo+$01
!RAM_SMW_Player_OverworldSubYPosLo #= !RAM_SMW_Player_OverworldSubXPosLo+$02
!RAM_SMW_Player_OverworldSubYPosHi #= !RAM_SMW_Player_OverworldSubXPosLo+$03
!RAM_SMW_Overworld_EventTileLayer #= $001B82|!Base2
!RAM_SMW_Overworld_DirectionArrowFlags #= $001B84|!Base2
!RAM_SMW_Overworld_GameOverFlag #= $001B87|!Base2
!RAM_SMW_Overworld_HDMATransitionEffectFlag #= $001DEC|!Base2
!RAM_SMW_Overworld_HDMATransitionEffectXPosLo #= $001DF0|!Base2
!RAM_SMW_Overworld_HDMATransitionEffectXPosHi #= !RAM_SMW_Overworld_HDMATransitionEffectXPosLo+$01
!RAM_SMW_Overworld_HDMATransitionEffectYPosLo #= $001DF2|!Base2
!RAM_SMW_Overworld_HDMATransitionEffectYPosHi #= !RAM_SMW_Overworld_HDMATransitionEffectYPosLo+$01

!RAM_SMW_Overworld_MarioScriptAddress #= $0013C1|!Base2

!RAM_SMW_Overworld_EventRevealSound #= $0013D0|!Base2
	!RAM_SMW_NoYoshiIntro_TypeToUse #= $0013D0|!Base2
!RAM_SMW_Overworld_EventRevealSpeed #= $0013E9|!Base2
!RAM_SMW_Overworld_MarioSaveLocation #= $0013EB|!Base2

!RAM_SMW_Global_GameStateFlags #= $000DE0|!Base2
	!Const_SMW_GameStateFlags_UnusedBit1 = $01
	!Const_SMW_GameStateFlags_DisablePlayerStart = $02
	!Const_SMW_GameStateFlags_EnableChocolateIsland2Gimmick = $04
	!Const_SMW_GameStateFlags_SlowMoles = $08
	!Const_SMW_GameStateFlags_Sprite32ThrowsBones = $10
	!Const_SMW_GameStateFlags_SubmapCreateBlockPath = $20
	!Const_SMW_GameStateFlags_SlowThrowingHammerBros = $40
	!Const_SMW_GameStateFlags_RidingYoshiAffectsMessage = $80
!RAM_SMW_Global_OnOverworldFlag #= $000DE1|!Base2

!RAM_SMW_OWSpr_SpriteID #= $000DE5|!Base2
!RAM_SMW_OWSpr_Table7E0DF5 #= !RAM_SMW_OWSpr_SpriteID+$02

!RAM_SMW_OWSpr_SubXPos #= $000E65|!Base2
!RAM_SMW_OWSpr_XPosLo #= !RAM_SMW_OWSpr_SubXPos+$01
!RAM_SMW_OWSpr_XPosHi #= !RAM_SMW_OWSpr_SubXPos+$02

!RAM_SMW_Overworld_MarioScriptStackPointer #= $000EE5|!Base2
!RAM_SMW_Overworld_MarioScriptStack #= $000EE7|!Base2

!RAM_SMW_OWSpr_Table7E0E05 #= $0014B0|!Base2
!RAM_SMW_OWSpr_Table7E0E15 #= !RAM_SMW_OWSpr_Table7E0E05+$02
!RAM_SMW_OWSpr_XSpeed #= $001530|!Base2
!RAM_SMW_OWSpr_YSpeed #= !RAM_SMW_OWSpr_XSpeed+$02
!RAM_SMW_OWSpr_DecrementingTable7E0E25 #= $0015B0|!Base2
!RAM_SMW_OWSpr_ZSpeed #= !RAM_SMW_OWSpr_DecrementingTable7E0E25+$02
!RAM_SMW_OWSpr_YXPPCCCT #= $001630|!Base2
!RAM_SMW_OWSpr_CurrentState #= !RAM_SMW_OWSpr_YXPPCCCT+$02
!RAM_SMW_OWSpr_GenericTable #= $0016B0|!Base2
!RAM_SMW_OWSpr_LoadIndex #= !RAM_SMW_OWSpr_GenericTable+$02
!RAM_SMW_OWSpr_Properties #= !RAM_SMW_OWSpr_GenericTable+$03

!RAM_SMW_OWSpr_SubYPos #= $001730|!Base2
!RAM_SMW_OWSpr_YPosLo #= !RAM_SMW_OWSpr_SubYPos+$01
!RAM_SMW_OWSpr_YPosHi #= !RAM_SMW_OWSpr_SubYPos+$02

!RAM_SMW_OWSpr_SubZPos #= $0017C0|!Base2
!RAM_SMW_OWSpr_ZPosLo #= !RAM_SMW_OWSpr_SubZPos+$01
!RAM_SMW_OWSpr_ZPosHi #= !RAM_SMW_OWSpr_SubZPos+$02

!RAM_SMW_Overworld_ShakingIntensity #= $001887|!Base2
!RAM_SMW_Overworld_ShakingScreenTimer #= $00188C|!Base2
!RAM_SMW_ShakingLayer1DispY #= $0018A8|!Base2
!RAM_SMW_ShakingLayer1DispX #= !RAM_SMW_ShakingLayer1DispY+$02
!RAM_SMW_OWSpr_EventFadeTileBufferIndex #= !7F9A7B
!RAM_SMW_OWSpr_EventFadeTileBuffer #= !7F9A7B+$02
	!RAM_SMW_OWSpr_EventFadeTileBuffer_XPos #= !RAM_SMW_OWSpr_EventFadeTileBuffer+$00
	!RAM_SMW_OWSpr_EventFadeTileBuffer_YPos #= !RAM_SMW_OWSpr_EventFadeTileBuffer+$02
	!RAM_SMW_OWSpr_EventFadeTileBuffer_NextTileDirection #= !RAM_SMW_OWSpr_EventFadeTileBuffer+$04
	!RAM_SMW_OWSpr_EventFadeTileBuffer_Map16Tile #= !RAM_SMW_OWSpr_EventFadeTileBuffer+$06
	!RAM_SMW_OWSpr_EventFadeTileBuffer_TilemapData #= !RAM_SMW_OWSpr_EventFadeTileBuffer+$08
	!RAM_SMW_Overworld_BackUpOfLevelStatusFlags #= !7F9A7B+$02

;#############################################################################################################
;#############################################################################################################

; Constants. You probably don't need to edit these. Most of these assign names to values used in various script macros.

!Const_SMW_MarioFaceUp = $00
!Const_SMW_MarioFaceDown = $02
!Const_SMW_MarioFaceLeft = $04
!Const_SMW_MarioFaceRight = $06

!Const_SMW_MacroID_Layer1 = $00
!Const_SMW_MacroID_Layer2 = $01

!Const_SMW_MacroID_NoMove = $00
!Const_SMW_MacroID_Left = $02
!Const_SMW_MacroID_UpLeft = $04
!Const_SMW_MacroID_Up = $06
!Const_SMW_MacroID_UpRight = $08
!Const_SMW_MacroID_Right = $0A
!Const_SMW_MacroID_DownRight = $0C
!Const_SMW_MacroID_Down = $0E
!Const_SMW_MacroID_DownLeft = $10
!Const_SMW_MacroID_LastTile = $80
!Const_SMW_MacroID_NotLastTile = $00

!Const_SMW_MacroID_DoNothing = $00
!Const_SMW_MacroID_NormalExit = $01
!Const_SMW_MacroID_SecretExit1 = $02
!Const_SMW_MacroID_SecretExit2 = $03
!Const_SMW_MacroID_SecretExit3 = $04

!Const_SMW_OWPlayerAnimation_Walking = $00
!Const_SMW_OWPlayerAnimation_Swimming = $02
!Const_SMW_OWPlayerAnimation_Climbing = $04
!Const_SMW_OWPlayerAnimation_StarWarp = $06
!Const_SMW_OWPlayerAnimation_EnterLevelOnLand = $08
!Const_SMW_OWPlayerAnimation_EnterLevelInWater = $0A
!Const_SMW_OWPlayerAnimation_DeadOnLand = $0C
!Const_SMW_OWPlayerAnimation_DeadIWater = $0E

!Const_SMW_MacroID_NoSwitchPalace = $00
!Const_SMW_MacroID_YellowSwitchPalace = $01
!Const_SMW_MacroID_BlueSwitchPalace = $02
!Const_SMW_MacroID_RedSwitchPalace = $03
!Const_SMW_MacroID_GreenSwitchPalace = $04

!Const_SMW_PathMovement_NoXMovement = $00
!Const_SMW_PathMovement_Right1Tile = $01
!Const_SMW_PathMovement_Right2Tiles = $02
!Const_SMW_PathMovement_Right3Tiles = $03
!Const_SMW_PathMovement_Right4Tiles = $04
!Const_SMW_PathMovement_Right5Tiles = $05
!Const_SMW_PathMovement_Right6Tiles = $06
!Const_SMW_PathMovement_Right7Tiles = $07
!Const_SMW_PathMovement_Left8Tiles = $08
!Const_SMW_PathMovement_Left7Tiles = $09
!Const_SMW_PathMovement_Left6Tiles = $0A
!Const_SMW_PathMovement_Left5Tiles = $0B
!Const_SMW_PathMovement_Left4Tiles = $0C
!Const_SMW_PathMovement_Left3Tiles = $0D
!Const_SMW_PathMovement_Left2Tiles = $0E
!Const_SMW_PathMovement_Left1Tile = $0F
!Const_SMW_PathMovement_NoYMovement = $00
!Const_SMW_PathMovement_Down1Tile = $10
!Const_SMW_PathMovement_Down2Tiles = $20
!Const_SMW_PathMovement_Down3Tiles = $30
!Const_SMW_PathMovement_Down4Tiles = $40
!Const_SMW_PathMovement_Down5Tiles = $50
!Const_SMW_PathMovement_Down6Tiles = $60
!Const_SMW_PathMovement_Down7Tiles = $70
!Const_SMW_PathMovement_Up8Tiles = $80
!Const_SMW_PathMovement_Up7Tiles = $90
!Const_SMW_PathMovement_Up6Tiles = $A0
!Const_SMW_PathMovement_Up5Tiles = $B0
!Const_SMW_PathMovement_Up4Tiles = $C0
!Const_SMW_PathMovement_Up3Tiles = $D0
!Const_SMW_PathMovement_Up2Tiles = $E0
!Const_SMW_PathMovement_Up1Tile = $F0
!Const_SMW_PathMovement_Right1Pixel = $01
!Const_SMW_PathMovement_Right2Pixels = $02
!Const_SMW_PathMovement_Right3Pixels = $03
!Const_SMW_PathMovement_Right4Pixels = $04
!Const_SMW_PathMovement_Right5Pixels = $05
!Const_SMW_PathMovement_Right6Pixels = $06
!Const_SMW_PathMovement_Right7Pixels = $07
!Const_SMW_PathMovement_Left8Pixels = $08
!Const_SMW_PathMovement_Left7Pixels = $09
!Const_SMW_PathMovement_Left6Pixels = $0A
!Const_SMW_PathMovement_Left5Pixels = $0B
!Const_SMW_PathMovement_Left4Pixels = $0C
!Const_SMW_PathMovement_Left3Pixels = $0D
!Const_SMW_PathMovement_Left2Pixels = $0E
!Const_SMW_PathMovement_Left1Pixel = $0F
!Const_SMW_PathMovement_Down1Pixel = $10
!Const_SMW_PathMovement_Down2Pixels = $20
!Const_SMW_PathMovement_Down3Pixels = $30
!Const_SMW_PathMovement_Down4Pixels = $40
!Const_SMW_PathMovement_Down5Pixels = $50
!Const_SMW_PathMovement_Down6Pixels = $60
!Const_SMW_PathMovement_Down7Pixels = $70
!Const_SMW_PathMovement_Up8Pixels = $80
!Const_SMW_PathMovement_Up7Pixels = $90
!Const_SMW_PathMovement_Up6Pixels = $A0
!Const_SMW_PathMovement_Up5Pixels = $B0
!Const_SMW_PathMovement_Up4Pixels = $C0
!Const_SMW_PathMovement_Up3Pixels = $D0
!Const_SMW_PathMovement_Up2Pixels = $E0
!Const_SMW_PathMovement_Up1Pixel = $F0

!Const_SMW_OWPlayer_CollisionPointXDisp = $0008
!Const_SMW_OWPlayer_CollisionPointYDisp = $000C

!Const_SMW_OffscreenBehaviorProp_DespawnOffscreen = $00
!Const_SMW_OffscreenBehaviorProp_ProcessWhenOffscreen = $01

!Const_SMW_SoundPort_1DF9 = $00
!Const_SMW_SoundPort_1DFA = $01
!Const_SMW_SoundPort_1DFB = $02
!Const_SMW_SoundPort_1DFC = $03

!Const_SMW_EntranceType_MainEntrance = $00
;!Const_SMW_EntranceType_MidwayEntrance = $01				; Doesn't work currently.
!Const_SMW_EntranceType_SecondaryEntrance = $02

!Const_SMW_SpeedMultiplier_MultiplyBy1 = $00
!Const_SMW_SpeedMultiplier_MultiplyBy2 = $01
!Const_SMW_SpeedMultiplier_MultiplyBy3 = $02
!Const_SMW_SpeedMultiplier_MultiplyBy4 = $03
!Const_SMW_SpeedMultiplier_MultiplyBy5 = $04
!Const_SMW_SpeedMultiplier_MultiplyBy6 = $05
!Const_SMW_SpeedMultiplier_MultiplyBy7 = $06
!Const_SMW_SpeedMultiplier_MultiplyBy8 = $07
!Const_SMW_SpeedMultiplier_MultiplyBy9 = $08
!Const_SMW_SpeedMultiplier_MultiplyBy10 = $09

!Const_SMW_NoYoshiIntroType_GhostHouse = $00
!Const_SMW_NoYoshiIntroType_Castle_RoundHillBG = $01
!Const_SMW_NoYoshiIntroType_Rope1_RoundHillBG = $02
!Const_SMW_NoYoshiIntroType_Rope2_NightBG = $03
!Const_SMW_NoYoshiIntroType_Rope3_CraggyBG = $04
!Const_SMW_NoYoshiIntroType_Castle_NoBG = $05
!Const_SMW_NoYoshiIntroType_Null = $FF

;#############################################################################################################
;#############################################################################################################

; Macro definitions.

macro LevelNameFont_Border()
 'A' = $00
 'B' = $01
 'C' = $02
 'D' = $03
 'E' = $04
 'F' = $05
 'G' = $06
 'H' = $07
 'I' = $08
 'J' = $09
 'K' = $0A
 'L' = $0B
 'M' = $0C
 'N' = $0D
 'O' = $0E
 'P' = $0F
 'Q' = $10
 'R' = $11
 'S' = $12
 'T' = $13
 'U' = $14
 'V' = $15
 'W' = $16
 'X' = $17
 'Y' = $18
 'Z' = $19
 '!' = $1A
 '.' = $1B
 '-' = $1C
 ',' = $1D
 '?' = $1E
 ' ' = $1F
 'a' = $40
 'b' = $41
 'c' = $42
 'd' = $43
 'e' = $44
 'f' = $45
 'g' = $46
 'h' = $47
 'i' = $48
 'j' = $49
 'k' = $4A
 'l' = $4B
 'm' = $4C
 'n' = $4D
 'o' = $4E
 'p' = $4F
 'q' = $50
 'r' = $51
 's' = $52
 't' = $53
 'u' = $54
 'v' = $55
 'w' = $56
 'x' = $57
 'y' = $58
 'z' = $59
 '#' = $5A
 '(' = $5B
 ')' = $5C
 ''' = $5D
 '1' = $64
 '2' = $65
 '3' = $66
 '4' = $67
 '5' = $68
 '6' = $69
 '7' = $6A
 '0' = $6B
endmacro

macro LevelNameFont_NoBorder()
 '0' = $00
 '1' = $01
 '2' = $02
 '3' = $03
 '4' = $04
 '5' = $05
 '6' = $06
 '7' = $07
 '8' = $08
 '9' = $09
 'A' = $0A
 'B' = $0B
 'C' = $0C
 'D' = $0D
 'E' = $0E
 'F' = $0F
 'G' = $10
 'H' = $11
 'I' = $12
 'J' = $13
 'K' = $14
 'L' = $15
 'M' = $16
 'N' = $17
 'O' = $18
 'P' = $19
 'Q' = $1A
 'R' = $1B
 'S' = $1C
 'T' = $1D
 'U' = $1E
 'V' = $1F
 'W' = $20
 'X' = $21
 'Y' = $22
 'Z' = $23
 '.' = $24
 ',' = $25
 '#' = $26
 '-' = $27
 '!' = $28
 ''' = $77
 ':' = $78
 ''' = $85
 ' ' = $FC
endmacro

macro CastleDestructionTextFont()
 'A' = $3900
 'B' = $3901
 'C' = $3902
 'D' = $3903
 'E' = $3904
 'F' = $3905
 'G' = $3906
 'H' = $3907
 'I' = $3908
 'J' = $3909
 'K' = $390A
 'L' = $390B
 'M' = $390C
 'N' = $390D
 'O' = $390E
 'P' = $390F
 'Q' = $3910
 'R' = $3911
 'S' = $3912
 'T' = $3913
 'U' = $3914
 'V' = $3915
 'W' = $3916
 'X' = $3917
 'Y' = $3918
 'Z' = $3919
 '!' = $391A
 '.' = $391B
 '-' = $391C
 ',' = $391D
 '?' = $391E
 ' ' = $391F
 'a' = $3940
 'b' = $3941
 'c' = $3942
 'd' = $3943
 'e' = $3944
 'f' = $3945
 'g' = $3946
 'h' = $3947
 'i' = $3948
 'j' = $3949
 'k' = $394A
 'l' = $394B
 'm' = $394C
 'n' = $394D
 'o' = $394E
 'p' = $394F
 'q' = $3950
 'r' = $3951
 's' = $3952
 't' = $3953
 'u' = $3954
 'v' = $3955
 'w' = $3956
 'x' = $3957
 'y' = $3958
 'z' = $3959
 '#' = $395A
 '(' = $395B
 ')' = $395C
 ''' = $395D
 '1' = $3964
 '2' = $3965
 '3' = $3966
 '4' = $3967
 '5' = $3968
 '6' = $3969
 '7' = $396A
 '0' = $396B
endmacro

macro LevelNameFont_Sprite()
 '0' = $A0
 '1' = $A1
 '2' = $A2
 '3' = $A3
 '4' = $A4
 '5' = $A5
 '6' = $A6
 '7' = $A7
 '8' = $A8
 '9' = $A9
 'A' = $AA
 'B' = $AB
 'C' = $AC
 'D' = $AD
 'E' = $AE
 'F' = $AF
 'G' = $B0
 'H' = $B1
 'I' = $B2
 'J' = $B3
 'K' = $B4
 'L' = $B5
 'M' = $B6
 'N' = $B7
 'O' = $B8
 'P' = $B9
 'Q' = $BA
 'R' = $BB
 'S' = $BC
 'T' = $BD
 'U' = $BE
 'V' = $BF
 'W' = $C0
 'X' = $C1
 'Y' = $C2
 'Z' = $C3
 '.' = $C4
 ',' = $C5
 'x' = $C6
 '-' = $C7
 '!' = $C8
 '@' = $C9
 '#' = $CA
 ''' = $CB
 ' ' = $FF
endmacro

; This command entirely exits a script. Intended for game mode 0C scripts.
; If used outside of game mode 0C, it will force overworld Mario into the "Free Movement" state.
macro ScriptCommand_EndScript()
	db $00
endmacro

; This will tell the script to go to the script address specified within the current bank.
macro ScriptCommand_JumpToScriptAddress(Address)
	db $01 : dw  <Address>
endmacro

; Acts like a NOP for scripts.
; Useful if you need to remove some script commands and can't edit them through this patch. Or if you need to pad a script.
macro ScriptCommand_NOP()
	db $02
endmacro

; This will buffer an entrance to warp to into !RAM_SMW_Overworld_WarpDestination.
; Use this before running BeginLevelWarp() or BeginOverworldWarp(), or else you may warp somewhere unintended.
macro ScriptCommand_SetWarpDestination(EntranceType, EntranceID)
	db $03 : db !Const_SMW_EntranceType_<EntranceType> : dw <EntranceID>
endmacro

; This compares two unsigned 8-bit bytes stored in RAM.
; It branches to the specified address if the bytes are the same. Otherwise, the next command below is processed.
macro ScriptCommand_8BitBranchIfRAMBytesEqual(RAMByte1, RAMByte2, BranchAddress)
	db $04 : dw <RAMByte1>,<RAMByte2>,<BranchAddress>
endmacro

; This compares two unsigned 8-bit bytes stored in RAM.
; It branches to the specified address if the bytes are not the same. Otherwise, the next command below is processed.
macro ScriptCommand_8BitBranchIfRAMBytesNotEqual(RAMByte1, RAMByte2, BranchAddress)
	db $05 : dw <RAMByte1>,<RAMByte2>,<BranchAddress>
endmacro

; This compares two unsigned 8-bit bytes stored in RAM.
; It branches to the specified address if the 1st byte is less than the 2nd. Otherwise, the next command below is processed.
macro ScriptCommand_8BitBranchIfRAMBytesLessThan(RAMByte1, RAMByte2, BranchAddress)
	db $06 : dw <RAMByte1>,<RAMByte2>,<BranchAddress>
endmacro

; This compares two unsigned 8-bit bytes stored in RAM.
; It branches to the specified address if the 1st byte is greater than or equal to the 2nd. Otherwise, the next command below is processed.
macro ScriptCommand_8BitBranchIfRAMBytesGreaterThanOrEqual(RAMByte1, RAMByte2, BranchAddress)
	db $07 : dw <RAMByte1>,<RAMByte2>,<BranchAddress>
endmacro

; This compares two signed 8-bit bytes stored in RAM.
; It branches to the specified address if the 1st byte minus the 2nd is a positive number. Otherwise, the next command below is processed.
macro ScriptCommand_8BitBranchIfRAMBytesPositive(RAMByte1, RAMByte2, BranchAddress)
	db $08 : dw <RAMByte1>,<RAMByte2>,<BranchAddress>
endmacro

; This compares two signed 8-bit bytes stored in RAM.
; It branches to the specified address if the 1st byte minus the 2nd is a negative number. Otherwise, the next command below is processed.
macro ScriptCommand_8BitBranchIfRAMBytesNegative(RAMByte1, RAMByte2, BranchAddress)
	db $09 : dw <RAMByte1>,<RAMByte2>,<BranchAddress>
endmacro

; This compares an unsigned 8-bit byte stored in RAM to a constant.
; It branches to the specified address if the byte is equal to the constant. Otherwise, the next command below is processed.
macro ScriptCommand_8BitBranchIfEqual(RAMByte, Constant, BranchAddress)
	db $0A : dw <RAMByte> : db <Constant> : dw <BranchAddress>
endmacro

; This compares an unsigned 8-bit byte stored in RAM to a constant.
; It branches to the specified address if the byte is not equal to the constant. Otherwise, the next command below is processed.
macro ScriptCommand_8BitBranchIfNotEqual(RAMByte, Constant, BranchAddress)
	db $0B : dw <RAMByte> : db <Constant> : dw <BranchAddress>
endmacro

; This compares an unsigned 8-bit byte stored in RAM to a constant.
; It branches to the specified address if the byte is less than the constant. Otherwise, the next command below is processed.
macro ScriptCommand_8BitBranchIfLessThan(RAMByte, Constant, BranchAddress)
	db $0C : dw <RAMByte> : db <Constant> : dw <BranchAddress>
endmacro

; This compares an unsigned 8-bit byte stored in RAM to a constant.
; It branches to the specified address if the byte is greater than or equal to the constant. Otherwise, the next command below is processed.
macro ScriptCommand_8BitBranchIfGreaterThanOrEqual(RAMByte, Constant, BranchAddress)
	db $0D : dw <RAMByte> : db <Constant> : dw <BranchAddress>
endmacro

; This compares a signed 8-bit byte stored in RAM to a constant.
; It branches to the specified address if the byte minus the constant is a positive number. Otherwise, the next command below is processed.
macro ScriptCommand_8BitBranchIfPositive(RAMByte, Constant, BranchAddress)
	db $0E : dw <RAMByte> : db <Constant> : dw <BranchAddress>
endmacro

; This compares a signed 8-bit byte stored in RAM to a constant.
; It branches to the specified address if the byte minus the constant is a negative number. Otherwise, the next command below is processed.
macro ScriptCommand_8BitBranchIfNegative(RAMByte, Constant, BranchAddress)
	db $0F : dw <RAMByte> : db <Constant> : dw <BranchAddress>
endmacro

; This compares an 8-bit byte stored in RAM to a constant.
; It branches to the specified address if any of the bits specified are clear. Otherwise, the next command below is processed.
macro ScriptCommand_8BitCheckIfBitsClear(RAMByte, Constant, BranchAddress)
	db $10 : dw <RAMByte> : db <Constant> : dw <BranchAddress>
endmacro

; This compares an 8-bit byte stored in RAM to a constant.
; It branches to the specified address if any of the bits specified are set. Otherwise, the next command below is processed.
macro ScriptCommand_8BitCheckIfBitsSet(RAMByte, Constant, BranchAddress)
	db $11 : dw <RAMByte> : db <Constant> : dw <BranchAddress>
endmacro

; This compares two 8-bit bytes stored in RAM.
; It branches to the specified address if any of the bits specified are clear. Otherwise, the next command below is processed.
macro ScriptCommand_8BitCheckIfRAMBitsClear(RAMByte1, RAMByte2, BranchAddress)
	db $12 : dw <RAMByte1>,<RAMByte2>,<BranchAddress>
endmacro

; This compares two 8-bit bytes stored in RAM.
; It branches to the specified address if any of the bits specified are set. Otherwise, the next command below is processed.
macro ScriptCommand_8BitCheckIfRAMBitsSet(RAMByte1, RAMByte2, BranchAddress)
	db $13 : dw <RAMByte1>,<RAMByte2>,<BranchAddress>
endmacro

; This uses a constant to modify an 8-bit byte stored in RAM.
; This will clear all but the specified bits in the byte.
macro ScriptCommand_8BitANDByte(RAMByte, Constant)
	db $14 : dw <RAMByte> : db <Constant>
endmacro

; This uses a constant to modify an 8-bit byte stored in RAM.
; This will set all the specified bits in the byte.
macro ScriptCommand_8BitORAByte(RAMByte, Constant)
	db $15 : dw <RAMByte> : db <Constant>
endmacro

; This uses a constant to modify an 8-bit byte stored in RAM.
; This will invert the specified bits in the byte.
macro ScriptCommand_8BitEORByte(RAMByte, Constant)
	db $16 : dw <RAMByte> : db <Constant>
endmacro

; This uses a byte stored in RAM to modify another 8-bit byte stored in RAM.
; This will clear all but the specified bits in the byte.
macro ScriptCommand_8BitAND2Bytes(RAMByte1, RAMByte2)
	db $17 : dw <RAMByte1>,<RAMByte2>
endmacro

; This uses a byte stored in RAM to modify another 8-bit byte stored in RAM.
; This will set all the specified bits in the byte.
macro ScriptCommand_8BitORA2Bytes(RAMByte1, RAMByte2)
	db $18 : dw <RAMByte1>,<RAMByte2>
endmacro

; This uses a byte stored in RAM to modify another 8-bit byte stored in RAM.
; This will invert all the specified bits in the byte.
macro ScriptCommand_8BitEOR2Bytes(RAMByte1, RAMByte2)
	db $19 : dw <RAMByte1>,<RAMByte2>
endmacro

; This will store an 8-bit byte into the specified RAM address.
macro ScriptCommand_8BitStoreByteToRAM(RAMByte, Constant)
	db $1A : dw <RAMByte> : db <Constant>
endmacro

; This will begin warping into a level using the entrance stored using SetWarpDestination previously.
macro ScriptCommand_BeginLevelWarp()
	db $1B
endmacro

; This allows you to jump to any ASM routine ending in RTL in the ROM and execute it through the scripting system.
; Processor flags and the Data Bank Register are preserved before calling the routine.
; Also note that, when jumping to a routine, A is 8-bit, X/Y is 16-bit, and Y is being used as the script index.
macro ScriptCommand_JSLToRoutine(Address)
	db $1C : dl <Address>|!FastROM
endmacro

; This will play the specified sound effect or song.
macro ScriptCommand_PlaySoundOrMusic(SoundPort, SoundID)
if !Const_SMW_SoundPort_<SoundPort> == !Const_SMW_SoundPort_1DFB
	db $1D : db !Const_SMW_SoundPort_<SoundPort>,!Define_SMW_Music_<SoundID>
else
	db $1D : db !Const_SMW_SoundPort_<SoundPort>,!Define_SMW_Sound<SoundPort>_<SoundID>
endif
endmacro

; Player path movement command.
; This tells Mario to move 0-7 pixels in the X/Y direction relative to his current position.
macro ScriptCommand_MovePlayerToRelativeFineCoords(RelativeXCoord, RelativeYCoord)
	db $1E : db !Const_SMW_PathMovement_<RelativeXCoord>|(!Const_SMW_PathMovement_<RelativeYCoord>)
endmacro

; Sets $9D to $01 to stop all animations.
macro ScriptCommand_FreezeScreen()
	db $1F
endmacro

; Clears $9D to re-enable animations.
macro ScriptCommand_UnfreezeScreen()
	db $20
endmacro

; This will begin warping into an overworld map using the entrance stored using SetWarpDestination previously.
macro ScriptCommand_BeginOverworldWarp()
	db $21
endmacro

; Pauses the script processing for X number of frames.
macro ScriptCommand_WaitXFrames(Timer)
	db $22 : db <Timer>
endmacro

; Checks if the specified event has been cleared. If so, it branches to the specified address.
; Otherwise, the next command below is processed.
macro ScriptCommand_CheckIfXEventPassed(EventNum, BranchAddress)
	db $23 : dw <EventNum>,<BranchAddress>
endmacro

; This allows you to jump to any ASM routine ending in RTS in bank 04 and execute it through the scripting system.
; Processor flags and the Data Bank Register are preserved before calling the routine.
; Also note that, when jumping to a routine, A is 8-bit, X/Y is 16-bit, and Y is being used as the script index.
; Note that the default bank for scripts is not bank 04, so you'll need to add the routine above the "EndOfBank04:" label in OverworldRevolution.asm to use this for custom routines.
macro ScriptCommand_JSRToRoutine(Address)
	db $24 : dw <Address>
endmacro

; Player path movement command.
; This tells Mario to the specified location.
macro ScriptCommand_MovePlayerToAbsoluteCoords(XCoord, YCoord)
	db $25 : dw <XCoord>, <YCoord>
endmacro

; Player path movement command.
; This tells Mario to move 0-7 tiles in the X/Y direction relative to his current position.
macro ScriptCommand_MovePlayerToRelativeCoarseCoords(RelativeXCoord, RelativeYCoord)
	db $26 : db !Const_SMW_PathMovement_<RelativeXCoord>|(!Const_SMW_PathMovement_<RelativeYCoord>)
endmacro

; This initializes, then buffers the specified map16 as part of an event step.
; If the 3rd parameter is set to "NotLastTile", the tile update will be delayed until a "BufferNextEventTile" command has its 3rd parameter set to "LastTile"
; Otherwise, the tile will be updated right away.
; The "Next tile direction" parameter tells the script where the next tile in the event step will be placed relative to the current position defined by the most recent "SetEventTileCoords" command and all event step commands after it.
; So, if you want to buffer a 4x4 event tile, you'd set the next tile direction parameters of 4 event step commands to something like "Right", "Down", "Left", and "NoMove", assuming the current position is in the top left corner.
; It may sound complicated, but look at how the existing scripts use it and try to visualize the order of the grid squares the scripts are drawing their tiles at.
macro ScriptCommand_BeginBufferingEventTile(MetaTileID, NextTileDirection, LastTileFlag)
	db $27 : dw <MetaTileID> : db !Const_SMW_MacroID_<NextTileDirection>|!Const_SMW_MacroID_<LastTileFlag>
endmacro

; Functions the same as BeginBufferingEventTile, except without doing any initization.
; Don't use this unless you've used the "BeginBufferingEventTile" command with the "NotLastTile" parameter before it.
macro ScriptCommand_BufferNextEventTile(MetaTileID, NextTileDirection, LastTileFlag)
	db $28 : dw <MetaTileID> : db !Const_SMW_MacroID_<NextTileDirection>|!Const_SMW_MacroID_<LastTileFlag>
endmacro

; Checks if the specified event has been triggered. If so, it branches to the specified address.
; Otherwise, the next command below is processed.
macro ScriptCommand_CheckIfXEventNotPassed(EventNum, BranchAddress)
	db $29 : dw <EventNum>,<BranchAddress>
endmacro

; Sets the flag for the specified event.
macro ScriptCommand_SetEvent(EventNum)
	db $2A : dw <EventNum>
endmacro

; Functions the same as BeginBufferingEventTile, except no sound will play.
; Intended for silent event scripts, but can be used in dynamic event scripts.
macro ScriptCommand_BeginBufferingSilentEventTile(MetaTileID, NextTileDirection, LastTileFlag)
	db $2B : dw <MetaTileID> : db !Const_SMW_MacroID_<NextTileDirection>|!Const_SMW_MacroID_<LastTileFlag>
endmacro

; Functions the same as BufferNextEventTile, except no sound will play.
; Intended for silent event scripts, but can be used in dynamic event scripts.
macro ScriptCommand_BufferNextSilentEventTile(MetaTileID, NextTileDirection, LastTileFlag)
	db $2C : dw <MetaTileID> : db !Const_SMW_MacroID_<NextTileDirection>|!Const_SMW_MacroID_<LastTileFlag>
endmacro

; Debug command, used to help see if a script is running as well as make it easier to step through one to see why it breaks.
; It both executes a WDM opcode and writes to $10FFFF, which can be used to trigger breakpoints depending on the debugger.
macro ScriptCommand_DebuggerBreakpoint()
	db $2D
endmacro

; Spawns an overworld sprite with the specified position and extra flags.
macro ScriptCommand_SpawnSprite(SpriteID, XPos, YPos, ZPos, GenericParam)
	db $2E : dw !Define_SMW_SpriteID_<SpriteID>,<XPos>,<YPos>,<ZPos>,<GenericParam>
endmacro

; Displays the specified level's name.
macro ScriptCommand_DisplayLevelName(LevelID)
	db $2F : dw !Define_SMW_LevelIndex_<LevelID>
endmacro

; This jumps to a script subroutine in the current bank.
; That routine must end with the RTSToScript command to return to where this routine was called.
; The routine called must end with a RTSToScript command. Otherwise, bad things(tm) will happen.
macro ScriptCommand_JSRToScript(ScriptAddress)
	db $30 : dw <ScriptAddress>
endmacro

; Tells the script processing to return to where the last JSRToScript command was used.
macro ScriptCommand_RTSToScript()
	db $31
endmacro

; Manages the path exit transition effect used in the vanilla game.
macro ScriptCommand_DoPathExitTransition()
	db $32
endmacro

; Displays the specified prompt, such as the save menu or life exchange window.
macro ScriptCommand_DisplayPrompt(PromptID)
	db $33 : db <PromptID>
endmacro

; Initializes the position and layer that the event tile buffering commands will use to know where to place tiles.
macro ScriptCommand_SetEventTileCoords(XPos, YPos, Layer)
	db $34 : dw <XPos>|(!Const_SMW_MacroID_<Layer><<15),<YPos>
endmacro

; Sets an earthquake effect to occur for the specified number of frames.
macro ScriptCommand_MakeScreenShake(ShakeTimer)
	db $35 : dw <ShakeTimer>
endmacro

; This compares an 8-bit byte stored in RAM to a constant.
; It branches to the specified address if all of the bits specified are set. Otherwise, the next command below is processed.
macro ScriptCommand_8BitCheckIfAllBitsSet(RAMByte, Constant, BranchAddress)
	db $36 : dw <RAMByte> : db <Constant> : dw <BranchAddress>
endmacro

; This compares two 8-bit bytes stored in RAM.
; It branches to the specified address if all of the bits specified are set. Otherwise, the next command below is processed.
macro ScriptCommand_8BitCheckIfAllRAMBitsSet(RAMByte1, RAMByte2, BranchAddress)
	db $37 : dw <RAMByte1>,<RAMByte2>,<BranchAddress>
endmacro

; Functions the same as opcode $00.
macro ScriptCommand_UnusedOpcode()
	db $38
endmacro

; Uses a RAM address byte x 3 to index a specified jump table to allow jumping to variable scripts based on some condition.
; Note that the pointer table must contain 24-bit pointers for this to work.
macro ScriptCommand_ScriptJumpTable(RAMAddress, TableAddress)
	db $39 : dw <RAMAddress> : dl <TableAddress>
endmacro

; This will store an 8-bit byte from RAM into the specified RAM address.
macro ScriptCommand_8BitStoreRAMToRAM(RAMByte1, RAMByte2)
	db $3A : dw <RAMByte1>, <RAMByte2>
endmacro

; This compares an 8-bit byte stored in RAM to a constant.
; It branches to the specified address if all of the bits specified are clear. Otherwise, the next command below is processed.
macro ScriptCommand_8BitCheckIfAllBitsClear(RAMByte, Constant, BranchAddress)
	db $3B : dw <RAMByte> : db <Constant> : dw <BranchAddress>
endmacro

; This compares two 8-bit bytes stored in RAM.
; It branches to the specified address if all of the bits specified are clear. Otherwise, the next command below is processed.
macro ScriptCommand_8BitCheckIfAllRAMBitsClear(RAMByte1, RAMByte2, BranchAddress)
	db $3C : dw <RAMByte1>,<RAMByte2>,<BranchAddress>
endmacro

; Tells the camera to focus on a specific point in the current map.
macro ScriptCommand_SetCameraFocusPoint(XPos, YPos)
	db $3D : dw <XPos>,<YPos>
endmacro

; Makes the camera follow the current player again after using the previous command.
macro ScriptCommand_SetFocusPointToCurrentPlayer()
	db $3E
endmacro

; Sets the animation of the current overworld player sprite.
macro ScriptCommand_ChangePlayerAnimation(AnimID)
	db $3F : db !Const_SMW_OWPlayerAnimation_<AnimID>
endmacro

; This will add a signed 8-bit constant to the specified RAM address.
; To do a subtraction, just add a negative number.
macro ScriptCommand_8BitAddConstantToRAM(RAMByte, Constant)
	db $40 : dw <RAMByte> : db <Constant>
endmacro

; This will add a signed 8-bit byte stored in RAM to the specified RAM address.
; To do a subtraction, just add a negative number.
macro ScriptCommand_8BitAddRAMToRAM(RAMByte1, RAMByte2)
	db $41 : dw <RAMByte1>,<RAMByte2>
endmacro

; Sets the facing direction of the current overworld player sprite.
macro ScriptCommand_SetPlayerFacingDirection(FacingDirection)
	db $42 : db !Const_SMW_MarioFace<FacingDirection>
endmacro

; This jumps to a script subroutine in any bank.
; That routine must end with the RTLToScript command to return to where this routine was called.
; The routine called must end with a RTSToScript command. Otherwise, bad things(tm) will happen.
macro ScriptCommand_JSLToScript(Address)
	db $43 : dl <Address>
endmacro

; Tells the script processing to return to where the last JSLToScript command was used.
macro ScriptCommand_RTLToScript()
	db $44
endmacro

; This will tell the script to go to the script address specified.
macro ScriptCommand_JMLToScriptAddress(Address)
	db $45 : dl <Address>
endmacro

; Sets the sound effect and reveal speed for an event.
macro ScriptCommand_SetPathRevealSpeedAndSound(RevealSpeed, SoundPort, SoundID)
if !Const_SMW_SoundPort_<SoundPort> == !Const_SMW_SoundPort_1DFB
	error "You attempted to set an event to play music when revealing tiles in one of your scripts!"
else
	db $46 : db <RevealSpeed>,!Const_SMW_SoundPort_<SoundPort>,!Define_SMW_Sound<SoundPort>_<SoundID>
endif
endmacro

; This overrides the currently playing music to a different song.
; The difference between this and PlaySoundOrMusic is that this makes the song persist even if you exit the map and is saved to SRAM.
; If you want to delay the song from playing until after a map transition, use the 8BitStoreByteToRAM command on !RAM_SMW_Overworld_MusicOverride instead.
macro ScriptCommand_OverrideCurrentMapMusic(MusicID)
	db $47 : db !Define_SMW_Music_<MusicID>
endmacro

; Sets the overworld player's movement speed during path movement.
macro ScriptCommand_SetPlayerSpeed(SubpixelSpeed, Multiplier)
	db $48 : db <SubpixelSpeed>,!Const_SMW_SpeedMultiplier_<Multiplier>
endmacro

; Displays the specified message from the specified level.
macro ScriptCommand_DisplayMessage(TranslevelNum, MessageNumber)
	db $49 : dw <TranslevelNum> : db <MessageNumber>
endmacro

; This compares two unsigned 16-bit bytes stored in RAM.
; It branches to the specified address if the bytes are the same. Otherwise, the next command below is processed.
macro ScriptCommand_16BitBranchIfRAMBytesEqual(RAMByte1, RAMByte2, BranchAddress)
	db $4A : dw <RAMByte1>,<RAMByte2>,<BranchAddress>
endmacro

; This compares two unsigned 16-bit bytes stored in RAM.
; It branches to the specified address if the bytes are not the same. Otherwise, the next command below is processed.
macro ScriptCommand_16BitBranchIfRAMBytesNotEqual(RAMByte1, RAMByte2, BranchAddress)
	db $4B : dw <RAMByte1>,<RAMByte2>,<BranchAddress>
endmacro

; This compares two unsigned 16-bit bytes stored in RAM.
; It branches to the specified address if the 1st byte is less than the 2nd. Otherwise, the next command below is processed.
macro ScriptCommand_16BitBranchIfRAMBytesLessThan(RAMByte1, RAMByte2, BranchAddress)
	db $4C : dw <RAMByte1>,<RAMByte2>,<BranchAddress>
endmacro

; This compares two unsigned 16-bit bytes stored in RAM.
; It branches to the specified address if the 1st byte is greater than or equal to the 2nd. Otherwise, the next command below is processed.
macro ScriptCommand_16BitBranchIfRAMBytesGreaterThanOrEqual(RAMByte1, RAMByte2, BranchAddress)
	db $4D : dw <RAMByte1>,<RAMByte2>,<BranchAddress>
endmacro

; This compares two signed 16-bit bytes stored in RAM.
; It branches to the specified address if the 1st byte minus the 2nd is a positive number. Otherwise, the next command below is processed.
macro ScriptCommand_16BitBranchIfRAMBytesPositive(RAMByte1, RAMByte2, BranchAddress)
	db $4E : dw <RAMByte1>,<RAMByte2>,<BranchAddress>
endmacro

; This compares two signed 16-bit bytes stored in RAM.
; It branches to the specified address if the 1st byte minus the 2nd is a negative number. Otherwise, the next command below is processed.
macro ScriptCommand_16BitBranchIfRAMBytesNegative(RAMByte1, RAMByte2, BranchAddress)
	db $4F : dw <RAMByte1>,<RAMByte2>,<BranchAddress>
endmacro

; This compares an unsigned 16-bit byte stored in RAM to a constant.
; It branches to the specified address if the byte is equal to the constant. Otherwise, the next command below is processed.
macro ScriptCommand_16BitBranchIfEqual(RAMByte, Constant, BranchAddress)
	db $50 : dw <RAMByte>,<Constant>,<BranchAddress>
endmacro

; This compares an unsigned 16-bit byte stored in RAM to a constant.
; It branches to the specified address if the byte is not equal to the constant. Otherwise, the next command below is processed.
macro ScriptCommand_16BitBranchIfNotEqual(RAMByte, Constant, BranchAddress)
	db $51 : dw <RAMByte>,<Constant>,<BranchAddress>
endmacro

; This compares an unsigned 16-bit byte stored in RAM to a constant.
; It branches to the specified address if the byte is less than the constant. Otherwise, the next command below is processed.
macro ScriptCommand_16BitBranchIfLessThan(RAMByte, Constant, BranchAddress)
	db $52 : dw <RAMByte>,<Constant>,<BranchAddress>
endmacro

; This compares an unsigned 16-bit byte stored in RAM to a constant.
; It branches to the specified address if the byte is greater than or equal to the constant. Otherwise, the next command below is processed.
macro ScriptCommand_16BitBranchIfGreaterThanOrEqual(RAMByte, Constant, BranchAddress)
	db $53 : dw <RAMByte>,<Constant>,<BranchAddress>
endmacro

; This compares a signed 16-bit byte stored in RAM to a constant.
; It branches to the specified address if the byte minus the constant is a positive number. Otherwise, the next command below is processed.
macro ScriptCommand_16BitBranchIfPositive(RAMByte, Constant, BranchAddress)
	db $54 : dw <RAMByte>,<Constant>,<BranchAddress>
endmacro

; This compares a signed 16-bit byte stored in RAM to a constant.
; It branches to the specified address if the byte minus the constant is a negative number. Otherwise, the next command below is processed.
macro ScriptCommand_16BitBranchIfNegative(RAMByte, Constant, BranchAddress)
	db $55 : dw <RAMByte>,<Constant>,<BranchAddress>
endmacro

; This compares a 16-bit byte stored in RAM to a constant.
; It branches to the specified address if any of the bits specified are clear. Otherwise, the next command below is processed.
macro ScriptCommand_16BitCheckIfBitsClear(RAMByte, Constant, BranchAddress)
	db $56 : dw <RAMByte>,<Constant>,<BranchAddress>
endmacro

; This compares a 16-bit byte stored in RAM to a constant.
; It branches to the specified address if any of the bits specified are set. Otherwise, the next command below is processed.
macro ScriptCommand_16BitCheckIfBitsSet(RAMByte, Constant, BranchAddress)
	db $57 : dw <RAMByte>,<Constant>,<BranchAddress>
endmacro

; This compares a 16-bit byte stored in RAM to a constant.
; It branches to the specified address if all of the bits specified are set. Otherwise, the next command below is processed.
macro ScriptCommand_16BitCheckIfAllBitsSet(RAMByte, Constant, BranchAddress)
	db $58 : dw <RAMByte>,<Constant>,<BranchAddress>
endmacro

; This compares a 16-bit byte stored in RAM to a constant.
; It branches to the specified address if all of the bits specified are clear. Otherwise, the next command below is processed.
macro ScriptCommand_16BitCheckIfAllBitsClear(RAMByte, Constant, BranchAddress)
	db $59 : dw <RAMByte>,<Constant>,<BranchAddress>
endmacro

; This compares two 16-bit bytes stored in RAM.
; It branches to the specified address if all of the bits specified are set. Otherwise, the next command below is processed.
macro ScriptCommand_16BitCheckIfAllRAMBitsSet(RAMByte1, RAMByte2, BranchAddress)
	db $5A : dw <RAMByte1>,<RAMByte2>,<BranchAddress>
endmacro

; This compares two 16-bit bytes stored in RAM.
; It branches to the specified address if all of the bits specified are clear. Otherwise, the next command below is processed.
macro ScriptCommand_16BitCheckIfAllRAMBitsClear(RAMByte1, RAMByte2, BranchAddress)
	db $5B : dw <RAMByte1>,<RAMByte2>,<BranchAddress>
endmacro

; This compares two 16-bit bytes stored in RAM.
; It branches to the specified address if any of the bits specified are clear. Otherwise, the next command below is processed.
macro ScriptCommand_16BitCheckIfRAMBitsClear(RAMByte1, RAMByte2, BranchAddress)
	db $5C : dw <RAMByte1>,<RAMByte2>,<BranchAddress>
endmacro

; This compares two 16-bit bytes stored in RAM.
; It branches to the specified address if any of the bits specified are set. Otherwise, the next command below is processed.
macro ScriptCommand_16BitCheckIfRAMBitsSet(RAMByte1, RAMByte2, BranchAddress)
	db $5D : dw <RAMByte1>,<RAMByte2>,<BranchAddress>
endmacro

; This uses a constant to modify a 16-bit byte stored in RAM.
; This will clear all but the specified bits in the byte.
macro ScriptCommand_16BitANDByte(RAMByte, Constant)
	db $5E : dw <RAMByte>,<Constant>
endmacro

; This uses a constant to modify a 16-bit byte stored in RAM.
; This will set all the specified bits in the byte.
macro ScriptCommand_16BitORAByte(RAMByte, Constant)
	db $5F : dw <RAMByte>,<Constant>
endmacro

; This uses a constant to modify a 16-bit byte stored in RAM.
; This will invert the specified bits in the byte.
macro ScriptCommand_16BitEORByte(RAMByte, Constant)
	db $60 : dw <RAMByte>,<Constant>
endmacro

; This uses a byte stored in RAM to modify another 16-bit byte stored in RAM.
; This will clear all but the specified bits in the byte.
macro ScriptCommand_16BitAND2Bytes(RAMByte1, RAMByte2)
	db $61 : dw <RAMByte1>,<RAMByte2>
endmacro

; This uses a byte stored in RAM to modify another 16-bit byte stored in RAM.
; This will set all the specified bits in the byte.
macro ScriptCommand_16BitORA2Bytes(RAMByte1, RAMByte2)
	db $62 : dw <RAMByte1>,<RAMByte2>
endmacro

; This uses a byte stored in RAM to modify another 16-bit byte stored in RAM.
; This will invert all the specified bits in the byte.
macro ScriptCommand_16BitEOR2Bytes(RAMByte1, RAMByte2)
	db $63 : dw <RAMByte1>,<RAMByte2>
endmacro

; This will store an 16-bit byte into the specified RAM address.
macro ScriptCommand_16BitStoreByteToRAM(RAMByte, Constant)
	db $64 : dw <RAMByte>,<Constant>
endmacro

; This will store a 16-bit byte from RAM into the specified RAM address.
macro ScriptCommand_16BitStoreRAMToRAM(RAMByte1, RAMByte2)
	db $65 : dw <RAMByte1>, <RAMByte2>
endmacro

; This will add a signed 16-bit constant to the specified RAM address.
; To do a subtraction, just add a negative number.
macro ScriptCommand_16BitAddConstantToRAM(RAMByte, Constant)
	db $66 : dw <RAMByte>,<Constant>
endmacro

; This will add a signed 16-bit byte stored in RAM to the specified RAM address.
; To do a subtraction, just add a negative number.
macro ScriptCommand_16BitAddRAMToRAM(RAMByte1, RAMByte2)
	db $67 : dw <RAMByte1>,<RAMByte2>
endmacro

; Teleports the current overworld player to the specified coordinates on the specified map.
; If the map is different from the current one, then a fade out will occur to load the new map.
macro ScriptCommand_TeleportOverworldPlayerToCoords(XPos, YPos, Map)
	db $68 : dw <XPos>,<YPos>,<Map>
endmacro

; Shortcut macro that inserts a SMW style level reveal animation in a script.
macro MakeLevelTileAppear(XPosOfTile, YPosOfTile, Map16ID, Layer)
	%ScriptCommand_SpawnSprite(OWSpr0B_LevelAppearSparkle, <XPosOfTile><<4, <YPosOfTile><<4, $0000, $0000)
	%ScriptCommand_WaitXFrames($08)
	%ScriptCommand_SetEventTileCoords(<XPosOfTile>, <YPosOfTile>, <Layer>)
	%ScriptCommand_BeginBufferingSilentEventTile(<Map16ID>, NoMove, LastTile)
	%ScriptCommand_WaitXFrames($18)
endmacro

; Shortcut macro that inserts a SMW style castle destruction animation in a script.
macro DestroyCastle(XPosOfTile, YPosOfTile, Map16ID, Layer)
	%ScriptCommand_WaitXFrames($03)
	%ScriptCommand_SpawnSprite(OWSpr0E_DestroyTileSmoke, <XPosOfTile><<4, <YPosOfTile><<4, $0000, $0000)
	%ScriptCommand_WaitXFrames($10)
	%ScriptCommand_SetEventTileCoords(<XPosOfTile>, <YPosOfTile>-$01, <Layer>)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(<Map16ID>, NoMove, LastTile)
	%ScriptCommand_WaitXFrames($1E)
endmacro

; Shortcut macro that inserts a SMW style fortress destruction animation in a script.
; The only difference between this one and the previous one is that this one only updates 1 tile rather than 2.
macro DestroyFortressOrSwitchPalace(XPosOfTile, YPosOfTile, Map16ID, Layer)
	%ScriptCommand_WaitXFrames($03)
	%ScriptCommand_SpawnSprite(OWSpr0E_DestroyTileSmoke, <XPosOfTile><<4, <YPosOfTile><<4, $0000, $0000)
	%ScriptCommand_WaitXFrames($10)
	%ScriptCommand_SetEventTileCoords(<XPosOfTile>, <YPosOfTile>, <Layer>)
	%ScriptCommand_BeginBufferingSilentEventTile(<Map16ID>, NoMove, LastTile)
	%ScriptCommand_WaitXFrames($1E)
endmacro

; Shortcut macro that inserts the animation for switch blocks flying out of a switch palace.
macro DoSwitchPalaceEvent(XPosOfTile, YPosOfTile, Map16ID, Layer)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Overworld_SwitchBlockEventBlocksThrownCounter, $00)
-:
	%ScriptCommand_SpawnSprite(OWSpr0C_FlyingSwitchBlock, <XPosOfTile><<4, <YPosOfTile><<4, $0000, $0000)
	%ScriptCommand_SpawnSprite(OWSpr0C_FlyingSwitchBlock, <XPosOfTile><<4, <YPosOfTile><<4, $0000, $0002)
	%ScriptCommand_SpawnSprite(OWSpr0C_FlyingSwitchBlock, <XPosOfTile><<4, <YPosOfTile><<4, $0000, $0004)
	%ScriptCommand_SpawnSprite(OWSpr0C_FlyingSwitchBlock, <XPosOfTile><<4, <YPosOfTile><<4, $0000, $0006)
	%ScriptCommand_WaitXFrames($10)
	%ScriptCommand_SpawnSprite(OWSpr0C_FlyingSwitchBlock, <XPosOfTile><<4, <YPosOfTile><<4, $0000, $0001)
	%ScriptCommand_SpawnSprite(OWSpr0C_FlyingSwitchBlock, <XPosOfTile><<4, <YPosOfTile><<4, $0000, $0003)
	%ScriptCommand_SpawnSprite(OWSpr0C_FlyingSwitchBlock, <XPosOfTile><<4, <YPosOfTile><<4, $0000, $0005)
	%ScriptCommand_SpawnSprite(OWSpr0C_FlyingSwitchBlock, <XPosOfTile><<4, <YPosOfTile><<4, $0000, $0007)
	%ScriptCommand_WaitXFrames($10)
	%ScriptCommand_8BitAddConstantToRAM(!RAM_SMW_Overworld_SwitchBlockEventBlocksThrownCounter, $01)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Overworld_SwitchBlockEventBlocksThrownCounter, $06, -)
	%ScriptCommand_WaitXFrames($50)
	%DestroyFortressOrSwitchPalace(<XPosOfTile>, <YPosOfTile>, <Map16ID>, <Layer>)
endmacro

; Shortcut macro handles entering a level when A/B/X/Y is pressed.
macro EnterTileOnFaceButtonPress(ScriptAddress)
	%ScriptCommand_8BitCheckIfBitsSet(!RAM_SMW_IO_ControllerPress1, (!Joypad_B>>8)|(!Joypad_Y>>8), <ScriptAddress>)
	%ScriptCommand_8BitCheckIfBitsSet(!RAM_SMW_IO_ControllerPress2, !Joypad_A|!Joypad_X, <ScriptAddress>)
endmacro

; Macros used in SpriteHandlingMain.asm to define/insert custom sprites.
!OWSpriteID = 1
macro SetOWSpritePointer(Label)
!SpriteName = ""
assert !OWSpriteID < $0100,"You can't insert more than 255 overworld sprites!"
	dl <Label>_Main-$01
!Define_SMW_SpriteID_<Label> #= !OWSpriteID
!{SpriteName!{OWSpriteID}} = "<Label>"
!OWSpriteID #= !OWSpriteID+$01
endmacro

macro SetOWSpriteProperties(OffscreenBehaviorFlag)
	db !Const_SMW_OffscreenBehaviorProp_<OffscreenBehaviorFlag>
endmacro

macro InsertOverworldSprites()
!LoopCounter = 1
freecode
OWSprStart:
while !LoopCounter < !OWSpriteID
namespace !{SpriteName!{LoopCounter}}
	incsrc "Sprites/!{SpriteName!{LoopCounter}}.asm"
namespace off
!LoopCounter #= !LoopCounter+$01
endwhile
endmacro

; Copies of two macros from Vitor Vilela's SA-1 patch for the MaxTile functionality. Only used if the SA-1 patch is not used.
macro Copy_Priority(pointer, offset)
	LDA.l <pointer>+$04
	TAX
	LDA.l <pointer>+$00
	BMI.b ?Abort
	INX #<offset>
	MVP !RAM_SMW_IO_OriginalOAMBuffer>>16,!RAM_SMW_OAM_OAMBufferMax>>16
?Abort:
endmacro

macro Restrict_Buffer(pointer)
	LDA.l <pointer>+$04
	SEC
	SBC.l <pointer>+$00
	CMP.b !RAM_SMW_Misc_ScratchRAM00
	BCC.b ?AllOk
	CLC
	LDA.b !RAM_SMW_Misc_ScratchRAM00
?AllOk:
	DEC
	STA.l <pointer>+$00
	EOR.w #$FFFF
	ADC.b !RAM_SMW_Misc_ScratchRAM00
	STA.b !RAM_SMW_Misc_ScratchRAM00
endmacro

;#############################################################################################################
;#############################################################################################################

; Defines/Labels taken from my SMW disassembly. You probably shouldn't edit these.

!RAM_SMW_Misc_ScratchRAM00 #= $000000|!Base1
!RAM_SMW_Misc_ScratchRAM01 #= $000001|!Base1
!RAM_SMW_Misc_ScratchRAM02 #= $000002|!Base1
!RAM_SMW_Misc_ScratchRAM03 #= $000003|!Base1
!RAM_SMW_Misc_ScratchRAM04 #= $000004|!Base1
!RAM_SMW_Misc_ScratchRAM05 #= $000005|!Base1
!RAM_SMW_Misc_ScratchRAM06 #= $000006|!Base1
!RAM_SMW_Misc_ScratchRAM07 #= $000007|!Base1
!RAM_SMW_Misc_ScratchRAM08 #= $000008|!Base1
!RAM_SMW_Misc_ScratchRAM09 #= $000009|!Base1
!RAM_SMW_Misc_ScratchRAM0A #= $00000A|!Base1
!RAM_SMW_Misc_ScratchRAM0B #= $00000B|!Base1
!RAM_SMW_Misc_ScratchRAM0C #= $00000C|!Base1
!RAM_SMW_Misc_ScratchRAM0D #= $00000D|!Base1
!RAM_SMW_Misc_ScratchRAM0E #= $00000E|!Base1
!RAM_SMW_Misc_ScratchRAM0F #= $00000F|!Base1
!RAM_SMW_Graphics_StripeImageToUpload #= $000012|!Base1
!RAM_SMW_Counter_GlobalFrames #= $000013|!Base1
!RAM_SMW_Counter_LocalFrames #= $000014|!Base1
!RAM_SMW_IO_ControllerHold1 #= $000015|!Base1
!RAM_SMW_IO_ControllerPress1 #= $000016|!Base1
!RAM_SMW_IO_ControllerHold2 #= $000017|!Base1
!RAM_SMW_IO_ControllerPress2 #= $000018|!Base1
!RAM_SMW_Player_CurrentPowerUp #= $000019|!Base1
!RAM_SMW_Mirror_CurrentLayer1XPosLo #= $00001A|!Base1
!RAM_SMW_Mirror_CurrentLayer1XPosHi #= !RAM_SMW_Mirror_CurrentLayer1XPosLo+$01
!RAM_SMW_Mirror_CurrentLayer1YPosLo #= !RAM_SMW_Mirror_CurrentLayer1XPosLo+$02
!RAM_SMW_Mirror_CurrentLayer1YPosHi #= !RAM_SMW_Mirror_CurrentLayer1YPosLo+$01
!RAM_SMW_Mirror_CurrentLayer2XPosLo #= !RAM_SMW_Mirror_CurrentLayer1XPosLo+$04
!RAM_SMW_Mirror_CurrentLayer2XPosHi #= !RAM_SMW_Mirror_CurrentLayer2XPosLo+$01
!RAM_SMW_Mirror_CurrentLayer2YPosLo #= !RAM_SMW_Mirror_CurrentLayer1XPosLo+$06
!RAM_SMW_Mirror_CurrentLayer2YPosHi #= !RAM_SMW_Mirror_CurrentLayer2YPosLo+$01
!RAM_SMW_Mirror_Layer3XPosLo #= !RAM_SMW_Mirror_CurrentLayer1XPosLo+$08
!RAM_SMW_Mirror_Layer3XPosHi #= !RAM_SMW_Mirror_Layer3XPosLo+$01
!RAM_SMW_Mirror_Layer3YPosLo #= !RAM_SMW_Mirror_CurrentLayer1XPosLo+$0A
!RAM_SMW_Mirror_Layer3YPosHi #= !RAM_SMW_Mirror_Layer3YPosLo+$01
!RAM_SMW_Misc_SecondLevelLayerXPosLo #= $000026|!Base1
!RAM_SMW_Misc_SecondLevelLayerXPosHi #= !RAM_SMW_Misc_SecondLevelLayerXPosLo+$01
!RAM_SMW_Misc_SecondLevelLayerYPosLo #= $000028|!Base1
!RAM_SMW_Misc_SecondLevelLayerYPosHi #= !RAM_SMW_Misc_SecondLevelLayerYPosLo+$01
!RAM_SMW_Mirror_ColorMathSelectAndEnable #= $000040|!Base1
!RAM_SMW_Mirror_BG1And2WindowMaskSettings #= $000041|!Base1
!RAM_SMW_Mirror_BG3And4WindowMaskSettings #= $000042|!Base1
!RAM_SMW_Mirror_ObjectAndColorWindowSettings #= $000043|!Base1
!RAM_SMW_Mirror_ColorMathInitialSettings #= $000044|!Base1
!RAM_SMW_Camera_Layer1ScrollingDirection #= $000055|!Base1
!RAM_SMW_Camera_Layer2ScrollingDirection #= $000056|!Base1
!RAM_SMW_Misc_LevelLayoutFlags #= $00005B|!Base1
!RAM_SMW_Misc_ScreensInLvl #= $00005D|!Base1
!RAM_SMW_Camera_LastScreenHoriz #= $00005E|!Base1
!RAM_SMW_Pointer_Layer1DataLo #= $000065|!Base1
!RAM_SMW_Pointer_Layer1DataHi #= !RAM_SMW_Pointer_Layer1DataLo+$01
!RAM_SMW_Pointer_Layer1DataBank #= !RAM_SMW_Pointer_Layer1DataLo+$02
!RAM_SMW_Pointer_LoMap16BlockDataLo #= $00006B|!Base1
!RAM_SMW_Player_XSpeed #= $00007B|!Base1
!RAM_SMW_Misc_ScratchRAM8A #= $00008A|!Base1
!RAM_SMW_Misc_ScratchRAM8B #= $00008B|!Base1
!RAM_SMW_Misc_ScratchRAM8C #= $00008C|!Base1
!RAM_SMW_Misc_ScratchRAM8D #= $00008D|!Base1
!RAM_SMW_Misc_ScratchRAM8E #= $00008E|!Base1
!RAM_SMW_Misc_ScratchRAM8F #= $00008F|!Base1
!RAM_SMW_Player_XPosLo #= $000094|!Base1
!RAM_SMW_Player_XPosHi #= !RAM_SMW_Player_XPosLo+$01
!RAM_SMW_Player_YPosLo #= $000096|!Base1
!RAM_SMW_Player_YPosHi #= !RAM_SMW_Player_YPosLo+$01
!RAM_SMW_Blocks_YPosLo #= $000098|!Base1
!RAM_SMW_Blocks_YPosHi #= !RAM_SMW_Blocks_YPosLo+$01
!RAM_SMW_Blocks_XPosLo #= $00009A|!Base1
!RAM_SMW_Blocks_XPosHi #= !RAM_SMW_Blocks_XPosLo+$01
!RAM_SMW_Flag_SpritesLocked #= $00009D|!Base1
!RAM_SMW_Pointer_SpriteListDataLo #= $0000CE|!Base1
!RAM_SMW_Pointer_SpriteListDataHi #= !RAM_SMW_Pointer_SpriteListDataLo+$01
!RAM_SMW_Pointer_SpriteListDataBank #= !RAM_SMW_Pointer_SpriteListDataLo+$02
!RAM_SMW_Misc_GameMode #= $000100|!Base2
!RAM_SMW_Misc_IntroLevelFlag #= $000109|!Base2
!RAM_SMW_Misc_CurrentSaveFile = $00010A|!Base2
!RAM_SMW_LM_Misc_CurrentLevelNumberLo #= $00010B|!Base2
!RAM_SMW_LM_Misc_CurrentLevelNumberHi #= !RAM_SMW_LM_Misc_CurrentLevelNumberLo+$01
!RAM_SMW_Misc_HDMAWindowEffectTable #= $0004A0|!Base2
!RAM_SMW_Palettes_PaletteUploadTableIndex #= $000680|!Base2
!RAM_SMW_Palettes_DynamicPaletteUploadIndex #= $000681|!Base2
!RAM_SMW_Palettes_DynamicPaletteBytesToUpload #= $000682|!Base2
!RAM_SMW_Palettes_DynamicPaletteCGRAMAddress #= !RAM_SMW_Palettes_DynamicPaletteBytesToUpload+$01
!RAM_SMW_Palettes_DynamicPaletteColors #= !RAM_SMW_Palettes_DynamicPaletteBytesToUpload+$02
!RAM_SMW_Palettes_BackgroundColorLo #= $000701|!Base2
!RAM_SMW_Palettes_BackgroundColorHi #= !RAM_SMW_Palettes_BackgroundColorLo+$01
!RAM_SMW_Palettes_PaletteMirror #= !RAM_SMW_Palettes_BackgroundColorLo+$02
!RAM_SMW_Palettes_CopyOfBackgroundColorLo #= $000903|!Base2
!RAM_SMW_Palettes_CopyOfBackgroundColorHi #= !RAM_SMW_Palettes_CopyOfBackgroundColorLo+$01
!RAM_SMW_Palettes_CopyOfPaletteMirror #= !RAM_SMW_Palettes_CopyOfBackgroundColorLo+$02
!RAM_SMW_LM_Level_MinYOffsetForSpriteSpawnRange #= $000BF0|!Base2
!RAM_SMW_LM_Level_MaxYOffsetForSpriteSpawnRange #= $000BF2|!Base2
!RAM_SMW_LM_Misc_24BitL1LevelScreenPosLoPtrs #= $000BF6|!Base2
!RAM_SMW_LM_Misc_24BitL2LevelScreenPosLoPtrs #= $000C26|!Base2
!RAM_SMW_Player_NumberOfTilesToUpdate #= $000D84|!Base2
!RAM_SMW_Graphics_DynamicSpritePointersTopLo #= $000D85|!Base2
!RAM_SMW_Graphics_DynamicSpritePointersBottomLo #= !RAM_SMW_Graphics_DynamicSpritePointersTopLo+$0A
!RAM_SMW_Misc_NMIToUseFlag #= $000D9B|!Base2
!RAM_SMW_Mirror_MainScreenLayers #= $000D9D|!Base2
!RAM_SMW_Mirror_SubScreenLayers #= $000D9E|!Base2
!RAM_SMW_Mirror_HDMAEnable #= $000D9F|!Base2
!RAM_SMW_IO_ControllerHold1CopyP1 #= $000DA2|!Base2
!RAM_SMW_IO_ControllerHold1CopyP2 #= !RAM_SMW_IO_ControllerHold1CopyP1+$01
!RAM_SMW_IO_ControllerHold2CopyP1 #= !RAM_SMW_IO_ControllerHold1CopyP1+$02
!RAM_SMW_IO_ControllerHold2CopyP2 #= !RAM_SMW_IO_ControllerHold1CopyP1+$03
!RAM_SMW_IO_ControllerPress1CopyP1 #= !RAM_SMW_IO_ControllerHold1CopyP1+$04
!RAM_SMW_IO_ControllerPress1CopyP2 #= !RAM_SMW_IO_ControllerHold1CopyP1+$05
!RAM_SMW_IO_ControllerPress2CopyP1 #= !RAM_SMW_IO_ControllerHold1CopyP1+$06
!RAM_SMW_IO_ControllerPress2CopyP2 #= !RAM_SMW_IO_ControllerHold1CopyP1+$07
!RAM_SMW_Mirror_MosaicSizeAndBGEnable #= $000DB0|!Base2
!RAM_SMW_Flag_TwoPlayerGame #= $000DB2|!Base2
!RAM_SMW_Player_CurrentCharacter #= $000DB3|!Base2
!RAM_SMW_Player_MariosLives #= $000DB4|!Base2
!RAM_SMW_Player_LuigisLives #= !RAM_SMW_Player_MariosLives+$01
!RAM_SMW_Player_MariosCoins #= $000DB6|!Base2
!RAM_SMW_Player_LuigisCoins #= !RAM_SMW_Player_MariosCoins+$01
!RAM_SMW_Player_MariosPowerUp #= $000DB8|!Base2
!RAM_SMW_Player_LuigisPowerUp #= !RAM_SMW_Player_MariosPowerUp+$01
!RAM_SMW_Player_MariosYoshi #= $000DBA|!Base2
!RAM_SMW_Player_LuigisYoshi #= !RAM_SMW_Player_MariosYoshi+$01
!RAM_SMW_Player_MariosItemBox #= $000DBC|!Base2
!RAM_SMW_Player_LuigisItemBox #= !RAM_SMW_Player_MariosItemBox+$01
!RAM_SMW_Player_CurrentLifeCount #= $000DBE|!Base2
!RAM_SMW_Player_CurrentCoinCount #= $000DBF|!Base2
!RAM_SMW_Yoshi_CarryOverLevelsFlag #= $000DC1|!Base2
!RAM_SMW_Player_CurrentItemBox #= $000DC2|!Base2
!RAM_SMW_Player_OverworldXSpeedLo #= $000DCF|!Base2
!RAM_SMW_Player_OverworldXSpeedHi #= !RAM_SMW_Player_OverworldXSpeedLo+$01
!RAM_SMW_Player_OverworldYSpeedLo #= !RAM_SMW_Player_OverworldXSpeedLo+$02
!RAM_SMW_Player_OverworldYSpeedHi #= !RAM_SMW_Player_OverworldXSpeedLo+$03
!RAM_SMW_Misc_ExitLevelAction #= $000DD5|!Base2
!RAM_SMW_Flag_SwitchPlayers = $000DD8|!Base2
!RAM_SMW_Misc_MusicRegisterBackup #= $000DDA|!Base2
!RAM_SMW_Sprites_CurrentlyProcessedOverworldSprite #= $000DDE|!Base2
!RAM_SMW_Overworld_LevelNumberLo #= $0013BF|!Base2
!RAM_SMW_Misc_CurrentlyActiveBossEndCutscene #= $0013C6|!Base2
!RAM_SMW_Yoshi_CurrentYoshiColor #= $0013C7|!Base2
!RAM_SMW_Flag_ShowContinueAndEnd #= $0013C9|!Base2
!RAM_SMW_Flag_ShowSavePrompt #= $0013CA|!Base2
!RAM_SMW_Flag_GotMidpoint #= $0013CE|!Base2
!RAM_SMW_Misc_ColorOfPalaceSwitchPressed1 #= $0013D2|!Base2
!RAM_SMW_Timer_PreventPause #= $0013D3|!Base2
!RAM_SMW_Flag_DisableLayer3Scroll #= $0013D5|!Base2
!RAM_SMW_Timer_WaitBeforeScoreTally #= $0013D6|!Base2
!RAM_SMW_LM_Misc_LevelScreenSizeLo #= $0013D7|!Base2
!RAM_SMW_LM_Misc_LevelScreenSizeHi #= !RAM_SMW_LM_Misc_LevelScreenSizeLo+$01
!RAM_SMW_Pointer_CurrentLevelEndProcess #= $0013D9|!Base2
!RAM_SMW_Player_CurrentLayerPriority #= $0013F9|!Base2
!RAM_SMW_Flag_Layer1HorizontalScrollLevelSetting #= $001411|!Base2
!RAM_SMW_Flag_Layer1VerticalScrollLevelSetting #= $001412|!Base2
!RAM_SMW_Flag_Layer2HorizontalScrollLevelSetting #= $001413|!Base2
!RAM_SMW_Flag_Layer2VerticalScrollLevelSetting #= $001414|!Base2
!RAM_SMW_Counter_SublevelsEntered #= $00141A|!Base2
!RAM_SMW_Flag_ShowPlayerStart = $00141D|!Base2
!RAM_SMW_Flag_DisableNoYoshiIntro #= $00141F|!Base2
!RAM_SMW_Misc_DisplayMessage = $001426|!Base2
!RAM_SMW_Flag_UploadLoadScreenLettersToVRAM #= $00143A|!Base2
!RAM_SMW_Overworld_SwitchBlockEventBlocksThrownCounter #= $001436|!Base2
!RAM_SMW_Misc_Layer1XPosLo #= $001462|!Base2
!RAM_SMW_Misc_Layer1XPosHi #= !RAM_SMW_Misc_Layer1XPosLo+$01
!RAM_SMW_Misc_Layer1YPosLo #= !RAM_SMW_Misc_Layer1XPosLo+$02
!RAM_SMW_Misc_Layer1YPosHi #= !RAM_SMW_Misc_Layer1YPosLo+$01
!RAM_SMW_Misc_Layer2XPosLo #= !RAM_SMW_Misc_Layer1XPosLo+$04
!RAM_SMW_Misc_Layer2XPosHi #= !RAM_SMW_Misc_Layer2XPosLo+$01
!RAM_SMW_Misc_Layer2YPosLo #= !RAM_SMW_Misc_Layer1XPosLo+$06
!RAM_SMW_Misc_Layer2YPosHi #= !RAM_SMW_Misc_Layer2YPosLo+$01
!RAM_SMW_Misc_Layer3XDispLo #= !RAM_SMW_Misc_Layer1XPosLo+$08
!RAM_SMW_Misc_Layer3XDispHi #= !RAM_SMW_Misc_Layer3XDispLo+$01
!RAM_SMW_Misc_RandomByte1 #= $00148D|!Base2
!RAM_SMW_Misc_RandomByte2 #= !RAM_SMW_Misc_RandomByte1+$01
!RAM_SMW_Palettes_LevelEndColorFadeDirection #= $001494|!Base2
!RAM_SMW_Timer_LevelEndFade #= $001495|!Base2
!RAM_SMW_Player_AnimationTimer #= $001496|!Base2
!RAM_SMW_Timer_CapeFlapAnimation #= $0014A2|!Base2
!RAM_SMW_Misc_Layer1YDisp #= $0017BC|!Base2
!RAM_SMW_Misc_Layer1XDisp #= $0017BD|!Base2
!RAM_SMW_Misc_Layer2YDisp #= $0017BE|!Base2
!RAM_SMW_Misc_Layer2XDisp #= $0017BF|!Base2
!RAM_SMW_Player_RidingYoshiFlag #= $00187A|!Base2
!RAM_SMW_Misc_ScratchRAM7E18B6 #= $0018B6|!Base2
!RAM_SMW_Misc_LevelModeSetting #= $001925|!Base2
!RAM_SMW_Misc_CurrentLayerBeingProcessedLo #= $001933|!Base2
!RAM_SMW_Misc_SubscreenExitEntranceNumberLo #= $0019B8|!Base2
!RAM_SMW_Misc_SubscreenExitProperties #= $0019D8|!Base2
!RAM_SMW_Misc_CurrentLayerBeingProcessedHi #= !RAM_SMW_Misc_CurrentLayerBeingProcessedLo+$01
!RAM_SMW_Misc_ItemMemoryBits #= $0019F8|!Base2
!RAM_SMW_Overworld_Layer1SubXPos #= $001B7C|!Base2
!RAM_SMW_Overworld_Layer1SubYPos #= !RAM_SMW_Overworld_Layer1SubXPos+$01
!RAM_SMW_Flag_MessageWindowSizeChangeDirection #= $001B88|!Base2
!RAM_SMW_Timer_WaitBeforeMessageWindowSizeChange #= $001B89|!Base2
!RAM_SMW_Flag_WhoGetsLivesInExchangeMenu #= $001B8A|!Base2
!RAM_SMW_Timer_LifeExchangeBlinkingArrowFrames #= $001B8B|!Base2
!RAM_SMW_Timer_DisplaySpecialMessage #= $001DF5|!Base2
!RAM_SMW_Overworld_TeleportToLocationIndex = $001DF6|!Base2
!RAM_SMW_IO_SoundCh1 #= $001DF9|!Base2
!RAM_SMW_IO_SoundCh2 #= !RAM_SMW_IO_SoundCh1+$01
!RAM_SMW_IO_MusicCh1 #= !RAM_SMW_IO_SoundCh1+$02
!RAM_SMW_IO_SoundCh3 #= !RAM_SMW_IO_SoundCh1+$03
!RAM_SMW_Palettes_LightningFlashColorIndex #= $001FFB|!Base2
!RAM_SMW_Timer_WaitBeforeNextLightningFlash #= $001FFC|!Base2
!RAM_SMW_Timer_LightningFrameDuration #= $001FFD|!Base2
!RAM_SMW_Blocks_Map16TableLo #= !7EC800
!RAM_SMW_Sprites_ResetSpriteOAMRt = $7F8000
!RAM_SMW_LM_Misc_PreviousLayer1XPos #= $7F831F
!RAM_SMW_LM_Misc_PreviousLayer1YPos #= $7F8321
!RAM_SMW_LM_Misc_PreviousLayer2XPos #= $7F8323
!RAM_SMW_LM_Misc_PreviousLayer2YPos #= $7F8325
!RAM_SMW_Misc_StripeImageUploadIndexLo #= $7F837B
!RAM_SMW_Misc_StripeImageUploadIndexHi #= !RAM_SMW_Misc_StripeImageUploadIndexLo+$01
!RAM_SMW_Misc_StripeImageUploadTable #= $7F837D
!RAM_SMW_Blocks_Map16TableHi #= !7EC800+$010000

struct SMW_OAMBuffer !RAM_SMW_IO_OAMBuffer
	.XDisp: skip $01
	.YDisp: skip $01
	.Tile: skip $01
	.Prop: skip $01
endstruct align $04

struct SMW_CopyOfPaletteMirror !RAM_SMW_Palettes_CopyOfPaletteMirror
	.LowByte: skip $01
	.HighByte: skip $01
endstruct align $02

struct SMW_PaletteMirror !RAM_SMW_Palettes_PaletteMirror
	.LowByte: skip $01
	.HighByte: skip $01
endstruct align $02

struct SMW_UpperOAMBuffer !RAM_SMW_IO_OAMBuffer+$0200
	.Slot: skip $01
endstruct align $01

struct SMW_OAMTileSizeBuffer !RAM_SMW_Sprites_OAMTileSizeBuffer
	.Slot: skip $01
endstruct

struct SMW_StripeImageUploadTable !RAM_SMW_Misc_StripeImageUploadTable
	.LowByte: skip $01
	.HighByte: skip $01
endstruct align $02

struct SMW_DynamicSpritePointersTop !RAM_SMW_Graphics_DynamicSpritePointersTopLo
	.LowByte: skip $01
	.HighByte: skip $01
endstruct align $02

struct SMW_DynamicSpritePointersBottom !RAM_SMW_Graphics_DynamicSpritePointersBottomLo
	.LowByte: skip $01
	.HighByte: skip $01
endstruct align $02

!RAM_SMW_OWSpr01_Lakitu_FollowMarioRangeIndex #= !RAM_SMW_OWSpr_Table7E0DF5
!RAM_SMW_OWSpr01_Lakitu_HorizAndVertMovementDirection #= !RAM_SMW_OWSpr_Table7E0E05				; Note: Also affects movement in the Z axis
!RAM_SMW_OWSpr01_Lakitu_HomeIntoMarioFlag #= !RAM_SMW_OWSpr_Table7E0E15
!RAM_SMW_OWSpr06_KoopaKid_CurrentMovementState #= !RAM_SMW_OWSpr_Table7E0DF5
!RAM_SMW_OWSpr06_KoopaKid_AnimationTimer #= !RAM_SMW_OWSpr_Table7E0E05
!RAM_SMW_OWSpr06_KoopaKid_StateTimer #= !RAM_SMW_OWSpr_DecrementingTable7E0E25
!RAM_SMW_OWSpr07_Smoke_AnimationFrameCounter #= !RAM_SMW_OWSpr_Table7E0DF5
!RAM_SMW_OWSpr09_Bowser_HorizontalMovementDirection #= !RAM_SMW_OWSpr_Table7E0DF5
!RAM_SMW_OWSpr09_Bowser_VerticalMovementDirection #= !RAM_SMW_OWSpr_Table7E0E05
!RAM_SMW_OWSpr09_Bowser_MovementFrameCounter #= !RAM_SMW_OWSpr_Table7E0E15
!RAM_SMW_OWSpr0A_Boo_HorizontalMovementDirection #= !RAM_SMW_OWSpr_Table7E0DF5
!RAM_SMW_OWSpr0A_Boo_VerticalMovementDirection #= !RAM_SMW_OWSpr_Table7E0E05
!RAM_SMW_OWSpr0A_Boo_MovementFrameCounter #= !RAM_SMW_OWSpr_Table7E0E15

SMW_ClearOverworldAndCutsceneRAM_Main = $00A1A6|!FastROM
SMW_SpecifySublevelToLoad_Main = $05D796|!FastROM
SMW_HandleSPCUploads_UploadOverworldMusicBank = $00810E|!FastROM
SMW_ClearLayer3Tilemap_Main = $0085FA|!FastROM
SMW_HandleStandardLevelCameraScroll_Main = $00F6DB|!FastROM
SMW_HandleScrollSpriteAndLayer3Scrolling_Main = $05BC00|!FastROM
SMW_CheckIfLevelTilemapsNeedScrollUpdate_Main = $0586F1|!FastROM
SMW_InitializeLevelLayer1And2Tilemaps_Main = $05809E|!FastROM
SMW_UploadGraphicsFiles_Main = $00A9DA|!FastROM
InitializeLayer3RAM = $05BE8A|!FastROM
SMW_InitializeLevelLayer3_Main = $009FB8|!FastROM
SMW_InitializeLevelTileAnimations_Main = $00A5F9|!FastROM
SMW_SetupHDMAWindowingEffects_EndHDMA = $009260|!FastROM
SMW_UpdateEntirePalette_Main = $00922F|!FastROM
SMW_SetKeepGameModeActiveTimer_OneFrame = $009F29|!FastROM
SMW_CompressOAMTileSizeBuffer_Main = $008494|!FastROM
SMW_InitializeLevelRAM_Main = $00A635|!FastROM
SMW_LoadSublevel_Main = $05801E|!FastROM
SMW_UploadLevelAnimations_Main = $00A390|!FastROM
SMW_LoadStripeImage_Main = $0084C8|!FastROM
SMW_LoadStripeImage_DATA_008599 = $008599|!FastROM
SMW_UploadPlayerGFX_Main = $00A300|!FastROM
SMW_GetRand_Main = $01ACF9|!FastROM
SMW_HandleCustomMap16_Main = $06F540|!FastROM
SMW_OverworldEventProcess04_FadeInLayer2Tile_CODE_00B006 = $00B006|!FastROM
SMW_SetVisibleLayers_Main = $0093FD|!FastROM
SMW_ParseLevelSpriteList_Main = $02A7FC|!FastROM
SMW_ParseLevelSpriteList_Entry2 = $02A802|!FastROM
SMW_LevelDataLayoutTables_LoTablePtrs = $00BEA8|!FastROM
SMW_SpecifySublevelToLoad_CODE_05D7D2 = $05D7D2|!FastROM
SMW_SpecifySublevelToLoad_CODE_05D8BC = $05D8BC|!FastROM
SMW_SpecifySublevelToLoad_CODE_05D8A2 = $05D8A2|!FastROM
SMW_SpecifySublevelToLoad_CODE_05DA60 = $05DA60|!FastROM
SMW_SpecifySublevelToLoad_CODE_05DAD7 = $05DAD7|!FastROM
SMW_HandleStandardLevelCameraScroll_CODE_00F7E8 = $00F7E8|!FastROM
SMW_GenericPage01Tile_CODE_00C0FB = $00C0FB|!FastROM
SMW_ParseLevelSpriteList_CODE_02A865 = $02A865|!FastROM
SMW_ParseLevelSpriteList_CODE_02A846 = $02A846|!FastROM
SMW_ParseLevelSpriteList_CODE_02A996 = $02A996|!FastROM
SMW_DropReservedItem_CODE_028071 = $028071|!FastROM
SMW_LoadStripeImage_CODE_0084CF = $0084CF|!FastROM
SMW_SaveGame_Main = $009BC9|!FastROM
SMW_GameMode00_LoadNintendoPresents_Mode04Finish = $0093F7|!FastROM
SMW_SetPlayerPose_Main = $00CEB1|!FastROM
SMW_PlayerGFXRt_Main = $00E2BD|!FastROM
SMW_DisplayingContinueEnd_Main = $009B80|!FastROM
SMW_UploadGraphicsFiles_SkipSpecial = $00AA80|!FastROM
SMW_InitializeEnemyRollcallLayerPositions_CODE_0CAE48 = $0CAE48|!FastROM
SMW_NorSprXXX_NetKoopas_Status08_CODE_01B9D6 = $01B9D6|!FastROM
SMW_StunnedShellGFXRt_Return0198A6 = $0198A6|!FastROM
SMW_OverworldPrompt07_DisplayingSavePrompt_Bank00 = $009BA8|!FastROM
SMW_CloseOverworldPrompt_CODE_009C16 = $009C16|!FastROM
SMW_DisplayMessage_Main = $05B10C|!FastROM
SMW_DisplayMessage_DATA_05A580 = $05A580|!FastROM
SMW_DisplayMessage_DrawSwitchBlocks = $05B2EB|!FastROM
SMW_DisplayMessage_DATA_05A590 = $05A590|!FastROM
SMW_DisplayMessage_CODE_05B241 = $05B241|!FastROM
SMW_DisplayMessage_CODE_05B250 = $05B250|!FastROM
SMW_LMSecondaryEntrancesHack_CODE_05DC53 = $05DC53|!FastROM
SMW_NorSpr035_Yoshi_Status08_CODE_01EC40 = $01EC40|!FastROM
SMW_BufferFileSelectText_CODE_009DB5 = $009DB5|!FastROM
SMW_GameMode08_FileSelect_CODE_009D22 = $009D22|!FastROM
SMW_NorSprXXX_SmallMontyMole_Status08_CODE_01E302 = $01E302|!FastROM
SMW_VBlankRoutine_CODE_00823D = $00823D|!FastROM
SMW_VBlankRoutine_CODE_008283 = $008283|!FastROM
SMW_VBlankRoutine_CODE_0082B0 = $0082B0|!FastROM
SMW_LoadSaveBufferData_Main = $00A195|!FastROM
SMW_InitializeSaveData_Main = $009F06|!FastROM
SMW_InitializeSaveData_CODE_009F18 = $009F18|!FastROM
SMW_TriggerHidden1up_Main = $03C2D9|!FastROM
SMW_HandleMenuCursor_DATA_009E7E = $009E7E|!FastROM
SMW_SetMap16HighByteForCurrentObject_Page00 = $0DAA0D|!FastROM
SMW_SetMap16HighByteForCurrentObject_Page01 = $0DAA08|!FastROM
SMW_ExtendedObj8E_YellowSwitchBlock_InactiveTiles = $0DB589|!FastROM
SMW_GrasslandObj3F_SmallBushes_LeftTiles = $0DB5A8|!FastROM
SMW_RunPlayerBlockCode_CODE_00EED1 = $00EED1|!FastROM
SMW_RunPlayerBlockCode_CODE_00EEB7 = $00EEB7|!FastROM
SMW_PlayerState00_Normal_CODE_00CA20 = $00CA20|!FastROM
SMW_PlayerState00_Normal_CODE_00CA25 = $00CA25|!FastROM
SMW_SaveFileLocations_Hi = $009CCB|!FastROM
SMW_SaveFileLocations_Lo = $009CCE|!FastROM
SMW_HexToDec_Bank00 = $009045|!FastROM
LMVRAMPatchRoutine_1FA370 = read3($00A5A3)|!FastROM
SMW_ProcessLevelExAnimation_Main = read3($00A2A6)|!FastROM
SMW_PaletteBufferHijack_Main = read3($00A5E4)|!FastROM
SMW_LoadCustomLevelPalette_Main = read3($00A5C0)|!FastROM
SMW_UploadLevelLayer1And2Tilemaps_Main = read3($00820A)|!FastROM
SMW_CustomLevelDimensionsHacks_AnalyzeSpriteList = read3($02ACA5)|!FastROM

!Define_SMW_Sound1DF9_HitHead = $01
!Define_SMW_Sound1DF9_Contact = $02
!Define_SMW_Sound1DF9_KickShell = $03
!Define_SMW_Sound1DF9_IntoPipe = $04
!Define_SMW_Sound1DF9_MidwayPoint = $05
!Define_SMW_Sound1DF9_YoshiGulp = $06
!Define_SMW_Sound1DF9_DryBonesCollapse = $07
!Define_SMW_Sound1DF9_SpinJumpKill = $08
!Define_SMW_Sound1DF9_FlyWithCape = $09
!Define_SMW_Sound1DF9_GetPowerup = $0A
!Define_SMW_Sound1DF9_ONOFFSwitch = $0B
!Define_SMW_Sound1DF9_CarryItemToGoal = $0C
!Define_SMW_Sound1DF9_GetCape = $0D
!Define_SMW_Sound1DF9_Swim = $0E
!Define_SMW_Sound1DF9_HurtWhileFlying = $0F
!Define_SMW_Sound1DF9_MagicShoot = $10
!Define_SMW_Sound1DF9_Pause = $11
!Define_SMW_Sound1DF9_UnPause = $12
!Define_SMW_Sound1DF9_Stomp1 = $13
!Define_SMW_Sound1DF9_Stomp2 = $14
!Define_SMW_Sound1DF9_Stomp3 = $15
!Define_SMW_Sound1DF9_Stomp4 = $16
!Define_SMW_Sound1DF9_Stomp5 = $17
!Define_SMW_Sound1DF9_Stomp6 = $18
!Define_SMW_Sound1DF9_Stomp7 = $19
!Define_SMW_Sound1DF9_Grinder1 = $1A
!Define_SMW_Sound1DF9_Grinder2 = $1B
!Define_SMW_Sound1DF9_YoshiCoin = $1C
!Define_SMW_Sound1DF9_RunningOutOfTime = $1D
!Define_SMW_Sound1DF9_PBalloon = $1E
!Define_SMW_Sound1DF9_KoopalingDead = $1F
!Define_SMW_Sound1DF9_YoshiSpit = $20
!Define_SMW_Sound1DF9_ValleyOfBowserAppears = $21
!Define_SMW_Sound1DF9_EndValleyOfBowserAppears = $22
!Define_SMW_Sound1DF9_LemmyWendyFall = $23
!Define_SMW_Sound1DF9_Unused = $24
!Define_SMW_Sound1DF9_BlarggRoar = $25
!Define_SMW_Sound1DF9_FireworksWhistle = $26
!Define_SMW_Sound1DF9_FireworksBang = $27
!Define_SMW_Sound1DF9_LouderFireworksWhistle = $28
!Define_SMW_Sound1DF9_LouderFireworksBang = $29
!Define_SMW_Sound1DF9_PeachPoppingOutOfClownCar = $2A
!Define_SMW_Sound1DF9_IncreaseMusicTempo = $FF

!Define_SMW_Sound1DFA_Jump = $01
!Define_SMW_Sound1DFA_TurnOnYoshiDrum = $02
!Define_SMW_Sound1DFA_TurnOffYoshiDrum = $03
!Define_SMW_Sound1DFA_Grinder = $04

!Define_SMW_Music_NoMusic = $00
!Define_SMW_Music_Piano = $01
!Define_SMW_Music_HereWeGo = $02
!Define_SMW_Music_WaterLevel = $03
!Define_SMW_Music_FightBowser1 = $04
!Define_SMW_Music_BossBattle = $05
!Define_SMW_Music_CaveDrums = $06
!Define_SMW_Music_GhostHouse = $07
!Define_SMW_Music_Castle = $08
!Define_SMW_Music_MarioDied = $09
!Define_SMW_Music_GameOver = $0A
!Define_SMW_Music_PassedBoss = $0B
!Define_SMW_Music_PassedLevel = $0C
!Define_SMW_Music_HaveStar = $0D
!Define_SMW_Music_DirectCoins = $0E
!Define_SMW_Music_IntoKeyhole1 = $0F
!Define_SMW_Music_IntoKeyhole2 = $10
!Define_SMW_Music_ZoomIn = $11
!Define_SMW_Music_SwitchPalace = $12
!Define_SMW_Music_Welcome = $13
!Define_SMW_Music_DoneBonusGame = $14
!Define_SMW_Music_RescueEgg = $15
!Define_SMW_Music_FightBowser2 = $16
!Define_SMW_Music_BowserZoomOut = $17
!Define_SMW_Music_BowserZoomIn = $18
!Define_SMW_Music_FightBowser3 = $19
!Define_SMW_Music_FightBowser4 = $1A
!Define_SMW_Music_BowserDied = $1B
!Define_SMW_Music_PrincessKiss = $1C
!Define_SMW_Music_BowserInterlude = $1D
!Define_SMW_Music_MusicFade = $80
!Define_SMW_Music_TitleScreen = $01
!Define_SMW_Music_Overworld = $02
!Define_SMW_Music_YoshisIsland = $03
!Define_SMW_Music_VanillaDome = $04
!Define_SMW_Music_StarRoad = $05
!Define_SMW_Music_ForestOfIllusion = $06
!Define_SMW_Music_BowsersValley = $07
!Define_SMW_Music_BowsersValleyRevealed = $08
!Define_SMW_Music_SpecialWorld = $09
!Define_SMW_Music_StaffRoll = $09
!Define_SMW_Music_TheYoshisAreHome = $0A
!Define_SMW_Music_CastList = $0B

!Define_SMW_Sound1DFC_Coin = $01
!Define_SMW_Sound1DFC_HitItemBlock = $02
!Define_SMW_Sound1DFC_HitVineBlock = $03
!Define_SMW_Sound1DFC_SpinJump = $04
!Define_SMW_Sound1DFC_1up = $05
!Define_SMW_Sound1DFC_ShootFireball = $06
!Define_SMW_Sound1DFC_BreakBlock = $07
!Define_SMW_Sound1DFC_Springboard = $08
!Define_SMW_Sound1DFC_BulletShoot = $09
!Define_SMW_Sound1DFC_EggHatch = $0A
!Define_SMW_Sound1DFC_PutItemInReserve = $0B
!Define_SMW_Sound1DFC_DropItemInReserve1 = $0C
!Define_SMW_Sound1DFC_DropItemInReserve2 = $0D
!Define_SMW_Sound1DFC_LRScroll = $0E
!Define_SMW_Sound1DFC_Door1 = $0F
!Define_SMW_Sound1DFC_Door2 = $10
!Define_SMW_Sound1DFC_DrumrollStart = $11
!Define_SMW_Sound1DFC_DrumrollEnd = $12
!Define_SMW_Sound1DFC_LoseYoshi = $13
!Define_SMW_Sound1DFC_Unused = $14
!Define_SMW_Sound1DFC_OverworldTileReveal = $15
!Define_SMW_Sound1DFC_CastleCollapse = $16
!Define_SMW_Sound1DFC_FireSpit = $17
!Define_SMW_Sound1DFC_Thunder = $18
!Define_SMW_Sound1DFC_Clap = $19
!Define_SMW_Sound1DFC_Explosion = $1A
!Define_SMW_Sound1DFC_TNTFuse = $1B
!Define_SMW_Sound1DFC_OverworldSwitchBlockEjection = $1C
!Define_SMW_Sound1DFC_RunningOutOfTime = $1D
!Define_SMW_Sound1DFC_ChuckWhistle = $1E
!Define_SMW_Sound1DFC_MountYoshi = $1F
!Define_SMW_Sound1DFC_LemmyWendyLandInLava = $20
!Define_SMW_Sound1DFC_YoshiTongue = $21
!Define_SMW_Sound1DFC_MessageBox = $22
!Define_SMW_Sound1DFC_StepOnLevelTile = $23
!Define_SMW_Sound1DFC_PSwitchRunningOut = $24
!Define_SMW_Sound1DFC_YoshiStompsEnemy = $25
!Define_SMW_Sound1DFC_Swooper = $26
!Define_SMW_Sound1DFC_Podoboo = $27
!Define_SMW_Sound1DFC_StunEnemy = $28
!Define_SMW_Sound1DFC_Correct = $29
!Define_SMW_Sound1DFC_Wrong = !Define_SMW_Sound1DFC_Correct+$01
!Define_SMW_Sound1DFC_FireworksWhistle = $2B
!Define_SMW_Sound1DFC_FireworksBang = $2C
!Define_SMW_Sound1DFC_PodobooPan1 = $2D
!Define_SMW_Sound1DFC_PodobooPan2 = $2E
!Define_SMW_Sound1DFC_PodobooPan3 = $2F
!Define_SMW_Sound1DFC_PodobooPan4 = $30
!Define_SMW_Sound1DFC_PodobooPan5 = $31
!Define_SMW_Sound1DFC_PodobooPan6 = $32
!Define_SMW_Sound1DFC_PodobooPan7 = $33
!Define_SMW_Sound1DFC_PodobooPan8 = $34

!Define_SMW_StripeImage_ShowScrollArrows = $15
!Define_SMW_StripeImage_RemoveScrollArrows = $18
!Define_SMW_StripeImage_SaveMenuText = $1E

!Joypad_None = $0000
!Joypad_DPadR = $0100
!Joypad_DPadL = $0200
!Joypad_DPadD = $0400
!Joypad_DPadU = $0800
!Joypad_Start = $1000
!Joypad_Select = $2000
!Joypad_Y = $4000
!Joypad_B = $8000

!Joypad_R = $0010
!Joypad_L = $0020
!Joypad_X = $0040
!Joypad_A = $0080

!REGISTER_MosaicSizeAndBGEnable = $002106
!REGISTER_BG1AddressAndSize = $002107
!REGISTER_BG2AddressAndSize = $002108
!REGISTER_BG3AddressAndSize = $002109
!REGISTER_BG1And2TileDataDesignation = $00210B
!REGISTER_BG3And4TileDataDesignation = $00210C
!REGISTER_BG3HorizScrollOffset = $002111
!REGISTER_BG3VertScrollOffset = $002112
!REGISTER_VRAMAddressIncrementValue = $002115
!REGISTER_VRAMAddressLo = $002116
!REGISTER_VRAMAddressHi = $002117
!REGISTER_WriteToVRAMPortLo = $002118
!REGISTER_WriteToVRAMPortHi = $002119
!REGISTER_Mode7TilemapSettings = $00211A
!REGISTER_BGWindowLogicSettings = $00212A
!REGISTER_ColorAndObjectWindowLogicSettings = $00212B
!REGISTER_MainScreenWindowMask = $00212E
!REGISTER_SubScreenWindowMask = $00212F
!REGISTER_ColorMathSelectAndEnable = $002131
!REGISTER_InitialScreenSettings = $002133
!REGISTER_IRQNMIAndJoypadEnableFlags = $004200
!REGISTER_Multiplicand = $004202
!REGISTER_Multiplier = $004203
!REGISTER_DividendLo = $004204
!REGISTER_DividendHi = $004205
!REGISTER_Divisor = $004206
!REGISTER_DMAEnable = $00420B
!REGISTER_HDMAEnable = $00420C
!REGISTER_QuotientLo = $004214
!REGISTER_QuotientHi = $004215
!REGISTER_ProductOrRemainderLo = $004216
!REGISTER_ProductOrRemainderHi = $004217

struct DMA $004300
	.Parameters: skip $01
	.Destination: skip $01
	.SourceLo: skip $01
	.SourceHi: skip $01
	.SourceBank: skip $01
	.SizeLo: skip $01
	.SizeHi: skip $01
	.Unused1: skip $01
	.Unused2: skip $01
	.Unused3: skip $01
	.Unused4: skip $01
endstruct align $10

struct HDMA $004300
	.Parameters: skip $01
	.Destination: skip $01
	.SourceLo: skip $01
	.SourceHi: skip $01
	.SourceBank: skip $01
	.IndirectSourceLo: skip $01
	.IndirectSourceHi: skip $01
	.IndirectSourceBank: skip $01
	.TableSourceLo: skip $01
	.TableSourceHi: skip $01
	.LineCount: skip $01
endstruct align $10

	!DMAParams_TransferMode_1Reg1Write = $00
	!DMAParams_TransferMode_2Regs1Write = $01
	!DMAParams_TransferMode_1Reg2Writes = $02
	!DMAParams_TransferMode_2Regs2Writes = $03
	!DMAParams_TransferMode_4Regs1Write = $04
	!DMAParams_TransferMode_2Regs2WritesAlternating = $05
	!DMAParams_TransferMode_CopyOf1Reg2Writes = $06
	!DMAParams_TransferMode_CopyOf2Regs2Writes = $07
	!DMAParams_EnableFixedTransfer = $08
	!DMAParams_IncrementSourceAddr = $00
	!DMAParams_DecrementSourceAddr = $10
	!DMAParams_HDMAUseDirectAddr = $00
	!DMAParams_HDMAUseIndirectAddr = $40
	!DMAParams_TransferDirection_ABusToBBus = $00
	!DMAParams_TransferDirection_BBusToABus = $80

!REGISTER_SA1_SA1RQControlWrite = $002209
!REGISTER_SA1_ArithmeticType = $002250
!REGISTER_SA1_MultiplicandOrDividendLo = $002251
!REGISTER_SA1_MultiplicandOrDividendHi = $002252
!REGISTER_SA1_MultiplierOrDivisorLo = $002253
!REGISTER_SA1_MultiplierOrDivisorHi = $002254
!REGISTER_SA1_ArithmeticResultLo = $002306
!REGISTER_SA1_ArithmeticResultMidLo = $002307
!REGISTER_SA1_ArithmeticResultMid = $002308
!REGISTER_SA1_ArithmeticResultMidHi = $002309
!REGISTER_SA1_ArithmeticResultHi = $00230A
!REGISTER_SA1_ArithmeticOverflowFlag = $00230B

macro SMW_StripeImageHeader(Label, XPos, YPos, Dir, RLE, Layer)
;To use this macro:
;- Label must be the label name for the stripe image. This label should be made to be a sublabel for another label (ie. ".Label" instead of "Label:". Also, you must put an identical label with End attached after the block of stripe image data so that the length of the data can be automatically set if RLE is not used.
; XPos is the starting X position (multiple of 8) to draw the stripe image on the specified layer. (Max is $3F)
; YPos is the same as above, except for the Y position
; Dir is the direction to draw the stripe image. 0 = Horizontal 1 = Vertical.
; RLE should be set to $0001 or greater if you intend on drawing a string of the same two bytes. RLE will be equal to the length you want (Max is $3FFF)

!StripeX = <XPos>
!StripeY = <YPos>
!StripeDir = $0000
!StripeRLE = <RLE>
if <Layer> == 1
	!StripeDest = $20
elseif <Layer> == 2
	!StripeDest = $30
elseif <Layer> == 3
	!StripeDest = $50
else
	error "The stripe image Layer parameter must be a 1, 2 or 3!"
endif

if <Dir> == 1
	!StripeDir == $8000
endif

<Label>:
	db (!StripeDest|((!StripeX&$20)>>3)|((!StripeY&$18)>>3)|((!StripeY&$20)>>2))&$7F
	db (!StripeX&$1F)|((!StripeY&$07)<<5)

if !StripeRLE == $0000
	db ((!StripeDir|(<Label>End-<Label>-$05))&$BFFF)>>8
	db (((<Label>End-<Label>-$05))&$00FF)
else
	db (!StripeDir|((!StripeRLE-$01)>>8))|$40
	db !StripeRLE-$01
endif 
endmacro
