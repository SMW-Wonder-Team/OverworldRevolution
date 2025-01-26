
; This patch expands the level/event tables to accomidate 256 of each instead of 96/120. It also makes some tweaks to move around the saved RAM addresses if needed.
; If "!Define_SMW_Global_UsingAltSaveSystem" is set to !TRUE, then most of this patch is ignored so you can use that save system without this patch interfering.
; Regardless, if you're using a patch that references any of the saved RAM addresses, you'll need to modify them to account for those addresses being remapped.
; I've listed what the below defines RAM address used to be so you'll know what they are in other patches.

if !SA1ROM == !TRUE
	!SRAM_SMW_MarioA_StartLocation = $41C000
else
	!SRAM_SMW_MarioA_StartLocation = $700000
endif

if !Define_SMW_Overworld_EnableMoreLevelsAndEvents == !TRUE
!RAM_SMW_Overworld_LevelStatusFlags #= $001EA2|!Base2								; $7E1EA2-$7E1F01
!RAM_SMW_Overworld_EventFlags #= $001FA2|!Base2									; $7E1F02-$7E1F10
!RAM_SMW_Overworld_MarioMap #= $001FC2|!Base2										; $7E1F11
!RAM_SMW_Overworld_LuigiMap #= !RAM_SMW_Overworld_MarioMap+$02					; $7E1F12
!RAM_SMW_Overworld_MarioAnimationState #= $001FC6|!Base2							; $7E1F13-$7E1F14
!RAM_SMW_Overworld_LuigiAnimationState #= $001FC8|!Base2							; $7E1F15-$7E1F16
!RAM_SMW_Overworld_MarioXPosLo #= $001FCA|!Base2									; $7E1F17-$7E1F18
!RAM_SMW_Overworld_LuigiXPosLo #= !RAM_SMW_Overworld_MarioXPosLo+$02			; $7E1F1B-$7E1F1C
!RAM_SMW_Overworld_MarioYPosLo #= !RAM_SMW_Overworld_MarioXPosLo+$04			; $7E1F19-$7E1F1A
!RAM_SMW_Overworld_LuigiYPosLo #= !RAM_SMW_Overworld_MarioXPosLo+$06			; $7E1F1D-$7E1F1E
!RAM_SMW_Overworld_MusicOverride #= $001FD2|!Base2								; N/A
!RAM_SMW_Global_SavedGameStateFlags #= $001FD3|!Base2								; N/A
!RAM_SMW_Counter_EventsTriggered #= $001FD4|!Base2								; $7E1F2E
else
!RAM_SMW_Overworld_LevelStatusFlags #= $001EA2|!Base2
!RAM_SMW_Overworld_EventFlags #= $001F02|!Base2
!RAM_SMW_Overworld_MarioMap #= $001F11|!Base2
!RAM_SMW_Overworld_LuigiMap #= !RAM_SMW_Overworld_MarioMap+$02
!RAM_SMW_Overworld_MarioAnimationState #= $001F15|!Base2
!RAM_SMW_Overworld_LuigiAnimationState #= $001F17|!Base2
!RAM_SMW_Overworld_MarioXPosLo #= $001F19|!Base2
!RAM_SMW_Overworld_LuigiXPosLo #= !RAM_SMW_Overworld_MarioXPosLo+$02
!RAM_SMW_Overworld_MarioYPosLo #= !RAM_SMW_Overworld_MarioXPosLo+$04
!RAM_SMW_Overworld_LuigiYPosLo #= !RAM_SMW_Overworld_MarioXPosLo+$06
!RAM_SMW_Overworld_MusicOverride #= $001F21|!Base2
!RAM_SMW_Global_SavedGameStateFlags #= $001F22|!Base2
;Empty $001F23-$001F2C
!RAM_SMW_Counter_EventsTriggered #= $001F2D|!Base2
endif
!Define_SMW_Misc_SaveFileSize #= !RAM_SMW_Counter_EventsTriggered-!RAM_SMW_Overworld_LevelStatusFlags+$04

!Const_SMW_LevelStatusFlags_CollectedAll1upCheckpoints = $01					; $7E1F3C-$7E1F47
!Const_SMW_LevelStatusFlags_CollectedAllYoshiCoins = $02						; $7E1F2F-$7E1F3A
!Const_SMW_LevelStatusFlags_Collected3UpMoon = $04							; $7E1FEE-$7E1FF9
!Const_SMW_LevelStatusFlags_UnusedBit1 = $08									; N/A
!Const_SMW_LevelStatusFlags_UnusedBit2 = $10									; N/A
!Const_SMW_LevelStatusFlags_UnusedBit3	= $20									; N/A
!Const_SMW_LevelStatusFlags_GotMidpoint = $40									; N/A
!Const_SMW_LevelStatusFlags_LevelBeaten = $80									; N/A

!Const_SMW_SavedGameStateFlags_ActiveGreenSwitch = $01						; $7E1F27
!Const_SMW_SavedGameStateFlags_ActiveYellowSwitch = $02						; $7E1F28
!Const_SMW_SavedGameStateFlags_ActiveBlueSwitch = $04							; $7E1F29
!Const_SMW_SavedGameStateFlags_ActiveRedSwitch = $08							; $7E1F2A
!Const_SMW_SavedGameStateFlags_YoshiWasSaved = $10							; $7E0EF8
!Const_SMW_SavedGameStateFlags_AltSP1GFX = $20									; N/A
!Const_SMW_SavedGameStateFlags_AltKoopaColors = $40							; N/A
!Const_SMW_SavedGameStateFlags_AltOWPalettes = $80							; N/A

org $009BDF																		; Remove a reference to the save buffer in the save routine.
	dw !RAM_SMW_Overworld_LevelStatusFlags

org $009EF0|!FastROM																; Make it easy to set Mario and Luigi's initial position on the overworld.
	dw !Define_SMW_Overworld_MarioStartingMap-!Define_SMW_Overworld_FirstMapSublevel,!Define_SMW_Overworld_LuigiStartingMap-!Define_SMW_Overworld_FirstMapSublevel
	dw !Define_SMW_Overworld_MarioStartingAnimation,!Define_SMW_Overworld_LuigiStartingAnimation
	dw !Define_SMW_Overworld_MarioStartingXPos,!Define_SMW_Overworld_LuigiStartingXPos
	dw !Define_SMW_Overworld_MarioStartingYPos,!Define_SMW_Overworld_LuigiStartingYPos
	padbyte $FF : pad SMW_InitializeSaveData_Main
	assert pc() <= SMW_InitializeSaveData_Main

org $009F06|!FastROM												;\ Account for the save file size potentially being expanded.
	REP.b #$10														;| Also, disable initializing the level setting flags beyond zeroing them out, since it's no longer necessary.
	LDX.w #!Define_SMW_Misc_SaveFileSize-$02						;|
-:																	;|
	STZ.w !RAM_SMW_Overworld_LevelStatusFlags,x				;|
	DEX																;|
	BPL.b -														;|
	SEP.b #$10														;|
	BRA.b CODE_009F1D												;|
	padbyte $EA : pad SMW_InitializeSaveData_CODE_009F18		;|
	assert pc() <= SMW_InitializeSaveData_CODE_009F18			;|
																	;| LM inserts a hijack here even if you don't insert the overworld.
																	;/ I'm not going to touch it so LM won't try to re-insert it.

org $009F1D|!FastROM												;\ The number of player bytes that need to be initialized is lower than vanilla.
CODE_009F1D:														;|
	LDX.b #$0F														;/

org $009F23|!FastROM												;\ Remap the various references to the RAM address tracking what overworld map the player is on.
	dw !RAM_SMW_Overworld_MarioMap								;| A few of these need further adjustments to account for this RAM address now being 16-bit.
																	;| A couple are unused, but I'm changing for consistency.
org $05D7C5|!FastROM												;| And a few are overwritten by other hijacks.
	LDY.w !RAM_SMW_Player_CurrentCharacterX2Lo					;|
	BRA.b +														;|
	NOP																;|
+:																	;|
	LDA.w !RAM_SMW_Overworld_MarioMap,y							;|
																	;|
org $0096D3|!FastROM												;|
	dw !RAM_SMW_Overworld_MarioMap								;|
																	;|
org $05D8AE|!FastROM												;|
	LDA.w !RAM_SMW_Overworld_MarioMap							;|
																	;|
org $00C9DC|!FastROM												;|
	dw !RAM_SMW_Overworld_MarioMap								;/

org $009777|!FastROM												;\ Disable clearing the collectable flags on game over, as they're now cleared when the file is reloaded.
	BRA.b +														;|
	NOP #12														;|
+:																	;/

org $00F31E|!FastROM														;\ Change how the game tracks collectables.
	JSL.l SetCollectionFlag_3UpMoon										;|
	BRA.b +																;|
	NOP #5																	;|
+:																			;|
																			;|
org $00F2B0|!FastROM														;|
	JSL.l SMW_TriggerHidden1up_Main										;|
	JSL.l SetCollectionFlag_1upCheckpoints								;|
	BRA.b +																;|
	NOP #5																	;|
+:																			;|
																			;|
org $00F34D|!FastROM														;|
	JSL.l SetCollectionFlag_YoshiCoins									;|
	BRA.b +																;|
	NOP #5																	;|
+:																			;|
																			;|
org $0DA589|!FastROM														;|
	REP.b #$10																;|
	LDY.w !RAM_SMW_Overworld_LevelNumberLo								;|
	LDA.b !RAM_SMW_Misc_ScratchRAM00									;|
	CMP.b #$08																;|
	BNE.b Check1upCheckpointFlag											;|
	LDA.w !RAM_SMW_Overworld_LevelStatusFlags,y						;|
	AND.b #!Const_SMW_LevelStatusFlags_Collected3UpMoon				;|
	BRA.b +																;|
																			;|
Check1upCheckpointFlag:													;|
	LDA.w !RAM_SMW_Overworld_LevelStatusFlags,y						;|
	AND.b #!Const_SMW_LevelStatusFlags_CollectedAll1upCheckpoints	;|
+:																			;|
	SEP.b #$10																;|
	BEQ.b CODE_0DA5B1														;|
	RTS																		;|
	padbyte $EA : pad $0DA5B1|!FastROM									;|
	assert pc()	<= $0DA5B1|!FastROM										;|
																			;|
org $0DA5B1|!FastROM														;|
CODE_0DA5B1:																;|
																			;|
org $0DB2CA|!FastROM														;|
	REP.b #$10																;|
	LDY.w !RAM_SMW_Overworld_LevelNumberLo								;|
	LDA.w !RAM_SMW_Overworld_LevelStatusFlags,y						;|
	AND.b #!Const_SMW_LevelStatusFlags_CollectedAllYoshiCoins		;|
	SEP.b #$10																;|
	BEQ.b CODE_0DB2E0														;|
	RTS																		;|
	padbyte $EA : pad $0DB2E0|!FastROM									;|
	assert pc()	<= $0DB2E0|!FastROM										;|
																			;|
org $0DB2E0|!FastROM														;|
CODE_0DB2E0:																;/

org $0DB940|!FastROM														;\ Change the way that the active switch palaces are tracked to save on RAM.
	LDA.w !RAM_SMW_Global_SavedGameStateFlags							;| Because the low byte of the Active and Inactive switch blocks are the same, I can save 6 bytes by not reading a separate table, which is enough to fit this change in without jumping away.
	AND.l SMW_HandleMenuCursor_DATA_009E7E+$02,x						;| 4 byte bit table. All the standard 8 byte bit tables are in the opposite order.
	BEQ.b CODE_0DB94E														;|
	JSR.w SMW_SetMap16HighByteForCurrentObject_Page01					;|
	NOP #2																	;|
CODE_0DB94E:																;|
																			;|
org $0DB58F|!FastROM														;| The routine for the yellow/green switch block needs a bigger modification.
	JSR.w SMW_SetMap16HighByteForCurrentObject_Page01					;|
	LDA.w !RAM_SMW_Global_SavedGameStateFlags							;|
	AND.l SMW_HandleMenuCursor_DATA_009E7E,x							;|
	BNE.b +																;|
	JSR.w SMW_SetMap16HighByteForCurrentObject_Page00					;|
+:																			;|
	LDA.l SMW_ExtendedObj8E_YellowSwitchBlock_InactiveTiles,x		;|
	STA.b [!RAM_SMW_Pointer_LoMap16BlockDataLo],y						;|
	RTS																		;/
	padbyte $EA : pad SMW_GrasslandObj3F_SmallBushes_LeftTiles
	assert pc() <= SMW_GrasslandObj3F_SmallBushes_LeftTiles

org $00EEAE|!FastROM														;\ Change how the switch palace switch checks if its associated block is active.
	JML.l SwitchPalaceSwitchInteractionHack							;|
	padbyte $EA : pad SMW_RunPlayerBlockCode_CODE_00EEB7				;|
	assert pc() <= SMW_RunPlayerBlockCode_CODE_00EEB7					;|
																			;|
org $0DEC96|!FastROM														;|
	JSL.l SwitchPalaceObjectHack											;/

if read1($03BCA0) == $FF											;\ If LM's sprite 19 fix isn't installed for whatever reason, delete two instructions that write to the save buffer and Mario's overworld map.
org $01E762|!FastROM												;| Mainly since setting Mario's initial map isn't necessary to do within this sprite now.
	BRA.b +														;|
	NOP #4															;|
+:																	;|
elseif read1($03BCA0) != $6B										;| If LM's sprite 19 fix is installed, insert an RTL to disable it.
	org $03BCA0|!FastROM											;| In addition to the above, it's also not necessary to save the game through this sprite.
		RTL															;/ I have to do it this way or else LM will keep inserting the hijack.
endif

org $00CA06|!FastROM												;\ Change how the cutscene triggering levels are handled.
	JML.l CheckForLevelsThatTriggerCutscenes					;|
	padbyte $EA : pad SMW_PlayerState00_Normal_CODE_00CA20		;|
	assert pc() <= SMW_PlayerState00_Normal_CODE_00CA20		;/

org $05D9C6|!FastROM													;\ Change how the midpoint flag is checked for.
	JSL.l CheckMidpointFlagOnLevelLoad								;|
	SEP.b #$10															;|
	BRA.b +															;| Also, there is no need to set the event number ID here.
	NOP #12															;| 
+:																		;|
	;AND.b #!Const_SMW_LevelStatusFlags_GotMidpoint				;| This is commented out just in the off chance the retry patch is being used.
																		;|
org $0DA68E|!FastROM													;|
	JSL.l CheckMidPointFlagHack										;|
	BRA.b +															;|
	NOP #3																;|
+:																		;/

org $00A261|!FastROM
	JSL.l StartSelectHack
	NOP #2
if !Define_SMW_Overworld_AllowStartSelectToExitPassedLevels == !TRUE
	db $F0
else
	db $80
endif

org $009E10|!FastROM																;\ Prevent updating the overworld tilemap or loading the save buffer on player selection
	STZ.w !RAM_SMW_Player_CurrentCharacter										;|
	STZ.w !RAM_SMW_Player_CurrentCharacterX2Lo									;|
	NOP																				;/

org $809E5F|!FastROM																;\ Don't initialize the current player here, as it breaks on game over. 
	BRA.b +																		;|
	NOP																				;|
+:																					;/

if !Define_SMW_Global_UsingAltSaveSystem == !FALSE
org $009B54|!FastROM												; Adjust the pointers and references to the size of the save files to account for their increased size.
	dw !Define_SMW_Misc_SaveFileSize

org $009B5D|!FastROM
	dw !SRAM_SMW_MarioA_StartLocation+(!Define_SMW_Misc_SaveFileSize*$03)

org $009BF1|!FastROM
	dw !Define_SMW_Misc_SaveFileSize-$02

org $009C02|!FastROM
	dw !Define_SMW_Misc_SaveFileSize*$03

org $009C08|!FastROM
	dw (!Define_SMW_Misc_SaveFileSize*$02)+$02

org $009CCB|!FastROM
	db (!Define_SMW_Misc_SaveFileSize*$00)>>8
	db (!Define_SMW_Misc_SaveFileSize*$01)>>8
	db (!Define_SMW_Misc_SaveFileSize*$02)>>8
	db (!Define_SMW_Misc_SaveFileSize*$00)
	db (!Define_SMW_Misc_SaveFileSize*$01)
	db (!Define_SMW_Misc_SaveFileSize*$02)

org $009DC1|!FastROM
	dw !Define_SMW_Misc_SaveFileSize*$03

org $009DC7|!FastROM
	dl !SRAM_SMW_MarioA_StartLocation+(!Define_SMW_Misc_SaveFileSize-$02)

org $009DCF|!FastROM
	dw !Define_SMW_Misc_SaveFileSize-$02

org $009DEE|!FastROM
	dw (!Define_SMW_Misc_SaveFileSize*$03)-$01

org $009CF7|!FastROM																;\ Change the way the file select routine loads a save file.
	JML.l LoadSaveFileData_FileSelectEntry										;/
endif
