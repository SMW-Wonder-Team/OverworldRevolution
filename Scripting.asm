include

;#############################################################################################################
;#############################################################################################################

;---------------------------------------------------------------------------

; This is where all the "silent event" scripts for each map are determined so events can persist when reloading a map.
; These could also run scripts that initialize some other aspect of the map, like spawning a generator sprite.

SubmapScripts:
	dl Script_SilentEventsForMainMap
	dl Script_SilentEventsForYoshisIsland
	dl Script_SilentEventsForVanillaDome
	dl Script_SilentEventsForForestOfIllusion
	dl Script_SilentEventsForValleyOfBowser
	dl Script_SilentEventsForSpecialWorld
	dl Script_SilentEventsForStarWorld
.End:

;---------------------------------------------------------------------------

; These are the pointers that correspond to the interactive tiles.
; So, the first script is for the tile defined by !Define_SMW_Overworld_StartOfInteractiveTileMap16, the next for that tile plus 1, and so on.

ScriptPointers:
.EnterLevelScripts:					; Scripts that run when pressing A/B/X/Y on a tile in free movement mode.
	dl Script_EnterLevel000
	dl Script_EnterVanillaSecret2
	dl Script_EnterVanillaSecret3
	dl Script_EnterTopSecretArea
	dl Script_EnterDonutGhostHouse
	dl Script_EnterDonutPlains3
	dl Script_EnterDonutPlains4
	dl Script_EnterMortonsCastle
	dl Script_EnterGreenSwitchPalace
	dl Script_EnterDonutPlains2
	dl Script_EnterDonutSecret1
	dl Script_EnterVanillaFortress
	dl Script_EnterButterBridge1
	dl Script_EnterButterBridge2
	dl Script_EnterLudwigsCastle
	dl Script_EnterCheeseBridgeArea
	dl Script_EnterCookieMountain
	dl Script_EnterSodaLake
	dl Script_EnterLevel012
	dl Script_EnterDonutSecretHouse
	dl Script_EnterYellowSwitchPalace
	dl Script_EnterDonutPlains1
	dl Script_EnterLevel016
	dl Script_EnterLevel017
	dl Script_EnterSunkenGhostShip
	dl Script_EnterLevel019
	dl Script_EnterWendysCastle
	dl Script_EnterChocolateFortress
	dl Script_EnterChocolateIsland5
	dl Script_EnterChocolateIsland4
	dl Script_EnterLevel01E
	dl Script_EnterForestFortress
	dl Script_EnterRoysCastle
	dl Script_EnterChocoGhostHouse
	dl Script_EnterChocolateIsland1
	dl Script_EnterChocolateIsland3
	dl Script_EnterChocolateIsland2
	dl Script_EnterIggysCastle
	dl Script_EnterYoshisIsland4
	dl Script_EnterYoshisIsland3
	dl Script_EnterYoshisHouse
	dl Script_EnterYoshisIsland1
	dl Script_EnterYoshisIsland2
	dl Script_EnterVanillaGhostHouse
	dl Script_EnterLevel108
	dl Script_EnterVanillaSecret1
	dl Script_EnterVanillaDome3
	dl Script_EnterDonutSecret2
	dl Script_EnterLevel10C
	dl Script_EnterFrontDoor
	dl Script_EnterBackDoor
	dl Script_EnterValleyOfBowser4
	dl Script_EnterLarrysCastle
	dl Script_EnterValleyFortress
	dl Script_EnterLevel112
	dl Script_EnterValleyOfBowser3
	dl Script_EnterValleyGhostHouse
	dl Script_EnterValleyOfBowser2
	dl Script_EnterValleyOfBowser1
	dl Script_EnterChocolateSecret
	dl Script_EnterVanillaDome2
	dl Script_EnterVanillaDome4
	dl Script_EnterVanillaDome1
	dl Script_EnterRedSwitchPalace
	dl Script_EnterLemmysCastle
	dl Script_EnterForestGhostHouse
	dl Script_EnterForestOfIllusion1
	dl Script_EnterForestOfIllusion4
	dl Script_EnterForestOfIllusion2
	dl Script_EnterBlueSwitchPalace
	dl Script_EnterForestSecretArea
	dl Script_EnterForestOfIllusion3
	dl Script_EnterLevel124
	dl Script_EnterFunky
	dl Script_EnterOutrageous
	dl Script_EnterMondo
	dl Script_EnterGroovy
	dl Script_EnterLevel129
	dl Script_EnterGnarly
	dl Script_EnterTubular
	dl Script_EnterWayCool
	dl Script_EnterAwesome
	dl Script_EnterLevel12E
	dl Script_EnterLevel12F
	dl Script_EnterStarWorld2
	dl Script_EnterLevel131
	dl Script_EnterStarWorld3
	dl Script_EnterLevel133
	dl Script_EnterStarWorld1
	dl Script_EnterStarWorld4
	dl Script_EnterStarWorld5
	dl Script_EnterLevel137
	dl Script_EnterLevel138
	dl Script_EnterLevel139
	dl Script_EnterLevel13A
	dl Script_EnterLevel13B
	dl Script_EnterPipeWarp_DonutSecretHouseToDonutSecret2
	dl Script_EnterPipeWarp_DonutSecret2ToDonutSecretHouse
	dl Script_EnterPipeWarp_DonutSecret2ToDonutPlains3
	dl Script_EnterPipeWarp_DonutPlains3ToDonutSecret2
	dl Script_EnterPipeWarp_VanillaSecret1ToVanillaSecret2
	dl Script_EnterPipeWarp_VanillaSecret2ToVanillaSecret1
	dl Script_EnterPipeWarp_LemmysCastleToCheeseBridgeArea
	dl Script_EnterPipeWarp_CheeseBridgeAreaToLemmysCastle
	dl Script_EnterPipeWarp_ChocolateIsland2ToChocolateSecret
	dl Script_EnterPipeWarp_ChocolateSecretToChocolateIsland2
	dl Script_EnterPipeWarp_ChocolateSecretToWendysCastle
	dl Script_EnterPipeWarp_WendysCastleToChocolateSecret
	dl Script_EnterPathExit_YoshisIsland1ToYellowSwitchPalace
	dl Script_EnterPathExit_YellowSwitchPalaceToYoshisIsland1
	dl Script_EnterPathExit_IggysCastleToDonutPlains1
	dl Script_EnterPathExit_DonutPlains1ToIggysCastle
	dl Script_EnterPathExit_MortonsCastleToVanillaDome1
	dl Script_EnterPathExit_VanillaDome1ToMortonsCastle
	dl Script_EnterPathExit_LudwigsCastleToForestOfIllusion1
	dl Script_EnterPathExit_ForestOfIllusion1ToLudwigsCastle
	dl Script_EnterPathExit_ForestSecretToForestFortress
	dl Script_EnterPathExit_ForestFortressToForestSecret
	dl Script_EnterPathExit_ForestOfIllusion3ToRoysCastle
	dl Script_EnterPathExit_RoysCastleToForestOfIllusion3
	dl Script_EnterPathExit_SunkenGhostShipToValleyOfBowser1
	dl Script_EnterPathExit_ValleyOfBowser1ToSunkenGhostShip
	dl Script_EnterStarWarp_DonutSecretHouseToStarRoad1
	dl Script_EnterStarWarp_StarRoad1ToDonutSecretHouse
	dl Script_EnterStarWarp_VanillaSecret1ToStarRoad2
	dl Script_EnterStarWarp_StarRoad2ToVanillaSecret1
	dl Script_EnterStarWarp_SodaLakeToStarRoad3
	dl Script_EnterStarWarp_StarRoad3ToSodaLake
	dl Script_EnterStarWarp_ForestFortressToStarRoad4
	dl Script_EnterStarWarp_StarRoad4ToForestFortress
	dl Script_EnterStarWarp_FrontDoorToStarRoad5
	dl Script_EnterStarWarp_StarRoad5ToFrontDoor
	dl Script_EnterStarWarp_StarRoad5ToGnarly
	dl Script_EnterStarWarp_GnarlyToStarRoad5
	dl Script_EnterStarWarp_FunkyToYoshisHouse
	dl Script_EnterDestroyedTile_IggysCastle
	dl Script_EnterDestroyedTile_MortonsCastle
	dl Script_EnterDestroyedTile_LemmysCastle
	dl Script_EnterDestroyedTile_LudwigsCastle
	dl Script_EnterDestroyedTile_RoysCastle
	dl Script_EnterDestroyedTile_WendysCastle
	dl Script_EnterDestroyedTile_LarrysCastle
	dl Script_EnterDestroyedTile_VanillaFortress
	dl Script_EnterDestroyedTile_ForestFortress
	dl Script_EnterDestroyedTile_ChocolateFortress
	dl Script_EnterDestroyedTile_ValleyFortress
	dl Script_EnterDestroyedTile_YellowSwitchPalace
	dl Script_EnterDestroyedTile_GreenSwitchPalace
	dl Script_EnterDestroyedTile_RedSwitchPalace
	dl Script_EnterDestroyedTile_BlueSwitchPalace
.EventScripts:					; Scripts that run when exiting the corresponding tile (or reloading from a game over)
	dl Script_ExitLevel000
	dl Script_ExitVanillaSecret2
	dl Script_ExitVanillaSecret3
	dl Script_ExitTopSecretArea
	dl Script_ExitDonutGhostHouse
	dl Script_ExitDonutPlains3
	dl Script_ExitDonutPlains4
	dl Script_ExitMortonsCastle
	dl Script_ExitGreenSwitchPalace
	dl Script_ExitDonutPlains2
	dl Script_ExitDonutSecret1
	dl Script_ExitVanillaFortress
	dl Script_ExitButterBridge1
	dl Script_ExitButterBridge2
	dl Script_ExitLudwigsCastle
	dl Script_ExitCheeseBridgeArea
	dl Script_ExitCookieMountain
	dl Script_ExitSodaLake
	dl Script_ExitLevel012
	dl Script_ExitDonutSecretHouse
	dl Script_ExitYellowSwitchPalace
	dl Script_ExitDonutPlains1
	dl Script_ExitLevel016
	dl Script_ExitLevel017
	dl Script_ExitSunkenGhostShip
	dl Script_ExitLevel019
	dl Script_ExitWendysCastle
	dl Script_ExitChocolateFortress
	dl Script_ExitChocolateIsland5
	dl Script_ExitChocolateIsland4
	dl Script_ExitLevel01E
	dl Script_ExitForestFortress
	dl Script_ExitRoysCastle
	dl Script_ExitChocoGhostHouse
	dl Script_ExitChocolateIsland1
	dl Script_ExitChocolateIsland3
	dl Script_ExitChocolateIsland2
	dl Script_ExitIggysCastle
	dl Script_ExitYoshisIsland4
	dl Script_ExitYoshisIsland3
	dl Script_ExitYoshisHouse
	dl Script_ExitYoshisIsland1
	dl Script_ExitYoshisIsland2
	dl Script_ExitVanillaGhostHouse
	dl Script_ExitLevel108
	dl Script_ExitVanillaSecret1
	dl Script_ExitVanillaDome3
	dl Script_ExitDonutSecret2
	dl Script_ExitLevel10C
	dl Script_ExitFrontDoor
	dl Script_ExitBackDoor
	dl Script_ExitValleyOfBowser4
	dl Script_ExitLarrysCastle
	dl Script_ExitValleyFortress
	dl Script_ExitLevel112
	dl Script_ExitValleyOfBowser3
	dl Script_ExitValleyGhostHouse
	dl Script_ExitValleyOfBowser2
	dl Script_ExitValleyOfBowser1
	dl Script_ExitChocolateSecret
	dl Script_ExitVanillaDome2
	dl Script_ExitVanillaDome4
	dl Script_ExitVanillaDome1
	dl Script_ExitRedSwitchPalace
	dl Script_ExitLemmysCastle
	dl Script_ExitForestGhostHouse
	dl Script_ExitForestOfIllusion1
	dl Script_ExitForestOfIllusion4
	dl Script_ExitForestOfIllusion2
	dl Script_ExitBlueSwitchPalace
	dl Script_ExitForestSecretArea
	dl Script_ExitForestOfIllusion3
	dl Script_ExitLevel124
	dl Script_ExitFunky
	dl Script_ExitOutrageous
	dl Script_ExitMondo
	dl Script_ExitGroovy
	dl Script_ExitLevel129
	dl Script_ExitGnarly
	dl Script_ExitTubular
	dl Script_ExitWayCool
	dl Script_ExitAwesome
	dl Script_ExitLevel12E
	dl Script_ExitLevel12F
	dl Script_ExitStarWorld2
	dl Script_ExitLevel131
	dl Script_ExitStarWorld3
	dl Script_ExitLevel133
	dl Script_ExitStarWorld1
	dl Script_ExitStarWorld4
	dl Script_ExitStarWorld5
	dl Script_ExitLevel137
	dl Script_ExitLevel138
	dl Script_ExitLevel139
	dl Script_ExitLevel13A
	dl Script_ExitLevel13B
	dl Script_StandingOnPipeWarp_DonutSecretHouseToDonutSecret2
	dl Script_StandingOnPipeWarp_DonutSecret2ToDonutSecretHouse
	dl Script_StandingOnPipeWarp_DonutSecret2ToDonutPlains3
	dl Script_StandingOnPipeWarp_DonutPlains3ToDonutSecret2
	dl Script_StandingOnPipeWarp_VanillaSecret1ToVanillaSecret2
	dl Script_StandingOnPipeWarp_VanillaSecret2ToVanillaSecret1
	dl Script_StandingOnPipeWarp_LemmysCastleToCheeseBridgeArea
	dl Script_StandingOnPipeWarp_CheeseBridgeAreaToLemmysCastle
	dl Script_StandingOnPipeWarp_ChocolateIsland2ToChocolateSecret
	dl Script_StandingOnPipeWarp_ChocolateSecretToChocolateIsland2
	dl Script_StandingOnPipeWarp_ChocolateSecretToWendysCastle
	dl Script_StandingOnPipeWarp_WendysCastleToChocolateSecret
	dl Script_StandingOnPathExit_YoshisIsland1ToYellowSwitchPalace
	dl Script_StandingOnPathExit_YellowSwitchPalaceToYoshisIsland1
	dl Script_StandingOnPathExit_IggysCastleToDonutPlains1
	dl Script_StandingOnPathExit_DonutPlains1ToIggysCastle
	dl Script_StandingOnPathExit_MortonsCastleToVanillaDome1
	dl Script_StandingOnPathExit_VanillaDome1ToMortonsCastle
	dl Script_StandingOnPathExit_LudwigsCastleToForestOfIllusion1
	dl Script_StandingOnPathExit_ForestOfIllusion1ToLudwigsCastle
	dl Script_StandingOnPathExit_ForestSecretToForestFortress
	dl Script_StandingOnPathExit_ForestFortressToForestSecret
	dl Script_StandingOnPathExit_ForestOfIllusion3ToRoysCastle
	dl Script_StandingOnPathExit_RoysCastleToForestOfIllusion3
	dl Script_StandingOnPathExit_SunkenGhostShipToValleyOfBowser1
	dl Script_StandingOnPathExit_ValleyOfBowser1ToSunkenGhostShip
	dl Script_StandingOnStarWarp_DonutSecretHouseToStarRoad1
	dl Script_StandingOnStarWarp_StarRoad1ToDonutSecretHouse
	dl Script_StandingOnStarWarp_VanillaSecret1ToStarRoad2
	dl Script_StandingOnStarWarp_StarRoad2ToVanillaSecret1
	dl Script_StandingOnStarWarp_SodaLakeToStarRoad3
	dl Script_StandingOnStarWarp_StarRoad3ToSodaLake
	dl Script_StandingOnStarWarp_ForestFortressToStarRoad4
	dl Script_StandingOnStarWarp_StarRoad4ToForestFortress
	dl Script_StandingOnStarWarp_FrontDoorToStarRoad5
	dl Script_StandingOnStarWarp_StarRoad5ToFrontDoor
	dl Script_StandingOnStarWarp_StarRoad5ToGnarly
	dl Script_StandingOnStarWarp_GnarlyToStarRoad5
	dl Script_StandingOnStarWarp_FunkyToYoshisHouse
	dl Script_StandingOnDestroyedTile_IggysCastle
	dl Script_StandingOnDestroyedTile_MortonsCastle
	dl Script_StandingOnDestroyedTile_LemmysCastle
	dl Script_StandingOnDestroyedTile_LudwigsCastle
	dl Script_StandingOnDestroyedTile_RoysCastle
	dl Script_StandingOnDestroyedTile_WendysCastle
	dl Script_StandingOnDestroyedTile_LarrysCastle
	dl Script_StandingOnDestroyedTile_VanillaFortress
	dl Script_StandingOnDestroyedTile_ForestFortress
	dl Script_StandingOnDestroyedTile_ChocolateFortress
	dl Script_StandingOnDestroyedTile_ValleyFortress
	dl Script_StandingOnDestroyedTile_YellowSwitchPalace
	dl Script_StandingOnDestroyedTile_GreenSwitchPalace
	dl Script_StandingOnDestroyedTile_RedSwitchPalace
	dl Script_StandingOnDestroyedTile_BlueSwitchPalace

;---------------------------------------------------------------------------

; 24-bit pointer table for the special world palettes used for each map when the special world has been cleared.
; The linked to files should be in .tpl format, as Lunar Magic exports the palette data in a format that's easy to insert with asar.
; If you set one of these pointers to $000000 or attempt to load a map that's not covered by this table, the regular palette will load instead.

SpecialWorldPalettePtrs:
	dl AltMainMapPalette
	dl AltYoshisIslandPalette
	dl AltVanillaDomePalette
	dl AltForestOfIllusionPalette
	dl AltValleyOfBowserPalette
	dl AltSpecialWorldPalette
	dl AltStarWorldPalette
.End:

AltMainMapPalette:
	incbin "MapData/AltMainMapPalette.tpl":$04..$0204

AltYoshisIslandPalette:
	incbin "MapData/AltYoshisIslandPalette.tpl":$04..$0204

AltVanillaDomePalette:
	incbin "MapData/AltVanillaDomePalette.tpl":$04..$0204

AltForestOfIllusionPalette:
	incbin "MapData/AltForestOfIllusionPalette.tpl":$04..$0204

AltValleyOfBowserPalette:
	incbin "MapData/AltValleyOfBowserPalette.tpl":$04..$0204

AltSpecialWorldPalette:
	incbin "MapData/AltSpecialWorldPalette.tpl":$04..$0204

AltStarWorldPalette:
	incbin "MapData/AltStarWorldPalette.tpl":$04..$0204

;---------------------------------------------------------------------------

;#############################################################################################################
;#############################################################################################################

; Special scripts

;---------------------------------------------------------------------------

Script_IntroMarch:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_YoshisHouse_XPosOfTile<<4), (!Define_SMW_YoshisHouse_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_WaitXFrames($01)
if !Define_SMW_Overworld_SaveGameAfterIntroMessage == !TRUE
	%ScriptCommand_JSLToRoutine(HandleSaveGame)
endif
if !Define_SMW_Overworld_EnableIntroLevel == !FALSE
	%ScriptCommand_DisplayMessage($00, $01)
endif
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYoshisHouse)

;---------------------------------------------------------------------------

Script_HandleGameOver:
	%ScriptCommand_JSLToRoutine(HandleGameOver)
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Misc_GameMode, $0B, .ContinueSelected)
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_HandleGameOver)

.ContinueSelected:
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Flag_TwoPlayerGame, $00, .NotTwoPlayer)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_SwitchPlayers, $01)
	%ScriptCommand_JSLToRoutine(CheckIfEitherPlayerIsAlive)
.DoGameOverLifeExchange:
if !Define_SMW_Overworld_AllowLifeExchange == !TRUE
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Misc_GameMode, $0E)
	%ScriptCommand_DisplayPrompt($01)
endif
	%ScriptCommand_JumpToScriptAddress(.AtLeastOneAlive)
.NotTwoPlayer:
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_GameOverFlag, $0001)
	%ScriptCommand_EndScript()

.AtLeastOneAlive:
	%ScriptCommand_ScriptJumpTable(!RAM_SMW_Overworld_MarioSaveLocation, ScriptPointers_EventScripts)

;---------------------------------------------------------------------------

Script_SpawnLightningGenerator:
	%ScriptCommand_SpawnSprite(OWSpr10_LightningGenerator, $0000, $0000, $0000, $0000)
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_SpawnCloudGenerator:
	%ScriptCommand_SpawnSprite(OWSpr11_CloudGenerator, $0000, $0000, $0000, $0000)
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

if !Define_SMW_Overworld_AllowLifeExchange&!Define_SMW_Overworld_UseLRForLifeExchange == !TRUE
Script_BringUpLifeExchangePrompt:
	%ScriptCommand_DisplayPrompt($01)
	%ScriptCommand_RTLToScript()
endif

;---------------------------------------------------------------------------

Script_FreePlayerMovement:
	%ScriptCommand_JSLToRoutine(HandleFreePlayerMovement)
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_FreePlayerMovement)

;---------------------------------------------------------------------------

;#############################################################################################################
;#############################################################################################################

; Enter tile scripts, used to determine what happens when the player interacts with a level tile/warp/etc.

;---------------------------------------------------------------------------

Script_EnterLevel000:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0000)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_Level000)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterVanillaSecret2:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0001)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_VanillaSecret2)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterVanillaSecret3:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0002)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_VanillaSecret3)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterTopSecretArea:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0003)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_TopSecretArea)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_DisablePlayerStart|!Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterDonutGhostHouse:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0004)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_DonutGhostHouse)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_GhostHouse)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterDonutPlains3:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0005)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_DonutPlains3)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterDonutPlains4:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0006)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_DonutPlains4)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterDestroyedTile_MortonsCastle:
Script_EnterMortonsCastle:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0007)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_MortonsCastle)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Castle_RoundHillBG)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterDestroyedTile_GreenSwitchPalace:
Script_EnterGreenSwitchPalace:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0008)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_GreenSwitchPalace)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterDonutPlains2:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0009)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_DonutPlains2)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterDonutSecret1:
	%ScriptCommand_SetWarpDestination(MainEntrance, $000A)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_DonutSecret1)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterDestroyedTile_VanillaFortress:
Script_EnterVanillaFortress:
	%ScriptCommand_SetWarpDestination(MainEntrance, $000B)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_VanillaFortress)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Castle_RoundHillBG)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterButterBridge1:
	%ScriptCommand_SetWarpDestination(MainEntrance, $000C)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_ButterBridge1)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterButterBridge2:
	%ScriptCommand_SetWarpDestination(MainEntrance, $000D)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_ButterBridge2)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterDestroyedTile_LudwigsCastle:
Script_EnterLudwigsCastle:
	%ScriptCommand_SetWarpDestination(MainEntrance, $000E)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_LudwigsCastle)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Castle_RoundHillBG)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterCheeseBridgeArea:
	%ScriptCommand_SetWarpDestination(MainEntrance, $000F)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_CheeseBridgeArea)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterCookieMountain:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0010)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_CookieMountain)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterSodaLake:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0011)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_SodaLake)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterLevel012:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0012)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_Level012)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterDonutSecretHouse:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0013)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_DonutSecretHouse)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_GhostHouse)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterDestroyedTile_YellowSwitchPalace:
Script_EnterYellowSwitchPalace:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0014)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_YellowSwitchPalace)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterDonutPlains1:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0015)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_DonutPlains1)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterLevel016:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0016)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_Level016)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterLevel017:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0017)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_Level017)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterSunkenGhostShip:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0018)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_SunkenGhostShip)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterLevel019:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0019)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_Level019)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterDestroyedTile_WendysCastle:
Script_EnterWendysCastle:
	%ScriptCommand_SetWarpDestination(MainEntrance, $001A)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_WendysCastle)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Castle_RoundHillBG)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterDestroyedTile_ChocolateFortress:
Script_EnterChocolateFortress:
	%ScriptCommand_SetWarpDestination(MainEntrance, $001B)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_ChocolateFortress)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Castle_RoundHillBG)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterChocolateIsland5:
	%ScriptCommand_SetWarpDestination(MainEntrance, $001C)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_ChocolateIsland5)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterChocolateIsland4:
	%ScriptCommand_SetWarpDestination(MainEntrance, $001D)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_ChocolateIsland4)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterLevel01E:
	%ScriptCommand_SetWarpDestination(MainEntrance, $001E)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_Level01E)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterDestroyedTile_ForestFortress:
Script_EnterForestFortress:
	%ScriptCommand_SetWarpDestination(MainEntrance, $001F)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_ForestFortress)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Castle_RoundHillBG)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterDestroyedTile_RoysCastle:
Script_EnterRoysCastle:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0020)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_RoysCastle)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Castle_RoundHillBG)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterChocoGhostHouse:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0021)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_ChocoGhostHouse)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_GhostHouse)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterChocolateIsland1:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0022)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_ChocolateIsland1)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterChocolateIsland3:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0023)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_ChocolateIsland3)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterChocolateIsland2:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0024)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_ChocolateIsland2)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_EnableChocolateIsland2Gimmick|!Const_SMW_GameStateFlags_SlowThrowingHammerBros)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterDestroyedTile_IggysCastle:
Script_EnterIggysCastle:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0101)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_IggysCastle)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Castle_RoundHillBG)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowMoles)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterYoshisIsland4:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0102)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_YoshisIsland4)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowMoles)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterYoshisIsland3:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0103)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_YoshisIsland3)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowMoles)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterYoshisHouse:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0104)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_YoshisHouse)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_DisablePlayerStart|!Const_SMW_GameStateFlags_RidingYoshiAffectsMessage|!Const_SMW_GameStateFlags_SlowMoles)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterYoshisIsland1:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0105)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_YoshisIsland1)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowMoles)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterYoshisIsland2:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0106)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_YoshisIsland2)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SlowMoles)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterVanillaGhostHouse:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0107)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_VanillaGhostHouse)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_GhostHouse)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterLevel108:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0108)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_Level108)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterVanillaSecret1:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0109)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_VanillaSecret1)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterVanillaDome3:
	%ScriptCommand_SetWarpDestination(MainEntrance, $010A)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_VanillaDome3)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterDonutSecret2:
	%ScriptCommand_SetWarpDestination(MainEntrance, $010B)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_DonutSecret2)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterLevel10C:
	%ScriptCommand_SetWarpDestination(MainEntrance, $010C)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_Level10C)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterFrontDoor:
	%ScriptCommand_SetWarpDestination(MainEntrance, $010D)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_FrontDoor)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Castle_NoBG)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_Sprite32ThrowsBones)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterBackDoor:
	%ScriptCommand_SetWarpDestination(MainEntrance, $010E)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_BackDoor)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Castle_NoBG)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_Sprite32ThrowsBones)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterValleyOfBowser4:
	%ScriptCommand_SetWarpDestination(MainEntrance, $010F)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_ValleyOfBowser4)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterDestroyedTile_LarrysCastle:
Script_EnterLarrysCastle:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0110)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_LarrysCastle)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Castle_NoBG)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_GameStateFlags, !Const_SMW_GameStateFlags_SubmapCreateBlockPath)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterDestroyedTile_ValleyFortress:
Script_EnterValleyFortress:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0111)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_ValleyFortress)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Castle_NoBG)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterLevel112:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0112)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_Level112)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterValleyOfBowser3:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0113)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_ValleyOfBowser3)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterValleyGhostHouse:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0114)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_ValleyGhostHouse)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_GhostHouse)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterValleyOfBowser2:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0115)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_ValleyOfBowser2)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterValleyOfBowser1:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0116)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_ValleyOfBowser1)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterChocolateSecret:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0117)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_ChocolateSecret)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterVanillaDome2:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0118)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_VanillaDome2)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterVanillaDome4:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0119)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_VanillaDome4)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterVanillaDome1:
	%ScriptCommand_SetWarpDestination(MainEntrance, $011A)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_VanillaDome1)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterDestroyedTile_RedSwitchPalace:
Script_EnterRedSwitchPalace:
	%ScriptCommand_SetWarpDestination(MainEntrance, $011B)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_RedSwitchPalace)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterDestroyedTile_LemmysCastle:
Script_EnterLemmysCastle:
	%ScriptCommand_SetWarpDestination(MainEntrance, $011C)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_LemmysCastle)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Castle_NoBG)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterForestGhostHouse:
	%ScriptCommand_SetWarpDestination(MainEntrance, $011D)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_ForestGhostHouse)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_GhostHouse)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterForestOfIllusion1:
	%ScriptCommand_SetWarpDestination(MainEntrance, $011E)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_ForestOfIllusion1)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterForestOfIllusion4:
	%ScriptCommand_SetWarpDestination(MainEntrance, $011F)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_ForestOfIllusion4)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterForestOfIllusion2:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0120)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_ForestOfIllusion2)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterDestroyedTile_BlueSwitchPalace:
Script_EnterBlueSwitchPalace:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0121)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_BlueSwitchPalace)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterForestSecretArea:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0122)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_ForestSecretArea)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterForestOfIllusion3:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0123)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_ForestOfIllusion3)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterLevel124:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0124)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_Level124)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterFunky:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0125)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_Funky)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterOutrageous:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0126)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_Outrageous)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterMondo:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0127)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_Mondo)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterGroovy:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0128)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_Groovy)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterLevel129:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0129)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_Level129)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterGnarly:
	%ScriptCommand_SetWarpDestination(MainEntrance, $012A)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_Gnarly)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterTubular:
	%ScriptCommand_SetWarpDestination(MainEntrance, $012B)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_Tubular)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterWayCool:
	%ScriptCommand_SetWarpDestination(MainEntrance, $012C)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_WayCool)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterAwesome:
	%ScriptCommand_SetWarpDestination(MainEntrance, $012D)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_Awesome)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterLevel12E:
	%ScriptCommand_SetWarpDestination(MainEntrance, $012E)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_Level12E)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterLevel12F:
	%ScriptCommand_SetWarpDestination(MainEntrance, $012F)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_Level12F)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterStarWorld2:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0130)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_StarWorld2)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterLevel131:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0131)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_Level131)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterStarWorld3:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0132)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_StarWorld3)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterLevel133:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0133)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_Level133)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterStarWorld1:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0134)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_StarWorld1)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterStarWorld4:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0135)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_StarWorld4)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterStarWorld5:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0136)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_StarWorld5)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterLevel137:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0137)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_Level137)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)
	%ScriptCommand_JumpToScriptAddress(Script_ExitLevel137)

;---------------------------------------------------------------------------

Script_EnterLevel138:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0138)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_Level138)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterLevel139:
	%ScriptCommand_SetWarpDestination(MainEntrance, $0139)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_Level139)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterLevel13A:
	%ScriptCommand_SetWarpDestination(MainEntrance, $013A)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_Level13A)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterLevel13B:
	%ScriptCommand_SetWarpDestination(MainEntrance, $013B)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_Level13B)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_NoYoshiIntro_TypeToUse, !Const_SMW_NoYoshiIntroType_Null)
	%ScriptCommand_JumpToScriptAddress(Script_SharedEnterLevelCode)

;---------------------------------------------------------------------------

Script_EnterPipeWarp_DonutSecretHouseToDonutSecret2:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $0200)
	%ScriptCommand_JumpToScriptAddress(Script_SharedPipeEntryCode)

;---------------------------------------------------------------------------

Script_EnterPipeWarp_DonutSecret2ToDonutSecretHouse:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $0201)
	%ScriptCommand_JumpToScriptAddress(Script_SharedPipeEntryCode)

;---------------------------------------------------------------------------

Script_EnterPipeWarp_DonutSecret2ToDonutPlains3:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $0202)
	%ScriptCommand_JumpToScriptAddress(Script_SharedPipeEntryCode)

;---------------------------------------------------------------------------

Script_EnterPipeWarp_DonutPlains3ToDonutSecret2:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $0203)
	%ScriptCommand_JumpToScriptAddress(Script_SharedPipeEntryCode)

;---------------------------------------------------------------------------

Script_EnterPipeWarp_VanillaSecret1ToVanillaSecret2:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $0204)
	%ScriptCommand_JumpToScriptAddress(Script_SharedPipeEntryCode)

;---------------------------------------------------------------------------

Script_EnterPipeWarp_VanillaSecret2ToVanillaSecret1:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $0205)
	%ScriptCommand_JumpToScriptAddress(Script_SharedPipeEntryCode)

;---------------------------------------------------------------------------

Script_EnterPipeWarp_LemmysCastleToCheeseBridgeArea:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $0206)
	%ScriptCommand_JumpToScriptAddress(Script_SharedPipeEntryCode)

;---------------------------------------------------------------------------

Script_EnterPipeWarp_CheeseBridgeAreaToLemmysCastle:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $0207)
	%ScriptCommand_JumpToScriptAddress(Script_SharedPipeEntryCode)

;---------------------------------------------------------------------------

Script_EnterPipeWarp_ChocolateIsland2ToChocolateSecret:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $0208)
	%ScriptCommand_JumpToScriptAddress(Script_SharedPipeEntryCode)

;---------------------------------------------------------------------------

Script_EnterPipeWarp_ChocolateSecretToChocolateIsland2:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $0209)
	%ScriptCommand_JumpToScriptAddress(Script_SharedPipeEntryCode)

;---------------------------------------------------------------------------

Script_EnterPipeWarp_ChocolateSecretToWendysCastle:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $020A)
	%ScriptCommand_JumpToScriptAddress(Script_SharedPipeEntryCode)

;---------------------------------------------------------------------------

Script_EnterPipeWarp_WendysCastleToChocolateSecret:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $020B)
	%ScriptCommand_JumpToScriptAddress(Script_SharedPipeEntryCode)

;---------------------------------------------------------------------------

Script_EnterStarWarp_DonutSecretHouseToStarRoad1:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $021A)
	%ScriptCommand_JumpToScriptAddress(Script_SharedStarWarpEntryCode)

;---------------------------------------------------------------------------

Script_EnterStarWarp_StarRoad1ToDonutSecretHouse:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $021B)
	%ScriptCommand_JumpToScriptAddress(Script_SharedStarWarpEntryCode)

;---------------------------------------------------------------------------

Script_EnterStarWarp_VanillaSecret1ToStarRoad2:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $021C)
	%ScriptCommand_JumpToScriptAddress(Script_SharedStarWarpEntryCode)

;---------------------------------------------------------------------------

Script_EnterStarWarp_StarRoad2ToVanillaSecret1:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $021D)
	%ScriptCommand_JumpToScriptAddress(Script_SharedStarWarpEntryCode)

;---------------------------------------------------------------------------

Script_EnterStarWarp_SodaLakeToStarRoad3:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $021E)
	%ScriptCommand_JumpToScriptAddress(Script_SharedStarWarpEntryCode)

;---------------------------------------------------------------------------

Script_EnterStarWarp_StarRoad3ToSodaLake:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $021F)
	%ScriptCommand_JumpToScriptAddress(Script_SharedStarWarpEntryCode)

;---------------------------------------------------------------------------

Script_EnterStarWarp_ForestFortressToStarRoad4:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $0220)
	%ScriptCommand_JumpToScriptAddress(Script_SharedStarWarpEntryCode)

;---------------------------------------------------------------------------

Script_EnterStarWarp_StarRoad4ToForestFortress:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $0221)
	%ScriptCommand_JumpToScriptAddress(Script_SharedStarWarpEntryCode)

;---------------------------------------------------------------------------

Script_EnterStarWarp_FrontDoorToStarRoad5:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $0222)
	%ScriptCommand_JumpToScriptAddress(Script_SharedStarWarpEntryCode)

;---------------------------------------------------------------------------

Script_EnterStarWarp_StarRoad5ToFrontDoor:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $0223)
	%ScriptCommand_JumpToScriptAddress(Script_SharedStarWarpEntryCode)

;---------------------------------------------------------------------------

Script_EnterStarWarp_StarRoad5ToGnarly:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $0224)
	%ScriptCommand_JumpToScriptAddress(Script_SharedStarWarpEntryCode)

;---------------------------------------------------------------------------

Script_EnterStarWarp_GnarlyToStarRoad5:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $0225)
	%ScriptCommand_JumpToScriptAddress(Script_SharedStarWarpEntryCode)

;---------------------------------------------------------------------------

Script_EnterStarWarp_FunkyToYoshisHouse:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $0226)
	%ScriptCommand_JumpToScriptAddress(Script_SharedStarWarpEntryCode)

;---------------------------------------------------------------------------

;#############################################################################################################
;#############################################################################################################

; Silent event scripts, which are used to make events persist when changing submaps and for events to affect more than one submap.

;---------------------------------------------------------------------------

Script_SilentEventsForMainMap:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_YoshisIsland1_NormalExitEventID, .RevealPath1ToYellowSwitchPalace)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_YellowSwitchPalace_XPosOfTile, !Define_SMW_YellowSwitchPalace_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
.RevealPath1ToYellowSwitchPalace:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_IggysCastle_NormalExitEventID, .RevealPath1ToDonutPlains1)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_BridgeToYoshisIsland_XPosOfTile, !Define_SMW_BridgeToYoshisIsland_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutPlains1_XPosOfTile, !Define_SMW_DonutPlains1_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToDonutPlains1:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutPlains1_XPosOfTile, !Define_SMW_DonutPlains1_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutPlains1_XPosOfTile, !Define_SMW_DonutPlains1_YPosOfTile+$02, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_BridgeToYoshisIsland_Map16Tile, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_BridgeToYoshisIsland_Map16Tile, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_BridgeToYoshisIsland_Map16Tile, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_AirTile_Map16Tile, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_DestroyedIggysCastle_Map16Tile, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutPlains1_NormalExitEventID, .RevealPath1ToDonutPlains2)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutPlains2_XPosOfTile, !Define_SMW_DonutPlains2_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToDonutPlains2:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutPlains1_XPosOfTile-$01, !Define_SMW_DonutPlains1_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0019, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0071, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0010, Up, LastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Up, LastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Up, LastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutPlains1_SecretExit1EventID, .RevealPath1ToDonutSecret1)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutSecret1_XPosOfTile, !Define_SMW_DonutSecret1_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToDonutSecret1:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutPlains1_XPosOfTile, !Define_SMW_DonutPlains1_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0072, Up, LastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0073, Up, LastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$007A, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_DonutPlains2_NormalExitEventID, .DontRevealPath1ToDonutGhostHouse)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutPlains2_XPosOfTile, !Define_SMW_DonutPlains2_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0007, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00B5, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00B6, NoMove, LastTile)

.DontRevealPath1ToDonutGhostHouse:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutPlains2_SecretExit1EventID, .RevealPath1ToGreenSwitchPalace)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_GreenSwitchPalace_XPosOfTile, !Define_SMW_GreenSwitchPalace_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToGreenSwitchPalace:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutPlains2_XPosOfTile-$01, !Define_SMW_DonutPlains2_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00B2, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00B4, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutGhostHouse_NormalExitEventID, .RevealPath1ToTopSecretArea)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_TopSecretArea_XPosOfTile, !Define_SMW_TopSecretArea_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToTopSecretArea:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutGhostHouse_XPosOfTile, !Define_SMW_DonutGhostHouse_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00C4, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00C6, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00C7, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutGhostHouse_SecretExit1EventID, .RevealPath1ToDonutPlains3)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutSecret2_NormalExitEventID, +)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutPlains3_XPosOfTile, !Define_SMW_DonutPlains3_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToDonutPlains3:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutGhostHouse_XPosOfTile+$02, !Define_SMW_DonutGhostHouse_YPosOfTile+$02, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$021E, UpRight, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0236, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0235, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$021A, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0220, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$007F, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0080, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, UpLeft, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$022A, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0222, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0224, UpLeft, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$022D, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0239, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0211, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0229, UpLeft, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0233, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0232, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0234, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0230, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01EB, Right, LastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0231, NoMove, NotLastTile)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutPlains1_SecretExit1EventID, ..SkipStep)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutSecret1_XPosOfTile, !Define_SMW_DonutSecret1_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00C3, NoMove, LastTile)
..SkipStep:
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutPlains3_NormalExitEventID, .RevealPath1ToDonutPlains4)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutPlains4_XPosOfTile, !Define_SMW_DonutPlains4_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToDonutPlains4:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutPlains3_XPosOfTile+$01, !Define_SMW_DonutPlains3_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00AA, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00AC, UpRight, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00AB, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00AD, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00AE, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_DonutPlains4_NormalExitEventID, .DontRevealPath1ToMortonsCastle)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutPlains4_XPosOfTile+$01, !Define_SMW_DonutPlains4_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0093, NoMove, LastTile)
.DontRevealPath1ToMortonsCastle:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_MortonsCastle_NormalExitEventID, .RevealPath1ToVanillaDome1)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DoorToVanillaDome_XPosOfTile, !Define_SMW_DoorToVanillaDome_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_ClosedDoor_Map16Tile, NoMove, LastTile)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, +)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_MortonsCastle, +)
	%ScriptCommand_16BitBranchIfEqual(!RAM_SMW_Misc_CurrentlyActiveBossEndCutscene, $00, +)
	%ScriptCommand_PlaySoundOrMusic(1DFB, NoMusic)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToVanillaDome1:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_MortonsCastle_XPosOfTile, !Define_SMW_MortonsCastle_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_DestroyedMortonsCastle_Map16Tile, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_MortonsCastle_XPosOfTile, !Define_SMW_MortonsCastle_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00B0, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00B1, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_StarWarp_SodaLakeToStarRoad3_XPosOfTile-$01, !Define_SMW_StarWarp_SodaLakeToStarRoad3_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0213, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0217, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0215, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0216, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0218, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0211, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$020D, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01EF, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$020E, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_DonutSecret1_NormalExitEventID, .DontRevealPath2ToDonutGhostHouse)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutSecret1_XPosOfTile, !Define_SMW_DonutSecret1_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0073, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0073, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00B7, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00B8, NoMove, LastTile)
.DontRevealPath2ToDonutGhostHouse:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_DonutSecret1_SecretExit1EventID, .DontRevealPath1ToDonutSecretHouse)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutSecret1_XPosOfTile+$01, !Define_SMW_DonutSecret1_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0075, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$007B, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0072, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00BC, NoMove, LastTile)
.DontRevealPath1ToDonutSecretHouse:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutSecretHouse_NormalExitEventID, .RevealPath1ToDonutSecret2)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutSecret2_XPosOfTile, !Define_SMW_DonutSecret2_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToDonutSecret2:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutSecretHouse_XPosOfTile+$01, !Define_SMW_DonutSecretHouse_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00BD, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00BE, UpRight, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00BF, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00C0, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutSecretHouse_SecretExit1EventID, .RevealPath1ToStarWarp_DonutSecretHouseToStarRoad1)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld5_NormalExitEventID, +)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_StarWarp_DonutSecretHouseToStarRoad1_XPosOfTile, !Define_SMW_StarWarp_DonutSecretHouseToStarRoad1_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToStarWarp_DonutSecretHouseToStarRoad1:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutSecretHouse_XPosOfTile, !Define_SMW_DonutSecretHouse_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00C1, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00C2, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_DonutSecret2_NormalExitEventID, .DontRevealPath2ToDonutPlains3)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutPlains3_XPosOfTile, !Define_SMW_DonutPlains3_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$008D, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0238, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$023F, DownRight, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0240, NoMove, LastTile)
.DontRevealPath2ToDonutPlains3:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_LemmysCastle_NormalExitEventID, .RevealPath1ToCheeseBridgeArea)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_CheeseBridgeArea_XPosOfTile, !Define_SMW_CheeseBridgeArea_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
.RevealPath1ToCheeseBridgeArea:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_CheeseBridgeArea_NormalExitEventID, .RevealPath1ToCookieMountain)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_CookieMountain_XPosOfTile, !Define_SMW_CookieMountain_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToCookieMountain:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_CheeseBridgeArea_XPosOfTile+$02, !Define_SMW_CheeseBridgeArea_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0155, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0100, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_CheeseBridgeArea_SecretExit1EventID, .RevealPath1ToSodaLake)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_SodaLake_XPosOfTile, !Define_SMW_SodaLake_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToSodaLake:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_CheeseBridgeArea_XPosOfTile, !Define_SMW_CheeseBridgeArea_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00CC, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00CD, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_SodaLake_NormalExitEventID, .RevealPath1ToStarWarp_SodaLakeToStarRoad3)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld2_NormalExitEventID, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld2_SecretExit1EventID, +)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_StarWarp_SodaLakeToStarRoad3_XPosOfTile, !Define_SMW_StarWarp_SodaLakeToStarRoad3_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
+:
.RevealPath1ToStarWarp_SodaLakeToStarRoad3:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_CookieMountain_NormalExitEventID, .DontRevealPath1ToLudwigsCastle)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_CookieMountain_XPosOfTile, !Define_SMW_CookieMountain_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0110, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00CE, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00D0, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00D2, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00D3, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0158, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0088, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00D4, NoMove, LastTile)
.DontRevealPath1ToLudwigsCastle:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_LudwigsCastle_NormalExitEventID, .RevealPath1ToForestOfIllusion1)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, +)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_LudwigsCastle, +)
	%ScriptCommand_16BitBranchIfEqual(!RAM_SMW_Misc_CurrentlyActiveBossEndCutscene, $00, +)
	%ScriptCommand_PlaySoundOrMusic(1DFB, NoMusic)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToForestOfIllusion1:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_LudwigsCastle_XPosOfTile, !Define_SMW_LudwigsCastle_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_DestroyedLudwigsCastle_Map16Tile, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_LudwigsCastle_XPosOfTile+$02, !Define_SMW_LudwigsCastle_YPosOfTile-$03, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00A6, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00A7, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00A9, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00A8, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_LudwigsCastle_XPosOfTile+$01, !Define_SMW_LudwigsCastle_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$008A, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$008B, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$008F, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0088, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0088, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0088, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$008E, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00A2, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaSecret1_NormalExitEventID, .RevealPath1ToVanillaSecret2)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaSecret2_XPosOfTile, !Define_SMW_VanillaSecret2_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToVanillaSecret2:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaSecret2_XPosOfTile, !Define_SMW_VanillaSecret2_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaSecret2_NormalExitEventID, .RevealPath1ToVanillaSecret3)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaSecret3_XPosOfTile, !Define_SMW_VanillaSecret3_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToVanillaSecret3:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaSecret2_XPosOfTile+$01, !Define_SMW_VanillaSecret2_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$003F, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaFortress_NormalExitEventID, .RevealPath1ToButterBridge1)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ButterBridge1_XPosOfTile, !Define_SMW_ButterBridge1_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToButterBridge1:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaFortress_XPosOfTile, !Define_SMW_VanillaFortress_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_DestroyedVanillaFortress_Map16Tile, Down, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaFortress_XPosOfTile+$02, !Define_SMW_VanillaFortress_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0081, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$007F, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$007F, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$007F, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$007F, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$007F, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0080, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ButterBridge1_NormalExitEventID, .RevealPath1ToButterBridge2)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ButterBridge2_XPosOfTile, !Define_SMW_ButterBridge2_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
.RevealPath1ToButterBridge2:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_ButterBridge2_NormalExitEventID, .DontRevealPath2ToLudwigsCastle)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ButterBridge2_XPosOfTile+$03, !Define_SMW_ButterBridge2_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0086, Left, LastTile)
.DontRevealPath2ToLudwigsCastle:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_ForestSecretArea_NormalExitEventID, .DontRevealPath1ToForestFortress)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestFortress_XPosOfTile+$01, !Define_SMW_ForestFortress_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0241, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00A4, NoMove, LastTile)
.DontRevealPath1ToForestFortress:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestFortress_NormalExitEventID, .RevealPath1ToStarWarp_ForestFortressToStarRoad4)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld3_NormalExitEventID, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld3_SecretExit1EventID, +)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_StarWarp_ForestFortressToStarRoad4_XPosOfTile, !Define_SMW_StarWarp_ForestFortressToStarRoad4_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToStarWarp_ForestFortressToStarRoad4:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestFortress_XPosOfTile, !Define_SMW_ForestFortress_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_DestroyedForestFortress_Map16Tile, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestFortress_XPosOfTile-$01, !Define_SMW_ForestFortress_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0243, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0244, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_ForestOfIllusion3_SecretExit1EventID, .DontRevealPath1ToRoysCastle)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_RoysCastle_XPosOfTile+$04, !Define_SMW_RoysCastle_YPosOfTile-$02, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00A3, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$000D, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0242, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0013, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0241, NoMove, LastTile)
.DontRevealPath1ToRoysCastle:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_RoysCastle_NormalExitEventID, .RevealPath1ToChocolateIsland1)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ChocolateIsland1_XPosOfTile, !Define_SMW_ChocolateIsland1_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToChocolateIsland1:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_RoysCastle_XPosOfTile, !Define_SMW_RoysCastle_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_DestroyedRoysCastle_Map16Tile, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_RoysCastle_XPosOfTile, !Define_SMW_RoysCastle_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00C1, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00C8, DownRight, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01FC, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00C9, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01FB, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01F1, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01FF, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0204, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01FE, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01FD, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0201, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0202, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0203, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01FA, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01F9, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01F8, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_ChocolateIsland1_NormalExitEventID, .DontRevealPath1ToChocoGhostHouse)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ChocolateIsland1_XPosOfTile-$01, !Define_SMW_ChocolateIsland1_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00CA, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0156, NoMove, LastTile)
.DontRevealPath1ToChocoGhostHouse:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocoGhostHouse_NormalExitEventID, .RevealPath1ToChocolateIsland2)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ChocolateIsland2_XPosOfTile, !Define_SMW_ChocolateIsland2_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToChocolateIsland2:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ChocoGhostHouse_XPosOfTile, !Define_SMW_ChocoGhostHouse_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0166, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0168, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$016C, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0163, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0164, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateIsland2_NormalExitEventID, .RevealPath1ToChocolateIsland3)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ChocolateIsland3_XPosOfTile, !Define_SMW_ChocolateIsland3_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToChocolateIsland3:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ChocolateIsland2_XPosOfTile-$01, !Define_SMW_ChocolateIsland2_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0165, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateIsland2_SecretExit1EventID, .RevealPath1ToChocolateSecret)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ChocolateSecret_XPosOfTile, !Define_SMW_ChocolateSecret_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToChocolateSecret:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ChocolateIsland2_XPosOfTile, !Define_SMW_ChocolateIsland2_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0166, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0170, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$016F, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$016E, UpRight, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$016C, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0171, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0172, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0173, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0173, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0174, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0168, NoMove, NotLastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ChocolateIsland2_XPosOfTile-$01, !Define_SMW_ChocolateIsland2_YPosOfTile-$02, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0166, UpLeft, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0169, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_ChocolateIsland3_NormalExitEventID, .DontRevealPath2ToChocolateIsland3)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ChocolateIsland3_XPosOfTile, !Define_SMW_ChocolateIsland3_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0175, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0162, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0177, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0166, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0161, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0178, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$016A, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$016C, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0165, NoMove, LastTile)
.DontRevealPath2ToChocolateIsland3:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_ChocolateIsland3_SecretExit1EventID, .DontRevealPath1ToChocolateFortress)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ChocolateIsland3_XPosOfTile-$01, !Define_SMW_ChocolateIsland3_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0163, NoMove, LastTile)
.DontRevealPath1ToChocolateFortress:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateFortress_NormalExitEventID, .RevealPath1ToChocolateIsland4)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ChocolateIsland4_XPosOfTile, !Define_SMW_ChocolateIsland4_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToChocolateIsland4:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ChocolateFortress_XPosOfTile, !Define_SMW_ChocolateFortress_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_DestroyedChocolateFortress_Map16Tile, NoMove, NotLastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ChocolateFortress_XPosOfTile, !Define_SMW_ChocolateFortress_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateIsland4_NormalExitEventID, .RevealPath1ToChocolateIsland5)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ChocolateIsland5_XPosOfTile, !Define_SMW_ChocolateIsland5_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToChocolateIsland5:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ChocolateIsland4_XPosOfTile-$01, !Define_SMW_ChocolateIsland4_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_ChocolateIsland5_NormalExitEventID, .DontRevealPath1ToWendysCastle)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ChocolateIsland5_XPosOfTile, !Define_SMW_ChocolateIsland5_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, NoMove, LastTile)
.DontRevealPath1ToWendysCastle:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_WendysCastle_NormalExitEventID, .RevealPath1ToSunkenGhostShip)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_SunkenGhostShip_XPosOfTile, !Define_SMW_SunkenGhostShip_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToSunkenGhostShip:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_WendysCastle_XPosOfTile, !Define_SMW_WendysCastle_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_DestroyedWendysCastle_Map16Tile, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_WendysCastle_XPosOfTile, !Define_SMW_WendysCastle_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$013D, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00DB, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0073, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00DD, UpRight, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00DE, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00DF, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_SunkenGhostShip_NormalExitEventID, .DontRevealPath1ToValleyOfBowser1)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_SunkenGhostShip_XPosOfTile-$01, !Define_SMW_SunkenGhostShip_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01C4, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01C5, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01C6, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01CC, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01CB, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01CA, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01CD, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01CE, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01CF, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01BA, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01B9, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01B8, NoMove, LastTile)
.DontRevealPath1ToValleyOfBowser1:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_YellowSwitchPalace_NormalExitEventID, .DontDestroyYellowSwitchPalace)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_YellowSwitchPalace_XPosOfTile, !Define_SMW_YellowSwitchPalace_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_FlattenedYellowSwitch_Map16Tile, NoMove, LastTile)
.DontDestroyYellowSwitchPalace:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_GreenSwitchPalace_NormalExitEventID, .DontDestroyGreenSwitchPalace)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_GreenSwitchPalace_XPosOfTile, !Define_SMW_GreenSwitchPalace_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_FlattenedGreenSwitch_Map16Tile, NoMove, LastTile)
.DontDestroyGreenSwitchPalace:
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_SilentEventsForYoshisIsland:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_YoshisIsland1_NormalExitEventID, .RevealPath1ToYellowSwitchPalace)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_YellowSwitchPalace_XPosOfTile, !Define_SMW_YellowSwitchPalace_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToYellowSwitchPalace:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_YoshisIsland1_XPosOfTile, !Define_SMW_YoshisIsland1_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0007, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0037, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0038, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0039, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$003A, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$000D, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_YoshisIsland1_XPosOfTile-$02, !Define_SMW_YoshisIsland1_YPosOfTile-$02, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$004A, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$004B, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$004C, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$004F, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$004E, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$004D, Up, NotLastTile)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0055, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0056, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0058, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0057, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_YoshisIsland1_XPosOfTile-$02, !Define_SMW_YoshisIsland1_YPosOfTile-$07, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$003D, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$003C, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_YoshisIsland2_NormalExitEventID, .RevealPath1ToYoshisIsland3)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_YoshisIsland3_XPosOfTile, !Define_SMW_YoshisIsland3_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToYoshisIsland3:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_YoshisIsland2_XPosOfTile, !Define_SMW_YoshisIsland2_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_YoshisIsland3_NormalExitEventID, .RevealPath1ToYoshisIsland4)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_YoshisIsland4_XPosOfTile, !Define_SMW_YoshisIsland4_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToYoshisIsland4:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_YoshisIsland3_XPosOfTile+$01, !Define_SMW_YoshisIsland3_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0013, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$003E, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$000D, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$003F, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_YoshisIsland4_NormalExitEventID, .DontRevealPath1ToIggysCastle)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_YoshisIsland4_XPosOfTile, !Define_SMW_YoshisIsland4_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$000A, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$005D, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$005E, NoMove, LastTile)
.DontRevealPath1ToIggysCastle:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_IggysCastle_NormalExitEventID, .RevealPath1ToDonutPlains1)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_BridgeToDonutPlains_XPosOfTile, !Define_SMW_BridgeToDonutPlains_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, +)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Overworld_LevelNumberLo, !Define_SMW_LevelIndex_IggysCastle, +)
	%ScriptCommand_16BitBranchIfEqual(!RAM_SMW_Misc_CurrentlyActiveBossEndCutscene, $00, +)
	%ScriptCommand_PlaySoundOrMusic(1DFB, NoMusic)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToDonutPlains1:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_IggysCastle_XPosOfTile, !Define_SMW_IggysCastle_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_DestroyedIggysCastle_Map16Tile, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_AirTile_Map16Tile, Up, NotLastTile)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_BridgeToDonutPlains_Map16Tile, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_BridgeToDonutPlains_Map16Tile, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_BridgeToDonutPlains_Map16Tile, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_IggysCastle_XPosOfTile, !Define_SMW_IggysCastle_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0062, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, NoMove, LastTile)
+
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_SilentEventsForVanillaDome:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_MortonsCastle_NormalExitEventID, .RevealPath1ToVanillaDome1)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaDome1_XPosOfTile, !Define_SMW_VanillaDome1_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToVanillaDome1:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaDome1_XPosOfTile, !Define_SMW_VanillaDome1_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0100, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0104, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaDome1_NormalExitEventID, .RevealPath1ToVanillaDome2)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaDome2_XPosOfTile, !Define_SMW_VanillaDome2_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToVanillaDome2:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaDome1_XPosOfTile+$01, !Define_SMW_VanillaDome1_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0156, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00E0, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00E1, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00E3, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00EA, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaDome1_SecretExit1EventID, .RevealPath1ToVanillaSecret1)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaSecret1_XPosOfTile, !Define_SMW_VanillaSecret1_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToVanillaSecret1:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaDome1_XPosOfTile-$03, !Define_SMW_VanillaDome1_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0179, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$017B, UpRight, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$017A, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0119, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$017C, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$017E, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$017F, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$017F, Up, LastTile)
+:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_VanillaDome2_NormalExitEventID, .DontRevealPath1ToVanillaGhostHouse)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaDome2_XPosOfTile, !Define_SMW_VanillaDome2_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$017F, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$017F, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00C8, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
.DontRevealPath1ToVanillaGhostHouse:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaDome2_SecretExit1EventID, .RevealPath1ToRedSwitchPalace)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_RedSwitchPalace_XPosOfTile, !Define_SMW_RedSwitchPalace_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToRedSwitchPalace:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaDome2_XPosOfTile+$01, !Define_SMW_VanillaDome2_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00F3, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00F4, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00F5, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaGhostHouse_NormalExitEventID, .RevealPath1ToVanillaDome3)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaDome3_XPosOfTile, !Define_SMW_VanillaDome3_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToVanillaDome3:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaGhostHouse_XPosOfTile+$01, !Define_SMW_VanillaGhostHouse_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00EC, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00EE, UpRight, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00ED, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00F0, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaDome3_NormalExitEventID, .RevealPath1ToVanillaDome4)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaDome4_XPosOfTile, !Define_SMW_VanillaDome4_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToVanillaDome4:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaDome3_XPosOfTile, !Define_SMW_VanillaDome3_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_VanillaDome4_NormalExitEventID, .DontRevealPath1ToLemmysCastle)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaDome4_XPosOfTile, !Define_SMW_VanillaDome4_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00BC, NoMove, LastTile)
.DontRevealPath1ToLemmysCastle:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_LemmysCastle_NormalExitEventID, .DontRevealPath1ToCheeseBridgeArea)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_LemmysCastle_XPosOfTile, !Define_SMW_LemmysCastle_YPosOfTile+$00, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_DestroyedLemmysCastle_Map16Tile, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_LemmysCastle_XPosOfTile, !Define_SMW_LemmysCastle_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00F1, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00F2, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0013, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0060, NoMove, LastTile)
.DontRevealPath1ToCheeseBridgeArea:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaSecret1_NormalExitEventID, .RevealPath1ToVanillaSecret2)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaSecret2_XPosOfTile, !Define_SMW_VanillaSecret2_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToVanillaSecret2:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaSecret1_XPosOfTile, !Define_SMW_VanillaSecret1_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$017F, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00E6, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaSecret1_SecretExit1EventID, .RevealPath1ToStarWarp_VanillaSecret1ToStarRoad2)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld1_NormalExitEventID, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld1_SecretExit1EventID, +)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_StarWarp_VanillaSecret1ToStarRoad2_XPosOfTile, !Define_SMW_StarWarp_VanillaSecret1ToStarRoad2_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToStarWarp_VanillaSecret1ToStarRoad2:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaSecret1_XPosOfTile-$02, !Define_SMW_VanillaSecret1_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, UpLeft, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00E7, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00E9, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_RedSwitchPalace_NormalExitEventID, .DontDestroyRedSwitchPalace)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_RedSwitchPalace_XPosOfTile, !Define_SMW_RedSwitchPalace_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_FlattenedRedSwitch_Map16Tile, NoMove, LastTile)
.DontDestroyRedSwitchPalace:
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_SilentEventsForForestOfIllusion:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_LudwigsCastle_NormalExitEventID, .RevealPath1ToForestOfIllusion1)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestOfIllusion1_XPosOfTile, !Define_SMW_ForestOfIllusion1_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToForestOfIllusion1:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestOfIllusion1_XPosOfTile, !Define_SMW_ForestOfIllusion1_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion1_NormalExitEventID, .RevealPath1ToForestOfIllusion2)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion4_NormalExitEventID, +)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestOfIllusion2_XPosOfTile, !Define_SMW_ForestOfIllusion2_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToForestOfIllusion2:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestOfIllusion1_XPosOfTile+$01, !Define_SMW_ForestOfIllusion1_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0016, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$005F, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$000A, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Down, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion1_SecretExit1EventID, .RevealPath1ToForestGhostHouse)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion3_NormalExitEventID, .SpawnBoo)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestGhostHouse_XPosOfTile, !Define_SMW_ForestGhostHouse_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToForestGhostHouse:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestOfIllusion1_XPosOfTile-$01, !Define_SMW_ForestOfIllusion1_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
.SpawnBoo:
	%ScriptCommand_SpawnSprite(OWSpr0A_Boo, (!Define_SMW_ForestGhostHouse_XPosOfTile-$01)<<4, !Define_SMW_ForestGhostHouse_YPosOfTile<<4, $0000, $0000)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion2_NormalExitEventID, .RevealPath1ToForestOfIllusion3)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestOfIllusion3_XPosOfTile, !Define_SMW_ForestOfIllusion3_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToForestOfIllusion3:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestOfIllusion2_XPosOfTile, !Define_SMW_ForestOfIllusion2_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$000D, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$018F, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0013, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion2_SecretExit1EventID, .RevealPath1ToBlueSwitchPalace)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_BlueSwitchPalace_XPosOfTile, !Define_SMW_BlueSwitchPalace_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToBlueSwitchPalace:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestOfIllusion2_XPosOfTile+$01, !Define_SMW_ForestOfIllusion2_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_ForestOfIllusion3_NormalExitEventID, .DontRevealPath1ToForestGhostHouse)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestOfIllusion3_XPosOfTile-$01, !Define_SMW_ForestOfIllusion3_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0019, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0193, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0010, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
.DontRevealPath1ToForestGhostHouse:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_ForestOfIllusion3_SecretExit1EventID, .DontRevealPath1ToRoysCastle)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestOfIllusion3_XPosOfTile, !Define_SMW_ForestOfIllusion3_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, NoMove, LastTile)
.DontRevealPath1ToRoysCastle:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_ForestGhostHouse_NormalExitEventID, .DontRevealPath2ToForestOfIllusion1)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestGhostHouse_XPosOfTile+$01, !Define_SMW_ForestGhostHouse_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, NoMove, LastTile)
.DontRevealPath2ToForestOfIllusion1:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestGhostHouse_SecretExit1EventID, .RevealPath1ToForestOfIllusion4)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestOfIllusion4_XPosOfTile, !Define_SMW_ForestOfIllusion4_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToForestOfIllusion4:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestGhostHouse_XPosOfTile-$01, !Define_SMW_ForestGhostHouse_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$001C, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0195, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0007, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_ForestOfIllusion4_NormalExitEventID, .DontRevealPath2ToForestOfIllusion2)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestOfIllusion4_XPosOfTile+$01, !Define_SMW_ForestOfIllusion4_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, NoMove, LastTile)
.DontRevealPath2ToForestOfIllusion2:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion4_SecretExit1EventID, .RevealPath1ToForestSecretArea)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestSecretArea_XPosOfTile, !Define_SMW_ForestSecretArea_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToForestSecretArea:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestOfIllusion4_XPosOfTile, !Define_SMW_ForestOfIllusion4_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestSecretArea_NormalExitEventID, .RevealPath1ToForestFortress)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestFortress_XPosOfTile, !Define_SMW_ForestFortress_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToForestFortress:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestSecretArea_XPosOfTile, !Define_SMW_ForestSecretArea_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$000D, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0197, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0013, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Left, LastTile)
+:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_BlueSwitchPalace_NormalExitEventID, .DontDestroyBlueSwitchPalace)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_BlueSwitchPalace_XPosOfTile, !Define_SMW_BlueSwitchPalace_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_FlattenedBlueSwitch_Map16Tile, NoMove, LastTile)
.DontDestroyBlueSwitchPalace:
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_SilentEventsForValleyOfBowser:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutSecretHouse_NormalExitEventID, .RevealPath1ToDonutSecret2)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutSecret2_XPosOfTile, !Define_SMW_DonutSecret2_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToDonutSecret2:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutSecret2_XPosOfTile, !Define_SMW_DonutSecret2_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutSecret2_NormalExitEventID, .RevealPath2ToDonutPlains3)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutPlains3_XPosOfTile, !Define_SMW_DonutPlains3_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath2ToDonutPlains3:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutSecret2_XPosOfTile+$01, !Define_SMW_DonutSecret2_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateIsland2_SecretExit1EventID, .RevealPath1ToChocolateSecret)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ChocolateSecret_XPosOfTile, !Define_SMW_ChocolateSecret_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
.RevealPath1ToChocolateSecret:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_SunkenGhostShip_NormalExitEventID, .RevealPath1ToValleyOfBowser1)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ValleyOfBowser1_XPosOfTile, !Define_SMW_ValleyOfBowser1_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToValleyOfBowser1:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ValleyOfBowser1_XPosOfTile+$03, !Define_SMW_ValleyOfBowser1_YPosOfTile+$02, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$023A, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$023B, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$023C, DownLeft, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$023D, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$023E, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0101, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0100, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyOfBowser1_NormalExitEventID, .RevealPath1ToValleyOfBowser2)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ValleyOfBowser2_XPosOfTile, !Define_SMW_ValleyOfBowser2_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToValleyOfBowser2:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ValleyOfBowser1_XPosOfTile-$01, !Define_SMW_ValleyOfBowser1_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0101, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0100, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_ValleyOfBowser2_NormalExitEventID, .DontRevealPath1ToValleyGhostHouse)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ValleyOfBowser2_XPosOfTile-$01, !Define_SMW_ValleyOfBowser2_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0101, NoMove, LastTile)
.DontRevealPath1ToValleyGhostHouse:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_ValleyOfBowser2_SecretExit1EventID, .DontRevealPath1ToValleyFortress)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ValleyOfBowser2_XPosOfTile, !Define_SMW_ValleyOfBowser2_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0122, NoMove, LastTile)
.DontRevealPath1ToValleyFortress:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyGhostHouse_NormalExitEventID, .RevealPath1ToValleyOfBowser3)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ValleyOfBowser3_XPosOfTile, !Define_SMW_ValleyOfBowser3_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToValleyOfBowser3:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ValleyGhostHouse_XPosOfTile-$01, !Define_SMW_ValleyGhostHouse_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0101, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0101, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0100, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_ValleyGhostHouse_SecretExit1EventID, .DontRevealPath1ToLarrysCastle)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ValleyGhostHouse_XPosOfTile, !Define_SMW_ValleyGhostHouse_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0122, NoMove, LastTile)
.DontRevealPath1ToLarrysCastle:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyOfBowser3_NormalExitEventID, .RevealPath1ToValleyOfBowser4)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ValleyOfBowser4_XPosOfTile, !Define_SMW_ValleyOfBowser4_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToValleyOfBowser4:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ValleyOfBowser3_XPosOfTile, !Define_SMW_ValleyOfBowser3_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0104, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0100, NoMove, LastTile)

+:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_ValleyOfBowser4_NormalExitEventID, .DontRevealPath2ToLarrysCastle)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ValleyOfBowser4_XPosOfTile+$01, !Define_SMW_ValleyOfBowser4_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0101, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0101, NoMove, LastTile)
.DontRevealPath2ToLarrysCastle:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyOfBowser4_SecretExit1EventID, .RevealPath1ToStarWarp_FrontDoorToStarRoad5)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld4_NormalExitEventID, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld4_SecretExit1EventID, +)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_StarWarp_FrontDoorToStarRoad5_XPosOfTile, !Define_SMW_StarWarp_FrontDoorToStarRoad5_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToStarWarp_FrontDoorToStarRoad5:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ValleyOfBowser4_XPosOfTile, !Define_SMW_ValleyOfBowser4_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0104, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$019A, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0198, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0198, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_LarrysCastle_NormalExitEventID, .DontRevealPath1ToFrontDoor)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_LarrysCastle_XPosOfTile, !Define_SMW_LarrysCastle_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_DestroyedLarrysCastle_Map16Tile, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_LarrysCastle_XPosOfTile, !Define_SMW_LarrysCastle_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0104, NoMove, LastTile)
.DontRevealPath1ToFrontDoor:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_ValleyFortress_NormalExitEventID, .DontRevealPath1ToBackDoor)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ValleyFortress_XPosOfTile, !Define_SMW_ValleyFortress_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_DestroyedValleyFortress_Map16Tile, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ValleyFortress_XPosOfTile, !Define_SMW_ValleyFortress_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0104, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0199, NoMove, LastTile)
.DontRevealPath1ToBackDoor:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_StarWorld4_SecretExit1EventID, .DontRevealPath1ToStarWarp_FrontDoorToStarRoad5)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_StarWarp_FrontDoorToStarRoad5_XPosOfTile, !Define_SMW_StarWarp_FrontDoorToStarRoad5_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$019A, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0198, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0198, NoMove, LastTile)
.DontRevealPath1ToStarWarp_FrontDoorToStarRoad5:
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_SilentEventsForSpecialWorld:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_Gnarly_NormalExitEventID, .RevealPath1ToTubular)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_Tubular_XPosOfTile, !Define_SMW_Tubular_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToTubular:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_Gnarly_XPosOfTile+$01, !Define_SMW_Gnarly_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_Tubular_NormalExitEventID, .RevealPath1ToWayCool)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_WayCool_XPosOfTile, !Define_SMW_WayCool_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToWayCool:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_Tubular_XPosOfTile+$01, !Define_SMW_Tubular_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_WayCool_NormalExitEventID, .RevealPath1ToAwesome)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_Awesome_XPosOfTile, !Define_SMW_Awesome_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToAwesome:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_WayCool_XPosOfTile+$01, !Define_SMW_WayCool_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_Awesome_NormalExitEventID, .RevealPath1ToGroovy)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_Groovy_XPosOfTile, !Define_SMW_Groovy_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToGroovy:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_Awesome_XPosOfTile+$01, !Define_SMW_Awesome_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00F7, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00F6, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_Groovy_NormalExitEventID, .RevealPath1ToMondo)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_Mondo_XPosOfTile, !Define_SMW_Mondo_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToMondo:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_Groovy_XPosOfTile-$01, !Define_SMW_Groovy_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_Mondo_NormalExitEventID, .RevealPath1ToOutrageous)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_Outrageous_XPosOfTile, !Define_SMW_Outrageous_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToOutrageous:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_Mondo_XPosOfTile-$01, !Define_SMW_Mondo_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_Outrageous_NormalExitEventID, .RevealPath1ToFunky)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_Funky_XPosOfTile, !Define_SMW_Funky_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToFunky:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_Outrageous_XPosOfTile-$01, !Define_SMW_Outrageous_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
+:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_Funky_NormalExitEventID, .RevealPath1ToYoshisHouse)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_StarWarp_FunkyToYoshisHouse_XPosOfTile, !Define_SMW_StarWarp_FunkyToYoshisHouse_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(+)

.RevealPath1ToYoshisHouse:
	%ScriptCommand_SetEventTileCoords(!Define_SMW_Funky_XPosOfTile-$01, !Define_SMW_Funky_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
+:
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_SilentEventsForStarWorld:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_StarWorld1_SecretExit1EventID, .DontRevealPath1ToStarWarp_StarRoad2ToVanillaSecret1)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_StarWorld1_XPosOfTile, !Define_SMW_StarWorld1_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00F8, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00FC, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00FE, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00FC, NoMove, LastTile)
.DontRevealPath1ToStarWarp_StarRoad2ToVanillaSecret1:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_StarWorld2_SecretExit1EventID, .DontRevealPath1ToStarWarp_StarRoad3ToSodaLake)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_StarWorld2_XPosOfTile, !Define_SMW_StarWorld2_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00F9, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00FF, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0183, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0184, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00FA, NoMove, LastTile)
.DontRevealPath1ToStarWarp_StarRoad3ToSodaLake:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_StarWorld3_SecretExit1EventID, .DontRevealPath1ToStarWarp_StarRoad4ToForestFortress)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_StarWorld3_XPosOfTile+$01, !Define_SMW_StarWorld2_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, LastTile)
.DontRevealPath1ToStarWarp_StarRoad4ToForestFortress:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_StarWorld4_SecretExit1EventID, .DontRevealPath1ToStarWarp_StarRoad5ToFrontDoor)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_StarWorld4_XPosOfTile, !Define_SMW_StarWorld4_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00AE, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0186, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0187, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0188, Right, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0189, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00F8, NoMove, LastTile)
.DontRevealPath1ToStarWarp_StarRoad5ToFrontDoor:
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_StarWorld5_NormalExitEventID, .DontRevealPath1ToStarRoad1ToDonutSecretHouse)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_StarWorld5_XPosOfTile, !Define_SMW_StarWorld5_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00FA, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$018A, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$018B, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0031, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$018A, Down, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$018C, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0031, Left, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00AE, NoMove, LastTile)
.DontRevealPath1ToStarRoad1ToDonutSecretHouse:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld5_SecretExit1EventID, .RevealPath1ToStarWarp_StarRoad5ToGnarly)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_StarWarp_StarRoad5ToGnarly_XPosOfTile, !Define_SMW_StarWarp_StarRoad5ToGnarly_YPosOfTile, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_AirTile_Map16Tile, NoMove, LastTile)
.RevealPath1ToStarWarp_StarRoad5ToGnarly:
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

;#############################################################################################################
;#############################################################################################################

; Exit level scripts, which are used to do dynamic events, animations, and more based on how Mario exits a level.

;---------------------------------------------------------------------------

Script_ExitLevel000:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLevel000)

;---------------------------------------------------------------------------

Script_ExitVanillaSecret2:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaSecret2_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_VanillaSecret2_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaSecret2_XPosOfTile+$01, !Define_SMW_VanillaSecret2_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$003F, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_VanillaSecret3_XPosOfTile, !Define_SMW_VanillaSecret3_YPosOfTile, !Define_SMW_VanillaSecret3_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaSecret2_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaSecret2)

;---------------------------------------------------------------------------

Script_ExitVanillaSecret3:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaSecret3_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_VanillaSecret3_NormalExitEventID)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaSecret3_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaSecret3)

;---------------------------------------------------------------------------

Script_ExitTopSecretArea:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnTopSecretArea)

;---------------------------------------------------------------------------

Script_ExitDonutGhostHouse:
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NormalExitEvent)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_SecretExit1, .NoEvent)
.SecretExit1Event:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutGhostHouse_SecretExit1EventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_DonutGhostHouse_SecretExit1EventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutGhostHouse_XPosOfTile+$02, !Define_SMW_DonutGhostHouse_YPosOfTile+$02, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$021E, UpRight, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$021D, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$021B, DownLeft, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$021C, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0218, DownLeft, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$021A, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0219, DownRight, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0237, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0211, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0221, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0238, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0220, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$021F, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0218, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$021B, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$022B, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0223, UpLeft, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0224, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0222, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$022A, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0229, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0228, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0227, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0225, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0226, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$021D, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$022F, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$022D, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$022C, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0218, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$022E, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0211, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0239, UpLeft, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0249, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0247, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0248, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0245, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0246, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0230, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01EB, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0231, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0233, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0232, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0234, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutGhostHouse_XPosOfTile+$02, !Define_SMW_DonutGhostHouse_YPosOfTile, Layer2)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$007F, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0235, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0236, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0080, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutPlains1_SecretExit1EventID, .SkipStep1)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutSecret1_XPosOfTile, !Define_SMW_DonutSecret1_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00C3, NoMove, LastTile)
.SkipStep1:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutSecret2_NormalExitEventID, .SkipStep2)
	%MakeLevelTileAppear(!Define_SMW_DonutPlains3_XPosOfTile, !Define_SMW_DonutPlains3_YPosOfTile, !Define_SMW_DonutPlains3_Map16Tile, Layer1)
.SkipStep2:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutGhostHouse_SecretExit1Entry)

.NormalExitEvent:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutGhostHouse_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_DonutGhostHouse_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutGhostHouse_XPosOfTile, !Define_SMW_DonutGhostHouse_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00C4, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00C5, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00C6, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00C7, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_TopSecretArea_XPosOfTile, !Define_SMW_TopSecretArea_YPosOfTile, !Define_SMW_TopSecretArea_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutGhostHouse_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutGhostHouse)

;---------------------------------------------------------------------------

Script_ExitDonutPlains3:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutPlains3_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_DonutPlains3_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutPlains3_XPosOfTile+$01, !Define_SMW_DonutPlains3_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00AA, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00AC, UpRight, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00AB, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00AF, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00AD, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00AE, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_DonutPlains4_XPosOfTile, !Define_SMW_DonutPlains4_YPosOfTile, !Define_SMW_DonutPlains4_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutPlains3_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutPlains3)

;---------------------------------------------------------------------------

Script_ExitDonutPlains4:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutPlains4_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_DonutPlains4_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutPlains4_XPosOfTile+$01, !Define_SMW_DonutPlains4_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0093, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutPlains4_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutPlains4)

;---------------------------------------------------------------------------

Script_ExitMortonsCastle:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_MortonsCastle_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_MortonsCastle_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%DestroyCastle(!Define_SMW_MortonsCastle_XPosOfTile, !Define_SMW_MortonsCastle_YPosOfTile, !Define_SMW_DestroyedMortonsCastle_Map16Tile, Layer1)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_MortonsCastle_XPosOfTile, !Define_SMW_MortonsCastle_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00B0, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00B1, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_StarWarp_SodaLakeToStarRoad3_XPosOfTile, !Define_SMW_StarWarp_SodaLakeToStarRoad3_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0205, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0206, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01EF, DownLeft, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0207, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0208, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0209, UpLeft, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$020A, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$020B, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0206, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$020C, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$020D, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0211, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0214, UpLeft, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0213, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0212, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0217, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0215, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0216, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$020E, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01EF, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0218, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_DoorToVanillaDome_XPosOfTile, !Define_SMW_DoorToVanillaDome_YPosOfTile, !Define_SMW_DoorToVanillaDome_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnMortonsCastle_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnMortonsCastle)

;---------------------------------------------------------------------------

Script_ExitGreenSwitchPalace:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ColorOfPalaceSwitchPressed1, !Const_SMW_MacroID_GreenSwitchPalace, .NoEvent)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_GreenSwitchPalace_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_GreenSwitchPalace_NormalExitEventID)
	%DoSwitchPalaceEvent(!Define_SMW_GreenSwitchPalace_XPosOfTile, !Define_SMW_GreenSwitchPalace_YPosOfTile, !Define_SMW_FlattenedGreenSwitch_Map16Tile, Layer1)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnGreenSwitchPalace_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnGreenSwitchPalace)

;---------------------------------------------------------------------------

Script_ExitDonutPlains2:
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NormalExitEvent)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_SecretExit1, .NoEvent)
.SecretExit1Event:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutPlains2_SecretExit1EventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_DonutPlains2_SecretExit1EventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutPlains2_XPosOfTile-$01, !Define_SMW_DonutPlains2_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00B2, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00B3, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00B4, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_GreenSwitchPalace_XPosOfTile, !Define_SMW_GreenSwitchPalace_YPosOfTile, !Define_SMW_GreenSwitchPalace_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutPlains2_SecretExit1Entry)

.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutPlains2_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_DonutPlains2_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutPlains2_XPosOfTile, !Define_SMW_DonutPlains2_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0007, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00B5, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00B6, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutPlains2_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutPlains2)

;---------------------------------------------------------------------------

Script_ExitDonutSecret1:
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NormalExitEvent)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_SecretExit1, .NoEvent)
.SecretExit1Event:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutSecret1_SecretExit1EventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_DonutSecret1_SecretExit1EventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutSecret1_XPosOfTile+$01, !Define_SMW_DonutSecret1_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0075, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$007B, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0072, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00BC, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutSecret1_SecretExit1Entry)

.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutSecret1_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_DonutSecret1_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutSecret1_XPosOfTile, !Define_SMW_DonutSecret1_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0073, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$007A, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0073, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00B7, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00B8, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutSecret1_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutSecret1)

;---------------------------------------------------------------------------

Script_ExitVanillaFortress:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaFortress_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_VanillaFortress_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%DestroyFortressOrSwitchPalace(!Define_SMW_VanillaFortress_XPosOfTile, !Define_SMW_VanillaFortress_YPosOfTile, !Define_SMW_DestroyedVanillaFortress_Map16Tile, Layer1)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaFortress_XPosOfTile+$02, !Define_SMW_VanillaFortress_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0081, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaFortress_XPosOfTile+$08, !Define_SMW_VanillaFortress_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0080, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaFortress_XPosOfTile+$03, !Define_SMW_VanillaFortress_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0083, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaFortress_XPosOfTile+$07, !Define_SMW_VanillaFortress_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0082, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaFortress_XPosOfTile+$03, !Define_SMW_VanillaFortress_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$007F, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaFortress_XPosOfTile+$07, !Define_SMW_VanillaFortress_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$007F, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaFortress_XPosOfTile+$04, !Define_SMW_VanillaFortress_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0083, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaFortress_XPosOfTile+$06, !Define_SMW_VanillaFortress_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0082, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaFortress_XPosOfTile+$04, !Define_SMW_VanillaFortress_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$007F, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaFortress_XPosOfTile+$06, !Define_SMW_VanillaFortress_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$007F, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaFortress_XPosOfTile+$05, !Define_SMW_VanillaFortress_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0083, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$007F, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_ButterBridge1_XPosOfTile, !Define_SMW_ButterBridge1_YPosOfTile, !Define_SMW_ButterBridge1_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaFortress_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaFortress)

;---------------------------------------------------------------------------

Script_ExitButterBridge1:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ButterBridge1_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ButterBridge1_NormalExitEventID)
	%MakeLevelTileAppear(!Define_SMW_ButterBridge2_XPosOfTile, !Define_SMW_ButterBridge2_YPosOfTile, !Define_SMW_ButterBridge2_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnButterBridge1_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnButterBridge1)

;---------------------------------------------------------------------------

Script_ExitButterBridge2:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ButterBridge2_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ButterBridge2_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ButterBridge2_XPosOfTile+$03, !Define_SMW_ButterBridge2_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0086, Left, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnButterBridge2_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnButterBridge2)

;---------------------------------------------------------------------------

Script_ExitLudwigsCastle:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_LudwigsCastle_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_LudwigsCastle_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%DestroyCastle(!Define_SMW_LudwigsCastle_XPosOfTile, !Define_SMW_LudwigsCastle_YPosOfTile, !Define_SMW_DestroyedLudwigsCastle_Map16Tile, Layer1)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_LudwigsCastle_XPosOfTile+$02, !Define_SMW_LudwigsCastle_YPosOfTile-$03, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00A6, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00A7, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00A9, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00A8, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_LudwigsCastle_XPosOfTile+$01, !Define_SMW_LudwigsCastle_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$008A, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$008B, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$008C, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$008F, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$009D, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0088, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$009D, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0088, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$009D, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0088, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0089, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$008E, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0005, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$009E, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00A2, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLudwigsCastle_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLudwigsCastle)

;---------------------------------------------------------------------------

Script_ExitCheeseBridgeArea:
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NormalExitEvent)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_SecretExit1, .NoEvent)
.SecretExit1Event:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_CheeseBridgeArea_SecretExit1EventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_CheeseBridgeArea_SecretExit1EventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_CheeseBridgeArea_XPosOfTile, !Define_SMW_CheeseBridgeArea_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00CC, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00CD, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_SodaLake_XPosOfTile, !Define_SMW_SodaLake_YPosOfTile, !Define_SMW_SodaLake_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnCheeseBridgeArea_SecretExit1Entry)

.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_CheeseBridgeArea_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_CheeseBridgeArea_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_CheeseBridgeArea_XPosOfTile+$02, !Define_SMW_CheeseBridgeArea_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0155, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0100, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_CookieMountain_XPosOfTile, !Define_SMW_CookieMountain_YPosOfTile, !Define_SMW_CookieMountain_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnCheeseBridgeArea_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnCheeseBridgeArea)

;---------------------------------------------------------------------------

Script_ExitCookieMountain:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_CookieMountain_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_CookieMountain_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_CookieMountain_XPosOfTile, !Define_SMW_CookieMountain_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0110, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00CE, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00CF, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00D0, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00D1, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00D2, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00D3, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0158, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$009C, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0088, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00D4, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnCookieMountain_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnCookieMountain)

;---------------------------------------------------------------------------

Script_ExitSodaLake:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_SodaLake_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_SodaLake_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%MakeLevelTileAppear(!Define_SMW_StarWarp_SodaLakeToStarRoad3_XPosOfTile, !Define_SMW_StarWarp_SodaLakeToStarRoad3_YPosOfTile, !Define_SMW_StarWarp_SodaLakeToStarRoad3_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnSodaLake_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnSodaLake)

;---------------------------------------------------------------------------

Script_ExitLevel012:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLevel012)

;---------------------------------------------------------------------------

Script_ExitDonutSecretHouse:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_CurrentlyActiveBossEndCutscene, $00, .SecretExit1Event)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutSecretHouse_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_DonutSecretHouse_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutSecretHouse_XPosOfTile+$01, !Define_SMW_DonutSecretHouse_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00BD, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00BE, UpRight, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00BF, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00C0, NoMove, LastTile)
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutSecretHouse_NormalExitEntry)

.SecretExit1Event:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutSecretHouse_SecretExit1EventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_DonutSecretHouse_SecretExit1EventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutSecretHouse_XPosOfTile, !Define_SMW_DonutSecretHouse_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00C1, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00C2, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_StarWarp_DonutSecretHouseToStarRoad1_XPosOfTile, !Define_SMW_StarWarp_DonutSecretHouseToStarRoad1_YPosOfTile, !Define_SMW_StarWarp_DonutSecretHouseToStarRoad1_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutSecretHouse_SecretExit1Entry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutSecretHouse)

;---------------------------------------------------------------------------

Script_ExitYellowSwitchPalace:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ColorOfPalaceSwitchPressed1, !Const_SMW_MacroID_YellowSwitchPalace, .NoEvent)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_YellowSwitchPalace_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_YellowSwitchPalace_NormalExitEventID)
	%DoSwitchPalaceEvent(!Define_SMW_YellowSwitchPalace_XPosOfTile, !Define_SMW_YellowSwitchPalace_YPosOfTile, !Define_SMW_FlattenedYellowSwitch_Map16Tile, Layer1)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYellowSwitchPalace_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYellowSwitchPalace)

;---------------------------------------------------------------------------

Script_ExitDonutPlains1:
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NormalExitEvent)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_SecretExit1, .NoEvent)
.SecretExit1Event:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutPlains1_SecretExit1EventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_DonutPlains1_SecretExit1EventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutPlains1_XPosOfTile, !Define_SMW_DonutPlains1_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0072, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0073, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$007A, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_DonutSecret1_XPosOfTile, !Define_SMW_DonutSecret1_YPosOfTile, !Define_SMW_DonutSecret1_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutPlains1_SecretExit1Entry)

.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutPlains1_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_DonutPlains1_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutPlains1_XPosOfTile-$01, !Define_SMW_DonutPlains1_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0019, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0071, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0011, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0010, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_DonutPlains2_XPosOfTile, !Define_SMW_DonutPlains2_YPosOfTile, !Define_SMW_DonutPlains2_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutPlains1_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutPlains1)

;---------------------------------------------------------------------------

Script_ExitLevel016:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLevel016)

;---------------------------------------------------------------------------

Script_ExitLevel017:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLevel017)

;---------------------------------------------------------------------------

Script_ExitSunkenGhostShip:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_SunkenGhostShip_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_SunkenGhostShip_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetCameraFocusPoint($0060, $00DC)
if !SA1ROM == !TRUE
	%ScriptCommand_MakeScreenShake($01A0)
else
	%ScriptCommand_MakeScreenShake($0140)
endif
	%ScriptCommand_JSRToScript(Script_InitializeEarthquakeEvent)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_SunkenGhostShip_XPosOfTile, !Define_SMW_SunkenGhostShip_YPosOfTile-$02, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$019B, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$019F, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$019B, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01A0, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01A1, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01A2, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$019B, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$019E, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$019D, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$019C, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01A3, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01A4, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01A5, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01A8, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01A7, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01A6, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01A9, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01AA, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01AB, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01AE, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01AD, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01AC, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01AF, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01B0, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01B1, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01B4, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01B3, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01B2, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01B5, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01B6, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01B7, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01BA, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01B9, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01B8, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01BB, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01BE, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01C1, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01C2, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01C3, DownLeft, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01BF, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01C0, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01BD, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01BC, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01C7, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01C4, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01C5, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01C6, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01C9, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01C8, Right, LastTile)
	%ScriptCommand_JSRToScript(.DrawFinalBowserRock)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01C1, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01C2, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01C3, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01C0, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01BF, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01BE, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01C7, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01C8, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01C9, NoMove, LastTile)
	%ScriptCommand_JSRToScript(.DrawFinalBowserRock)
	%ScriptCommand_JSRToScript(Script_EndOfEarthquakeEvent)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnSunkenGhostShip_NormalExitEntry)

.DrawFinalBowserRock:
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01CC, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01CB, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01CA, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01CD, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01CE, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01CF, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01BA, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01B9, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01B8, NoMove, LastTile)
	%ScriptCommand_RTSToScript()

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnSunkenGhostShip)

;---------------------------------------------------------------------------

Script_ExitLevel019:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLevel019)

;---------------------------------------------------------------------------

Script_ExitWendysCastle:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_WendysCastle_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_WendysCastle_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%DestroyCastle(!Define_SMW_WendysCastle_XPosOfTile, !Define_SMW_WendysCastle_YPosOfTile, !Define_SMW_DestroyedWendysCastle_Map16Tile, Layer1)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_WendysCastle_XPosOfTile, !Define_SMW_WendysCastle_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$013D, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00DA, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00DB, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_WendysCastle_XPosOfTile+$02, !Define_SMW_WendysCastle_YPosOfTile-$04, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00DC, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_WendysCastle_XPosOfTile, !Define_SMW_WendysCastle_YPosOfTile-$02, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0073, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00DD, UpRight, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00DE, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00DF, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_SunkenGhostShip_XPosOfTile, !Define_SMW_SunkenGhostShip_YPosOfTile, !Define_SMW_SunkenGhostShip_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnWendysCastle_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnWendysCastle)

;---------------------------------------------------------------------------

Script_ExitChocolateFortress:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateFortress_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ChocolateFortress_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%DestroyFortressOrSwitchPalace(!Define_SMW_ChocolateFortress_XPosOfTile, !Define_SMW_ChocolateFortress_YPosOfTile, !Define_SMW_DestroyedChocolateFortress_Map16Tile, Layer1)	
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ChocolateFortress_XPosOfTile, !Define_SMW_ChocolateFortress_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_ChocolateIsland4_XPosOfTile, !Define_SMW_ChocolateIsland4_YPosOfTile, !Define_SMW_ChocolateIsland4_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateFortress_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateFortress)

;---------------------------------------------------------------------------

Script_ExitChocolateIsland5:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateIsland5_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ChocolateIsland5_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ChocolateIsland5_XPosOfTile, !Define_SMW_ChocolateIsland5_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland5_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland5)

;---------------------------------------------------------------------------

Script_ExitChocolateIsland4:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateIsland4_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ChocolateIsland4_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ChocolateIsland4_XPosOfTile-$01, !Define_SMW_ChocolateIsland4_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_ChocolateIsland5_XPosOfTile, !Define_SMW_ChocolateIsland5_YPosOfTile, !Define_SMW_ChocolateIsland5_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland4_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland4)

;---------------------------------------------------------------------------

Script_ExitLevel01E:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLevel01E)

;---------------------------------------------------------------------------

Script_ExitForestFortress:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestFortress_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ForestFortress_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%DestroyFortressOrSwitchPalace(!Define_SMW_ForestFortress_XPosOfTile, !Define_SMW_ForestFortress_YPosOfTile, !Define_SMW_DestroyedForestFortress_Map16Tile, Layer1)	
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestFortress_XPosOfTile-$01, !Define_SMW_ForestFortress_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$243, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0244, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_StarWarp_ForestFortressToStarRoad4_XPosOfTile, !Define_SMW_StarWarp_ForestFortressToStarRoad4_YPosOfTile, !Define_SMW_StarWarp_ForestFortressToStarRoad4_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestFortress_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestFortress)

;---------------------------------------------------------------------------

Script_ExitRoysCastle:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_RoysCastle_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_RoysCastle_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%DestroyCastle(!Define_SMW_RoysCastle_XPosOfTile, !Define_SMW_RoysCastle_YPosOfTile, !Define_SMW_DestroyedRoysCastle_Map16Tile, Layer1)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_RoysCastle_XPosOfTile, !Define_SMW_RoysCastle_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00C1, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00D5, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00C8, DownLeft, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01D0, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01D0, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01D0, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01D3, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01D2, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01D1, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01D4, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01D5, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01D6, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01D9, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01D8, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01D7, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01DA, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01DB, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01DC, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01DF, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01DE, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01DD, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01E3, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01E4, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01E5, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01E2, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01E1, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01E0, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01D0, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01D0, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01D0, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01E8, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01E7, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01E6, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01E9, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01DB, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01EA, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01EE, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01ED, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01EC, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01EB, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01EB, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01EB, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01EB, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01EB, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01EB, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01EF, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01EF, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01EF, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01E2, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00C9, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01F0, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01F1, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01EA, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01EE, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01ED, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01F4, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01F8, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01F9, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01FA, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01E5, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01F7, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01F6, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01F5, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$001F, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01DC, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01D9, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01F3, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01F2, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01FB, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00C9, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01FC, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01DC, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01F1, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01FD, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01FE, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01DF, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0203, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0202, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0201, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01F6, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01F7, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0200, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01FF, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$001F, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01F5, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01F2, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01F3, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01D9, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01FC, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00C9, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01FB, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01F1, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01FF, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0204, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01FE, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$01FD, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_ChocolateIsland1_XPosOfTile, !Define_SMW_ChocolateIsland1_YPosOfTile, !Define_SMW_ChocolateIsland1_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnRoysCastle_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnRoysCastle)

;---------------------------------------------------------------------------

Script_ExitChocoGhostHouse:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocoGhostHouse_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ChocoGhostHouse_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ChocoGhostHouse_XPosOfTile, !Define_SMW_ChocoGhostHouse_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0164, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0166, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0168, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$016C, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$016D, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0163, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0164, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_ChocolateIsland2_XPosOfTile, !Define_SMW_ChocolateIsland2_YPosOfTile, !Define_SMW_ChocolateIsland2_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocoGhostHouse_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocoGhostHouse)

;---------------------------------------------------------------------------

Script_ExitChocolateIsland1:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateIsland1_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ChocolateIsland1_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ChocolateIsland1_XPosOfTile-$01, !Define_SMW_ChocolateIsland1_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00D6, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00CA, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015E, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0156, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland1_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland1)

;---------------------------------------------------------------------------

Script_ExitChocolateIsland3:
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NormalExitEvent)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_SecretExit1, .NoEvent)
.SecretExit1Event:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateIsland3_SecretExit1EventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ChocolateIsland3_SecretExit1EventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ChocolateIsland3_XPosOfTile-$01, !Define_SMW_ChocolateIsland3_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0163, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland3_SecretExit1Entry)

.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateIsland3_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ChocolateIsland3_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ChocolateIsland3_XPosOfTile, !Define_SMW_ChocolateIsland3_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0175, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0176, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0162, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0177, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0166, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0161, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0178, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$016A, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$016C, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0165, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland3_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland3)

;---------------------------------------------------------------------------

Script_ExitChocolateIsland2:
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NormalExitEvent)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_SecretExit1, .NoEvent)
.SecretExit1Event:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateIsland2_SecretExit1EventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ChocolateIsland2_SecretExit1EventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ChocolateIsland2_XPosOfTile, !Define_SMW_ChocolateIsland2_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0166, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0170, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$016F, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$016E, UpRight, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$016C, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0171, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0172, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0173, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0173, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0174, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0168, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ChocolateIsland2_XPosOfTile-$01, !Define_SMW_ChocolateIsland2_YPosOfTile-$02, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0166, UpLeft, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0169, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland2_SecretExit1Entry)

.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateIsland2_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ChocolateIsland2_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ChocolateIsland2_XPosOfTile-$01, !Define_SMW_ChocolateIsland2_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0165, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_ChocolateIsland3_XPosOfTile, !Define_SMW_ChocolateIsland3_YPosOfTile, !Define_SMW_ChocolateIsland3_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland2_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland2)

;---------------------------------------------------------------------------

Script_ExitIggysCastle:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_IggysCastle_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_IggysCastle_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%DestroyCastle(!Define_SMW_IggysCastle_XPosOfTile, !Define_SMW_IggysCastle_YPosOfTile, !Define_SMW_DestroyedIggysCastle_Map16Tile, Layer1)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_IggysCastle_XPosOfTile, !Define_SMW_IggysCastle_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0062, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Up, LastTile)
	%ScriptCommand_SpawnSprite(OWSpr0B_LevelAppearSparkle, $00A0, $0020, $0000, $0000)
	%ScriptCommand_WaitXFrames($08)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_IggysCastle_XPosOfTile, !Define_SMW_IggysCastle_YPosOfTile-$02, Layer1)
	%ScriptCommand_BeginBufferingSilentEventTile(!Define_SMW_BridgeToDonutPlains_Map16Tile, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_BridgeToDonutPlains_Map16Tile, Up, NotLastTile)
	%ScriptCommand_BufferNextSilentEventTile(!Define_SMW_BridgeToDonutPlains_Map16Tile, NoMove, LastTile)
	%ScriptCommand_WaitXFrames($18)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnIggysCastle_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnIggysCastle)

;---------------------------------------------------------------------------

Script_ExitYoshisIsland4:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_YoshisIsland4_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_YoshisIsland4_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_YoshisIsland4_XPosOfTile, !Define_SMW_YoshisIsland4_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$000C, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$000A, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$005D, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$005E, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYoshisIsland4_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYoshisIsland4)

;---------------------------------------------------------------------------

Script_ExitYoshisIsland3:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_YoshisIsland3_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_YoshisIsland3_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_YoshisIsland3_XPosOfTile+$01, !Define_SMW_YoshisIsland3_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0015, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0013, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$003E, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$000E, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$000D, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$003F, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_YoshisIsland4_XPosOfTile, !Define_SMW_YoshisIsland4_YPosOfTile, !Define_SMW_YoshisIsland4_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYoshisIsland3_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYoshisIsland3)

;---------------------------------------------------------------------------

Script_ExitYoshisHouse:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYoshisHouse)

;---------------------------------------------------------------------------

Script_ExitYoshisIsland1:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_YoshisIsland1_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_YoshisIsland1_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_YoshisIsland1_XPosOfTile, !Define_SMW_YoshisIsland1_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0009, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0007, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0037, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0038, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0039, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$003A, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$000E, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$000D, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_YoshisIsland1_XPosOfTile-$02, !Define_SMW_YoshisIsland1_YPosOfTile-$03, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0051, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0041, UpRight, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, Down, NotLastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0042, UpRight, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0052, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0043, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0046, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0045, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0044, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0047, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0048, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0049, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$004C, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$004B, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$004A, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$004D, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$004E, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$004F, UpLeft, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0056, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0055, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0053, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0054, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_YoshisIsland1_XPosOfTile-$02, !Define_SMW_YoshisIsland1_YPosOfTile-$07, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$003D, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$003B, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_YoshisIsland1_XPosOfTile-$02, !Define_SMW_YoshisIsland1_YPosOfTile-$05, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0057, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0058, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_YoshisIsland1_XPosOfTile-$02, !Define_SMW_YoshisIsland1_YPosOfTile-$08, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$003C, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYoshisIsland1_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYoshisIsland1)

;---------------------------------------------------------------------------

Script_ExitYoshisIsland2:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_YoshisIsland2_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_YoshisIsland2_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_YoshisIsland2_XPosOfTile, !Define_SMW_YoshisIsland2_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0006, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_YoshisIsland3_XPosOfTile, !Define_SMW_YoshisIsland3_YPosOfTile, !Define_SMW_YoshisIsland3_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYoshisIsland2_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYoshisIsland2)

;---------------------------------------------------------------------------

Script_ExitVanillaGhostHouse:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaGhostHouse_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_VanillaGhostHouse_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaGhostHouse_XPosOfTile+$01, !Define_SMW_VanillaGhostHouse_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0003, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0003, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00EB, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00EC, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00EE, UpRight, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00ED, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00EF, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00F0, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_VanillaDome3_XPosOfTile, !Define_SMW_VanillaDome3_YPosOfTile, !Define_SMW_VanillaDome3_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaGhostHouse_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaGhostHouse)

;---------------------------------------------------------------------------

Script_ExitLevel108:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLevel108)

;---------------------------------------------------------------------------

Script_ExitVanillaSecret1:
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NormalExitEvent)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_SecretExit1, .NoEvent)
.SecretExit1Event:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaSecret1_SecretExit1EventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_VanillaSecret1_SecretExit1EventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaSecret1_XPosOfTile-$02, !Define_SMW_VanillaSecret1_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, UpLeft, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00E7, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00E8, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00E9, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_StarWarp_VanillaSecret1ToStarRoad2_XPosOfTile, !Define_SMW_StarWarp_VanillaSecret1ToStarRoad2_YPosOfTile, !Define_SMW_StarWarp_VanillaSecret1ToStarRoad2_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaSecret1_SecretExit1Entry)

.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaSecret1_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_VanillaSecret1_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaSecret1_XPosOfTile, !Define_SMW_VanillaSecret1_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0180, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$017F, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00E6, Up, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaSecret1_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaSecret1)

;---------------------------------------------------------------------------

Script_ExitVanillaDome3:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaDome3_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_VanillaDome3_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaDome3_XPosOfTile, !Define_SMW_VanillaDome3_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0005, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_VanillaDome4_XPosOfTile, !Define_SMW_VanillaDome4_YPosOfTile, !Define_SMW_VanillaDome4_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaDome3_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaDome3)

;---------------------------------------------------------------------------

Script_ExitDonutSecret2:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutSecret2_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_DonutSecret2_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_DonutSecret2_XPosOfTile+$01, !Define_SMW_DonutSecret2_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutSecret2_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutSecret2)

;---------------------------------------------------------------------------

Script_ExitLevel10C:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLevel10C)

;---------------------------------------------------------------------------

Script_ExitFrontDoor:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnFrontDoor)

;---------------------------------------------------------------------------

Script_ExitBackDoor:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnBackDoor)

;---------------------------------------------------------------------------

Script_ExitValleyOfBowser4:
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NormalExitEvent)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_SecretExit1, .NoEvent)
.SecretExit1Event:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyOfBowser4_SecretExit1EventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ValleyOfBowser4_SecretExit1EventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ValleyOfBowser4_XPosOfTile, !Define_SMW_ValleyOfBowser4_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$013E, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0104, Up, LastTile)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld4_SecretExit1EventID, .SkipStep)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$019A, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0198, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0198, Right, LastTile)
	%MakeLevelTileAppear(!Define_SMW_StarWarp_FrontDoorToStarRoad5_XPosOfTile, !Define_SMW_StarWarp_FrontDoorToStarRoad5_XPosOfTile, !Define_SMW_StarWarp_FrontDoorToStarRoad5_Map16Tile, Layer1)
.SkipStep:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyOfBowser4_SecretExit1Entry)

.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyOfBowser4_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ValleyOfBowser4_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ValleyOfBowser4_XPosOfTile+$01, !Define_SMW_ValleyOfBowser4_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0103, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0101, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0103, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0101, Right, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyOfBowser4_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyOfBowser4)

;---------------------------------------------------------------------------

Script_ExitLarrysCastle:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_LarrysCastle_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_LarrysCastle_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%DestroyCastle(!Define_SMW_LarrysCastle_XPosOfTile, !Define_SMW_LarrysCastle_YPosOfTile, !Define_SMW_DestroyedLarrysCastle_Map16Tile, Layer1)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_LarrysCastle_XPosOfTile, !Define_SMW_LarrysCastle_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0106, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0104, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLarrysCastle_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLarrysCastle)

;---------------------------------------------------------------------------

Script_ExitValleyFortress:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyFortress_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ValleyFortress_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%DestroyFortressOrSwitchPalace(!Define_SMW_ValleyFortress_XPosOfTile, !Define_SMW_ValleyFortress_YPosOfTile, !Define_SMW_DestroyedValleyFortress_Map16Tile, Layer1)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ValleyFortress_XPosOfTile, !Define_SMW_ValleyFortress_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0199, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0104, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0199, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyFortress_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyFortress)

;---------------------------------------------------------------------------

Script_ExitLevel112:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLevel112)

;---------------------------------------------------------------------------

Script_ExitValleyOfBowser3:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyOfBowser3_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ValleyOfBowser3_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ValleyOfBowser3_XPosOfTile, !Define_SMW_ValleyOfBowser3_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0106, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0104, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0100, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_ValleyOfBowser4_XPosOfTile, !Define_SMW_ValleyOfBowser4_YPosOfTile, !Define_SMW_ValleyOfBowser4_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyOfBowser3_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyOfBowser3)

;---------------------------------------------------------------------------

Script_ExitValleyGhostHouse:
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NormalExitEvent)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_SecretExit1, .NoEvent)
.SecretExit1Event:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyGhostHouse_SecretExit1EventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ValleyGhostHouse_SecretExit1EventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ValleyGhostHouse_XPosOfTile, !Define_SMW_ValleyGhostHouse_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0122, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyGhostHouse_SecretExit1Entry)

.NormalExitEvent:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyGhostHouse_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ValleyGhostHouse_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ValleyGhostHouse_XPosOfTile-$01, !Define_SMW_ValleyGhostHouse_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0102, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0101, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0102, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0101, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0100, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_ValleyOfBowser3_XPosOfTile, !Define_SMW_ValleyOfBowser3_YPosOfTile, !Define_SMW_ValleyOfBowser3_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyGhostHouse_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyGhostHouse)

;---------------------------------------------------------------------------

Script_ExitValleyOfBowser2:
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NormalExitEvent)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_SecretExit1, .NoEvent)
.SecretExit1Event:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyOfBowser2_SecretExit1EventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ValleyOfBowser2_SecretExit1EventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ValleyOfBowser2_XPosOfTile, !Define_SMW_ValleyOfBowser2_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0122, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyOfBowser2_SecretExit1Entry)

.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyOfBowser2_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ValleyOfBowser2_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ValleyOfBowser2_XPosOfTile-$01, !Define_SMW_ValleyOfBowser2_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0102, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0101, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyOfBowser2_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyOfBowser2)

;---------------------------------------------------------------------------

Script_ExitValleyOfBowser1:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyOfBowser1_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ValleyOfBowser1_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ValleyOfBowser1_XPosOfTile-$01, !Define_SMW_ValleyOfBowser1_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0102, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0101, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0100, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_ValleyOfBowser2_XPosOfTile, !Define_SMW_ValleyOfBowser2_YPosOfTile, !Define_SMW_ValleyOfBowser2_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyOfBowser1_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyOfBowser1)

;---------------------------------------------------------------------------

Script_ExitChocolateSecret:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateSecret_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ChocolateSecret_NormalExitEventID)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateSecret_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateSecret)

;---------------------------------------------------------------------------

Script_ExitVanillaDome2:
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NormalExitEvent)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_SecretExit1, .NoEvent)
.SecretExit1Event:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaDome2_SecretExit1EventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_VanillaDome2_SecretExit1EventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaDome2_XPosOfTile+$01, !Define_SMW_VanillaDome2_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00F3, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00F4, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00F5, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_RedSwitchPalace_XPosOfTile, !Define_SMW_RedSwitchPalace_YPosOfTile, !Define_SMW_RedSwitchPalace_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaDome2_SecretExit1Entry)

.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaDome2_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_VanillaDome2_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaDome2_XPosOfTile, !Define_SMW_VanillaDome2_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$017F, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$017F, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00C8, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaDome2_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaDome2)

;---------------------------------------------------------------------------

Script_ExitVanillaDome4:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaDome4_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_VanillaDome4_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaDome4_XPosOfTile, !Define_SMW_VanillaDome4_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00BC, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaDome4_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaDome4)

;---------------------------------------------------------------------------

Script_ExitVanillaDome1:
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NormalExitEvent)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_SecretExit1, .NoEvent)
.SecretExit1Event:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaDome1_SecretExit1EventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_VanillaDome1_SecretExit1EventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaDome1_XPosOfTile-$03, !Define_SMW_VanillaDome1_YPosOfTile-$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0179, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$017B, UpRight, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$017A, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0173, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$015F, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0119, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$017C, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$017D, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$017E, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$017F, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$017F, Up, LastTile)
	%MakeLevelTileAppear(!Define_SMW_VanillaSecret1_XPosOfTile, !Define_SMW_VanillaSecret1_YPosOfTile, !Define_SMW_VanillaSecret1_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaDome1_SecretExit1Entry)

.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaDome1_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_VanillaDome1_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_VanillaDome1_XPosOfTile+$01, !Define_SMW_VanillaDome1_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0156, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00E0, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00E1, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00E2, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00E3, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00EA, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_VanillaDome2_XPosOfTile, !Define_SMW_VanillaDome2_YPosOfTile, !Define_SMW_VanillaDome2_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaDome1_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaDome1)

;---------------------------------------------------------------------------

Script_ExitRedSwitchPalace:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ColorOfPalaceSwitchPressed1, !Const_SMW_MacroID_RedSwitchPalace, .NoEvent)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_RedSwitchPalace_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_RedSwitchPalace_NormalExitEventID)
	%DoSwitchPalaceEvent(!Define_SMW_RedSwitchPalace_XPosOfTile, !Define_SMW_RedSwitchPalace_YPosOfTile, !Define_SMW_FlattenedRedSwitch_Map16Tile, Layer1)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnRedSwitchPalace_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnRedSwitchPalace)

;---------------------------------------------------------------------------

Script_ExitLemmysCastle:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_LemmysCastle_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_LemmysCastle_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%DestroyCastle(!Define_SMW_LemmysCastle_XPosOfTile, !Define_SMW_LemmysCastle_YPosOfTile, !Define_SMW_DestroyedLemmysCastle_Map16Tile, Layer1)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_LemmysCastle_XPosOfTile, !Define_SMW_LemmysCastle_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00F1, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00F2, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0014, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0013, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0060, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLemmysCastle_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLemmysCastle)

;---------------------------------------------------------------------------

Script_ExitForestGhostHouse:
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NormalExitEvent)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_SecretExit1, .NoEvent)
.SecretExit1Event:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestGhostHouse_SecretExit1EventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ForestGhostHouse_SecretExit1EventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_SlowPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestGhostHouse_XPosOfTile-$02, !Define_SMW_ForestGhostHouse_YPosOfTile+$03, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestGhostHouse_XPosOfTile-$01, !Define_SMW_ForestGhostHouse_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0060, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$001C, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0195, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$006A, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0007, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_ForestOfIllusion4_XPosOfTile, !Define_SMW_ForestOfIllusion4_YPosOfTile, !Define_SMW_ForestOfIllusion4_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestGhostHouse_SecretExit1Entry)

.NormalExitEvent:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestGhostHouse_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ForestGhostHouse_NormalExitEventID)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion1_SecretExit1EventID, .SkipStep)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_SlowPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestGhostHouse_XPosOfTile+$01, !Define_SMW_ForestGhostHouse_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0061, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, NoMove, LastTile)
.SkipStep:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestGhostHouse_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestGhostHouse)

;---------------------------------------------------------------------------

Script_ExitForestOfIllusion1:
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NormalExitEvent)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_SecretExit1, .NoEvent)
.SecretExit1Event:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion1_SecretExit1EventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ForestOfIllusion1_SecretExit1EventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_SlowPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestOfIllusion1_XPosOfTile-$02, !Define_SMW_ForestOfIllusion1_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0060, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion3_NormalExitEventID, .SkipStep2)
	%ScriptCommand_SpawnSprite(OWSpr0A_Boo, (!Define_SMW_ForestGhostHouse_XPosOfTile-$01)<<4, !Define_SMW_ForestGhostHouse_YPosOfTile<<4, $0000, $0000)
	%MakeLevelTileAppear(!Define_SMW_ForestGhostHouse_XPosOfTile, !Define_SMW_ForestGhostHouse_YPosOfTile, !Define_SMW_ForestGhostHouse_Map16Tile, Layer1)
.SkipStep2:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion1_SecretExit1Entry)

.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion1_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ForestOfIllusion1_NormalExitEventID)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestGhostHouse_NormalExitEventID, .SkipStep1)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_SlowPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestOfIllusion1_XPosOfTile+$01, !Define_SMW_ForestOfIllusion1_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0065, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestOfIllusion1_XPosOfTile+$01, !Define_SMW_ForestOfIllusion1_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0061, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0016, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$005F, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0069, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$000A, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Down, LastTile)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion4_NormalExitEventID, .SkipStep1)
	%MakeLevelTileAppear(!Define_SMW_ForestOfIllusion2_XPosOfTile, !Define_SMW_ForestOfIllusion2_YPosOfTile, !Define_SMW_ForestOfIllusion2_Map16Tile, Layer1)
.SkipStep1:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion1_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion1)

;---------------------------------------------------------------------------

Script_ExitForestOfIllusion4:
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NormalExitEvent)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_SecretExit1, .NoEvent)
.SecretExit1Event:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion4_SecretExit1EventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ForestOfIllusion4_SecretExit1EventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_SlowPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestOfIllusion4_XPosOfTile, !Define_SMW_ForestOfIllusion4_YPosOfTile+$02, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0062, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, Down, LastTile)
	%MakeLevelTileAppear(!Define_SMW_ForestSecretArea_XPosOfTile, !Define_SMW_ForestSecretArea_YPosOfTile, !Define_SMW_ForestSecretArea_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion4_SecretExit1Entry)

.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion4_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ForestOfIllusion4_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_SlowPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestOfIllusion4_XPosOfTile+$03, !Define_SMW_ForestOfIllusion4_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0194, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00B4, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestOfIllusion4_XPosOfTile+$01, !Define_SMW_ForestOfIllusion4_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, LastTile)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion1_NormalExitEventID, .SkipStep)
	%MakeLevelTileAppear(!Define_SMW_ForestOfIllusion2_XPosOfTile, !Define_SMW_ForestOfIllusion2_YPosOfTile, !Define_SMW_ForestOfIllusion2_Map16Tile, Layer1)
.SkipStep:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion4_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion4)

;---------------------------------------------------------------------------

Script_ExitForestOfIllusion2:
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NormalExitEvent)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_SecretExit1, .NoEvent)
.SecretExit1Event:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion2_SecretExit1EventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ForestOfIllusion2_SecretExit1EventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_SlowPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestOfIllusion2_XPosOfTile+$01, !Define_SMW_ForestOfIllusion2_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0061, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0061, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_BlueSwitchPalace_XPosOfTile, !Define_SMW_BlueSwitchPalace_YPosOfTile, !Define_SMW_BlueSwitchPalace_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion2_SecretExit1Entry)

.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion2_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ForestOfIllusion2_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_SlowPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestOfIllusion2_XPosOfTile, !Define_SMW_ForestOfIllusion2_YPosOfTile+$02, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$018E, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestOfIllusion2_XPosOfTile, !Define_SMW_ForestOfIllusion2_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0062, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$000D, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$018F, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0190, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0013, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_ForestOfIllusion3_XPosOfTile, !Define_SMW_ForestOfIllusion3_YPosOfTile, !Define_SMW_ForestOfIllusion3_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion2_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion2)

;---------------------------------------------------------------------------

Script_ExitBlueSwitchPalace:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ColorOfPalaceSwitchPressed1, !Const_SMW_MacroID_BlueSwitchPalace, .NoEvent)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_BlueSwitchPalace_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_BlueSwitchPalace_NormalExitEventID)
	%DoSwitchPalaceEvent(!Define_SMW_BlueSwitchPalace_XPosOfTile, !Define_SMW_BlueSwitchPalace_YPosOfTile, !Define_SMW_FlattenedBlueSwitch_Map16Tile, Layer1)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnBlueSwitchPalace_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnBlueSwitchPalace)

;---------------------------------------------------------------------------

Script_ExitForestSecretArea:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestSecretArea_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ForestSecretArea_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_SlowPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestSecretArea_XPosOfTile, !Define_SMW_ForestSecretArea_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00B4, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0068, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0196, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00B4, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0194, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestSecretArea_XPosOfTile, !Define_SMW_ForestSecretArea_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0062, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$000D, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0197, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0013, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Left, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestSecretArea_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestSecretArea)

;---------------------------------------------------------------------------

Script_ExitForestOfIllusion3:
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NormalExitEvent)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_SecretExit1, .NoEvent)
.SecretExit1Event:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion3_SecretExit1EventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ForestOfIllusion3_SecretExit1EventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_SlowPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestOfIllusion3_XPosOfTile, !Define_SMW_ForestOfIllusion3_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0191, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0065, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestOfIllusion3_XPosOfTile, !Define_SMW_ForestOfIllusion3_YPosOfTile+$01, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0062, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0062, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0062, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0062, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion3_SecretExit1Entry)

.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion3_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_ForestOfIllusion3_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_SlowPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestOfIllusion3_XPosOfTile-$01, !Define_SMW_ForestOfIllusion3_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0192, UpRight, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0067, Left, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, NoMove, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestOfIllusion3_XPosOfTile-$02, !Define_SMW_ForestOfIllusion3_YPosOfTile-$03, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0040, Up, LastTile)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_ForestOfIllusion3_XPosOfTile-$01, !Define_SMW_ForestOfIllusion3_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0060, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0019, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0193, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$006C, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0010, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion1_SecretExit1EventID, .SkipStep)
	%ScriptCommand_SpawnSprite(OWSpr0A_Boo, (!Define_SMW_ForestGhostHouse_XPosOfTile-$01)<<4, !Define_SMW_ForestGhostHouse_YPosOfTile<<4, $0000, $0000)
	%MakeLevelTileAppear(!Define_SMW_ForestGhostHouse_XPosOfTile, !Define_SMW_ForestGhostHouse_YPosOfTile, !Define_SMW_ForestGhostHouse_Map16Tile, Layer1)
.SkipStep:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion3_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion3)

;---------------------------------------------------------------------------

Script_ExitLevel124:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLevel124)

;---------------------------------------------------------------------------

Script_ExitFunky:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_Funky_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_Funky_NormalExitEventID)
	%ScriptCommand_8BitORAByte(!RAM_SMW_Global_SavedGameStateFlags, !Const_SMW_SavedGameStateFlags_AltSP1GFX|!Const_SMW_SavedGameStateFlags_AltKoopaColors|!Const_SMW_SavedGameStateFlags_AltOWPalettes)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_Funky_XPosOfTile-$01, !Define_SMW_Funky_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_StarWarp_FunkyToYoshisHouse_XPosOfTile, !Define_SMW_StarWarp_FunkyToYoshisHouse_YPosOfTile, !Define_SMW_StarWarp_FunkyToYoshisHouse_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnFunky_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnFunky)

;---------------------------------------------------------------------------

Script_ExitOutrageous:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_Outrageous_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_Outrageous_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_Outrageous_XPosOfTile-$01, !Define_SMW_Outrageous_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_Funky_XPosOfTile, !Define_SMW_Funky_YPosOfTile, !Define_SMW_Funky_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnOutrageous_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnOutrageous)

;---------------------------------------------------------------------------

Script_ExitMondo:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_Mondo_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_Mondo_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_Mondo_XPosOfTile-$01, !Define_SMW_Outrageous_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_Outrageous_XPosOfTile, !Define_SMW_Outrageous_YPosOfTile, !Define_SMW_Outrageous_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnMondo_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnMondo)

;---------------------------------------------------------------------------

Script_ExitGroovy:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_Groovy_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_Groovy_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_Groovy_XPosOfTile-$01, !Define_SMW_Groovy_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_Mondo_XPosOfTile, !Define_SMW_Mondo_YPosOfTile, !Define_SMW_Mondo_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnGroovy_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnGroovy)

;---------------------------------------------------------------------------

Script_ExitLevel129:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLevel129)

;---------------------------------------------------------------------------

Script_ExitGnarly:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_Gnarly_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_Gnarly_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_Gnarly_XPosOfTile+$01, !Define_SMW_Gnarly_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_Tubular_XPosOfTile, !Define_SMW_Tubular_YPosOfTile, !Define_SMW_Tubular_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnGnarly_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnGnarly)

;---------------------------------------------------------------------------

Script_ExitTubular:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_Tubular_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_Tubular_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_Tubular_XPosOfTile+$01, !Define_SMW_Tubular_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_WayCool_XPosOfTile, !Define_SMW_WayCool_YPosOfTile, !Define_SMW_WayCool_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnTubular_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnTubular)

;---------------------------------------------------------------------------

Script_ExitWayCool:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_WayCool_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_WayCool_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_WayCool_XPosOfTile+$01, !Define_SMW_WayCool_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_Awesome_XPosOfTile, !Define_SMW_Awesome_YPosOfTile, !Define_SMW_Awesome_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnWayCool_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnWayCool)

;---------------------------------------------------------------------------

Script_ExitAwesome:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NoEvent)
.NormalExitEvent:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $01)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_Awesome_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_Awesome_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_Awesome_XPosOfTile+$01, !Define_SMW_Awesome_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00F7, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0004, Up, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00F6, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0000, NoMove, LastTile)
	%MakeLevelTileAppear(!Define_SMW_Groovy_XPosOfTile, !Define_SMW_Groovy_YPosOfTile, !Define_SMW_Groovy_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnAwesome_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnAwesome)

;---------------------------------------------------------------------------

Script_ExitLevel12E:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLevel12E)

;---------------------------------------------------------------------------

Script_ExitLevel12F:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLevel12F)

;---------------------------------------------------------------------------

Script_ExitStarWorld2:
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NormalExitEvent)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_SecretExit1, .NoEvent)
.SecretExit1Event:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld2_SecretExit1EventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_StarWorld2_SecretExit1EventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_StarWorld2_XPosOfTile, !Define_SMW_StarWorld2_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00F9, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00FF, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0182, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0183, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0184, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00FA, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld2_SecretExit1Entry)

.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld2_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_StarWorld2_NormalExitEventID)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld2_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld2)

;---------------------------------------------------------------------------

Script_ExitLevel131:
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_ExitStarWorld3:
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NormalExitEvent)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_SecretExit1, .NoEvent)
.SecretExit1Event:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld3_SecretExit1EventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_StarWorld3_SecretExit1EventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_StarWorld3_XPosOfTile+$01, !Define_SMW_StarWorld2_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0185, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0185, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0001, Right, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld3_SecretExit1Entry)

.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld3_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_StarWorld3_NormalExitEventID)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld3_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld3)

;---------------------------------------------------------------------------

Script_ExitLevel133:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLevel133)

;---------------------------------------------------------------------------

Script_ExitStarWorld1:
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NormalExitEvent)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_SecretExit1, .NoEvent)
.SecretExit1Event:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld1_SecretExit1EventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_StarWorld1_SecretExit1EventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_StarWorld1_XPosOfTile, !Define_SMW_StarWorld1_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00F8, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00FC, Up, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00FD, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00FE, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00FC, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld1_SecretExit1Entry)

.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld1_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_StarWorld1_NormalExitEventID)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld1_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld1)

;---------------------------------------------------------------------------

Script_ExitStarWorld4:
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NormalExitEvent)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_SecretExit1, .NoEvent)
.SecretExit1Event:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld4_SecretExit1EventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_StarWorld4_SecretExit1EventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_StarWorld4_XPosOfTile, !Define_SMW_StarWorld4_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00AE, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00FB, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0186, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0187, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$018D, NoMove, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0188, Right, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0189, Down, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00F8, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld4_SecretExit1Entry)

.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld4_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_StarWorld4_NormalExitEventID)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld4_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld4)

;---------------------------------------------------------------------------

Script_ExitStarWorld5:
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_NormalExit, .NormalExitEvent)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Misc_ExitLevelAction, !Const_SMW_MacroID_SecretExit1, .NoEvent)
.SecretExit1Event:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld5_SecretExit1EventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_StarWorld5_SecretExit1EventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%MakeLevelTileAppear(!Define_SMW_StarWarp_StarRoad5ToGnarly_XPosOfTile, !Define_SMW_StarWarp_StarRoad5ToGnarly_YPosOfTile, !Define_SMW_StarWarp_StarRoad5ToGnarly_Map16Tile, Layer1)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld5_SecretExit1Entry)

.NormalExitEvent:
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld5_NormalExitEventID, .NoEvent)
	%ScriptCommand_SetEvent(!Define_SMW_StarWorld5_NormalExitEventID)
	%ScriptCommand_SetPathRevealSpeedAndSound(!Define_SMW_Overworld_NormalPathRevealDelay, 1DFC, OverworldTileReveal)
	%ScriptCommand_SetEventTileCoords(!Define_SMW_StarWorld5_XPosOfTile, !Define_SMW_StarWorld5_YPosOfTile, Layer2)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00FA, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$018A, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$018B, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0031, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$018A, Down, NotLastTile)
	%ScriptCommand_BufferNextEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$018C, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$0031, Left, LastTile)
	%ScriptCommand_BeginBufferingEventTile(!Define_SMW_Overworld_StartOfEventTileMap16+$00AE, NoMove, LastTile)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld5_NormalExitEntry)

.NoEvent:
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoMoveEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld5)

;---------------------------------------------------------------------------

Script_ExitLevel137:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLevel137)

;---------------------------------------------------------------------------

Script_ExitLevel138:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLevel138)

;---------------------------------------------------------------------------

Script_ExitLevel139:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLevel139)

;---------------------------------------------------------------------------

Script_ExitLevel13A:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLevel13A)

;---------------------------------------------------------------------------

Script_ExitLevel13B:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLevel13B)

;---------------------------------------------------------------------------

;#############################################################################################################
;#############################################################################################################

; Scripts used to determine how the overworld player should interact with tiles they're stationed on.

;---------------------------------------------------------------------------

Script_StandingOnLevel000:
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_StandingOnVanillaSecret2:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterVanillaSecret2)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaSecret1_NormalExitEventID, Script_StandingOnVanillaSecret2_MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaSecret2_NormalExitEventID, Script_StandingOnVanillaSecret2_MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaSecret2)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_PipeWarp_VanillaSecret2ToVanillaSecret1_XPosOfTile<<4), (!Define_SMW_PipeWarp_VanillaSecret2ToVanillaSecret1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnPipeWarp_VanillaSecret2ToVanillaSecret1)

.MoveRight:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_VanillaSecret3_XPosOfTile<<4), (!Define_SMW_VanillaSecret3_YPosOfTile<<4)-$06)
	%ScriptCommand_ChangePlayerAnimation(Swimming)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaSecret3)

;---------------------------------------------------------------------------

Script_StandingOnVanillaSecret3:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterVanillaSecret3)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaSecret2_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaSecret3_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaSecret3)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_VanillaSecret2_XPosOfTile<<4), (!Define_SMW_VanillaSecret2_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaSecret2)

.MoveRight:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_VanillaFortress_XPosOfTile<<4), (!Define_SMW_VanillaFortress_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaFortress)

;---------------------------------------------------------------------------

Script_StandingOnTopSecretArea:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterTopSecretArea)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutGhostHouse_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnTopSecretArea)

.MoveDown:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_DonutGhostHouse_XPosOfTile<<4), (!Define_SMW_DonutGhostHouse_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutGhostHouse)

;---------------------------------------------------------------------------

Script_StandingOnDonutGhostHouse:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterDonutGhostHouse)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutPlains2_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutGhostHouse_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutGhostHouse_SecretExit1EventID, .MoveRight)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutSecret1_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutGhostHouse)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_JSRToScript(PathMacroScript_TopLeftQuarterCircle_EnterLeft)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_DonutPlains2_XPosOfTile<<4), (!Define_SMW_DonutPlains2_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutPlains2)

.MoveUp:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_TopSecretArea_XPosOfTile<<4), (!Define_SMW_TopSecretArea_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnTopSecretArea)

.MoveRight:
.SecretExit1Entry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Right2Tiles, NoYMovement)
	%ScriptCommand_SpawnSprite(OWSpr03_CheepCheep, $0070, $00D0, $0000, $0000)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Right2Tiles, NoYMovement)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_DonutPlains3_XPosOfTile<<4), (!Define_SMW_DonutPlains3_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutPlains3)

.MoveDown:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down2Tiles)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_ClimbingSubpixelSpeed, !Define_SMW_Overworld_ClimbingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Climbing)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down1Tile)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Swimming)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_DonutSecret1_XPosOfTile<<4), (!Define_SMW_DonutSecret1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutSecret1)

;---------------------------------------------------------------------------

Script_StandingOnDonutPlains3:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterDonutPlains3)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutGhostHouse_SecretExit1EventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutPlains3_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutSecret2_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutPlains3)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Left2Tiles, NoYMovement)
	%ScriptCommand_SpawnSprite(OWSpr03_CheepCheep, $0070, $00D0, $0000, $0000)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_DonutGhostHouse_XPosOfTile<<4), (!Define_SMW_DonutGhostHouse_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutGhostHouse)

.MoveRight:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_JSRToScript(PathMacroScript_TopRightQuarterCircle_EnterRight)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_DonutPlains4_XPosOfTile<<4), (!Define_SMW_DonutPlains4_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutPlains4)

.MoveDown:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Down7Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Down7Pixels)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_ClimbingSubpixelSpeed, !Define_SMW_Overworld_ClimbingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Climbing)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Down7Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Down4Pixels)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Swimming)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Down7Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Down7Pixels)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down1Tile)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right4Pixels, Down7Pixels)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_PipeWarp_DonutPlains3ToDonutSecret2_XPosOfTile<<4), (!Define_SMW_PipeWarp_DonutPlains3ToDonutSecret2_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnPipeWarp_DonutPlains3ToDonutSecret2)

;---------------------------------------------------------------------------

Script_StandingOnDonutPlains4:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterDonutPlains4)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutPlains3_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutPlains4_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutPlains4)

.MoveUp:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_JSRToScript(PathMacroScript_TopRightQuarterCircle_EnterBelow)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutPlains3)

.MoveRight:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_MortonsCastle_XPosOfTile<<4), (!Define_SMW_MortonsCastle_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnMortonsCastle)

;---------------------------------------------------------------------------

Script_StandingOnDestroyedTile_MortonsCastle:
Script_StandingOnMortonsCastle:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_MortonsCastle_NormalExitEventID, .NotDestroyed)
if !Define_SMW_Overworld_AllowCastleReEntryWithLR == !TRUE
	%ScriptCommand_8BitCheckIfAllBitsSet(!RAM_SMW_IO_ControllerHold2, !Joypad_L|!Joypad_R, Script_EnterMortonsCastle)
endif
	%ScriptCommand_JumpToScriptAddress(.IsDestroyed)

.NotDestroyed:
	%EnterTileOnFaceButtonPress(Script_EnterMortonsCastle)
.IsDestroyed:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutPlains4_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_MortonsCastle_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnMortonsCastle)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_DonutPlains4_XPosOfTile<<4), (!Define_SMW_DonutPlains4_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutPlains4)

.MoveUp:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up3Tiles)
Script_EnterPathExit_MortonsCastleToVanillaDome1:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $0210)
	%ScriptCommand_JSRToScript(Script_SharedPathExitEntryCode)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_VanillaDome1_XPosOfTile<<4), (!Define_SMW_VanillaDome1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaDome1)

;---------------------------------------------------------------------------

Script_StandingOnDestroyedTile_GreenSwitchPalace:
Script_StandingOnGreenSwitchPalace:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_GreenSwitchPalace_NormalExitEventID, .NotDestroyed)
	%ScriptCommand_JumpToScriptAddress(.IsDestroyed)

.NotDestroyed:
	%EnterTileOnFaceButtonPress(Script_EnterGreenSwitchPalace)
.IsDestroyed:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutPlains2_SecretExit1EventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
.NormalExitEntry:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnGreenSwitchPalace)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_DonutPlains2_XPosOfTile<<4), (!Define_SMW_DonutPlains2_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutPlains2)

;---------------------------------------------------------------------------

Script_StandingOnDonutPlains2:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterDonutPlains2)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutPlains2_SecretExit1EventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutPlains2_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutPlains1_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutPlains2)

.MoveLeft:
.SecretExit1Entry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_GreenSwitchPalace_XPosOfTile<<4), (!Define_SMW_GreenSwitchPalace_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnGreenSwitchPalace)

.MoveUp:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up1Tile)
	%ScriptCommand_JSRToScript(PathMacroScript_TopLeftQuarterCircle_EnterBelow)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_DonutGhostHouse_XPosOfTile<<4), (!Define_SMW_DonutGhostHouse_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutGhostHouse)

.MoveDown:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down2Tiles)
	%ScriptCommand_JSRToScript(PathMacroScript_BottomLeftQuarterCircle_EnterAbove)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_DonutPlains1_XPosOfTile<<4), (!Define_SMW_DonutPlains1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutPlains1)

;---------------------------------------------------------------------------

Script_StandingOnDonutSecret1:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterDonutSecret1)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutSecret1_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutSecret1_SecretExit1EventID, .MoveRight)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutPlains1_SecretExit1EventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutSecret1)

.MoveUp:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up2Tiles)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_ClimbingSubpixelSpeed, !Define_SMW_Overworld_ClimbingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Climbing)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up1Tile)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_DonutGhostHouse_XPosOfTile<<4), (!Define_SMW_DonutGhostHouse_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutGhostHouse)

.MoveRight:
.SecretExit1Entry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Right1Tile, NoYMovement)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right7Pixels, Down2Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right7Pixels, Down4Pixels)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_DonutSecretHouse_XPosOfTile<<4), (!Define_SMW_DonutSecretHouse_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutSecretHouse)

.MoveDown:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down1Tile)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_DonutPlains1_XPosOfTile<<4), (!Define_SMW_DonutPlains1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutPlains1)

;---------------------------------------------------------------------------

Script_StandingOnDestroyedTile_VanillaFortress:
Script_StandingOnVanillaFortress:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_VanillaFortress_NormalExitEventID, .NotDestroyed)
if !Define_SMW_Overworld_AllowCastleReEntryWithLR == !TRUE
	%ScriptCommand_8BitCheckIfAllBitsSet(!RAM_SMW_IO_ControllerHold2, !Joypad_L|!Joypad_R, Script_EnterVanillaFortress)
endif
	%ScriptCommand_JumpToScriptAddress(.IsDestroyed)

.NotDestroyed:
	%EnterTileOnFaceButtonPress(Script_EnterVanillaFortress)
.IsDestroyed:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaSecret3_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaFortress_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaFortress)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Left2Tiles, NoYMovement)
	%ScriptCommand_ChangePlayerAnimation(Swimming)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_VanillaSecret3_XPosOfTile<<4), (!Define_SMW_VanillaSecret3_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaSecret3)

.MoveRight:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ButterBridge1_XPosOfTile<<4), (!Define_SMW_ButterBridge1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnButterBridge1)

;---------------------------------------------------------------------------

Script_StandingOnButterBridge1:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterButterBridge1)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaFortress_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ButterBridge1_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnButterBridge1)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_VanillaFortress_XPosOfTile<<4), (!Define_SMW_VanillaFortress_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaFortress)

.MoveRight:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ButterBridge2_XPosOfTile<<4), (!Define_SMW_ButterBridge2_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnButterBridge2)

;---------------------------------------------------------------------------

Script_StandingOnButterBridge2:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterButterBridge2)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ButterBridge1_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ButterBridge2_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnButterBridge2)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ButterBridge1_XPosOfTile<<4), (!Define_SMW_ButterBridge1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnButterBridge1)

.MoveRight:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_LudwigsCastle_XPosOfTile<<4), (!Define_SMW_LudwigsCastle_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLudwigsCastle)

;---------------------------------------------------------------------------

Script_StandingOnDestroyedTile_LudwigsCastle:
Script_StandingOnLudwigsCastle:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_LudwigsCastle_NormalExitEventID, .NotDestroyed)
if !Define_SMW_Overworld_AllowCastleReEntryWithLR == !TRUE
	%ScriptCommand_8BitCheckIfAllBitsSet(!RAM_SMW_IO_ControllerHold2, !Joypad_L|!Joypad_R, Script_EnterLudwigsCastle)
endif
	%ScriptCommand_JumpToScriptAddress(.IsDestroyed)

.NotDestroyed:
	%EnterTileOnFaceButtonPress(Script_EnterLudwigsCastle)
.IsDestroyed:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ButterBridge2_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_LudwigsCastle_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_CookieMountain_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLudwigsCastle)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ButterBridge2_XPosOfTile<<4), (!Define_SMW_ButterBridge2_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnButterBridge2)

.MoveDown:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down1Tile)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_ClimbingSubpixelSpeed, !Define_SMW_Overworld_ClimbingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Climbing)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down2Tiles)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Down7Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Down7Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Left1Tile, NoYMovement)
	%ScriptCommand_JSRToScript(PathMacroScript_BottomLeftQuarterCircle_EnterLeft)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_CookieMountain_XPosOfTile<<4), (!Define_SMW_CookieMountain_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnCookieMountain)

.MoveRight:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_JSRToScript(PathMacroScript_TopRightQuarterCircle_EnterRight)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_ClimbingSubpixelSpeed, !Define_SMW_Overworld_ClimbingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Climbing)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down3Tiles)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down2Tiles)
Script_EnterPathExit_LudwigsCastleToForestOfIllusion1:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $0212)
	%ScriptCommand_JSRToScript(Script_SharedPathExitEntryCode)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ForestOfIllusion1_XPosOfTile<<4), (!Define_SMW_ForestOfIllusion1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion1)

;---------------------------------------------------------------------------

Script_StandingOnCheeseBridgeArea:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterCheeseBridgeArea)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_LemmysCastle_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_CheeseBridgeArea_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_CheeseBridgeArea_SecretExit1EventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnCheeseBridgeArea)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Left2Tiles, NoYMovement)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_PipeWarp_CheeseBridgeAreaToLemmysCastle_XPosOfTile<<4), (!Define_SMW_PipeWarp_CheeseBridgeAreaToLemmysCastle_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnPipeWarp_CheeseBridgeAreaToLemmysCastle)

.MoveRight:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_SpawnSprite(OWSpr03_CheepCheep, $0150, $0090, $0000, $0000)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_CookieMountain_XPosOfTile<<4), (!Define_SMW_CookieMountain_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnCookieMountain)

.MoveDown:
.SecretExit1Entry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_ClimbingSubpixelSpeed, !Define_SMW_Overworld_ClimbingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Climbing)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down3Tiles)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Swimming)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_SodaLake_XPosOfTile<<4), (!Define_SMW_SodaLake_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnSodaLake)

;---------------------------------------------------------------------------

Script_StandingOnCookieMountain:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterCookieMountain)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_CheeseBridgeArea_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_CookieMountain_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnCookieMountain)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_CheeseBridgeArea_XPosOfTile<<4), (!Define_SMW_CheeseBridgeArea_YPosOfTile<<4)-$06)
	%ScriptCommand_SpawnSprite(OWSpr03_CheepCheep, $0150, $0090, $0000, $0000)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnCheeseBridgeArea)

.MoveDown:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_JSRToScript(PathMacroScript_BottomLeftQuarterCircle_EnterAbove)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Right1Tile, NoYMovement)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Up7Pixels)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_ClimbingSubpixelSpeed, !Define_SMW_Overworld_ClimbingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Climbing)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up3Tiles)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_LudwigsCastle_XPosOfTile<<4), (!Define_SMW_LudwigsCastle_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLudwigsCastle)

;---------------------------------------------------------------------------

Script_StandingOnSodaLake:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterSodaLake)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_CheeseBridgeArea_SecretExit1EventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_SodaLake_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnSodaLake)

.MoveUp:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_ClimbingSubpixelSpeed, !Define_SMW_Overworld_ClimbingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Climbing)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up3Tiles)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_CheeseBridgeArea_XPosOfTile<<4), (!Define_SMW_CheeseBridgeArea_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnCheeseBridgeArea)

.MoveDown:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left7Pixels, Down7Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Left1Tile, Down4Tiles)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left4Pixels, Down4Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down2Tiles)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left4Pixels, Down7Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down2Tiles)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left4Pixels, Down4Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left7Pixels, NoYMovement)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Left1Tile, NoYMovement)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left4Pixels, Up7Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left2Pixels, Up4Pixels)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_ClimbingSubpixelSpeed, !Define_SMW_Overworld_ClimbingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Climbing)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up1Tile)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWarp_SodaLakeToStarRoad3_XPosOfTile<<4), (!Define_SMW_StarWarp_SodaLakeToStarRoad3_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_SodaLakeToStarRoad3)

;---------------------------------------------------------------------------

Script_StandingOnLevel012:
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_StandingOnDonutSecretHouse:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterDonutSecretHouse)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutSecret1_SecretExit1EventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutSecretHouse_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutSecretHouse_SecretExit1EventID, .MoveDown)
+:

	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutSecretHouse)

.MoveUp:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up1Tile)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Up4Pixels)
	%ScriptCommand_ChangePlayerAnimation(Swimming)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left7Pixels, Up4Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left7Pixels, Up2Pixels)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_DonutSecret1_XPosOfTile<<4), (!Define_SMW_DonutSecret1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutSecret1)

.MoveRight:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_PipeWarp_DonutSecretHouseToDonutSecret2_XPosOfTile<<4), (!Define_SMW_PipeWarp_DonutSecretHouseToDonutSecret2_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnPipeWarp_DonutSecretHouseToDonutSecret2)

.MoveDown:
.SecretExit1Entry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWarp_DonutSecretHouseToStarRoad1_XPosOfTile<<4), (!Define_SMW_StarWarp_DonutSecretHouseToStarRoad1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_DonutSecretHouseToStarRoad1)

;---------------------------------------------------------------------------

Script_StandingOnDestroyedTile_YellowSwitchPalace:
Script_StandingOnYellowSwitchPalace:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_YellowSwitchPalace_NormalExitEventID, .NotDestroyed)
	%ScriptCommand_JumpToScriptAddress(.IsDestroyed)

.NotDestroyed:
	%EnterTileOnFaceButtonPress(Script_EnterYellowSwitchPalace)
.IsDestroyed:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_YoshisIsland1_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
.NormalExitEntry:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYellowSwitchPalace)

.MoveDown:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Down6Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down1Tile)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_ClimbingSubpixelSpeed, !Define_SMW_Overworld_ClimbingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Climbing)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down2Tiles)
Script_EnterPathExit_YellowSwitchPalaceToYoshisIsland1:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $020D)
	%ScriptCommand_JSRToScript(Script_SharedPathExitEntryCode)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down1Tile)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Down5Pixels)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Swimming)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Down7Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Down7Pixels)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_ClimbingSubpixelSpeed, !Define_SMW_Overworld_ClimbingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Climbing)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down1Tile)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Down7Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Down5Pixels)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_JSRToScript(PathMacroScript_VerticalSBendLeft_EnterAbove)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_YoshisIsland1_XPosOfTile<<4), (!Define_SMW_YoshisIsland1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYoshisIsland1)

;---------------------------------------------------------------------------

Script_StandingOnDonutPlains1:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterDonutPlains1)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutPlains1_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutPlains1_SecretExit1EventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_IggysCastle_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutPlains1)

.MoveLeft:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_JSRToScript(PathMacroScript_BottomLeftQuarterCircle_EnterLeft)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up2Tiles)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_DonutPlains2_XPosOfTile<<4), (!Define_SMW_DonutPlains2_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutPlains2)

.MoveUp:
.SecretExit1Entry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up1Tile)
	%ScriptCommand_ChangePlayerAnimation(Swimming)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_DonutSecret1_XPosOfTile<<4), (!Define_SMW_DonutSecret1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutSecret1)

.MoveDown:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down4Tiles)
Script_EnterPathExit_DonutPlains1ToIggysCastle:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $020F)
	%ScriptCommand_JSRToScript(Script_SharedPathExitEntryCode)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_IggysCastle_XPosOfTile<<4), (!Define_SMW_IggysCastle_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnIggysCastle)

;---------------------------------------------------------------------------

Script_StandingOnLevel016:
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_StandingOnLevel017:
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_StandingOnSunkenGhostShip:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterSunkenGhostShip)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_WendysCastle_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_SunkenGhostShip_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnSunkenGhostShip)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Left2Tiles, Down1Tile)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down1Tile)
	%ScriptCommand_SpawnSprite(OWSpr03_CheepCheep, $00B0, $0180, $0000, $0000)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_WendysCastle_XPosOfTile<<4), (!Define_SMW_WendysCastle_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnWendysCastle)

.MoveUp:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up2Tiles)
Script_EnterPathExit_SunkenGhostShipToValleyOfBowser1:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $0218)
	%ScriptCommand_JSRToScript(Script_SharedPathExitEntryCode)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_JSRToScript(PathMacroScript_TopRightQuarterCircle_EnterBelow)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ValleyOfBowser1_XPosOfTile<<4), (!Define_SMW_ValleyOfBowser1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyOfBowser1)

;---------------------------------------------------------------------------

Script_StandingOnLevel019:
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_StandingOnDestroyedTile_WendysCastle:
Script_StandingOnWendysCastle:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_WendysCastle_NormalExitEventID, .NotDestroyed)
if !Define_SMW_Overworld_AllowCastleReEntryWithLR == !TRUE
	%ScriptCommand_8BitCheckIfAllBitsSet(!RAM_SMW_IO_ControllerHold2, !Joypad_L|!Joypad_R, Script_EnterWendysCastle)
endif
	%ScriptCommand_JumpToScriptAddress(.IsDestroyed)

.NotDestroyed:
	%EnterTileOnFaceButtonPress(Script_EnterWendysCastle)
.IsDestroyed:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateSecret_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_WendysCastle_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateIsland5_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnWendysCastle)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_JSRToScript(PathMacroScript_BottomLeftQuarterCircle_EnterLeft)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_PipeWarp_WendysCastleToChocolateSecret_XPosOfTile<<4), (!Define_SMW_PipeWarp_WendysCastleToChocolateSecret_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnPipeWarp_WendysCastleToChocolateSecret)

.MoveUp:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up2Tiles)
	%ScriptCommand_ChangePlayerAnimation(Swimming)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up1Tile)
	%ScriptCommand_SpawnSprite(OWSpr03_CheepCheep, $00B0, $0180, $0000, $0000)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_SunkenGhostShip_XPosOfTile<<4), (!Define_SMW_SunkenGhostShip_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnSunkenGhostShip)

 .MoveDown:
 	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ChocolateIsland5_XPosOfTile<<4), (!Define_SMW_ChocolateIsland5_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland5)

;---------------------------------------------------------------------------

Script_StandingOnDestroyedTile_ChocolateFortress:
Script_StandingOnChocolateFortress:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_ChocolateFortress_NormalExitEventID, .NotDestroyed)
if !Define_SMW_Overworld_AllowCastleReEntryWithLR == !TRUE
	%ScriptCommand_8BitCheckIfAllBitsSet(!RAM_SMW_IO_ControllerHold2, !Joypad_L|!Joypad_R, Script_EnterChocolateFortress)
endif
	%ScriptCommand_JumpToScriptAddress(.IsDestroyed)

.NotDestroyed:
	%EnterTileOnFaceButtonPress(Script_EnterChocolateFortress)
.IsDestroyed:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateIsland3_SecretExit1EventID, .MoveRight)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateFortress_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateFortress)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ChocolateIsland3_XPosOfTile<<4), (!Define_SMW_ChocolateIsland3_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland3)

.MoveDown:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ChocolateIsland4_XPosOfTile<<4), (!Define_SMW_ChocolateIsland4_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland4)

;---------------------------------------------------------------------------

Script_StandingOnChocolateIsland5:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterChocolateIsland5)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateIsland5_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateIsland4_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland5)

.MoveUp:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_WendysCastle_XPosOfTile<<4), (!Define_SMW_WendysCastle_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnWendysCastle)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ChocolateIsland4_XPosOfTile<<4), (!Define_SMW_ChocolateIsland4_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland4)

;---------------------------------------------------------------------------

Script_StandingOnChocolateIsland4:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterChocolateIsland4)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateIsland4_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateFortress_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland4)

.MoveLeft:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ChocolateIsland5_XPosOfTile<<4), (!Define_SMW_ChocolateIsland5_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland5)

 .MoveUp:
 	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ChocolateFortress_XPosOfTile<<4), (!Define_SMW_ChocolateFortress_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateFortress)

;---------------------------------------------------------------------------

Script_StandingOnLevel01E:
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_StandingOnDestroyedTile_ForestFortress:
Script_StandingOnForestFortress:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_ForestFortress_NormalExitEventID, .NotDestroyed)
if !Define_SMW_Overworld_AllowCastleReEntryWithLR == !TRUE
	%ScriptCommand_8BitCheckIfAllBitsSet(!RAM_SMW_IO_ControllerHold2, !Joypad_L|!Joypad_R, Script_EnterForestFortress)
endif
	%ScriptCommand_JumpToScriptAddress(.IsDestroyed)

.NotDestroyed:
	%EnterTileOnFaceButtonPress(Script_EnterForestFortress)
.IsDestroyed:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestFortress_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestSecretArea_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestFortress)

.MoveLeft:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWarp_ForestFortressToStarRoad4_XPosOfTile<<4), (!Define_SMW_StarWarp_ForestFortressToStarRoad4_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_ForestFortressToStarRoad4)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Right3Tiles, NoYMovement)
Script_EnterPathExit_ForestFortressToForestSecret:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $0215)
	%ScriptCommand_JSRToScript(Script_SharedPathExitEntryCode)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Right2Tiles, NoYMovement)
	%ScriptCommand_JSRToScript(PathMacroScript_BottomRightQuarterCircle_EnterRight)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ForestSecretArea_XPosOfTile<<4), (!Define_SMW_ForestSecretArea_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestSecretArea)

;---------------------------------------------------------------------------

Script_StandingOnDestroyedTile_RoysCastle:
Script_StandingOnRoysCastle:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_RoysCastle_NormalExitEventID, .NotDestroyed)
if !Define_SMW_Overworld_AllowCastleReEntryWithLR == !TRUE
	%ScriptCommand_8BitCheckIfAllBitsSet(!RAM_SMW_IO_ControllerHold2, !Joypad_L|!Joypad_R, Script_EnterRoysCastle)
endif
	%ScriptCommand_JumpToScriptAddress(.IsDestroyed)

.NotDestroyed:
	%EnterTileOnFaceButtonPress(Script_EnterRoysCastle)
.IsDestroyed:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion3_SecretExit1EventID, .MoveRight)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_RoysCastle_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnRoysCastle)

.MoveDown:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ChocolateIsland1_XPosOfTile<<4), (!Define_SMW_ChocolateIsland1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland1)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Right2Tiles, NoYMovement)
	%ScriptCommand_JSRToScript(PathMacroScript_BottomRightQuarterCircle_EnterRight)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up1Tile)
Script_EnterPathExit_RoysCastleToForestOfIllusion3:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $0217)
	%ScriptCommand_JSRToScript(Script_SharedPathExitEntryCode)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ForestOfIllusion3_XPosOfTile<<4), (!Define_SMW_ForestOfIllusion3_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion3)

;---------------------------------------------------------------------------

Script_StandingOnChocoGhostHouse:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterChocoGhostHouse)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateIsland1_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocoGhostHouse_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocoGhostHouse)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ChocolateIsland1_XPosOfTile<<4), (!Define_SMW_ChocolateIsland1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland1)

.MoveDown:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ChocolateIsland2_XPosOfTile<<4), (!Define_SMW_ChocolateIsland2_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland2)

;---------------------------------------------------------------------------

Script_StandingOnChocolateIsland1:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterChocolateIsland1)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateIsland1_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_RoysCastle_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland1)

.MoveLeft:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ChocoGhostHouse_XPosOfTile<<4), (!Define_SMW_ChocoGhostHouse_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocoGhostHouse)

.MoveUp:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_RoysCastle_XPosOfTile<<4), (!Define_SMW_RoysCastle_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnRoysCastle)

;---------------------------------------------------------------------------

Script_StandingOnChocolateIsland3:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterChocolateIsland3)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateIsland3_SecretExit1EventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateIsland3_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateIsland2_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateIsland3_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland3)

.MoveLeft:
.SecretExit1Entry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ChocolateFortress_XPosOfTile<<4), (!Define_SMW_ChocolateFortress_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateFortress)

.MoveUp:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up1Tile)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left7Pixels, Up7Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Left1Tile, NoYMovement)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left7Pixels, Down7Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down2Tiles)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right7Pixels, Down7Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Right1Tile, NoYMovement)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right7Pixels, Up7Pixels)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ChocolateIsland3_XPosOfTile<<4), (!Define_SMW_ChocolateIsland3_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland3)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ChocolateIsland2_XPosOfTile<<4), (!Define_SMW_ChocolateIsland2_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland2)

.MoveDown:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down1Tile)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left7Pixels, Down7Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Left1Tile, NoYMovement)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left7Pixels, Up7Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up2Tiles)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right7Pixels, Up7Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Right1Tile, NoYMovement)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right7Pixels, Down7Pixels)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ChocolateIsland3_XPosOfTile<<4), (!Define_SMW_ChocolateIsland3_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland3)

;---------------------------------------------------------------------------

Script_StandingOnChocolateIsland2:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterChocolateIsland2)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateIsland2_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocoGhostHouse_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateIsland2_SecretExit1EventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland2)

.MoveLeft:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ChocolateIsland3_XPosOfTile<<4), (!Define_SMW_ChocolateIsland3_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland3)

.MoveUp:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ChocoGhostHouse_XPosOfTile<<4), (!Define_SMW_ChocoGhostHouse_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocoGhostHouse)

.MoveDown:
.SecretExit1Entry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down1Tile)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right4Pixels, Down7Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Right1Tile, NoYMovement)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right7Pixels, Up7Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up1Tile)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left2Pixels, Up7Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left7Pixels, Up4Pixels)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_PipeWarp_ChocolateIsland2ToChocolateSecret_XPosOfTile<<4), (!Define_SMW_PipeWarp_ChocolateIsland2ToChocolateSecret_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnPipeWarp_ChocolateIsland2ToChocolateSecret)

;---------------------------------------------------------------------------

Script_StandingOnDestroyedTile_IggysCastle:
Script_StandingOnIggysCastle:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_IggysCastle_NormalExitEventID, .NotDestroyed)
if !Define_SMW_Overworld_AllowCastleReEntryWithLR == !TRUE
	%ScriptCommand_8BitCheckIfAllBitsSet(!RAM_SMW_IO_ControllerHold2, !Joypad_L|!Joypad_R, Script_EnterIggysCastle)
endif
	%ScriptCommand_JumpToScriptAddress(.IsDestroyed)

.NotDestroyed:
	%EnterTileOnFaceButtonPress(Script_EnterIggysCastle)
.IsDestroyed:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_IggysCastle_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_YoshisIsland4_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnIggysCastle)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_JSRToScript(PathMacroScript_TopRightQuarterCircle_EnterRight)
	%ScriptCommand_ChangePlayerAnimation(Swimming)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_YoshisIsland4_XPosOfTile<<4), (!Define_SMW_YoshisIsland4_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYoshisIsland4)

.MoveUp:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up2Tiles)
Script_EnterPathExit_IggysCastleToDonutPlains1:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $020E)
	%ScriptCommand_JSRToScript(Script_SharedPathExitEntryCode)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_DonutPlains1_XPosOfTile<<4), (!Define_SMW_DonutPlains1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutPlains1)

;---------------------------------------------------------------------------

Script_StandingOnYoshisIsland4:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterYoshisIsland4)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_YoshisIsland4_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_YoshisIsland3_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYoshisIsland4)

.MoveUp:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_JSRToScript(PathMacroScript_TopRightQuarterCircle_EnterBelow)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_IggysCastle_XPosOfTile<<4), (!Define_SMW_IggysCastle_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnIggysCastle)

.MoveDown:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_JSRToScript(PathMacroScript_BottomRightQuarterCircle_EnterAbove)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_YoshisIsland3_XPosOfTile<<4), (!Define_SMW_YoshisIsland3_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYoshisIsland3)

;---------------------------------------------------------------------------

Script_StandingOnYoshisIsland3:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterYoshisIsland3)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_YoshisIsland3_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_YoshisIsland2_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYoshisIsland3)

.MoveRight:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_JSRToScript(PathMacroScript_BottomRightQuarterCircle_EnterRight)
	%ScriptCommand_ChangePlayerAnimation(Swimming)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_YoshisIsland4_XPosOfTile<<4), (!Define_SMW_YoshisIsland4_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYoshisIsland4)

.MoveDown:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_YoshisIsland2_XPosOfTile<<4), (!Define_SMW_YoshisIsland2_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYoshisIsland2)

;---------------------------------------------------------------------------

Script_StandingOnYoshisHouse:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterYoshisHouse)
	%ScriptCommand_8BitCheckIfBitsSet(!RAM_SMW_IO_ControllerPress1, !Joypad_DPadL>>8, .MoveLeft)
	%ScriptCommand_8BitCheckIfBitsSet(!RAM_SMW_IO_ControllerPress1, !Joypad_DPadR>>8, .MoveRight)
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYoshisHouse)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_YoshisIsland1_XPosOfTile<<4), (!Define_SMW_YoshisIsland1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYoshisIsland1)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_YoshisIsland2_XPosOfTile<<4), (!Define_SMW_YoshisIsland2_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYoshisIsland2)

;---------------------------------------------------------------------------

Script_StandingOnYoshisIsland1:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterYoshisIsland1)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_YoshisIsland1_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsSet(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, .MoveRight)
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYoshisIsland1)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_JSRToScript(PathMacroScript_HorizontalSBendUp_EnterLeft)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYoshisHouse)

.MoveUp:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_JSRToScript(PathMacroScript_VerticalSBendLeft_EnterBelow)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Up6Pixels)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_ClimbingSubpixelSpeed, !Define_SMW_Overworld_ClimbingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Climbing)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up2Tiles)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Swimming)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Up7Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Up7Pixels)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_ClimbingSubpixelSpeed, !Define_SMW_Overworld_ClimbingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Climbing)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up2Tiles)
Script_EnterPathExit_YoshisIsland1ToYellowSwitchPalace:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $020C)
	%ScriptCommand_JSRToScript(Script_SharedPathExitEntryCode)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up2Tiles)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_YellowSwitchPalace_XPosOfTile<<4), (!Define_SMW_YellowSwitchPalace_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYellowSwitchPalace)

;---------------------------------------------------------------------------

Script_StandingOnYoshisIsland2:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterYoshisIsland2)
	%ScriptCommand_8BitCheckIfBitsSet(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, .MoveLeft)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_YoshisIsland2_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYoshisIsland2)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_YoshisHouse_XPosOfTile<<4), (!Define_SMW_YoshisHouse_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYoshisHouse)

.MoveUp:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_YoshisIsland3_XPosOfTile<<4), (!Define_SMW_YoshisIsland3_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnYoshisIsland3)

;---------------------------------------------------------------------------

Script_StandingOnVanillaGhostHouse:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterVanillaGhostHouse)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaGhostHouse_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaDome2_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaGhostHouse)

.MoveRight:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Right2Tiles, NoYMovement)
	%ScriptCommand_JSRToScript(PathMacroScript_TopRightQuarterCircle_EnterRight)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_VanillaDome3_XPosOfTile<<4), (!Define_SMW_VanillaDome3_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaDome3)

.MoveDown:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down1Tile)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_ClimbingSubpixelSpeed, !Define_SMW_Overworld_ClimbingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Climbing)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down3Tiles)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Swimming)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_VanillaDome2_XPosOfTile<<4), (!Define_SMW_VanillaDome2_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaDome2)

;---------------------------------------------------------------------------

Script_StandingOnLevel108:
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_StandingOnVanillaSecret1:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterVanillaSecret1)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaSecret1_SecretExit1EventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaSecret1_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaDome1_SecretExit1EventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaSecret1)

.MoveLeft:
.SecretExit1Entry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWarp_VanillaSecret1ToStarRoad2_XPosOfTile<<4), (!Define_SMW_StarWarp_VanillaSecret1ToStarRoad2_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_VanillaSecret1ToStarRoad2)

.MoveUp:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_ClimbingSubpixelSpeed, !Define_SMW_Overworld_ClimbingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Climbing)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up2Tiles)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_PipeWarp_VanillaSecret1ToVanillaSecret2_XPosOfTile<<4), (!Define_SMW_PipeWarp_VanillaSecret1ToVanillaSecret2_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnPipeWarp_VanillaSecret1ToVanillaSecret2)

.MoveDown:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_ClimbingSubpixelSpeed, !Define_SMW_Overworld_ClimbingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Climbing)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down2Tiles)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_JSRToScript(PathMacroScript_BottomLeftQuarterCircle_EnterAbove)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_VanillaDome1_XPosOfTile<<4), (!Define_SMW_VanillaDome1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaDome1)

;---------------------------------------------------------------------------

Script_StandingOnVanillaDome3:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterVanillaDome3)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaGhostHouse_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaDome3_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaDome3)

.MoveUp:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_JSRToScript(PathMacroScript_TopRightQuarterCircle_EnterBelow)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_VanillaGhostHouse_XPosOfTile<<4), (!Define_SMW_VanillaGhostHouse_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaGhostHouse)

.MoveDown:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_VanillaDome4_XPosOfTile<<4), (!Define_SMW_VanillaDome4_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaDome4)

;---------------------------------------------------------------------------

Script_StandingOnDonutSecret2:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterDonutSecret2)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutSecret2_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutSecretHouse_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutSecret2)

.MoveRight:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_PipeWarp_DonutSecret2ToDonutPlains3_XPosOfTile<<4), (!Define_SMW_PipeWarp_DonutSecret2ToDonutPlains3_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnPipeWarp_DonutSecret2ToDonutPlains3)

.MoveDown:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_PipeWarp_DonutSecret2ToDonutSecretHouse_XPosOfTile<<4), (!Define_SMW_PipeWarp_DonutSecret2ToDonutSecretHouse_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnPipeWarp_DonutSecret2ToDonutSecretHouse)

;---------------------------------------------------------------------------

Script_StandingOnLevel10C:
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_StandingOnFrontDoor:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterFrontDoor)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld4_SecretExit1EventID, .MoveLeft)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyOfBowser4_SecretExit1EventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_LarrysCastle_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnFrontDoor)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Left2Tiles, NoYMovement)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWarp_FrontDoorToStarRoad5_XPosOfTile<<4), (!Define_SMW_StarWarp_FrontDoorToStarRoad5_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_FrontDoorToStarRoad5)

.MoveDown:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_LarrysCastle_XPosOfTile<<4), (!Define_SMW_LarrysCastle_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLarrysCastle)

;---------------------------------------------------------------------------

Script_StandingOnBackDoor:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterBackDoor)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyFortress_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnBackDoor)

.MoveDown:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ValleyFortress_XPosOfTile<<4), (!Define_SMW_ValleyFortress_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyFortress)

;---------------------------------------------------------------------------

Script_StandingOnValleyOfBowser4:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterValleyOfBowser4)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyOfBowser4_SecretExit1EventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyOfBowser4_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyOfBowser3_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyOfBowser4)

.MoveUp:
.SecretExit1Entry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWarp_FrontDoorToStarRoad5_XPosOfTile<<4), (!Define_SMW_StarWarp_FrontDoorToStarRoad5_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_FrontDoorToStarRoad5)

.MoveRight:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_LarrysCastle_XPosOfTile<<4), (!Define_SMW_LarrysCastle_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLarrysCastle)

.MoveDown:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ValleyOfBowser3_XPosOfTile<<4), (!Define_SMW_ValleyOfBowser3_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyOfBowser3)

;---------------------------------------------------------------------------

Script_StandingOnDestroyedTile_LarrysCastle:
Script_StandingOnLarrysCastle:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_LarrysCastle_NormalExitEventID, .NotDestroyed)
if !Define_SMW_Overworld_AllowCastleReEntryWithLR == !TRUE
	%ScriptCommand_8BitCheckIfAllBitsSet(!RAM_SMW_IO_ControllerHold2, !Joypad_L|!Joypad_R, Script_EnterLarrysCastle)
endif
	%ScriptCommand_JumpToScriptAddress(.IsDestroyed)

.NotDestroyed:
	%EnterTileOnFaceButtonPress(Script_EnterLarrysCastle)
.IsDestroyed:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyOfBowser4_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_LarrysCastle_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyGhostHouse_SecretExit1EventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLarrysCastle)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ValleyOfBowser4_XPosOfTile<<4), (!Define_SMW_ValleyOfBowser4_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyOfBowser4)

.MoveUp:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_FrontDoor_XPosOfTile<<4), (!Define_SMW_FrontDoor_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnFrontDoor)

.MoveDown:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ValleyGhostHouse_XPosOfTile<<4), (!Define_SMW_ValleyGhostHouse_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyGhostHouse)

;---------------------------------------------------------------------------

Script_StandingOnDestroyedTile_ValleyFortress:
Script_StandingOnValleyFortress:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_ValleyFortress_NormalExitEventID, .NotDestroyed)
if !Define_SMW_Overworld_AllowCastleReEntryWithLR == !TRUE
	%ScriptCommand_8BitCheckIfAllBitsSet(!RAM_SMW_IO_ControllerHold2, !Joypad_L|!Joypad_R, Script_EnterValleyFortress)
endif
	%ScriptCommand_JumpToScriptAddress(.IsDestroyed)

.NotDestroyed:
	%EnterTileOnFaceButtonPress(Script_EnterValleyFortress)
.IsDestroyed:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyFortress_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyOfBowser2_SecretExit1EventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyFortress)

.MoveUp:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_BackDoor_XPosOfTile<<4), (!Define_SMW_BackDoor_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnBackDoor)

.MoveDown:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ValleyOfBowser2_XPosOfTile<<4), (!Define_SMW_ValleyOfBowser2_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyOfBowser2)

;---------------------------------------------------------------------------

Script_StandingOnLevel112:
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_StandingOnValleyOfBowser3:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterValleyOfBowser3)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyOfBowser3_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyGhostHouse_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyOfBowser3)

.MoveUp:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ValleyOfBowser4_XPosOfTile<<4), (!Define_SMW_ValleyOfBowser4_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyOfBowser4)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ValleyGhostHouse_XPosOfTile<<4), (!Define_SMW_ValleyGhostHouse_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyGhostHouse)

;---------------------------------------------------------------------------

Script_StandingOnValleyGhostHouse:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterValleyGhostHouse)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyGhostHouse_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyGhostHouse_SecretExit1EventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyOfBowser2_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyGhostHouse)

.MoveLeft
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ValleyOfBowser3_XPosOfTile<<4), (!Define_SMW_ValleyOfBowser3_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyOfBowser3)

.MoveUp:
.SecretExit1Entry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_LarrysCastle_XPosOfTile<<4), (!Define_SMW_LarrysCastle_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLarrysCastle)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ValleyOfBowser2_XPosOfTile<<4), (!Define_SMW_ValleyOfBowser2_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyOfBowser2)

;---------------------------------------------------------------------------

Script_StandingOnValleyOfBowser2:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterValleyOfBowser2)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyOfBowser2_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyOfBowser2_SecretExit1EventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyOfBowser1_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyOfBowser2)

.MoveLeft
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ValleyGhostHouse_XPosOfTile<<4), (!Define_SMW_ValleyGhostHouse_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyGhostHouse)

.MoveUp:
.SecretExit1Entry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ValleyFortress_XPosOfTile<<4), (!Define_SMW_ValleyFortress_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyFortress)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ValleyOfBowser1_XPosOfTile<<4), (!Define_SMW_ValleyOfBowser1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyOfBowser1)

;---------------------------------------------------------------------------

Script_StandingOnValleyOfBowser1:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterValleyOfBowser1)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyOfBowser2_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_SunkenGhostShip_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyOfBowser1)

.MoveLeft
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ValleyOfBowser2_XPosOfTile<<4), (!Define_SMW_ValleyOfBowser2_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyOfBowser2)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Right1Tile, NoYMovement)
	%ScriptCommand_JSRToScript(PathMacroScript_TopRightQuarterCircle_EnterRight)
Script_EnterPathExit_ValleyOfBowser1ToSunkenGhostShip:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $0219)
	%ScriptCommand_JSRToScript(Script_SharedPathExitEntryCode)
	%ScriptCommand_ChangePlayerAnimation(Swimming)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_SunkenGhostShip_XPosOfTile<<4), (!Define_SMW_SunkenGhostShip_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnSunkenGhostShip)

;---------------------------------------------------------------------------

Script_StandingOnChocolateSecret:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterChocolateSecret)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateSecret_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateIsland2_SecretExit1EventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateSecret)

.MoveLeft
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_PipeWarp_ChocolateSecretToWendysCastle_XPosOfTile<<4), (!Define_SMW_PipeWarp_ChocolateSecretToWendysCastle_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnPipeWarp_ChocolateSecretToWendysCastle)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_PipeWarp_ChocolateSecretToChocolateIsland2_XPosOfTile<<4), (!Define_SMW_PipeWarp_ChocolateSecretToChocolateIsland2_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnPipeWarp_ChocolateSecretToChocolateIsland2)

;---------------------------------------------------------------------------

Script_StandingOnVanillaDome2:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterVanillaDome2)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaDome2_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaDome2_SecretExit1EventID, .MoveRight)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaDome1_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaDome2)

.MoveUp
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_ClimbingSubpixelSpeed, !Define_SMW_Overworld_ClimbingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Climbing)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up3Tiles)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_VanillaGhostHouse_XPosOfTile<<4), (!Define_SMW_VanillaGhostHouse_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaGhostHouse)

.MoveRight:
.SecretExit1Entry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_JSRToScript(PathMacroScript_TopRightQuarterCircle_EnterRight)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_RedSwitchPalace_XPosOfTile<<4), (!Define_SMW_RedSwitchPalace_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnRedSwitchPalace)

.MoveDown:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_JSRToScript(PathMacroScript_BottomRightQuarterCircle_EnterAbove)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_VanillaDome1_XPosOfTile<<4), (!Define_SMW_VanillaDome1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaDome1)

;---------------------------------------------------------------------------

Script_StandingOnVanillaDome4:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterVanillaDome4)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaDome3_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaDome4_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaDome4)

.MoveUp:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_VanillaDome3_XPosOfTile<<4), (!Define_SMW_VanillaDome3_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaDome3)

.MoveDown:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_LemmysCastle_XPosOfTile<<4), (!Define_SMW_LemmysCastle_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLemmysCastle)

;---------------------------------------------------------------------------

Script_StandingOnVanillaDome1:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterVanillaDome1)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaDome1_SecretExit1EventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaDome1_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_MortonsCastle_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaDome1)

.MoveLeft
.SecretExit1Entry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_JSRToScript(PathMacroScript_BottomLeftQuarterCircle_EnterLeft)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_ClimbingSubpixelSpeed, !Define_SMW_Overworld_ClimbingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Climbing)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up2Tiles)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_VanillaSecret1_XPosOfTile<<4), (!Define_SMW_VanillaSecret1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaSecret1)

.MoveRight:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Right1Tile, NoYMovement)
	%ScriptCommand_ChangePlayerAnimation(Swimming)
	%ScriptCommand_JSRToScript(PathMacroScript_BottomRightQuarterCircle_EnterRight)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_VanillaDome2_XPosOfTile<<4), (!Define_SMW_VanillaDome2_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaDome2)

.MoveDown:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down2Tiles)
Script_EnterPathExit_VanillaDome1ToMortonsCastle:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $0211)
	%ScriptCommand_JSRToScript(Script_SharedPathExitEntryCode)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_MortonsCastle_XPosOfTile<<4), (!Define_SMW_MortonsCastle_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnMortonsCastle)

;---------------------------------------------------------------------------

Script_StandingOnDestroyedTile_RedSwitchPalace:
Script_StandingOnRedSwitchPalace:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_RedSwitchPalace_NormalExitEventID, .NotDestroyed)
	%ScriptCommand_JumpToScriptAddress(.IsDestroyed)

.NotDestroyed:
	%EnterTileOnFaceButtonPress(Script_EnterRedSwitchPalace)
.IsDestroyed:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaDome2_SecretExit1EventID, .MoveUp)
+:
	%ScriptCommand_WaitXFrames($01)
.NormalExitEntry:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnRedSwitchPalace)

.MoveUp:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Swimming)
	%ScriptCommand_JSRToScript(PathMacroScript_TopRightQuarterCircle_EnterBelow)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_VanillaDome2_XPosOfTile<<4), (!Define_SMW_VanillaDome2_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaDome2)

;---------------------------------------------------------------------------

Script_StandingOnDestroyedTile_LemmysCastle:
Script_StandingOnLemmysCastle:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_LemmysCastle_NormalExitEventID, .NotDestroyed)
if !Define_SMW_Overworld_AllowCastleReEntryWithLR == !TRUE
	%ScriptCommand_8BitCheckIfAllBitsSet(!RAM_SMW_IO_ControllerHold2, !Joypad_L|!Joypad_R, Script_EnterLemmysCastle)
endif
	%ScriptCommand_JumpToScriptAddress(.IsDestroyed)

.NotDestroyed:
	%EnterTileOnFaceButtonPress(Script_EnterLemmysCastle)
.IsDestroyed:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaDome4_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_LemmysCastle_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLemmysCastle)

.MoveUp:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_VanillaDome4_XPosOfTile<<4), (!Define_SMW_VanillaDome4_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaDome4)

.MoveDown:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_JSRToScript(PathMacroScript_BottomRightQuarterCircle_EnterAbove)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_PipeWarp_LemmysCastleToCheeseBridgeArea_XPosOfTile<<4), (!Define_SMW_PipeWarp_LemmysCastleToCheeseBridgeArea_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnPipeWarp_LemmysCastleToCheeseBridgeArea)

;---------------------------------------------------------------------------

Script_StandingOnForestGhostHouse:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterForestGhostHouse)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestGhostHouse_SecretExit1EventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion1_SecretExit1EventID, .MoveRight)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestGhostHouse_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion3_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestGhostHouse)

.MoveLeft:
.SecretExit1Entry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_JSRToScript(PathMacroScript_TopLeftQuarterCircle_EnterLeft)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ForestOfIllusion4_XPosOfTile<<4), (!Define_SMW_ForestOfIllusion4_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion4)

.MoveRight:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ForestOfIllusion1_XPosOfTile<<4), (!Define_SMW_ForestOfIllusion1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion1)

.MoveDown:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down3Tiles)
	%ScriptCommand_JSRToScript(PathMacroScript_BottomLeftQuarterCircle_EnterAbove)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ForestOfIllusion3_XPosOfTile<<4), (!Define_SMW_ForestOfIllusion3_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion3)

;---------------------------------------------------------------------------

Script_StandingOnForestOfIllusion1:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterForestOfIllusion1)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestGhostHouse_NormalExitEventID, .MoveLeft)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion1_SecretExit1EventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_LudwigsCastle_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion1_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion1)

.MoveLeft:
.SecretExit1Entry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ForestGhostHouse_XPosOfTile<<4), (!Define_SMW_ForestGhostHouse_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestGhostHouse)

.MoveRight:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_JSRToScript(PathMacroScript_TopRightQuarterCircle_EnterRight)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ForestOfIllusion2_XPosOfTile<<4), (!Define_SMW_ForestOfIllusion2_YPosOfTile<<4)-$06)
	%ScriptCommand_ChangePlayerAnimation(Swimming)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion2)

.MoveUp:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up2Tiles)
Script_EnterPathExit_ForestOfIllusion1ToLudwigsCastle:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $0213)
	%ScriptCommand_JSRToScript(Script_SharedPathExitEntryCode)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up2Tiles)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_ClimbingSubpixelSpeed, !Define_SMW_Overworld_ClimbingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Climbing)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up3Tiles)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_JSRToScript(PathMacroScript_TopRightQuarterCircle_EnterBelow)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_LudwigsCastle_XPosOfTile<<4), (!Define_SMW_LudwigsCastle_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLudwigsCastle)

;---------------------------------------------------------------------------

Script_StandingOnForestOfIllusion4:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterForestOfIllusion4)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_YoshisIsland4_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion4_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion4_SecretExit1EventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion4)

.MoveUp:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up1Tile)
	%ScriptCommand_JSRToScript(PathMacroScript_TopLeftQuarterCircle_EnterBelow)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ForestGhostHouse_XPosOfTile<<4), (!Define_SMW_ForestGhostHouse_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestGhostHouse)

.MoveRight:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ForestOfIllusion2_XPosOfTile<<4), (!Define_SMW_ForestOfIllusion2_YPosOfTile<<4)-$06)
	%ScriptCommand_ChangePlayerAnimation(Swimming)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion2)

.MoveDown:
.SecretExit1Entry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ForestSecretArea_XPosOfTile<<4), (!Define_SMW_ForestSecretArea_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestSecretArea)

;---------------------------------------------------------------------------

Script_StandingOnForestOfIllusion2:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterForestOfIllusion2)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion4_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion1_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion2_SecretExit1EventID, .MoveRight)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion2_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion2)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ForestOfIllusion4_XPosOfTile<<4), (!Define_SMW_ForestOfIllusion4_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion4)

.MoveUp:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up1Tile)
	%ScriptCommand_JSRToScript(PathMacroScript_TopRightQuarterCircle_EnterBelow)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ForestOfIllusion1_XPosOfTile<<4), (!Define_SMW_ForestOfIllusion1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion1)

.MoveRight:
.SecretExit1Entry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_BlueSwitchPalace_XPosOfTile<<4), (!Define_SMW_BlueSwitchPalace_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnBlueSwitchPalace)

.MoveDown:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_JSRToScript(PathMacroScript_BottomRightQuarterCircle_EnterAbove)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ForestOfIllusion3_XPosOfTile<<4), (!Define_SMW_ForestOfIllusion3_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion3)

;---------------------------------------------------------------------------

Script_StandingOnDestroyedTile_BlueSwitchPalace:
Script_StandingOnBlueSwitchPalace:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%ScriptCommand_CheckIfXEventNotPassed(!Define_SMW_BlueSwitchPalace_NormalExitEventID, .NotDestroyed)
	%ScriptCommand_JumpToScriptAddress(.IsDestroyed)

.NotDestroyed:
	%EnterTileOnFaceButtonPress(Script_EnterBlueSwitchPalace)
.IsDestroyed:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion2_SecretExit1EventID, .MoveLeft)
+:
	%ScriptCommand_WaitXFrames($01)
.NormalExitEntry:
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnBlueSwitchPalace)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ForestOfIllusion2_XPosOfTile<<4), (!Define_SMW_ForestOfIllusion2_YPosOfTile<<4)-$06)
	%ScriptCommand_ChangePlayerAnimation(Swimming)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion2)

;---------------------------------------------------------------------------

Script_StandingOnForestSecretArea:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterForestSecretArea)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion4_SecretExit1EventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestSecretArea_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestSecretArea)

.MoveUp:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ForestOfIllusion4_XPosOfTile<<4), (!Define_SMW_ForestOfIllusion4_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion4)

.MoveDown:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_JSRToScript(PathMacroScript_BottomRightQuarterCircle_EnterAbove)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Left2Tiles, NoYMovement)
Script_EnterPathExit_ForestSecretToForestFortress:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $0214)
	%ScriptCommand_JSRToScript(Script_SharedPathExitEntryCode)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ForestFortress_XPosOfTile<<4), (!Define_SMW_ForestFortress_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestFortress)

;---------------------------------------------------------------------------

Script_StandingOnForestOfIllusion3:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterForestOfIllusion3)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion3_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion2_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestOfIllusion3_SecretExit1EventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion3)

.MoveLeft:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_JSRToScript(PathMacroScript_BottomLeftQuarterCircle_EnterLeft)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ForestGhostHouse_XPosOfTile<<4), (!Define_SMW_ForestGhostHouse_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestGhostHouse)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_JSRToScript(PathMacroScript_BottomRightQuarterCircle_EnterRight)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ForestOfIllusion2_XPosOfTile<<4), (!Define_SMW_ForestOfIllusion2_YPosOfTile<<4)-$06)
	%ScriptCommand_ChangePlayerAnimation(Swimming)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestOfIllusion2)

.MoveDown:
.SecretExit1Entry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down3Tiles)
Script_EnterPathExit_ForestOfIllusion3ToRoysCastle:
	%ScriptCommand_SetWarpDestination(SecondaryEntrance, $0216)
	%ScriptCommand_JSRToScript(Script_SharedPathExitEntryCode)
	%ScriptCommand_JSRToScript(PathMacroScript_BottomRightQuarterCircle_EnterAbove)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_RoysCastle_XPosOfTile<<4), (!Define_SMW_RoysCastle_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnRoysCastle)

;---------------------------------------------------------------------------

Script_StandingOnLevel124:
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_StandingOnFunky:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterFunky)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_Funky_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_Outrageous_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnFunky)

.MoveLeft:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWarp_FunkyToYoshisHouse_XPosOfTile<<4), (!Define_SMW_StarWarp_FunkyToYoshisHouse_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_FunkyToYoshisHouse)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_Outrageous_XPosOfTile<<4), (!Define_SMW_Outrageous_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnOutrageous)

;---------------------------------------------------------------------------

Script_StandingOnOutrageous:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterOutrageous)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_Outrageous_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_Mondo_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnOutrageous)

.MoveLeft:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_Funky_XPosOfTile<<4), (!Define_SMW_Funky_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnFunky)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_Mondo_XPosOfTile<<4), (!Define_SMW_Mondo_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnMondo)

;---------------------------------------------------------------------------

Script_StandingOnMondo:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterMondo)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_Mondo_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_Groovy_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnMondo)

.MoveLeft:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_Outrageous_XPosOfTile<<4), (!Define_SMW_Outrageous_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnOutrageous)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_Groovy_XPosOfTile<<4), (!Define_SMW_Groovy_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnGroovy)

;---------------------------------------------------------------------------

Script_StandingOnGroovy:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterGroovy)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_Groovy_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_Awesome_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnGroovy)

.MoveLeft:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_Mondo_XPosOfTile<<4), (!Define_SMW_Mondo_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnMondo)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Right1Tile, NoYMovement)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right7Pixels, Down2Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right7Pixels, Down7Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down1Tile)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left7Pixels, Down7Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left7Pixels, Down2Pixels)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_Awesome_XPosOfTile<<4), (!Define_SMW_Awesome_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnAwesome)

;---------------------------------------------------------------------------

Script_StandingOnLevel129:
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_StandingOnGnarly:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterGnarly)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld5_SecretExit1EventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_Gnarly_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnGnarly)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWarp_GnarlyToStarRoad5_XPosOfTile<<4), (!Define_SMW_StarWarp_GnarlyToStarRoad5_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_GnarlyToStarRoad5)

.MoveRight:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_Tubular_XPosOfTile<<4), (!Define_SMW_Tubular_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnTubular)

;---------------------------------------------------------------------------

Script_StandingOnTubular:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterTubular)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_Gnarly_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_Tubular_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnTubular)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_Gnarly_XPosOfTile<<4), (!Define_SMW_Gnarly_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnGnarly)

.MoveRight:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_WayCool_XPosOfTile<<4), (!Define_SMW_WayCool_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnWayCool)

;---------------------------------------------------------------------------

Script_StandingOnWayCool:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterWayCool)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_Tubular_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_WayCool_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnWayCool)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_Tubular_XPosOfTile<<4), (!Define_SMW_Tubular_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnTubular)

.MoveRight:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_Awesome_XPosOfTile<<4), (!Define_SMW_Awesome_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnAwesome)

;---------------------------------------------------------------------------

Script_StandingOnAwesome:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterAwesome)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_WayCool_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_Awesome_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnAwesome)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_WayCool_XPosOfTile<<4), (!Define_SMW_WayCool_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnWayCool)

.MoveRight:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Right1Tile, NoYMovement)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right7Pixels, Up2Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right7Pixels, Up7Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up1Tile)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left7Pixels, Up7Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left7Pixels, Up2Pixels)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_Groovy_XPosOfTile<<4), (!Define_SMW_Groovy_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnGroovy)

;---------------------------------------------------------------------------

Script_StandingOnLevel12E:
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_StandingOnLevel12F:
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_StandingOnStarWorld2:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterStarWorld2)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaSecret1_SecretExit1EventID, .MoveLeft)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld1_SecretExit1EventID, .MoveLeft)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld2_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfAllBitsClear(!RAM_SMW_IO_ControllerHold1, (!Joypad_DPadU>>8)|(!Joypad_DPadR>>8), +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld2_SecretExit1EventID, .MoveUpRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld2)

.MoveLeft:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWarp_StarRoad2ToVanillaSecret1_XPosOfTile<<4), (!Define_SMW_StarWarp_StarRoad2ToVanillaSecret1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_StarRoad2ToVanillaSecret1)

.MoveUpRight:
.SecretExit1Entry:
	%ScriptCommand_SetPlayerFacingDirection(Right)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWarp_StarRoad3ToSodaLake_XPosOfTile<<4), (!Define_SMW_StarWarp_StarRoad3ToSodaLake_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_StarRoad3ToSodaLake)

;---------------------------------------------------------------------------

Script_StandingOnLevel131:
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_StandingOnStarWorld3:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterStarWorld3)
	%ScriptCommand_8BitCheckIfAllBitsClear(!RAM_SMW_IO_ControllerHold1, (!Joypad_DPadL>>8)|(!Joypad_DPadU>>8), +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_SodaLake_NormalExitEventID, .MoveUpLeft)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld2_SecretExit1EventID, .MoveUpLeft)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld3_NormalExitEventID, .MoveUpLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld3_SecretExit1EventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld3)

.MoveUpLeft:
.NormalExitEntry:
	%ScriptCommand_SetPlayerFacingDirection(Left)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWarp_StarRoad3ToSodaLake_XPosOfTile<<4), (!Define_SMW_StarWarp_StarRoad3ToSodaLake_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_StarRoad3ToSodaLake)

.MoveRight:
.SecretExit1Entry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWarp_StarRoad4ToForestFortress_XPosOfTile<<4), (!Define_SMW_StarWarp_StarRoad4ToForestFortress_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_StarRoad4ToForestFortress)

;---------------------------------------------------------------------------

Script_StandingOnLevel133:
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_StandingOnStarWorld1:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterStarWorld1)
	%ScriptCommand_8BitCheckIfAllBitsClear(!RAM_SMW_IO_ControllerHold1, (!Joypad_DPadL>>8)|(!Joypad_DPadU>>8), +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld1_SecretExit1EventID, .MoveUpLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutSecretHouse_SecretExit1EventID, .MoveDown)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld5_NormalExitEventID, .MoveDown)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld1_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld1)

.MoveDown:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWarp_StarRoad1ToDonutSecretHouse_XPosOfTile<<4), (!Define_SMW_StarWarp_StarRoad1ToDonutSecretHouse_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_StarRoad1ToDonutSecretHouse)

.MoveUpLeft:
.SecretExit1Entry:
	%ScriptCommand_SetPlayerFacingDirection(Left)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWarp_StarRoad2ToVanillaSecret1_XPosOfTile<<4), (!Define_SMW_StarWarp_StarRoad2ToVanillaSecret1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_StarRoad2ToVanillaSecret1)

;---------------------------------------------------------------------------

Script_StandingOnStarWorld4:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterStarWorld4)
	%ScriptCommand_8BitCheckIfAllBitsClear(!RAM_SMW_IO_ControllerHold1, (!Joypad_DPadU>>8)|(!Joypad_DPadR>>8), +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestFortress_NormalExitEventID, .MoveUpRight)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld3_SecretExit1EventID, .MoveUpRight)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld4_NormalExitEventID, .MoveUpRight)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld4_SecretExit1EventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld4)

.MoveUpRight:
.NormalExitEntry:
	%ScriptCommand_SetPlayerFacingDirection(Right)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWarp_StarRoad4ToForestFortress_XPosOfTile<<4), (!Define_SMW_StarWarp_StarRoad4ToForestFortress_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_StarRoad4ToForestFortress)

.MoveDown:
.SecretExit1Entry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWarp_StarRoad5ToFrontDoor_XPosOfTile<<4), (!Define_SMW_StarWarp_StarRoad5ToFrontDoor_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_StarRoad5ToFrontDoor)

;---------------------------------------------------------------------------

Script_StandingOnStarWorld5:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterStarWorld5)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld5_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld5_SecretExit1EventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyOfBowser4_SecretExit1EventID, .MoveRight)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld3_SecretExit1EventID, .MoveRight)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld4_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld5)

.MoveLeft:
.NormalExitEntry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWarp_StarRoad1ToDonutSecretHouse_XPosOfTile<<4), (!Define_SMW_StarWarp_StarRoad1ToDonutSecretHouse_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_StarRoad1ToDonutSecretHouse)

.MoveUp:
.SecretExit1Entry:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_ClimbingSubpixelSpeed, !Define_SMW_Overworld_ClimbingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Climbing)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up2Tiles)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWarp_StarRoad5ToGnarly_XPosOfTile<<4), (!Define_SMW_StarWarp_StarRoad5ToGnarly_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_StarRoad5ToGnarly)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWarp_StarRoad5ToFrontDoor_XPosOfTile<<4), (!Define_SMW_StarWarp_StarRoad5ToFrontDoor_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode_NoSoundEntry)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_StarRoad5ToFrontDoor)

;---------------------------------------------------------------------------

Script_StandingOnLevel137:
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_StandingOnLevel138:
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_StandingOnLevel139:
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_StandingOnLevel13A:
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_StandingOnLevel13B:
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_StandingOnPipeWarp_DonutSecretHouseToDonutSecret2:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterPipeWarp_DonutSecretHouseToDonutSecret2)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutSecretHouse_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnPipeWarp_DonutSecretHouseToDonutSecret2)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_DonutSecretHouse_XPosOfTile<<4), (!Define_SMW_DonutSecretHouse_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutSecretHouse)

;---------------------------------------------------------------------------

Script_StandingOnPipeWarp_DonutSecret2ToDonutSecretHouse:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterPipeWarp_DonutSecret2ToDonutSecretHouse)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutSecretHouse_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnPipeWarp_DonutSecret2ToDonutSecretHouse)

.MoveUp:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_DonutSecret2_XPosOfTile<<4), (!Define_SMW_DonutSecret2_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutSecret2)

;---------------------------------------------------------------------------

Script_StandingOnPipeWarp_DonutSecret2ToDonutPlains3:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterPipeWarp_DonutSecret2ToDonutPlains3)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutSecret2_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnPipeWarp_DonutSecret2ToDonutPlains3)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_DonutSecret2_XPosOfTile<<4), (!Define_SMW_DonutSecret2_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutSecret2)

;---------------------------------------------------------------------------

Script_StandingOnPipeWarp_DonutPlains3ToDonutSecret2:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterPipeWarp_DonutPlains3ToDonutSecret2)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutSecret2_NormalExitEventID, .MoveLeft)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnPipeWarp_DonutPlains3ToDonutSecret2)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Left1Tile, NoYMovement)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Left1Tile, Up1Tile)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Up7Pixels)
	%ScriptCommand_ChangePlayerAnimation(Swimming)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Up7Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Up7Pixels)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_ClimbingSubpixelSpeed, !Define_SMW_Overworld_ClimbingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Climbing)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Up7Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Up4Pixels)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_DonutPlains3_XPosOfTile<<4), (!Define_SMW_DonutPlains3_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutPlains3)

;---------------------------------------------------------------------------

Script_StandingOnPipeWarp_VanillaSecret1ToVanillaSecret2:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterPipeWarp_VanillaSecret1ToVanillaSecret2)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaSecret1_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnPipeWarp_VanillaSecret1ToVanillaSecret2)

.MoveDown:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_VanillaSecret1_XPosOfTile<<4), (!Define_SMW_VanillaSecret1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaSecret1)

;---------------------------------------------------------------------------

Script_StandingOnPipeWarp_VanillaSecret2ToVanillaSecret1:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterPipeWarp_VanillaSecret2ToVanillaSecret1)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaSecret1_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnPipeWarp_VanillaSecret2ToVanillaSecret1)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_VanillaSecret2_XPosOfTile<<4), (!Define_SMW_VanillaSecret2_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaSecret2)

;---------------------------------------------------------------------------

Script_StandingOnPipeWarp_LemmysCastleToCheeseBridgeArea:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterPipeWarp_LemmysCastleToCheeseBridgeArea)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_LemmysCastle_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnPipeWarp_LemmysCastleToCheeseBridgeArea)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_JSRToScript(PathMacroScript_BottomRightQuarterCircle_EnterRight)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_LemmysCastle_XPosOfTile<<4), (!Define_SMW_LemmysCastle_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnLemmysCastle)

;---------------------------------------------------------------------------

Script_StandingOnPipeWarp_CheeseBridgeAreaToLemmysCastle:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterPipeWarp_CheeseBridgeAreaToLemmysCastle)
	%ScriptCommand_8BitCheckIfAllBitsClear(!RAM_SMW_IO_ControllerHold1, (!Joypad_DPadR>>8)|(!Joypad_DPadU>>8), +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_LemmysCastle_NormalExitEventID, .MoveUpRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnPipeWarp_CheeseBridgeAreaToLemmysCastle)

.MoveUpRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_CheeseBridgeArea_XPosOfTile<<4)-$18, (!Define_SMW_CheeseBridgeArea_YPosOfTile<<4)-$06)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_CheeseBridgeArea_XPosOfTile<<4), (!Define_SMW_CheeseBridgeArea_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnCheeseBridgeArea)

;---------------------------------------------------------------------------

Script_StandingOnPipeWarp_ChocolateIsland2ToChocolateSecret:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterPipeWarp_ChocolateIsland2ToChocolateSecret)
	%ScriptCommand_8BitCheckIfAllBitsClear(!RAM_SMW_IO_ControllerHold1, (!Joypad_DPadR>>8)|(!Joypad_DPadD>>8), +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateIsland2_SecretExit1EventID, .MoveDownRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnPipeWarp_ChocolateIsland2ToChocolateSecret)

.MoveDownRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Right5Tiles, Down4Tiles)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left4Pixels, Down7Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down1Tile)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left4Pixels, Down7Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Left1Tile, NoYMovement)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left7Pixels, Up7Pixels)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ChocolateIsland2_XPosOfTile<<4), (!Define_SMW_ChocolateIsland2_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateIsland2)

;---------------------------------------------------------------------------

Script_StandingOnPipeWarp_ChocolateSecretToChocolateIsland2:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterPipeWarp_ChocolateSecretToChocolateIsland2)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateIsland2_SecretExit1EventID, .MoveLeft)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnPipeWarp_ChocolateSecretToChocolateIsland2)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ChocolateSecret_XPosOfTile<<4), (!Define_SMW_ChocolateSecret_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateSecret)

;---------------------------------------------------------------------------

Script_StandingOnPipeWarp_ChocolateSecretToWendysCastle:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterPipeWarp_ChocolateSecretToWendysCastle)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateSecret_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnPipeWarp_ChocolateSecretToWendysCastle)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ChocolateSecret_XPosOfTile<<4), (!Define_SMW_ChocolateSecret_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnChocolateSecret)

;---------------------------------------------------------------------------

Script_StandingOnPipeWarp_WendysCastleToChocolateSecret:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterPipeWarp_WendysCastleToChocolateSecret)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ChocolateSecret_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnPipeWarp_WendysCastleToChocolateSecret)

.MoveDown:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down1Tile)
	%ScriptCommand_JSRToScript(PathMacroScript_BottomLeftQuarterCircle_EnterAbove)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_WendysCastle_XPosOfTile<<4), (!Define_SMW_WendysCastle_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnWendysCastle)

;---------------------------------------------------------------------------

Script_StandingOnPathExit_YoshisIsland1ToYellowSwitchPalace:
Script_StandingOnPathExit_YellowSwitchPalaceToYoshisIsland1:
Script_StandingOnPathExit_IggysCastleToDonutPlains1:
Script_StandingOnPathExit_DonutPlains1ToIggysCastle:
Script_StandingOnPathExit_MortonsCastleToVanillaDome1:
Script_StandingOnPathExit_VanillaDome1ToMortonsCastle:
Script_StandingOnPathExit_LudwigsCastleToForestOfIllusion1:
Script_StandingOnPathExit_ForestOfIllusion1ToLudwigsCastle:
Script_StandingOnPathExit_ForestSecretToForestFortress:
Script_StandingOnPathExit_ForestFortressToForestSecret:
Script_StandingOnPathExit_ForestOfIllusion3ToRoysCastle:
Script_StandingOnPathExit_RoysCastleToForestOfIllusion3:
Script_StandingOnPathExit_SunkenGhostShipToValleyOfBowser1:
Script_StandingOnPathExit_ValleyOfBowser1ToSunkenGhostShip:
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

Script_StandingOnStarWarp_DonutSecretHouseToStarRoad1:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterStarWarp_DonutSecretHouseToStarRoad1)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutSecretHouse_SecretExit1EventID, .MoveUp)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_DonutSecretHouseToStarRoad1)

.MoveUp:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_DonutSecretHouse_XPosOfTile<<4), (!Define_SMW_DonutSecretHouse_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnDonutSecretHouse)

;---------------------------------------------------------------------------

Script_StandingOnStarWarp_StarRoad1ToDonutSecretHouse:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterStarWarp_StarRoad1ToDonutSecretHouse)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_DonutSecretHouse_SecretExit1EventID, .MoveUp)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld5_NormalExitEventID, .MoveUp)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld5_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_StarRoad1ToDonutSecretHouse)

.MoveUp:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWorld1_XPosOfTile<<4), (!Define_SMW_StarWorld1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld1)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWorld5_XPosOfTile<<4), (!Define_SMW_StarWorld5_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld5)

;---------------------------------------------------------------------------

Script_StandingOnStarWarp_VanillaSecret1ToStarRoad2:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterStarWarp_VanillaSecret1ToStarRoad2)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaSecret1_SecretExit1EventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_VanillaSecret1ToStarRoad2)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_VanillaSecret1_XPosOfTile<<4), (!Define_SMW_VanillaSecret1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnVanillaSecret1)

;---------------------------------------------------------------------------

Script_StandingOnStarWarp_StarRoad2ToVanillaSecret1:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterStarWarp_StarRoad2ToVanillaSecret1)
	%ScriptCommand_8BitCheckIfAllBitsClear(!RAM_SMW_IO_ControllerHold1, (!Joypad_DPadR>>8)|(!Joypad_DPadD>>8), +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld1_SecretExit1EventID, .MoveDownRight)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_VanillaSecret1_SecretExit1EventID, .MoveRight)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld1_SecretExit1EventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_StarRoad2ToVanillaSecret1)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWorld2_XPosOfTile<<4), (!Define_SMW_StarWorld2_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld2)

.MoveDownRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWorld1_XPosOfTile<<4), (!Define_SMW_StarWorld1_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld1)

;---------------------------------------------------------------------------

Script_StandingOnStarWarp_SodaLakeToStarRoad3:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterStarWarp_SodaLakeToStarRoad3)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_SodaLake_NormalExitEventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_SodaLakeToStarRoad3)

.MoveDown:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down1Tile)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_ClimbingSubpixelSpeed, !Define_SMW_Overworld_ClimbingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Climbing)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down1Tile)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Swimming)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right4Pixels, Down7Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Right1Tile, NoYMovement)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right4Pixels, Up7Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right4Pixels, Up4Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up1Tile)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right4Pixels, Up7Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right4Pixels, Up4Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up2Tiles)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_SodaLake_XPosOfTile<<4), (!Define_SMW_SodaLake_YPosOfTile<<4)-$06)	
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnSodaLake)

;---------------------------------------------------------------------------

Script_StandingOnStarWarp_StarRoad3ToSodaLake:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterStarWarp_StarRoad3ToSodaLake)
	%ScriptCommand_8BitCheckIfAllBitsClear(!RAM_SMW_IO_ControllerHold1, (!Joypad_DPadL>>8)|(!Joypad_DPadD>>8), +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld2_SecretExit1EventID, .MoveDownLeft)
+:
	%ScriptCommand_8BitCheckIfAllBitsClear(!RAM_SMW_IO_ControllerHold1, (!Joypad_DPadR>>8)|(!Joypad_DPadD>>8), +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_SodaLake_NormalExitEventID, .MoveDownRight)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld2_SecretExit1EventID, .MoveDownRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_StarRoad3ToSodaLake)

.MoveDownLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWorld2_XPosOfTile<<4), (!Define_SMW_StarWorld2_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld2)

.MoveDownRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWorld3_XPosOfTile<<4), (!Define_SMW_StarWorld3_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld3)

;---------------------------------------------------------------------------

Script_StandingOnStarWarp_ForestFortressToStarRoad4:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterStarWarp_ForestFortressToStarRoad4)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestFortress_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_ForestFortressToStarRoad4)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ForestFortress_XPosOfTile<<4), (!Define_SMW_ForestFortress_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnForestFortress)

;---------------------------------------------------------------------------

Script_StandingOnStarWarp_StarRoad4ToForestFortress:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterStarWarp_StarRoad4ToForestFortress)
	%ScriptCommand_8BitCheckIfAllBitsClear(!RAM_SMW_IO_ControllerHold1, (!Joypad_DPadL>>8)|(!Joypad_DPadD>>8), +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ForestFortress_NormalExitEventID, .MoveDownLeft)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld3_SecretExit1EventID, .MoveDownLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld3_SecretExit1EventID, .MoveLeft)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_StarRoad4ToForestFortress)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWorld3_XPosOfTile<<4), (!Define_SMW_StarWorld3_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld3)

.MoveDownLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWorld4_XPosOfTile<<4), (!Define_SMW_StarWorld4_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld4)

;---------------------------------------------------------------------------

Script_StandingOnStarWarp_FrontDoorToStarRoad5:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterStarWarp_FrontDoorToStarRoad5)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyOfBowser4_SecretExit1EventID, .MoveRight)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld4_SecretExit1EventID, .MoveRight)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyOfBowser4_SecretExit1EventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_FrontDoorToStarRoad5)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_FrontDoor_XPosOfTile<<4), (!Define_SMW_FrontDoor_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnFrontDoor)

.MoveDown:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_ValleyOfBowser4_XPosOfTile<<4), (!Define_SMW_ValleyOfBowser4_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnValleyOfBowser4)

;---------------------------------------------------------------------------

Script_StandingOnStarWarp_StarRoad5ToFrontDoor:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterStarWarp_StarRoad5ToFrontDoor)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadL>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_ValleyOfBowser4_SecretExit1EventID, .MoveLeft)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld4_SecretExit1EventID, .MoveLeft)
+:
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadU>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld4_SecretExit1EventID, .MoveUp)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_StarRoad5ToFrontDoor)

.MoveLeft:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWorld5_XPosOfTile<<4), (!Define_SMW_StarWorld5_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld5)

.MoveUp:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWorld4_XPosOfTile<<4), (!Define_SMW_StarWorld4_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld4)

;---------------------------------------------------------------------------

Script_StandingOnStarWarp_StarRoad5ToGnarly:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterStarWarp_StarRoad5ToGnarly)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadD>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld5_SecretExit1EventID, .MoveDown)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_StarRoad5ToGnarly)

.MoveDown:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_ClimbingSubpixelSpeed, !Define_SMW_Overworld_ClimbingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Climbing)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down2Tiles)
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_StarWorld5_XPosOfTile<<4), (!Define_SMW_StarWorld5_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWorld5)

;---------------------------------------------------------------------------

Script_StandingOnStarWarp_GnarlyToStarRoad5:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterStarWarp_GnarlyToStarRoad5)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_StarWorld5_SecretExit1EventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_GnarlyToStarRoad5)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_Gnarly_XPosOfTile<<4), (!Define_SMW_Gnarly_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnGnarly)

;---------------------------------------------------------------------------

Script_StandingOnStarWarp_FunkyToYoshisHouse:
	%ScriptCommand_JSLToRoutine(HandlePlayerIdlingOnLevelFunctions)
	%EnterTileOnFaceButtonPress(Script_EnterStarWarp_FunkyToYoshisHouse)
	%ScriptCommand_8BitCheckIfBitsClear(!RAM_SMW_IO_ControllerHold1, !Joypad_DPadR>>8, +)
	%ScriptCommand_CheckIfXEventPassed(!Define_SMW_Funky_NormalExitEventID, .MoveRight)
+:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnStarWarp_FunkyToYoshisHouse)

.MoveRight:
	%ScriptCommand_SetPlayerSpeed(!Define_SMW_Overworld_WalkingSubpixelSpeed, !Define_SMW_Overworld_WalkingSpeedMultiplier)
	%ScriptCommand_MovePlayerToAbsoluteCoords((!Define_SMW_Funky_XPosOfTile<<4), (!Define_SMW_Funky_YPosOfTile<<4)-$06)
	%ScriptCommand_JSRToScript(Script_SharedStepOnLevelTileCode)
	%ScriptCommand_JumpToScriptAddress(Script_StandingOnFunky)

;---------------------------------------------------------------------------

;#############################################################################################################
;#############################################################################################################

; Script subroutines.

;---------------------------------------------------------------------------

; Jump to this script to do a pipe warp.

Script_SharedPipeEntryCode:
	%ScriptCommand_PlaySoundOrMusic(1DF9, IntoPipe)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Overworld_WarpToChosenEntranceFlag, $01)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Misc_ExitLevelAction, $00)
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_BeginOverworldWarp()
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

; Jump to this script to do a Star Road warp.

Script_SharedStarWarpEntryCode:
	%ScriptCommand_PlaySoundOrMusic(1DF9, GetCape)
	%ScriptCommand_ChangePlayerAnimation(StarWarp)
	%ScriptCommand_WaitXFrames($31)
	%ScriptCommand_JSRToRoutine(HandleStarWarpLaunch)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Overworld_WarpToChosenEntranceFlag, $01)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Misc_ExitLevelAction, $00)
	%ScriptCommand_ChangePlayerAnimation(Walking)
	%ScriptCommand_SetPlayerFacingDirection(Down)
	%ScriptCommand_BeginOverworldWarp()
	%ScriptCommand_EndScript()

;---------------------------------------------------------------------------

; JSR to this script to do a path exit transition and warp.

Script_SharedPathExitEntryCode:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Overworld_WarpToChosenEntranceFlag, $01)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Overworld_HDMATransitionEffectFlag, $00)
	%ScriptCommand_DoPathExitTransition()
	%ScriptCommand_RTSToScript()

;---------------------------------------------------------------------------

; JSR to this script to do a standard level entry animation.

Script_SharedEnterLevelCode:
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Player_CurrentCharacter, $00, .IsMario)
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Overworld_LuigiAnimationState, !Const_SMW_OWPlayerAnimation_Walking, .EnterLandLevel)
	%ScriptCommand_JumpToScriptAddress(.IsLuigi)

.IsMario:
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Overworld_MarioAnimationState, !Const_SMW_OWPlayerAnimation_Walking, .EnterLandLevel)
.IsLuigi:
	%ScriptCommand_ChangePlayerAnimation(EnterLevelInWater)
	%ScriptCommand_JumpToScriptAddress(.EnterWaterLevel)

.EnterLandLevel:
	%ScriptCommand_ChangePlayerAnimation(EnterLevelOnLand)
.EnterWaterLevel:
	%ScriptCommand_SetPlayerFacingDirection(Down)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Overworld_WarpToChosenEntranceFlag, $01)
	%ScriptCommand_PlaySoundOrMusic(1DFB, MusicFade)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Misc_MusicRegisterBackup, $00)
	%ScriptCommand_PlaySoundOrMusic(1DFC, Coin)
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_BeginLevelWarp()

;---------------------------------------------------------------------------

; JSR to this script to handle what happens when Mario reaches his destination during path movement.

Script_SharedStepOnLevelTileCode:
	%ScriptCommand_PlaySoundOrMusic(1DFC, StepOnLevelTile)
.NoSoundEntry:
	%ScriptCommand_JSLToRoutine(HandleLevelTileCollision_ScriptEntry)
	%ScriptCommand_WaitXFrames($10)
	%ScriptCommand_SetPlayerFacingDirection(Down)
-:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Misc_ColorOfPalaceSwitchPressed1, $00)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Misc_CurrentlyActiveBossEndCutscene, $00)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Player_OverworldSubXPosLo, $0000)
	%ScriptCommand_16BitStoreByteToRAM(!RAM_SMW_Player_OverworldSubYPosLo, $0000)
if !Define_SMW_Overworld_EnableSavePromptOnLevels == !TRUE
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Flag_ShowSavePrompt, $01, .NoSavePrompt)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Flag_ShowSavePrompt, $00)
	%ScriptCommand_DisplayPrompt($00)
.NoSavePrompt:
endif
	%ScriptCommand_8BitBranchIfEqual(!RAM_SMW_Misc_ExitLevelAction, $00, .Return)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Misc_ExitLevelAction, $00)
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Flag_TwoPlayerGame, $00, .SwitchPlayers)
.Return:
	%ScriptCommand_RTSToScript()

.NoMoveEntry:
	%ScriptCommand_JSLToRoutine(HandleLevelTileCollision_ScriptEntry)
	%ScriptCommand_JumpToScriptAddress(-)

.SwitchPlayers:
	%ScriptCommand_JSLToRoutine(HandlePlayerSwitch)
	%ScriptCommand_RTSToScript()

;---------------------------------------------------------------------------

; Jump to the following scripts to recreate certain path configurations to make vanilla style overworld movement easier.

PathMacroScript_TopLeftQuarterCircle:
.EnterLeft:
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Left1Tile, NoYMovement)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left7Pixels, Down4Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left5Pixels, Down5Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left4Pixels, Down7Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down1Tile)
	%ScriptCommand_RTSToScript()

.EnterBelow:
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up1Tile)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right4Pixels, Up7Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right5Pixels, Up5Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right7Pixels, Up4Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Right1Tile, NoYMovement)
	%ScriptCommand_RTSToScript()

PathMacroScript_TopRightQuarterCircle:
.EnterRight:
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Right1Tile, NoYMovement)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right7Pixels, Down4Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right5Pixels, Down5Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right4Pixels, Down7Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down1Tile)
	%ScriptCommand_RTSToScript()

.EnterBelow:
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up1Tile)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left4Pixels, Up7Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left5Pixels, Up5Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left7Pixels, Up4Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Left1Tile, NoYMovement)
	%ScriptCommand_RTSToScript()

PathMacroScript_BottomLeftQuarterCircle:
.EnterLeft:
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Left1Tile, NoYMovement)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left7Pixels, Up4Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left5Pixels, Up5Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left4Pixels, Up7Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up1Tile)
	%ScriptCommand_RTSToScript()

.EnterAbove:
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down1Tile)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right4Pixels, Down7Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right5Pixels, Down5Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right7Pixels, Down4Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Right1Tile, NoYMovement)
	%ScriptCommand_RTSToScript()

PathMacroScript_BottomRightQuarterCircle:
.EnterRight:
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Right1Tile, NoYMovement)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right7Pixels, Up4Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right5Pixels, Up5Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right4Pixels, Up7Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Up1Tile)
	%ScriptCommand_RTSToScript()

.EnterAbove:
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(NoXMovement, Down1Tile)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left4Pixels, Down7Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left5Pixels, Down5Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left7Pixels, Down4Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Left1Tile, NoYMovement)
	%ScriptCommand_RTSToScript()

PathMacroScript_VerticalSBendLeft:
.EnterAbove:
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Down7Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Down7Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Left1Tile, Down2Tiles)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Down2Pixels)
	%ScriptCommand_RTSToScript()

.EnterBelow:
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Up6Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Up8Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Right1Tile, Up2Tiles)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Up2Pixels)
	%ScriptCommand_RTSToScript()

PathMacroScript_VerticalSBendRight:
.EnterAbove:
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Down7Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Down7Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Right1Tile, Down2Tiles)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Down2Pixels)
	%ScriptCommand_RTSToScript()

.EnterBelow:
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Up6Pixels)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Up8Pixels)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Left1Tile, Up2Tiles)
	%ScriptCommand_MovePlayerToRelativeFineCoords(NoXMovement, Up2Pixels)
	%ScriptCommand_RTSToScript()

PathMacroScript_HorizontalSBendUp:
.EnterLeft:
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right7Pixels, NoYMovement)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right7Pixels, NoYMovement)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Right2Tiles, Up1Tile)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right2Pixels, NoYMovement)
	%ScriptCommand_RTSToScript()

.EnterRight:
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left6Pixels, NoYMovement)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left8Pixels, NoYMovement)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Left2Tiles, Down1Tile)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left2Pixels, NoYMovement)
	%ScriptCommand_RTSToScript()

PathMacroScript_HorizontalSBendDown:
.EnterLeft:
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right7Pixels, NoYMovement)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right7Pixels, NoYMovement)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Right2Tiles, Down1Tile)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Right2Pixels, NoYMovement)
	%ScriptCommand_RTSToScript()

.EnterRight:
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left6Pixels, NoYMovement)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left8Pixels, NoYMovement)
	%ScriptCommand_MovePlayerToRelativeCoarseCoords(Left2Tiles, Up1Tile)
	%ScriptCommand_MovePlayerToRelativeFineCoords(Left2Pixels, NoYMovement)
	%ScriptCommand_RTSToScript()

;---------------------------------------------------------------------------

; JSR to this script to begin an earthquake event, like Sunken Ghost Ship in the vanilla game.

Script_InitializeEarthquakeEvent:
	%ScriptCommand_PlaySoundOrMusic(1DFB, BowsersValleyRevealed)
	%ScriptCommand_WaitXFrames($20)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Overworld_ShakingIntensity, $04)
	%ScriptCommand_WaitXFrames($20)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Overworld_ShakingIntensity, $06)
	%ScriptCommand_WaitXFrames($40)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Overworld_ShakingIntensity, $04)
	%ScriptCommand_RTSToScript()

;---------------------------------------------------------------------------

; JSR to this script to wait for an earthquake to finish before proceeding.

Script_EndOfEarthquakeEvent:
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Overworld_ShakingIntensity, $02)
	%ScriptCommand_WaitXFrames($30)
	%ScriptCommand_8BitStoreByteToRAM(!RAM_SMW_Overworld_ShakingIntensity, $00)
	%ScriptCommand_WaitXFrames($20)
.CheckIfEarthquakeEnded:
	%ScriptCommand_8BitBranchIfNotEqual(!RAM_SMW_Overworld_ShakingScreenTimer, $00, .WaitForEathquakeToEnd)
	%ScriptCommand_RTSToScript()

.WaitForEathquakeToEnd:
	%ScriptCommand_WaitXFrames($01)
	%ScriptCommand_JumpToScriptAddress(.CheckIfEarthquakeEnded)

;---------------------------------------------------------------------------

;#############################################################################################################
;#############################################################################################################
