asar 1.90
; Overworld Revolution Patch by Yoshifanatic
; This patch reworks the SMW overworld to use level tilemaps instead of its own to allow for far larger overworlds.
; As a consequence of this change, many aspects of the overworld have also been made more flexible.
; For example, path movement and events now use a scripting language to handle them.
; This patch has all the functionality of the vanilla overworld and much, much more.

; Note: I highly recommend inserting this patch: https://www.smwcentral.net/?p=section&a=details&id=28028
; That will reduce the likelyhood of the top of the screen flickering during events.

org $008000
print ""
print "---------------------------------------------------------------------------"
print ""

incsrc "Defines.asm"

!TEMP = 0
if read1($05D7B9) != $22
	!TEMP = 1
endif

if read3($00A5C0)&(!FastROM^$FFFFFF) == $05BE8A
	!TEMP = 1
endif

if read1($00A5E1) == $A9
	!TEMP = 1
endif

if read1($0583B8) == $AD
	!TEMP = 1
endif

if !TEMP == 1
	print ""
	error "One or more Lunar Magic ASM hacks are missing that this patch needs to function. Please save a level after doing each of the following:"
	print "- Changing the horizontal level mode of a level."
	print "- Setting a level to use a custom palette."
	print "- Toggling a level's ExAnimation settings or inserting an ExAnimation."
	print "- Enabling Super GFX Bypass."
	print ""
	print "Alternatively, inserting any of the provided .mwl files will do all of the above."
endif

;#############################################################################################################
;#############################################################################################################

incsrc "ExpandAvailableLevelAndEventSlots.asm"

if read4($048000) != $524F4659	; "YFOR"
	incsrc "DeleteOriginalOverworldData.asm"
endif

org $02A861|!FastROM				; Hijack the level sprite parser routine to allow overworld sprites to be loaded by this routine.
	JML.l LoadOverworldSpritesHack

org $05DAE1|!FastROM
	LDA.w !RAM_SMW_Global_GameStateFlags
	AND.b #!Const_SMW_GameStateFlags_EnableChocolateIsland2Gimmick
if !Define_SMW_Overworld_EnableLevel024Gimmick == !TRUE
	db $F0
else
	db $80
endif

if read2($0FF195|!FastROM) != $FFFF					;\ Disable a check in Lunar Magic's ASM for the overworld that would prevent the BG2/BG3 graphics slots from being used.
org $0FF195											;|
	NOP #2												;|
endif													;/

org $05DA1C|!FastROM									; Change how the game determines what No-Yoshi intro to use.
	LDA.w !RAM_SMW_Misc_GameMode
	EOR.b #$11
	ORA.w !RAM_SMW_Counter_SublevelsEntered
	ORA.w !RAM_SMW_Flag_ShowPlayerStart
	ORA.w !RAM_SMW_Flag_DisableNoYoshiIntro
	ORA.w !RAM_SMW_Misc_IntroLevelFlag
	BEQ.b +
-:
	JMP.w SMW_SpecifySublevelToLoad_CODE_05DAD7

+:
	LDX.w !RAM_SMW_NoYoshiIntro_TypeToUse
	CPX.b #$FF
	BEQ.b -
	BRA.b +
	padbyte $EA : pad SMW_SpecifySublevelToLoad_CODE_05DA60
	assert pc() <= SMW_SpecifySublevelToLoad_CODE_05DA60
+:

org $05B15B|!FastROM						; Prevent the intro message from messing with Mario's position. And also set a temp flag that makes the intro script run.
	LDA.b #$01
	STA.w !RAM_SMW_Overworld_RunIntroScriptFlag

org $0084E5|!FastROM					;\ Remap these stripe image pointers.
	dl DisplayScrollArrows			;|
	dl RemoveScrollArrows				;|
	dl ClearPromptWindowImage		;/

org $03DFFC|!FastROM											;\ Fix the Bowser fight lightning, as these tables got moved elsewhere.
	dl OWSpr10_LightningGenerator_DATA_04F700+$08			;|
																;|
org $03E003|!FastROM											;|
	dl OWSpr10_LightningGenerator_DATA_04F6F8				;|
																;|
org $03E00A|!FastROM											;|
	dl OWSpr10_LightningGenerator_DATA_04F700				;/

if !SA1ROM == !TRUE
org $02A984|!FastROM
	JML.l HandleAltKoopaColorsCheck
	NOP #2
else
org $02A985|!FastROM
	JML.l HandleAltKoopaColorsCheck
	NOP
endif
CODE_02A98A:

org $00AA73|!FastROM
	JML.l HandleAltSpriteGraphicsCheck1
	NOP
CODE_00AA78:

org $019825|!FastROM
	JML.l HandleAltSpriteGraphicsCheck2
	NOP
CODE_01982A:

org $01B9CC|!FastROM
	JML.l HandleAltSpriteGraphicsCheck3
	NOP
CODE_01B9D1:

org $0CAE0E|!FastROM
	JML.l HandleAltSpriteGraphicsCheck4
	NOP
CODE_0CAE13:

org $01EC29|!FastROM											; Change how the game determines whether Yoshi displays his saved message when saved.
	JML.l HandleYoshiSavedMessage
	NOP #14
CODE_01EC3B:

org $01E2F3|!FastROM											; Change how the game determines if monty moles should emerge faster.
	LDY.b #$68
	LDA.w !RAM_SMW_Global_GameStateFlags
	AND.b #!Const_SMW_GameStateFlags_SlowMoles
	BNE.b +
	LDY.b #$20
+:
	TYA
	BRA.b +
	padbyte $EA : pad SMW_NorSprXXX_SmallMontyMole_Status08_CODE_01E302
+:
	assert pc() <= SMW_NorSprXXX_SmallMontyMole_Status08_CODE_01E302

org $02DA79|!FastROM											;\ Change how the game determines if a hammer bro should throw hammers more often.
	JSL.l HandleHammerBrosAggression						;|
	BRA.b +													;|
	NOP															;|
+:																;|
																;|
org $02DA8E|!FastROM											;|
	db $00														;/

org $0392F8|!FastROM												;\ Change how the create/eat block determines if it should use the Roy's Castle or Larry's Castle path.
	LDA.w !RAM_SMW_Global_GameStateFlags						;|
	AND.b #!Const_SMW_GameStateFlags_SubmapCreateBlockPath	;|
	ASL																;|
	ASL																;|
	ASL																;/

org $01E526|!FastROM												;\ Change how the game determines if normal sprite 32 (Ledge Dry Bones) is able to throw bones.
	LDA.w !RAM_SMW_Global_GameStateFlags						;|
	AND.b #!Const_SMW_GameStateFlags_Sprite32ThrowsBones		;|
	db $F0															;|
																	;|
org $01E5A0|!FastROM												;|
	LDA.w !RAM_SMW_Global_GameStateFlags						;|
	AND.b #!Const_SMW_GameStateFlags_Sprite32ThrowsBones		;|
	db $F0															;/

org $009696|!FastROM											; Remove the check for if you're standing on Yoshi's House to determine if "Mario Start!" should appear.
	LDA.w !RAM_SMW_Global_GameStateFlags					; That's now handled in a new way.
	AND.b #!Const_SMW_GameStateFlags_DisablePlayerStart
	ORA.w !RAM_SMW_Counter_SublevelsEntered
	ORA.w !RAM_SMW_Misc_IntroLevelFlag
	BNE.b CODE_0096AB
	LDA.b #!Const_SMW_GameStateFlags_DisablePlayerStart
	TSB.w !RAM_SMW_Global_GameStateFlags

org $0096AB|!FastROM
CODE_0096AB:

org $009BC0|!FastROM												;\ Change how the save prompt works.
	JSL.l HandleSaveGame											;|
	JSL.l BeginClosingOverworldPrompt							;/

if read3($0FF9E0) != $FFFFFF
org $0FF989|!FastROM												;\ Make it so that Lunar Magic will handle layer 3 graphics on the overworld the same way as it does for levels.
	BEQ.b CODE_0FF9F7												;|
																	;|
org $0FF9F7|!FastROM												;|
CODE_0FF9F7:														;/
endif

org $008222|!FastROM
	JSR.w SMW_UploadLevelAnimations_Main						;\ Modify part of the V-Blank routine used by the overworld with some new functions.
	JSL.l ExtraOverworldVBlankStuff								;|
if !Define_SMW_Overworld_DisplayBorderMario == !TRUE				;|
	JSR.w SMW_UploadPlayerGFX_Main								;|
else																;|
	NOP #3															;|
endif																;|
	JMP.w SMW_VBlankRoutine_CODE_00823D							;|
	padbyte $EA : pad SMW_VBlankRoutine_CODE_00823D				;|
	assert pc() <= SMW_VBlankRoutine_CODE_00823D				;/

org $00827C														;\ Make it possible to change layer 3's position on the overworld.
	JML.l Layer3Fix												;|
	NOP															;/

org $05DBC9|!FastROM												; Rewrite this routine so it doesn't prevent the level names from displaying.
	%SMW_StripeImageHeader(LifeCounterImage, !Define_SMW_Overworld_LifeCounterXPos, !Define_SMW_Overworld_LifeCounterYPos, 0, $0000, 3)
if !Define_SMW_Overworld_BorderSetting == !BorderSetting_None
	db $26,$20|(!Define_SMW_Overworld_LifeCounterPalette<<2)
	db $FC,$20|(!Define_SMW_Overworld_LifeCounterPalette<<2)
	db $FC,$20|(!Define_SMW_Overworld_LifeCounterPalette<<2)
else
	db $8F,$20|(!Define_SMW_Overworld_LifeCounterPalette<<2)
	db $FE,$20|(!Define_SMW_Overworld_LifeCounterPalette<<2)
	db $FE,$20|(!Define_SMW_Overworld_LifeCounterPalette<<2)
endif
LifeCounterImageEnd:
	db $FF

SMW_LoadOverworldLifeCounter_Main:
	PHB
	PEA.w !RAM_SMW_Misc_StripeImageUploadIndexLo>>8
	PLB
	PLB
	LDX.b #$00
	LDY.w !RAM_SMW_Misc_StripeImageUploadIndexLo
-:
	LDA.l LifeCounterImage,x
	STA.w SMW_StripeImageUploadTable[$00].LowByte,y
	INY
	INX
	CPX.b #$0B
	BCC.b -
	LDX.b #$00
	LDA.l !RAM_SMW_Player_CurrentCharacter
	BEQ.b .Mario
	LDX.b #$01
.Mario:
	LDY.w !RAM_SMW_Misc_StripeImageUploadIndexLo
	LDA.l !RAM_SMW_Player_MariosLives,x
	INC
	JSL.l HexToDec
	CPX.b #$00
	BEQ.b .NoTensDigit
	CLC
if !Define_SMW_Overworld_BorderSetting == !BorderSetting_None
	ADC.b #$00
else
	ADC.b #$22
endif
	STA.w SMW_StripeImageUploadTable[$04].LowByte,y
if !Define_SMW_Overworld_BorderSetting == !BorderSetting_None
	LDA.b #$20|(!Define_SMW_Overworld_LifeCounterPalette<<2)
else
	LDA.b #$21|(!Define_SMW_Overworld_LifeCounterPalette<<2)
endif
	STA.w SMW_StripeImageUploadTable[$04].HighByte,y
	TXA
.NoTensDigit:
	CLC
if !Define_SMW_Overworld_BorderSetting == !BorderSetting_None
	ADC.b #$00
else
	ADC.b #$22
endif
	STA.w SMW_StripeImageUploadTable[$03].LowByte,y
if !Define_SMW_Overworld_BorderSetting == !BorderSetting_None
	LDA.b #$20|(!Define_SMW_Overworld_LifeCounterPalette<<2)
else
	LDA.b #$21|(!Define_SMW_Overworld_LifeCounterPalette<<2)
endif
	STA.w SMW_StripeImageUploadTable[$03].HighByte,y
	LDA.w !RAM_SMW_Misc_StripeImageUploadIndexLo
	CLC
	ADC.b #$0A
	STA.w !RAM_SMW_Misc_StripeImageUploadIndexLo
	PLB
	RTL
	padbyte $EA : pad $05DC3A|!FastROM
	assert pc() <= $05DC3A|!FastROM

org $009341|!FastROM
	dw SMW_GameMode0C_LoadOverworld_Main

org $00A06B|!FastROM												; Rewrite the "load overworld" game mode.
SMW_GameMode0C_LoadOverworld_Main:
	JSR.w SMW_ClearLayer3Tilemap_Main
	JSR.w SMW_ClearOverworldAndCutsceneRAM_Main
	LDA.w !RAM_SMW_Misc_IntroLevelFlag
	BEQ.b NotIntroLevel
if !Define_SMW_Overworld_EnableIntroLevel == !TRUE
	LDA.b #$10
	STA.w !RAM_SMW_Misc_GameMode
	LDA.b #$F0
	STA.w !RAM_SMW_Mirror_MosaicSizeAndBGEnable
	LDA.b #!Define_SMW_Overworld_IntroLevelTimer
	STA.w !RAM_SMW_Timer_DisplaySpecialMessage
	LDA.b #$81
	STA.w !REGISTER_IRQNMIAndJoypadEnableFlags
	JMP.w SMW_GameMode00_LoadNintendoPresents_Mode04Finish
else
	STZ.w !RAM_SMW_Misc_IntroLevelFlag
	LDA.b #$01
	STA.w !RAM_SMW_Overworld_RunIntroScriptFlag
	BRA.b +
	NOP #13
+:
endif

NotIntroLevel:
	STZ.w !RAM_SMW_Flag_DisableLayer3Scroll
	STZ.w !RAM_SMW_Pointer_CurrentLevelEndProcess
	LDA.b #$50
	STA.w !RAM_SMW_Timer_WaitBeforeScoreTally
	JSL.l CheckIfPlayersShouldSwitch
	JSL.l SMW_SpecifySublevelToLoad_Main
	LDA.b #$11
	STA.w !RAM_SMW_Misc_GameMode
	LDX.b #$07
-:
	LDA.b !RAM_SMW_Mirror_CurrentLayer1XPosLo,x
	STA.w !RAM_SMW_Misc_Layer1XPosLo,x
	DEX
	BPL.b -
if !AddmusicKFlag == !FALSE
	JSR.w SMW_HandleSPCUploads_UploadOverworldMusicBank
else
	NOP #3
endif
	JSL.l SetStandardPPUSettings
	LDA.b [!RAM_SMW_Pointer_Layer1DataLo]
	AND.b #$1F
	INC
	STA.b !RAM_SMW_Camera_LastScreenHoriz
	LDA.b #$22											;\ This is to prevent the normal level sprite initialization from running.
	STA.w !RAM_SMW_Misc_GameMode						;/
	JSL.l SMW_LoadSublevel_Main
	LDA.b #$0C
	STA.w !RAM_SMW_Misc_GameMode
if !AddmusicKFlag == !TRUE
	LDA.w !RAM_SMW_Overworld_MusicOverride
	BNE.b +
	LDA.w !RAM_SMW_Misc_MusicRegisterBackup
+:
	STA.w !RAM_SMW_IO_MusicCh1
	BRA.b +
	NOP #7
+:
else
	LDA.w !RAM_SMW_Overworld_MusicOverride
	BNE.b +
	LDA.w !RAM_SMW_Misc_MusicRegisterBackup
+:
	CMP.b #$40
	BCS.b +
	STA.w !RAM_SMW_IO_MusicCh1
+:
	AND.b #$BF
	STA.w !RAM_SMW_Misc_MusicRegisterBackup
endif
	STZ.w !RAM_SMW_Palettes_BackgroundColorLo
	STZ.w !RAM_SMW_Palettes_BackgroundColorHi
	LDA.w !RAM_SMW_Overworld_HDMATransitionEffectFlag
	BNE.b +++
	LDA.b #$03
	STA.b !RAM_SMW_Mirror_ColorMathInitialSettings
if !Define_SMW_Overworld_EnableSpriteTransparency|!Define_SMW_Overworld_EnableFadeEffect == !TRUE
	LDA.b #$30
else
	LDA.b #$20
endif
	LDY.w !RAM_SMW_Flag_ShowContinueAndEnd
	BEQ.b CODE_00A11B
	REP.b #$20
	LDA.w #$318C
	STA.w !RAM_SMW_Palettes_BackgroundColorLo
	SEP.b #$20
	LDA.b #$40
	STA.b !RAM_SMW_Mirror_ObjectAndColorWindowSettings
	LDA.b #$20
	STA.b !RAM_SMW_Mirror_ColorMathInitialSettings
	LDA.b #$B3
	LDX.b #$17
	BRA.b ++

CODE_00A11B:
	LDX.b #$15
	LDY.b #$02
++:
	STX.w !RAM_SMW_Mirror_MainScreenLayers
	STY.w !RAM_SMW_Mirror_SubScreenLayers
	STA.w !REGISTER_ColorMathSelectAndEnable
	STA.b !RAM_SMW_Mirror_ColorMathSelectAndEnable
	JSR.w SMW_SetupHDMAWindowingEffects_EndHDMA
	BRA.b +

+++:
	JSL.l SetColorMathRegistersForPathExitTransition
+:
	JSL.l ExtraOverworldLoadStuff
	JSR.w SMW_UploadGraphicsFiles_Main
if !Define_SMW_Overworld_DisplayLifeCounter == !TRUE
	JSL.l SMW_LoadOverworldLifeCounter_Main
else
	NOP #4
endif
	JSL.l SMW_LoadStripeImage_Main
	JSR.w SMW_InitializeLevelTileAnimations_Main
	JSR.w SMW_SetKeepGameModeActiveTimer_OneFrame
if !UberASMFlag == !TRUE
	REP.b #$20
	LDA.l $00A5EF|!FastROM
	STA.b !RAM_SMW_Misc_ScratchRAM00
	LDA.l $00A5F0|!FastROM
	BRA.b +															;\ This is to prevent the ROM from crashing when re-inserting GFX/ExGFX files
	padbyte $EA : pad $00A14D|!FastROM								;| LM inserts 4 NOPs at $00A149 each time.
	assert pc() <= $00A14D|!FastROM									;|
																		;|
+:																		;/
	STA.b !RAM_SMW_Misc_ScratchRAM01
	SEP.b #$20
	PHK
	PEA.w ReturnFromUberASMInit-$01
	JMP.w [!RAM_SMW_Misc_ScratchRAM00]
ReturnFromUberASMInit:
	;JSL.l UberASMCode_Init
else
	BRA.b +
	NOP #21
+:
endif
	JSR.w SMW_InitializeLevelLayer3_Main
	JSR.w SMW_UpdateEntirePalette_Main
if !SA1ROM == !TRUE
	JSR.w SMW_CompressOAMTileSizeBuffer_Main
	BRA.b +
	NOP #2
+:
else
	JSL.l MoveBufferedDataIntoRealOAMBuffer
	JSR.w SMW_CompressOAMTileSizeBuffer_Main
endif
if !Define_SMW_Overworld_BorderSetting != !BorderSetting_None
	STZ.b !RAM_SMW_Mirror_Layer3XPosLo
	STZ.b !RAM_SMW_Mirror_Layer3YPosLo
else
	NOP #4
endif
	LDA.b #$0D
	LDY.w !RAM_SMW_Overworld_HDMATransitionEffectFlag
	BEQ.b +
	LDA.b #$0E
+:
	STA.w !RAM_SMW_Misc_GameMode
	JMP.w SMW_GameMode00_LoadNintendoPresents_Mode04Finish
	padbyte $EA : pad SMW_LoadSaveBufferData_Main
	assert pc() <= SMW_LoadSaveBufferData_Main

org $05D842|!FastROM														;\ Change how the game loads a level from the overworld.
	JML.l LoadLevelFromOverworldHack									;|
	padbyte $EA : pad SMW_SpecifySublevelToLoad_CODE_05D8A2			;|
	assert pc() <= SMW_SpecifySublevelToLoad_CODE_05D8A2				;/
CODE_05D8A2:

org $00A1C1|!FastROM								; Change the beginning of the "show overworld" game mode.
	JSL.l Main										;
if !SA1ROM == !TRUE								;\ If the SA-1 patch is used, jump to where it runs its MaxTile code.
	JMP.w SMW_CompressOAMTileSizeBuffer_Main	;|
	NOP #6											;/
else												;\ Otherwise, run my "bootleg" of MaxTile 
	JSL.l MoveBufferedDataIntoRealOAMBuffer	;|
	JMP.w SMW_CompressOAMTileSizeBuffer_Main	;|
	NOP #2											;|
endif												;/

org $048000|!FastROM								; Completely overwrite bank 04 with most of the patch's new code.
StartOfBank04:
	db "YFOR",$0000
autoclean	dl OWSprStart
autoclean	dl ScriptingBank01
autoclean	dl LevelNameAndMessageTextBank01

org $0480D2|!FastROM								; This is to prevent issues when inserting graphics with LM.
incsrc "Sprites/SpriteHandlingMain.asm"
	%OverworldSpritePtrsAndCode()
Main:
	PHB
	PHK
	PLB
if !SA1ROM == !FALSE
	JSL.l InitializeOAMPointers
endif
if !UberASMFlag == !TRUE
	REP.b #$20
	LDA.l $00A243|!FastROM
	STA.b !RAM_SMW_Misc_ScratchRAM00
	LDA.l $00A244|!FastROM
	STA.b !RAM_SMW_Misc_ScratchRAM01
	SEP.b #$20
	PHK
	PEA.w ReturnFromUberASMMain-$01
	JMP.w [!RAM_SMW_Misc_ScratchRAM00]
ReturnFromUberASMMain:
	;JSL.l UberASMCode_Main
else
	JSL.l !RAM_SMW_Sprites_ResetSpriteOAMRt
endif
	JSR.w Sub
	LDA.b !RAM_SMW_Flag_SpritesLocked
	LSR
	BCS.b +
	INC.b !RAM_SMW_Counter_LocalFrames			; This needs to be done later than the ExAnimation routine, or else it will desync animations using the 15+ FPS trick.
+:
if !UberASMFlag == !TRUE
	REP.b #$20
	LDA.l $00A2EF|!FastROM
	STA.b !RAM_SMW_Misc_ScratchRAM00
	LDA.l $00A2F0|!FastROM
	STA.b !RAM_SMW_Misc_ScratchRAM01
	SEP.b #$20
	PHK
	PEA.w ReturnFromUberASMEnd-$01
	LDA.b !RAM_SMW_Mirror_CurrentLayer1YPosLo	; Necessary, as the start of this routine writes to this RAM. I need to make sure it stays the same value.
	JMP.w [!RAM_SMW_Misc_ScratchRAM00]
ReturnFromUberASMEnd:
	;JSL.l UberASMCode_End
endif
	LDA.w !RAM_SMW_Overworld_GameOverFlag
	BEQ.b +
	STZ.w !RAM_SMW_Overworld_GameOverFlag
	JSL.l LoadSaveFileData_Main
	LDA.b #$0B
	STA.w !RAM_SMW_Misc_GameMode
+:
	LDA.w !RAM_SMW_Misc_GameMode
	CMP.b #$0E
	BEQ.b +
	STZ.w !RAM_SMW_Global_OnOverworldFlag
	JSR.w ClearSpriteRAM
+:
	PLB
	RTL

Sub:
	JSL.l SMW_ProcessLevelExAnimation_Main
	JSL.l HandleCameraScrolling_Main
	JSL.l SMW_HandleScrollSpriteAndLayer3Scrolling_Main
	JSL.l SMW_CheckIfLevelTilemapsNeedScrollUpdate_Main
if !SA1ROM == !TRUE
	LDA.b #.SA1Main
	STA.w !RAM_SMW_SA1_SA1CodePointerLo
	LDA.b #.SA1Main>>8
	STA.w !RAM_SMW_SA1_SA1CodePointerHi
	LDA.b #.SA1Main>>16
	STA.w !RAM_SMW_SA1_SA1CodePointerBank
	JSR.w !RAM_SMW_SA1_BeginSA1ProcessingRoutine
	RTS

.SA1Main:
	PHB
	PHK
	PLB
	JSR.w ..Sub
	PLB
	RTL

..Sub:
endif
	JSL.l SMW_ProcessOverworldSprites_Main
	;PHB
	PEA.w SMW_ParseLevelSpriteList_Main>>8
	PLB
	PLB
	PHK
	PEA.w .Return-$01
	PEA.w SMW_DropReservedItem_CODE_028071-$01
	JML.l SMW_ParseLevelSpriteList_Main
.Return:
	;PLB
	RTS

;---------------------------------------------------------------------------

ProcessScript:
	REP.b #$10
	SEP.b #$20
	PHB
	LDA.w !RAM_SMW_Overworld_MarioScriptAddress+$02
	PHA
	PLB
	LDY.w !RAM_SMW_Overworld_MarioScriptAddress
-:
	LDA.b #$00
	XBA
	LDA.w $0000,y
	STA.b !RAM_SMW_Misc_ScratchRAM8A
	ASL
	TAX
	JSR.w (ScriptOpPtrs,x)
	BRA.b -

ExitScriptProcessing:
	PHB
	PLA
	STA.w !RAM_SMW_Overworld_MarioScriptAddress+$02
	STY.w !RAM_SMW_Overworld_MarioScriptAddress
	PLA
	PLA
	PLB
	SEP.b #$10
	REP.b #$20
	RTS

ScriptOpPtrs:
	dw Op00_EndScript
	dw Op01_JumpToScriptAddress
	dw Op02_NOP
	dw Op03_SetWarpDestination
	dw Op04_8BitBranchIfRAMBytesEqual
	dw Op05_8BitBranchIfRAMBytesNotEqual
	dw Op06_8BitBranchIfRAMBytesLessThan
	dw Op07_8BitBranchIfRAMBytesGreaterThanOrEqual
	dw Op08_8BitBranchIfRAMBytesPositive
	dw Op09_8BitBranchIfRAMBytesNegative
	dw Op0A_8BitBranchIfEqual
	dw Op0B_8BitBranchIfNotEqual
	dw Op0C_8BitBranchIfLessThan
	dw Op0D_8BitBranchIfGreaterThanOrEqual
	dw Op0E_8BitBranchIfPositive
	dw Op0F_8BitBranchIfNegative
	dw Op10_8BitCheckIfBitsClear
	dw Op11_8BitCheckIfBitsSet
	dw Op12_8BitCheckIfRAMBitsClear
	dw Op13_8BitCheckIfRAMBitsSet
	dw Op14_8BitANDByte
	dw Op15_8BitORAByte
	dw Op16_8BitEORByte
	dw Op17_8BitAND2Bytes
	dw Op18_8BitORA2Bytes
	dw Op19_8BitEOR2Bytes
	dw Op1A_8BitStoreByteToRAM
	dw Op1B_BeginLevelWarp
	dw Op1C_JSLToRoutine
	dw Op1D_PlaySoundOrMusic
	dw Op1E_MovePlayerToRelativeFineCoords
	dw Op1F_FreezeScreen
	dw Op20_UnfreezeScreen
	dw Op21_BeginOverworldWarp
	dw Op22_WaitXFrames
	dw Op23_CheckIfXEventPassed
	dw Op24_JSRToRoutine
	dw Op25_MovePlayerToAbsoluteCoords
	dw Op26_MovePlayerToRelativeCoarseCoords
	dw Op27_BeginBufferingEventTile
	dw Op28_BufferNextEventTile
	dw Op29_CheckIfXEventNotPassed
	dw Op2A_SetEvent
	dw Op2B_BeginBufferingSilentEventTile
	dw Op2C_BufferNextSilentEventTile
	dw Op2D_DebuggerBreakpoint
	dw Op2E_SpawnSprite
	dw Op2F_DisplayLevelName
	dw Op30_JSRToScript
	dw Op31_RTSToScript
	dw Op32_DoPathExitTransition
	dw Op33_DisplayPrompt
	dw Op34_SetEventTileCoords
	dw Op35_MakeScreenShake
	dw Op36_8BitCheckIfAllBitsSet
	dw Op37_8BitCheckIfAllRAMBitsSet
	dw Op38_UnusedOpcode
	dw Op39_ScriptJumpTable
	dw Op3A_8BitStoreRAMToRAM
	dw Op3B_8BitCheckIfAllBitsClear
	dw Op3C_8BitCheckIfAllRAMBitsClear
	dw Op3D_SetCameraFocusPoint
	dw Op3E_SetFocusPointToCurrentPlayer
	dw Op3F_ChangePlayerAnimation
	dw Op40_8BitAddConstantToRAM
	dw Op41_8BitAddRAMToRAM
	dw Op42_SetPlayerFacingDirection
	dw Op43_JSLToScript
	dw Op44_RTLToScript
	dw Op45_JMLToScriptAddress
	dw Op46_SetPathRevealSpeedAndSound
	dw Op47_OverrideCurrentMapMusic
	dw Op48_SetPlayerSpeed
	dw Op49_DisplayMessage
	dw Op4A_16BitBranchIfRAMBytesEqual
	dw Op4B_16BitBranchIfRAMBytesNotEqual
	dw Op4C_16BitBranchIfRAMBytesLessThan
	dw Op4D_16BitBranchIfRAMBytesGreaterThanOrEqual
	dw Op4E_16BitBranchIfRAMBytesPositive
	dw Op4F_16BitBranchIfRAMBytesNegative
	dw Op50_16BitBranchIfEqual
	dw Op51_16BitBranchIfNotEqual
	dw Op52_16BitBranchIfLessThan
	dw Op53_16BitBranchIfGreaterThanOrEqual
	dw Op54_16BitBranchIfPositive
	dw Op55_16BitBranchIfNegative
	dw Op56_16BitCheckIfBitsClear
	dw Op57_16BitCheckIfBitsSet
	dw Op58_16BitCheckIfAllBitsSet
	dw Op59_16BitCheckIfAllBitsClear
	dw Op5A_16BitCheckIfAllRAMBitsSet
	dw Op5B_16BitCheckIfAllRAMBitsClear
	dw Op5C_16BitCheckIfRAMBitsClear
	dw Op5D_16BitCheckIfRAMBitsSet
	dw Op5E_16BitANDByte
	dw Op5F_16BitORAByte
	dw Op60_16BitEORByte
	dw Op61_16BitAND2Bytes
	dw Op62_16BitORA2Bytes
	dw Op63_16BitEOR2Bytes
	dw Op64_16BitStoreByteToRAM
	dw Op65_16BitStoreRAMToRAM
	dw Op66_16BitAddConstantToRAM
	dw Op67_16BitAddRAMToRAM
	dw Op68_TeleportOverworldPlayerToCoords

Op38_UnusedOpcode:
Op00_EndScript:
	LDA.w !RAM_SMW_Misc_GameMode
	CMP.b #$0C
	BEQ.b +
	LDA.b #Script_FreePlayerMovement>>16
	PHA
	PLB
	LDY.w #Script_FreePlayerMovement
+:
	JMP.w ExitScriptProcessing

Op45_JMLToScriptAddress:
	LDA.w $0003,y
	PHA
	PLB
Op01_JumpToScriptAddress:
	LDX.w $0001,y
	TXY
	RTS

Op03_SetWarpDestination:
	LDA.b #$04
	STA.b !RAM_SMW_Misc_ScratchRAM00
	LDA.w $0002,y
	STA.w !RAM_SMW_Overworld_WarpDestination
	LDA.w $0003,y
	STA.b !RAM_SMW_Misc_ScratchRAM01
	LDA.w $0001,y
	BEQ.b .MainEntrance
	DEC
	BEQ.b .MidwayEntrance
	LDA.b !RAM_SMW_Misc_ScratchRAM01
	ASL
	ASL
	ASL
	AND.b #$F0
	ORA.b #$06
	STA.b !RAM_SMW_Misc_ScratchRAM02
	LDA.b !RAM_SMW_Misc_ScratchRAM01
	AND.b #$01
	ORA.b !RAM_SMW_Misc_ScratchRAM02
	BRA.b .SecondaryEntrance

.MidwayEntrance:
	LDA.b #$0C
	STA.b !RAM_SMW_Misc_ScratchRAM00
.MainEntrance:
	LDA.b !RAM_SMW_Misc_ScratchRAM01
	ORA.b !RAM_SMW_Misc_ScratchRAM00
.SecondaryEntrance:
	STA.w !RAM_SMW_Overworld_WarpDestination+$01
	INY
	INY
	INY
Op02_NOP:
	INY
	RTS

Op04_8BitBranchIfRAMBytesEqual:
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	LDA.w $0000,x
	CMP.b (!RAM_SMW_Misc_ScratchRAM00)
	BEQ.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op05_8BitBranchIfRAMBytesNotEqual:
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	LDA.w $0000,x
	CMP.b (!RAM_SMW_Misc_ScratchRAM00)
	BNE.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op06_8BitBranchIfRAMBytesLessThan:
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	LDA.w $0000,x
	CMP.b (!RAM_SMW_Misc_ScratchRAM00)
	BCC.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op07_8BitBranchIfRAMBytesGreaterThanOrEqual:
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	LDA.w $0000,x
	CMP.b (!RAM_SMW_Misc_ScratchRAM00)
	BCS.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op08_8BitBranchIfRAMBytesPositive:
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	LDA.w $0000,x
	CMP.b (!RAM_SMW_Misc_ScratchRAM00)
	BPL.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op09_8BitBranchIfRAMBytesNegative:
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	LDA.w $0000,x
	CMP.b (!RAM_SMW_Misc_ScratchRAM00)
	BMI.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op0A_8BitBranchIfEqual:
	LDX.w $0001,y
	LDA.w $0000,x
	CMP.w $0003,y
	BEQ.b +
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0004,y
	TXY
	RTS

Op0B_8BitBranchIfNotEqual:
	LDX.w $0001,y
	LDA.w $0000,x
	CMP.w $0003,y
	BNE.b +
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0004,y
	TXY
	RTS

Op0C_8BitBranchIfLessThan:
	LDX.w $0001,y
	LDA.w $0000,x
	CMP.w $0003,y
	BCC.b +
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0004,y
	TXY
	RTS

Op0D_8BitBranchIfGreaterThanOrEqual:
	LDX.w $0001,y
	LDA.w $0000,x
	CMP.w $0003,y
	BCS.b +
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0004,y
	TXY
	RTS

Op0E_8BitBranchIfPositive:
	LDX.w $0001,y
	LDA.w $0000,x
	CMP.w $0003,y
	BPL.b +
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0004,y
	TXY
	RTS

Op0F_8BitBranchIfNegative:
	LDX.w $0001,y
	LDA.w $0000,x
	CMP.w $0003,y
	BMI.b +
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0004,y
	TXY
	RTS

Op10_8BitCheckIfBitsClear:
	LDX.w $0001,y
	LDA.w $0000,x
	AND.w $0003,y
	BEQ.b +
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0004,y
	TXY
	RTS

Op11_8BitCheckIfBitsSet:
	LDX.w $0001,y
	LDA.w $0000,x
	AND.w $0003,y
	BNE.b +
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0004,y
	TXY
	RTS

Op36_8BitCheckIfAllBitsSet:
	LDX.w $0001,y
	LDA.w $0000,x
	AND.w $0003,y
	CMP.w $0003,y
	BEQ.b +
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0004,y
	TXY
	RTS

Op3B_8BitCheckIfAllBitsClear:
	LDX.w $0001,y
	LDA.w $0000,x
	AND.w $0003,y
	CMP.w $0003,y
	BNE.b +
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0004,y
	TXY
	RTS

Op37_8BitCheckIfAllRAMBitsSet:
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	LDA.w $0000,x
	AND.b (!RAM_SMW_Misc_ScratchRAM00)
	CMP.b (!RAM_SMW_Misc_ScratchRAM00)
	BEQ.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op3C_8BitCheckIfAllRAMBitsClear:
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	LDA.w $0000,x
	AND.b (!RAM_SMW_Misc_ScratchRAM00)
	CMP.b (!RAM_SMW_Misc_ScratchRAM00)
	BNE.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op12_8BitCheckIfRAMBitsClear:
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	LDA.w $0000,x
	AND.b (!RAM_SMW_Misc_ScratchRAM00)
	BEQ.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op13_8BitCheckIfRAMBitsSet:
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	LDA.w $0000,x
	AND.b (!RAM_SMW_Misc_ScratchRAM00)
	BNE.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op14_8BitANDByte:
	LDX.w $0001,y
	LDA.w $0000,x
	AND.w $0003,y
	STA.w $0000,x
	INY
	INY
	INY
	INY
	RTS

Op15_8BitORAByte:
	LDX.w $0001,y
	LDA.w $0000,x
	ORA.w $0003,y
	STA.w $0000,x
	INY
	INY
	INY
	INY
	RTS

Op16_8BitEORByte:
	LDX.w $0001,y
	LDA.w $0000,x
	EOR.w $0003,y
	STA.w $0000,x
	INY
	INY
	INY
	INY
	RTS

Op17_8BitAND2Bytes:
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	LDA.w $0000,x
	AND.b (!RAM_SMW_Misc_ScratchRAM00)
	STA.w $0000,x
	INY
	INY
	INY
	INY
	INY
	RTS

Op18_8BitORA2Bytes:
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	LDA.w $0000,x
	ORA.b (!RAM_SMW_Misc_ScratchRAM00)
	STA.w $0000,x
	INY
	INY
	INY
	INY
	INY
	RTS

Op19_8BitEOR2Bytes:
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	LDA.w $0000,x
	EOR.b (!RAM_SMW_Misc_ScratchRAM00)
	STA.w $0000,x
	INY
	INY
	INY
	INY
	INY
	RTS

Op1A_8BitStoreByteToRAM:
	LDX.w $0001,y
	LDA.w $0003,y
	STA.w $0000,x
	INY
	INY
	INY
	INY
	RTS

Op3A_8BitStoreRAMToRAM:
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	LDA.b (!RAM_SMW_Misc_ScratchRAM00)
	STA.w $0000,x
	INY
	INY
	INY
	INY
	INY
	RTS

Op40_8BitAddConstantToRAM:
	LDX.w $0001,y
	LDA.w $0000,x
	CLC
	ADC.w $0003,y
	STA.w $0000,x
	INY
	INY
	INY
	INY
	RTS

Op41_8BitAddRAMToRAM:
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	CLC
	ADC.b (!RAM_SMW_Misc_ScratchRAM00)
	STA.w $0000,x
	INY
	INY
	INY
	INY
	INY
	RTS

Op4A_16BitBranchIfRAMBytesEqual:
	REP.b #$20
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	LDA.w $0000,x
	CMP.b (!RAM_SMW_Misc_ScratchRAM00)
	SEP.b #$20
	BEQ.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op4B_16BitBranchIfRAMBytesNotEqual:
	REP.b #$20
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	LDA.w $0000,x
	CMP.b (!RAM_SMW_Misc_ScratchRAM00)
	SEP.b #$20
	BNE.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op4C_16BitBranchIfRAMBytesLessThan:
	REP.b #$20
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	LDA.w $0000,x
	CMP.b (!RAM_SMW_Misc_ScratchRAM00)
	SEP.b #$20
	BCC.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op4D_16BitBranchIfRAMBytesGreaterThanOrEqual:
	REP.b #$20
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	LDA.w $0000,x
	CMP.b (!RAM_SMW_Misc_ScratchRAM00)
	SEP.b #$20
	BCS.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op4E_16BitBranchIfRAMBytesPositive:
	REP.b #$20
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	LDA.w $0000,x
	CMP.b (!RAM_SMW_Misc_ScratchRAM00)
	SEP.b #$20
	BPL.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op4F_16BitBranchIfRAMBytesNegative:
	REP.b #$20
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	LDA.w $0000,x
	CMP.b (!RAM_SMW_Misc_ScratchRAM00)
	SEP.b #$20
	BMI.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op50_16BitBranchIfEqual:
	REP.b #$20
	LDX.w $0001,y
	LDA.w $0000,x
	CMP.w $0003,y
	SEP.b #$20
	BEQ.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op51_16BitBranchIfNotEqual:
	REP.b #$20
	LDX.w $0001,y
	LDA.w $0000,x
	CMP.w $0003,y
	SEP.b #$20
	BNE.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op52_16BitBranchIfLessThan:
	REP.b #$20
	LDX.w $0001,y
	LDA.w $0000,x
	CMP.w $0003,y
	SEP.b #$20
	BCC.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op53_16BitBranchIfGreaterThanOrEqual:
	REP.b #$20
	LDX.w $0001,y
	LDA.w $0000,x
	CMP.w $0003,y
	BCS.b +
	SEP.b #$20
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op54_16BitBranchIfPositive:
	REP.b #$20
	LDX.w $0001,y
	LDA.w $0000,x
	CMP.w $0003,y
	SEP.b #$20
	BPL.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op55_16BitBranchIfNegative:
	REP.b #$20
	LDX.w $0001,y
	LDA.w $0000,x
	CMP.w $0003,y
	SEP.b #$20
	BMI.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op56_16BitCheckIfBitsClear:
	REP.b #$20
	LDX.w $0001,y
	LDA.w $0000,x
	AND.w $0003,y
	SEP.b #$20
	BEQ.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op57_16BitCheckIfBitsSet:
	REP.b #$20
	LDX.w $0001,y
	LDA.w $0000,x
	AND.w $0003,y
	SEP.b #$20
	BNE.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op58_16BitCheckIfAllBitsSet:
	REP.b #$20
	LDX.w $0001,y
	LDA.w $0000,x
	AND.w $0003,y
	CMP.w $0003,y
	SEP.b #$20
	BEQ.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op59_16BitCheckIfAllBitsClear:
	REP.b #$20
	LDX.w $0001,y
	LDA.w $0000,x
	AND.w $0003,y
	CMP.w $0003,y
	SEP.b #$20
	BNE.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op5A_16BitCheckIfAllRAMBitsSet:
	REP.b #$20
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	LDA.w $0000,x
	AND.b (!RAM_SMW_Misc_ScratchRAM00)
	CMP.b (!RAM_SMW_Misc_ScratchRAM00)
	SEP.b #$20
	BEQ.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op5B_16BitCheckIfAllRAMBitsClear:
	REP.b #$20
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	LDA.w $0000,x
	AND.b (!RAM_SMW_Misc_ScratchRAM00)
	CMP.b (!RAM_SMW_Misc_ScratchRAM00)
	SEP.b #$20
	BNE.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op5C_16BitCheckIfRAMBitsClear:
	REP.b #$20
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	LDA.w $0000,x
	AND.b (!RAM_SMW_Misc_ScratchRAM00)
	SEP.b #$20
	BEQ.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op5D_16BitCheckIfRAMBitsSet:
	REP.b #$20
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	LDA.w $0000,x
	AND.b (!RAM_SMW_Misc_ScratchRAM00)
	SEP.b #$20
	BNE.b +
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	LDX.w $0005,y
	TXY
	RTS

Op5E_16BitANDByte:
	REP.b #$20
	LDX.w $0001,y
	LDA.w $0000,x
	AND.w $0003,y
	STA.w $0000,x
	SEP.b #$20
	INY
	INY
	INY
	INY
	INY
	RTS

Op5F_16BitORAByte:
	REP.b #$20
	LDX.w $0001,y
	LDA.w $0000,x
	ORA.w $0003,y
	STA.w $0000,x
	SEP.b #$20
	INY
	INY
	INY
	INY
	INY
	RTS

Op60_16BitEORByte:
	REP.b #$20
	LDX.w $0001,y
	LDA.w $0000,x
	EOR.w $0003,y
	STA.w $0000,x
	SEP.b #$20
	INY
	INY
	INY
	INY
	INY
	RTS

Op61_16BitAND2Bytes:
	REP.b #$20
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	LDA.w $0000,x
	AND.b (!RAM_SMW_Misc_ScratchRAM00)
	STA.w $0000,x
	SEP.b #$20
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

Op62_16BitORA2Bytes:
	REP.b #$20
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	LDA.w $0000,x
	ORA.b (!RAM_SMW_Misc_ScratchRAM00)
	STA.w $0000,x
	SEP.b #$20
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

Op63_16BitEOR2Bytes:
	REP.b #$20
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	LDA.w $0000,x
	EOR.b (!RAM_SMW_Misc_ScratchRAM00)
	STA.w $0000,x
	SEP.b #$20
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

Op64_16BitStoreByteToRAM:
	REP.b #$20
	LDX.w $0001,y
	LDA.w $0003,y
	STA.w $0000,x
	SEP.b #$20
	INY
	INY
	INY
	INY
	INY
	RTS

Op65_16BitStoreRAMToRAM:
	REP.b #$20
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	LDA.b (!RAM_SMW_Misc_ScratchRAM00)
	STA.w $0000,x
	SEP.b #$20
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

Op66_16BitAddConstantToRAM:
	REP.b #$21
	LDX.w $0001,y
	LDA.w $0000,x
	ADC.w $0003,y
	STA.w $0000,x
	SEP.b #$20
	INY
	INY
	INY
	INY
	INY
	RTS

Op67_16BitAddRAMToRAM:
	REP.b #$21
	LDX.w $0001,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0003,y
	ADC.b (!RAM_SMW_Misc_ScratchRAM00)
	STA.w $0000,x
	SEP.b #$20
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

Op1B_BeginLevelWarp:
	LDA.b #$0F
	BRA.b +

Op21_BeginOverworldWarp:
	LDA.b #$0B
+:
.Entry2:
	STA.w !RAM_SMW_Misc_GameMode
	STZ.w !RAM_SMW_Misc_ExitLevelAction
	INY
	JMP.w ExitScriptProcessing

Op1C_JSLToRoutine:
	PHP
	PHB
	LDA.w $0001,y
	STA.b !RAM_SMW_Misc_ScratchRAM00
	LDA.w $0002,y
	STA.b !RAM_SMW_Misc_ScratchRAM01
	LDA.w $0003,y
	STA.b !RAM_SMW_Misc_ScratchRAM02
	PHK
	PEA.w .Return-$01 
	JMP.w [!RAM_SMW_Misc_ScratchRAM00]
.Return:
	PLB
	PLP
	INY
	INY
	INY
	INY
	RTS

Op24_JSRToRoutine:
	PHP
	PHB
	LDA.w $0001,y
	STA.b !RAM_SMW_Misc_ScratchRAM00
	LDA.w $0002,y
	STA.b !RAM_SMW_Misc_ScratchRAM01
	PEA.w .Return-$01 
	JMP.w (!RAM_SMW_Misc_ScratchRAM00)
.Return:
	PLB
	PLP
	INY
	INY
	INY
	RTS

Op25_MovePlayerToAbsoluteCoords:
	LDX.w !RAM_SMW_Overworld_MarioScriptState
	JMP.w (.States,x)

.States:
	dw .State00_SetDestination
	dw .State02_MoveToDestination

.State00_SetDestination:
	LDX.w $0001,y
	STX.w !RAM_SMW_Player_OverworldXPosMarioIsGoingToLo
	LDX.w $0003,y
	STX.w !RAM_SMW_Player_OverworldYPosMarioIsGoingToLo
	LDX.w #$0002
	STX.w !RAM_SMW_Overworld_MarioScriptState
.State02_MoveToDestination:
	PHY
	JSL.l HandlePathMovement
	PLY
	SEP.b #$20
	BCS.b +
	JMP.w ExitScriptProcessing

+:
	LDX.w #$0000
	STX.w !RAM_SMW_Overworld_MarioScriptState
	INY
	INY
	INY
	INY
	INY
	RTS

Op26_MovePlayerToRelativeCoarseCoords:
	LDX.w !RAM_SMW_Overworld_MarioScriptState
	JMP.w (.States,x)

.States:
	dw .State00_SetDestination
	dw .State02_MoveToDestination

.State00_SetDestination:
	LDX.w !RAM_SMW_Player_CurrentCharacterX2Lo
	REP.b #$20
	LDA.w $0001,y
	AND.w #$000F
	ASL
	ASL
	ASL
	ASL
	CMP.w #$0080
	BCC.b +
	ORA.w #$FF00
+:
	CLC
	ADC.w !RAM_SMW_Overworld_MarioXPosLo,x
	STA.w !RAM_SMW_Player_OverworldXPosMarioIsGoingToLo
	LDA.w $0001,y
	AND.w #$00F0
	CMP.w #$0080
	BCC.b +
	ORA.w #$FF00
+:
	CLC
	ADC.w !RAM_SMW_Overworld_MarioYPosLo,x
	STA.w !RAM_SMW_Player_OverworldYPosMarioIsGoingToLo
	SEP.b #$20
	LDX.w #$0002
	STX.w !RAM_SMW_Overworld_MarioScriptState
.State02_MoveToDestination:
	PHY
	JSL.l HandlePathMovement
	PLY
	SEP.b #$20
	BCS.b +
	JMP.w ExitScriptProcessing

+:
	LDX.w #$0000
	STX.w !RAM_SMW_Overworld_MarioScriptState
	INY
	INY
	RTS

Op1E_MovePlayerToRelativeFineCoords:
	LDX.w !RAM_SMW_Overworld_MarioScriptState
	JMP.w (.States,x)

.States:
	dw .State00_SetDestination
	dw .State02_MoveToDestination

.State00_SetDestination:
	LDX.w !RAM_SMW_Player_CurrentCharacterX2Lo
	REP.b #$20
	LDA.w $0001,y
	AND.w #$000F
	CMP.w #$0008
	BCC.b +
	ORA.w #$FFF0
+:
	CLC
	ADC.w !RAM_SMW_Overworld_MarioXPosLo,x
	STA.w !RAM_SMW_Player_OverworldXPosMarioIsGoingToLo
	LDA.w $0001,y
	AND.w #$00F0
	LSR
	LSR
	LSR
	LSR
	CMP.w #$0008
	BCC.b +
	ORA.w #$FFF0
+:
	CLC
	ADC.w !RAM_SMW_Overworld_MarioYPosLo,x
	STA.w !RAM_SMW_Player_OverworldYPosMarioIsGoingToLo
	SEP.b #$20
	LDX.w #$0002
	STX.w !RAM_SMW_Overworld_MarioScriptState
.State02_MoveToDestination:
	PHY
	JSL.l HandlePathMovement
	PLY
	SEP.b #$20
	BCS.b +
	JMP.w ExitScriptProcessing

+:
	LDX.w #$0000
	STX.w !RAM_SMW_Overworld_MarioScriptState
	INY
	INY
	RTS

Op28_BufferNextEventTile:
	LDX.w !RAM_SMW_Overworld_MarioScriptState
	JMP.w (.BufferTileStates,x)

.BufferTileStates:
	dw .State00_BufferTile
	dw .State02_FadeInTile

.State02_FadeInTile:
	JMP.w DoPathFade

.State00_BufferTile:
	JSR.w GetPositionOfNextEventTile
if !Define_SMW_Overworld_EnableFadeEffect == !TRUE
	JSR.w BufferFadeEffectTileData
else
	LDA.w $0001,y
	AND.w #$7FFF
	JSL.l BufferEventTile
endif
	BRA.b ++

Op2C_BufferNextSilentEventTile:
	JSR.w GetPositionOfNextEventTile
	LDA.w $0001,y
	AND.w #$7FFF
	JSL.l BufferEventTile
	BRA.b ++

Op27_BeginBufferingEventTile:
	LDX.w !RAM_SMW_Overworld_MarioScriptState
	JMP.w (.BufferTileStates,x)

.BufferTileStates:
	dw .State00_BufferTile
	dw .State02_FadeInTile

.State02_FadeInTile:
	JMP.w DoPathFade

.State00_BufferTile:
if !SA1ROM == !TRUE
	LDX.w #.SNESMain
	STX.w !RAM_SMW_SA1_SNESCodePointerLo
	LDX.w #.SNESMain>>8
	STX.w !RAM_SMW_SA1_SNESCodePointerHi
	LDA.b #$D0
	STA.w !REGISTER_SA1_SA1RQControlWrite
-:
	LDA.w !RAM_SMW_SA1_SNESDoneFlag
	BEQ.b -
	STZ.w !RAM_SMW_SA1_SNESDoneFlag
	REP.b #$20
	BRA.b +

.SNESMain:
	REP.b #$20
	LDA.l !RAM_SMW_Misc_StripeImageUploadIndexLo
	STA.b !RAM_SMW_Misc_ScratchRAM8C
	SEP.b #$20
	RTL

+:
else
	LDA.l !RAM_SMW_Misc_StripeImageUploadIndexLo
	STA.b !RAM_SMW_Misc_ScratchRAM8C
	LDA.l !RAM_SMW_Misc_StripeImageUploadIndexHi
	STA.b !RAM_SMW_Misc_ScratchRAM8D
endif
	JSR.w GetPositionOfFirstEventTile
if !Define_SMW_Overworld_EnableFadeEffect == !TRUE
	JSR.w BufferFadeEffectTileData
else
	LDA.w $0001,y
	AND.w #$7FFF
	JSL.l BufferEventTile
endif
	BRA.b ++

Op2B_BeginBufferingSilentEventTile:
	JSR.w GetPositionOfFirstEventTile
	LDA.w $0001,y
	AND.w #$7FFF
	JSL.l BufferEventTile
++:
	REP.b #$21
	LDA.b !RAM_SMW_Misc_ScratchRAM8E
	AND.w #$001E
	TAX
	LDA.b !RAM_SMW_Blocks_XPosLo
	;CLC
	ADC.l .BlockXOffset,x
	STA.b !RAM_SMW_Blocks_XPosLo
	STA.w !RAM_SMW_Overworld_EventTileXPos
	LDA.b !RAM_SMW_Blocks_YPosLo
	CLC
	ADC.l .BlockYOffset,x
	STA.b !RAM_SMW_Blocks_YPosLo
	STA.w !RAM_SMW_Overworld_EventTileYPos
	SEP.b #$20
	LDA.b !RAM_SMW_Misc_ScratchRAM8E
	BPL.w ++
	LDA.b !RAM_SMW_Misc_ScratchRAM8A
	SEC
	SBC.b #$27
	CMP.b #$02
	BCS.b ++
	LDX.w #$0002
	STX.w !RAM_SMW_Overworld_MarioScriptState
	LDA.b #$00
	XBA
	LDA.w !RAM_SMW_Overworld_EventRevealSound
	TAX
	LDA.w !RAM_SMW_Overworld_EventRevealSound+$01
	BEQ.b +
	STA.w !RAM_SMW_IO_SoundCh1,x
+:
if !Define_SMW_Overworld_EnableFadeEffect == !TRUE
	PHY
	PHB
	PHK
	PLB
	LDY.w #.PathFadeSpriteData-$01
	JSL.l SpawnOverworldSprite
	PLB
	REP.b #$20
	JSL.l AdjustPaletteOfBufferedTiles
	SEP.b #$20
	PLY
endif
	JMP.w ExitScriptProcessing

++:
	INY
	INY
	INY
	INY
	RTS

.BlockXOffset:
	dw $0000					; No Direction
	dw $FFF0					; Left
	dw $FFF0					; Up Left
	dw $0000					; Up
	dw $0010					; Up Right
	dw $0010					; Right
	dw $0010					; Down Right
	dw $0000					; Down
	dw $FFF0					; Down Left

.BlockYOffset:
	dw $0000					; No Direction
	dw $0000					; Left
	dw $FFF0					; Up Left
	dw $FFF0					; Up
	dw $FFF0					; Up Right
	dw $0000					; Right
	dw $0010					; Down Right
	dw $0010					; Down
	dw $0010					; Down Left
	dw $0000					; No Direction

if !Define_SMW_Overworld_EnableFadeEffect == !TRUE
.PathFadeSpriteData:
	dw !Define_SMW_SpriteID_OWSpr0D_EventFadeTile,$0000,$8000,$8000,$0000

BufferFadeEffectTileData:
	LDA.b !RAM_SMW_Misc_ScratchRAM8A
	AND.w #$00FF
	SEC
	SBC.w #$0027
	CMP.w #$0002
	BCS.b ++
	PHY
	LDA.w $0001,y
	ASL
	JSL.l SMW_HandleCustomMap16_Main
	STA.b !RAM_SMW_Misc_ScratchRAM0A
-:
	LDA.l !RAM_SMW_OWSpr_EventFadeTileBufferIndex
	TAX
	LDA.b !RAM_SMW_Blocks_XPosLo
	STA.l !RAM_SMW_OWSpr_EventFadeTileBuffer_XPos,x
	LDA.b !RAM_SMW_Blocks_YPosLo
	STA.l !RAM_SMW_OWSpr_EventFadeTileBuffer_YPos,x
	LDA.b !RAM_SMW_Misc_ScratchRAM8E
	AND.w #$0080
	STA.l !RAM_SMW_OWSpr_EventFadeTileBuffer_NextTileDirection,x
	PLY
	PHY
	LDA.w !RAM_SMW_Misc_CurrentLayerBeingProcessedLo
	LSR
	ROR
	AND.w #$8000
	ORA.w $0001,y
	;AND.w #$7FFF
	STA.l !RAM_SMW_OWSpr_EventFadeTileBuffer_Map16Tile,x
	LDY.w #$0002
	LDA.b [!RAM_SMW_Misc_ScratchRAM0A]
	STA.l !RAM_SMW_OWSpr_EventFadeTileBuffer_TilemapData+$00,x
	LDA.b [!RAM_SMW_Misc_ScratchRAM0A],y
	STA.l !RAM_SMW_OWSpr_EventFadeTileBuffer_TilemapData+$04,x
	INY
	INY
	LDA.b [!RAM_SMW_Misc_ScratchRAM0A],y
	STA.l !RAM_SMW_OWSpr_EventFadeTileBuffer_TilemapData+$02,x
	INY
	INY
	LDA.b [!RAM_SMW_Misc_ScratchRAM0A],y
	STA.l !RAM_SMW_OWSpr_EventFadeTileBuffer_TilemapData+$06,x
	TXA
	CLC
	ADC.w #$0010
	STA.l !RAM_SMW_OWSpr_EventFadeTileBufferIndex
	PLY
++:
	RTS

AdjustPaletteOfBufferedTiles:
if !SA1ROM == !TRUE
	LDA.w #.SNESMain
	STA.w !RAM_SMW_SA1_SNESCodePointerLo
	LDA.w #.SNESMain>>8
	STA.w !RAM_SMW_SA1_SNESCodePointerHi
	SEP.b #$20
	LDA.b #$D0
	STA.w !REGISTER_SA1_SA1RQControlWrite
-:
	LDA.w !RAM_SMW_SA1_SNESDoneFlag
	BEQ.b -
	STZ.w !RAM_SMW_SA1_SNESDoneFlag
	REP.b #$20
	RTL

.SNESMain:
	REP.b #$30
	JSL.l ..Sub
	SEP.b #$30
	RTL

..Sub
endif
	LDX.b !RAM_SMW_Misc_ScratchRAM8C
-:
	LDA.l SMW_StripeImageUploadTable[$02].LowByte,x
	AND.w #$EFFF
	STA.l SMW_StripeImageUploadTable[$02].LowByte,x
	LDA.l SMW_StripeImageUploadTable[$03].LowByte,x
	AND.w #$EFFF
	STA.l SMW_StripeImageUploadTable[$03].LowByte,x
	LDA.l SMW_StripeImageUploadTable[$06].LowByte,x
	AND.w #$EFFF
	STA.l SMW_StripeImageUploadTable[$06].LowByte,x
	LDA.l SMW_StripeImageUploadTable[$07].LowByte,x
	AND.w #$EFFF
	STA.l SMW_StripeImageUploadTable[$07].LowByte,x
	TXA
	CLC
	ADC.w #$0010
	TAX
	STX.b !RAM_SMW_Misc_ScratchRAM8C
	CMP.l !RAM_SMW_Misc_StripeImageUploadIndexLo
	BCC.b -
	RTL
endif

DoPathFade:
if !Define_SMW_Overworld_EnableFadeEffect == !TRUE
	LDA.l !RAM_SMW_OWSpr_EventFadeTileBufferIndex
	BEQ.b +
	JMP.w ExitScriptProcessing

+:
	INY
	INY
	INY
	INY
	LDX.w #$0000
	STX.w !RAM_SMW_Overworld_MarioScriptState
	RTS
else
	LDA.w !RAM_SMW_Overworld_MarioWaitTimer
	BEQ.b ++
	CMP.b #$01
	BNE.b +
	INY
	INY
	INY
	INY
	LDX.w #$0000
	STX.w !RAM_SMW_Overworld_MarioScriptState
	STZ.w !RAM_SMW_Overworld_MarioWaitTimer
	RTS

+:
	DEC.w !RAM_SMW_Overworld_MarioWaitTimer
	JMP.w ExitScriptProcessing

++:
	LDA.w !RAM_SMW_Overworld_EventRevealSpeed
	STA.w !RAM_SMW_Overworld_MarioWaitTimer
	JMP.w ExitScriptProcessing
endif

GetPositionOfFirstEventTile:
	LDX.w !RAM_SMW_Overworld_EventTileYPos
	STX.b !RAM_SMW_Blocks_YPosLo
	LDX.w !RAM_SMW_Overworld_EventTileXPos
	STX.b !RAM_SMW_Blocks_XPosLo
GetPositionOfNextEventTile:
	LDX.w !RAM_SMW_Overworld_EventTileLayer
	STX.w !RAM_SMW_Misc_CurrentLayerBeingProcessedLo
	REP.b #$20
	LDA.w $0003,y
	AND.w #$009E
	STA.b !RAM_SMW_Misc_ScratchRAM8E
	RTS

Op46_SetPathRevealSpeedAndSound:
	LDA.w $0001,y
	STA.w !RAM_SMW_Overworld_EventRevealSpeed
	LDX.w $0002,y
	STX.w !RAM_SMW_Overworld_EventRevealSound
	INY
	INY
	INY
	INY
	RTS

Op1D_PlaySoundOrMusic:
	LDA.w $0001,y
	TAX
	LDA.w $0002,y
	STA.w !RAM_SMW_IO_SoundCh1,x
	;CPX.w #!Const_SMW_SoundPort_1DFB
	;BNE.b .NotMusicChannel
	;STA.w !RAM_SMW_Misc_MusicRegisterBackup
.NotMusicChannel:
	INY
	INY
	INY
	RTS

Op47_OverrideCurrentMapMusic:
	LDA.w $0001,y
	STA.w !RAM_SMW_Overworld_MusicOverride
	STA.w !RAM_SMW_Misc_MusicRegisterBackup
	STA.w !RAM_SMW_IO_MusicCh1
	INY
	INY
	RTS
	
Op1F_FreezeScreen:
	LDA.b #$01
	BRA.b +

Op20_UnfreezeScreen:
	LDA.b #$00
+:
	STA.b !RAM_SMW_Flag_SpritesLocked
	RTS

Op22_WaitXFrames:
	LDA.w !RAM_SMW_Overworld_MarioWaitTimer
	BEQ.b ++
	CMP.b #$01
	BNE.b +
	INY
	INY
	STZ.w !RAM_SMW_Overworld_MarioWaitTimer
	RTS

+:
	DEC.w !RAM_SMW_Overworld_MarioWaitTimer
	JMP.w ExitScriptProcessing

++:
	LDA.w $0001,y
	STA.w !RAM_SMW_Overworld_MarioWaitTimer
	JMP.w ExitScriptProcessing

Op23_CheckIfXEventPassed:
	PHY
	REP.b #$20
	LDA.w $0001,y
	JSL.l GetEventIndex
	SEP.b #$20
	LDA.w !RAM_SMW_Overworld_EventFlags,y
	AND.l BitTable,x
	BEQ.b +
	PLY
	LDX.w $0003,y
	TXY
	RTS

+:
	PLY
	INY
	INY
	INY
	INY
	INY
	RTS

Op29_CheckIfXEventNotPassed:
	PHY
	REP.b #$20
	LDA.w $0001,y
	JSL.l GetEventIndex
	SEP.b #$20
	LDA.w !RAM_SMW_Overworld_EventFlags,y
	AND.l BitTable,x
	BNE.b +
	PLY
	LDX.w $0003,y
	TXY
	RTS

+:
	PLY
	INY
	INY
	INY
	INY
	INY
	RTS

Op2A_SetEvent:
	PHY
	REP.b #$20
	LDA.w $0001,y
	JSL.l GetEventIndex
	INC.w !RAM_SMW_Counter_EventsTriggered
	SEP.b #$20
	LDA.w !RAM_SMW_Overworld_EventFlags,y
	ORA.l BitTable,x
	STA.w !RAM_SMW_Overworld_EventFlags,y
	PLY
	INY
	INY
	INY
	RTS

BitTable:
	db $01,$02,$04,$08,$10,$20,$40,$80

Op2D_DebuggerBreakpoint:
	WDM #$00
	STA.l $10FFFF
	INY
	RTS

Op2E_SpawnSprite:
	JSL.l SpawnOverworldSprite
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

Op2F_DisplayLevelName:
	REP.b #$20
	PHY
	LDX.w $0001,y
	LDA.l LevelNameIndexTable,x
	JSL.l UpdateLevelName
	PLY
	INY
	INY
	INY
	SEP.b #$20
	RTS

Op43_JSLToScript:
	REP.b #$21
	LDX.w !RAM_SMW_Overworld_MarioScriptStackPointer
	INC.w !RAM_SMW_Overworld_MarioScriptStackPointer
	INC.w !RAM_SMW_Overworld_MarioScriptStackPointer
	INC.w !RAM_SMW_Overworld_MarioScriptStackPointer
	TYA
	ADC.w #$0004
	STA.w !RAM_SMW_Overworld_MarioScriptStack,x
	SEP.b #$20
	LDA.w $0003,y
	STA.w !RAM_SMW_Overworld_MarioScriptStack+$02,x
	PHA
	PLB
	LDX.w $0001,y
	TXY
	RTS

Op30_JSRToScript:
	REP.b #$21
	LDX.w !RAM_SMW_Overworld_MarioScriptStackPointer
	INC.w !RAM_SMW_Overworld_MarioScriptStackPointer
	INC.w !RAM_SMW_Overworld_MarioScriptStackPointer
	TYA
	ADC.w #$0003
	STA.w !RAM_SMW_Overworld_MarioScriptStack,x
	SEP.b #$20
	LDX.w $0001,y
	TXY
	RTS

Op44_RTLToScript:
	DEC.w !RAM_SMW_Overworld_MarioScriptStackPointer
	LDX.w !RAM_SMW_Overworld_MarioScriptStackPointer
	LDA.w !RAM_SMW_Overworld_MarioScriptStack,x
	PHA
	PLB
Op31_RTSToScript:
	DEC.w !RAM_SMW_Overworld_MarioScriptStackPointer
	DEC.w !RAM_SMW_Overworld_MarioScriptStackPointer
	LDX.w !RAM_SMW_Overworld_MarioScriptStackPointer
	LDY.w !RAM_SMW_Overworld_MarioScriptStack,x
	RTS

Op32_DoPathExitTransition:
	LDA.b #$00
	XBA
	LDA.w !RAM_SMW_Overworld_HDMATransitionEffectFlag
	TAX
	JMP.w (.HDMATransitionPtrs,x)

.HDMATransitionPtrs:
	dw .State00_Initialize
	dw .State02_FadeOut
	dw .State04_FadeIn
	dw .State06_EndHDMA

.State00_Initialize:
	JSR.w InitializeColorMathMirrors
	JSR.w ClearWindowHDMATable
if !Define_SMW_Overworld_BorderSetting == !BorderSetting_Full
	LDX.w #$7000
else
	LDX.w #$7F00
endif
	STX.w !RAM_SMW_Overworld_HDMATransitionEffectXPosLo
if !Define_SMW_Overworld_BorderSetting == !BorderSetting_None
	LDX.w #$7400
else
	LDX.w #$5400
endif
	STX.w !RAM_SMW_Overworld_HDMATransitionEffectYPosLo
	LDA.b #$02
	STA.w !RAM_SMW_Overworld_HDMATransitionEffectFlag
if !Define_SMW_Overworld_BorderSetting != !BorderSetting_None
	LDX.w #$004E
	LDA.b #$FF
-:
	STA.w !RAM_SMW_Misc_HDMAWindowEffectTable+$01,x
	STZ.w !RAM_SMW_Misc_HDMAWindowEffectTable,x
	DEX
	DEX
	BPL.b -
endif
	JMP.w ExitScriptProcessing

.DATA_04DB08:
if !Define_SMW_Overworld_BorderSetting == !BorderSetting_Full
	dw $F900,$0700
else
	dw $F800,$0800
endif

.DATA_04DB0C:
if !Define_SMW_Overworld_BorderSetting == !BorderSetting_Full
	dw $0000,$7000
else
	dw $0000,$7F00
endif

.DATA_04DB10:
if !Define_SMW_Overworld_BorderSetting == !BorderSetting_None
	dw $FAC0,$0740
else
	dw $FAC0,$0540
endif

.DATA_04DB14:
if !Define_SMW_Overworld_BorderSetting == !BorderSetting_None
	dw $0000,$7400
else
	dw $0000,$5400
endif

.State02_FadeOut:
.State04_FadeIn:
	REP.b #$21
	LDA.w !RAM_SMW_Overworld_HDMATransitionEffectXPosLo
	ADC.l .DATA_04DB08-$02,x
	STA.w !RAM_SMW_Overworld_HDMATransitionEffectXPosLo
	SEC
	SBC.l .DATA_04DB0C-$02,x
	EOR.l .DATA_04DB08-$02,x
	BPL.b .CODE_04DB43
	LDA.w !RAM_SMW_Overworld_HDMATransitionEffectYPosLo
	CLC
	ADC.l .DATA_04DB10-$02,x
	STA.w !RAM_SMW_Overworld_HDMATransitionEffectYPosLo
	SEC
	SBC.l .DATA_04DB14-$02,x
	EOR.l .DATA_04DB10-$02,x
	BMI.b .CODE_04DB5F
.CODE_04DB43:
	LDA.l .DATA_04DB0C-$02,x
	STA.w !RAM_SMW_Overworld_HDMATransitionEffectXPosLo
	LDA.l .DATA_04DB14-$02,x
	STA.w !RAM_SMW_Overworld_HDMATransitionEffectYPosLo
	INC.w !RAM_SMW_Overworld_HDMATransitionEffectFlag
	INC.w !RAM_SMW_Overworld_HDMATransitionEffectFlag
	LDA.w !RAM_SMW_Overworld_HDMATransitionEffectFlag
	CMP.w #$0004
	BNE.b .CODE_04DB5F
	SEP.b #$20
	LDA.b #$0C
	DEY
	JMP.w Op21_BeginOverworldWarp_Entry2

.CODE_04DB5F:
	SEP.b #$20
	LDA.w !RAM_SMW_Overworld_HDMATransitionEffectYPosHi
	ASL
	STA.b !RAM_SMW_Misc_ScratchRAM00
	STZ.b !RAM_SMW_Misc_ScratchRAM01
	LDA.w !RAM_SMW_Overworld_HDMATransitionEffectXPosHi
	CLC
	ADC.b #$80
	XBA
	LDA.b #$80
	SEC
	SBC.w !RAM_SMW_Overworld_HDMATransitionEffectXPosHi
	REP.b #$20
	PHY
	LDX.w #$0000
if !Define_SMW_Overworld_BorderSetting == !BorderSetting_None
	LDY.w #$00E8
else
	LDY.w #$00A8
endif
.CODE_04DB7A:
	CPX.b !RAM_SMW_Misc_ScratchRAM00
	BCC.b .CODE_04DB81
	LDA.w #$00FF
.CODE_04DB81:
if !Define_SMW_Overworld_BorderSetting == !BorderSetting_None
	STA.w !RAM_SMW_Misc_HDMAWindowEffectTable-$02,y
	STA.w !RAM_SMW_Misc_HDMAWindowEffectTable+$D8,x
else
	STA.w !RAM_SMW_Misc_HDMAWindowEffectTable+$4E,y
	STA.w !RAM_SMW_Misc_HDMAWindowEffectTable+$F8,x
endif
	INX
	INX
	DEY
	DEY
	BNE.b .CODE_04DB7A
	PLY
	STZ.w !RAM_SMW_Palettes_BackgroundColorLo
	SEP.b #$20
	JSL.l SetColorMathRegistersForPathExitTransition
if !SA1ROM == !TRUE
	LDA.b #$02
else
	LDA.b #$80
endif
	TSB.w !RAM_SMW_Mirror_HDMAEnable
	JMP.w ExitScriptProcessing

.State06_EndHDMA:
	STZ.w !RAM_SMW_Overworld_HDMATransitionEffectFlag
	JSR.w InitializeColorMathMirrors
	INY
	RTS

Op33_DisplayPrompt:
	LDX.w !RAM_SMW_Overworld_MarioScriptState
	JMP.w (.MessagePromptPtrs,x)

.MessagePromptPtrs:
	dw .State00_Initialize
	dw .State02_ExpandWindow
	dw .State04_UploadMenu
	dw .State06_ProcessCurrentPrompt
	dw .State08_ShrinkWindow

.State00_Initialize:
	JSR.w InitializeColorMathMirrors
	LDA.b #!Define_SMW_Sound1DFC_MessageBox
	STA.w !RAM_SMW_IO_SoundCh3
	LDA.b #$02
	STA.w !RAM_SMW_Overworld_MarioScriptState
	TSB.b !RAM_SMW_Flag_SpritesLocked
	JMP.w ExitScriptProcessing

.DATA_04F411:
	db $04,$FC

.DATA_04F413:
	db $68,$00

.State02_ExpandWindow:
.State08_ShrinkWindow:
	PHY
	SEP.b #$10
	LDX.b #$00
	LDA.w !RAM_SMW_Player_MariosLives
	CMP.w !RAM_SMW_Player_LuigisLives
	BPL.b .CODE_04F420
	INX
.CODE_04F420:
	STX.w !RAM_SMW_Flag_WhoGetsLivesInExchangeMenu
	LDX.w !RAM_SMW_Flag_MessageWindowSizeChangeDirection
	LDA.w !RAM_SMW_Timer_WaitBeforeMessageWindowSizeChange
	CMP.l .DATA_04F413,x
	BNE.b .CODE_04F44B
	INC.w !RAM_SMW_Overworld_MarioScriptState
	INC.w !RAM_SMW_Overworld_MarioScriptState
	LDA.w !RAM_SMW_Overworld_MarioScriptState
	CMP.b #$0A
	REP.b #$10
	BCC.b .Return04F44A
	STZ.w !RAM_SMW_Overworld_MarioScriptState
	STZ.w !RAM_SMW_Flag_MessageWindowSizeChangeDirection
	LDA.b #$02
	TRB.b !RAM_SMW_Flag_SpritesLocked
if !SA1ROM == !TRUE
	LDA.b #$02
else
	LDA.b #$80
endif
	TRB.w !RAM_SMW_Mirror_HDMAEnable
	PLY
	INY
	INY
	RTS

.Return04F44A:
	PLY
	JMP.w ExitScriptProcessing

.CODE_04F44B:
	CLC
	ADC.l .DATA_04F411,x
	STA.w !RAM_SMW_Timer_WaitBeforeMessageWindowSizeChange
	CLC
	ADC.b #$80
	XBA
	REP.b #$10
	JSR.w ClearWindowHDMATable
	SEP.b #$10
	LDA.w !RAM_SMW_Timer_WaitBeforeMessageWindowSizeChange
	LSR
	ADC.w !RAM_SMW_Timer_WaitBeforeMessageWindowSizeChange
	LSR
	AND.b #$FE
	CMP.b #$48
	BCC.b +
	LDA.b #$48
+:
	TAX
	LDA.b #$80
	SEC
	SBC.w !RAM_SMW_Timer_WaitBeforeMessageWindowSizeChange
	REP.b #$20
	LDY.b #$48
.CODE_04F47F:
	STA.w !RAM_SMW_Misc_HDMAWindowEffectTable+$A8,y
	STA.w !RAM_SMW_Misc_HDMAWindowEffectTable+$F0,x
	DEY
	DEY
	DEX
	DEX
	BPL.b .CODE_04F47F
	STZ.w !RAM_SMW_Palettes_BackgroundColorLo
	SEP.b #$20
	LDA.b #$22
	STA.b !RAM_SMW_Mirror_BG1And2WindowMaskSettings
	LDA.b #$20
	STA.b !RAM_SMW_Mirror_ObjectAndColorWindowSettings
if !SA1ROM == !TRUE
	LDA.b #$02
else
	LDA.b #$80
endif
	TSB.w !RAM_SMW_Mirror_HDMAEnable
	REP.b #$10
	PLY
	JMP.w ExitScriptProcessing

.State04_UploadMenu:
	LDX.w #$0000
	STX.b !RAM_SMW_Mirror_Layer3XPosLo
	STX.b !RAM_SMW_Mirror_Layer3YPosLo
	INC.w !RAM_SMW_Overworld_MarioScriptState
	INC.w !RAM_SMW_Overworld_MarioScriptState
	LDA.w $0001,y
	BNE.b ..NotSavePrompt
	LDA.b #!Define_SMW_StripeImage_SaveMenuText
	STA.b !RAM_SMW_Graphics_StripeImageToUpload
..NotSavePrompt:
	JMP.w ExitScriptProcessing

.State06_ProcessCurrentPrompt:
if !SA1ROM == !TRUE
	STY.b !RAM_SMW_Misc_ScratchRAM00
	PHB
	PLA
	STA.b !RAM_SMW_Misc_ScratchRAM02
	LDX.w #.SNESMain
	STX.w !RAM_SMW_SA1_SNESCodePointerLo
	LDX.w #.SNESMain>>8
	STX.w !RAM_SMW_SA1_SNESCodePointerHi
	LDA.b #$D0
	STA.w !REGISTER_SA1_SA1RQControlWrite
-:
	LDA.w !RAM_SMW_SA1_SNESDoneFlag
	BEQ.b -
	STZ.w !RAM_SMW_SA1_SNESDoneFlag
	JMP.w ExitScriptProcessing

.SNESMain:
	PHP
	SEP.b #$20
	REP.b #$10
	PHB
	LDA.b !RAM_SMW_Misc_ScratchRAM02
	PHA
	PLB
	LDY.b !RAM_SMW_Misc_ScratchRAM00
	JSR.w ..Sub
	PLB
	PLP
	RTL

..Sub
endif
	PHY
	LDX.w #$0000
	STX.b !RAM_SMW_Mirror_Layer3XPosLo
	STX.b !RAM_SMW_Mirror_Layer3YPosLo
	LDA.w $0001,y
	SEP.b #$10
	BEQ.b ..SavePrompt
	JSL.l BufferLifeExchangerMenu
	BRA.b ++

..SavePrompt:
	JSL.l SMW_OverworldPrompt07_DisplayingSavePrompt_Bank00
++:
	REP.b #$10
	PLY
if !SA1ROM == !TRUE
	RTS
else
	JMP.w ExitScriptProcessing
endif

InitializeColorMathMirrors:
if !SA1ROM == !TRUE
	LDA.b #$02
else
	LDA.b #$80
endif
	TRB.w !RAM_SMW_Mirror_HDMAEnable
	STZ.w !RAM_SMW_Palettes_BackgroundColorLo
	STZ.w !RAM_SMW_Palettes_BackgroundColorHi
	STZ.b !RAM_SMW_Mirror_BG1And2WindowMaskSettings
	STZ.b !RAM_SMW_Mirror_BG3And4WindowMaskSettings
	STZ.b !RAM_SMW_Mirror_ObjectAndColorWindowSettings
	RTS

Op34_SetEventTileCoords:
	REP.b #$20
	STZ.w !RAM_SMW_Overworld_EventTileLayer
	LDA.w $0001,y
	ASL
	ROL.w !RAM_SMW_Overworld_EventTileLayer
	ASL
	ASL
	ASL
	STA.w !RAM_SMW_Overworld_EventTileXPos
	STA.b !RAM_SMW_Blocks_XPosLo
	LDA.w $0003,y
	ASL
	ASL
	ASL
	ASL
	STA.w !RAM_SMW_Overworld_EventTileYPos
	STA.b !RAM_SMW_Blocks_YPosLo
	SEP.b #$20
	INY
	INY
	INY
	INY
	INY
	RTS

Op35_MakeScreenShake:
	LDX.w $0001,y
	STX.w !RAM_SMW_Overworld_ShakingScreenTimer
	LDA.b #!Define_SMW_Sound1DF9_ValleyOfBowserAppears
	STA.w !RAM_SMW_IO_SoundCh1
	LDA.b #$02
	STA.w !RAM_SMW_Overworld_ShakingIntensity
	INY
	INY
	INY
	RTS

Op39_ScriptJumpTable:
	LDX.w $0003,y
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w $0004,y
	STX.b !RAM_SMW_Misc_ScratchRAM01
	LDX.w $0001,y
	LDA.w $0000,x
	ASL
	ADC.w $0000,x
	INC
	INC
	TAY
	LDA.b [!RAM_SMW_Misc_ScratchRAM00],y
	PHA
	PLB
	DEY
	DEY
	REP.b #$20
	LDA.b [!RAM_SMW_Misc_ScratchRAM00],y
	TAY
	SEP.b #$20
	RTS

Op3D_SetCameraFocusPoint:
	LDX.w !RAM_SMW_Overworld_MarioScriptState
	JMP.w (.States,x)

.States:
	dw .State00_SetDestination
	dw .State02_MoveToDestination

.State00_SetDestination:
	LDX.w $0001,y
	STX.w !RAM_SMW_Overworld_CameraFocusXPos
	LDX.w $0003,y
	STX.w !RAM_SMW_Overworld_CameraFocusYPos
	LDX.w #$0004
	STX.w !RAM_SMW_Overworld_CameraState
	LDX.w #$0002
	STX.w !RAM_SMW_Overworld_MarioScriptState
.State02_MoveToDestination:
	LDA.w !RAM_SMW_Overworld_CameraFocusXPos
	CMP.b !RAM_SMW_Mirror_CurrentLayer1XPosLo
	BNE.b +
	LDA.w !RAM_SMW_Overworld_CameraFocusYPos
	CMP.b !RAM_SMW_Mirror_CurrentLayer1YPosLo
	BNE.b +
	LDX.w #$0000
	STX.w !RAM_SMW_Overworld_MarioScriptState
	INY
	INY
	INY
	INY
	INY
	RTS

+:
	JMP.w ExitScriptProcessing

Op3E_SetFocusPointToCurrentPlayer:
	LDX.w #$0000
	STX.w !RAM_SMW_Overworld_CameraState
	INY
	RTS

Op3F_ChangePlayerAnimation:
	LDX.w !RAM_SMW_Player_CurrentCharacterX2Lo
	LDA.w $0001,y
	STA.w !RAM_SMW_Overworld_MarioAnimationState,x
	INY
	INY
	RTS

Op42_SetPlayerFacingDirection:
	LDX.w !RAM_SMW_Player_CurrentCharacterX2Lo
	LDA.w $0001,y
	STA.w !RAM_SMW_Overworld_MarioFacingDirection,x
	INY
	INY
	RTS

Op48_SetPlayerSpeed:
	LDX.w $0001,y
	STX.w !RAM_SMW_Overworld_CurrentPlayerSpeedOffset
	INY
	INY
	INY
	RTS

Op49_DisplayMessage:
if !Define_SMW_MessageText_UsingAltMessagingSystem == !TRUE
	warn "Since you specified you're using an alt message system, did you modify the code at 'Op49_DisplayMessage' as well as its corresponding macro to account for the new message system? If so, delete this warning so you won't see this again."
else
	LDX.w !RAM_SMW_Overworld_MarioScriptState
	JMP.w (.States,x)

.States:
	dw .State00_InitializeMessage
	dw .State02_DisplayMessage

.State00_InitializeMessage:
	LDA.w $0003,y
	BEQ.b .InvalidMessage
	STA.w !RAM_SMW_Misc_DisplayMessage
	LDX.w $0001,y
	STX.w !RAM_SMW_Overworld_LevelNumberLo
	LDA.b #$01
	STA.b !RAM_SMW_Flag_SpritesLocked
	LDX.b !RAM_SMW_Mirror_BG1And2WindowMaskSettings
	STX.w !RAM_SMW_Overworld_BackupOfColorMathAndWindowSettings
	LDX.b !RAM_SMW_Mirror_ObjectAndColorWindowSettings
	STX.w !RAM_SMW_Overworld_BackupOfColorMathAndWindowSettings+$02
	LDX.w #$0002
	STX.w !RAM_SMW_Overworld_MarioScriptState
	JSR.w ClearWindowHDMATable
.State02_DisplayMessage:
if !SA1ROM == !TRUE
	LDX.w #.SNESMain
	STX.w !RAM_SMW_SA1_SNESCodePointerLo
	LDX.w #.SNESMain>>8
	STX.w !RAM_SMW_SA1_SNESCodePointerHi
	LDA.b #$D0
	STA.w !REGISTER_SA1_SA1RQControlWrite
-:
	LDA.w !RAM_SMW_SA1_SNESDoneFlag
	BEQ.b -
	STZ.w !RAM_SMW_SA1_SNESDoneFlag
	LDA.w !RAM_SMW_Misc_DisplayMessage
	BNE.b +
	PHY
	PHP
	REP.b #$20
	JSR.w HandleLevelTileCollision_Main
	PLP
	PLY
	STZ.w !RAM_SMW_Overworld_MarioScriptState
	INY
	INY
	INY
	INY
	RTS

+:
	JMP.w ExitScriptProcessing

.SNESMain:
	REP.b #$10
endif
	PHY
	SEP.b #$10
	JSL.l SMW_DisplayMessage_Main
	REP.b #$10
	PLY
	LDA.w !RAM_SMW_Misc_DisplayMessage
	BNE.b .TextBoxNotClosed
	STZ.b !RAM_SMW_Flag_SpritesLocked
	LDX.w !RAM_SMW_Overworld_BackupOfColorMathAndWindowSettings
	STX.b !RAM_SMW_Mirror_BG1And2WindowMaskSettings
	LDX.w !RAM_SMW_Overworld_BackupOfColorMathAndWindowSettings+$02
	STX.b !RAM_SMW_Mirror_ObjectAndColorWindowSettings
	PHY
	PHP
	SEP.b #$10
if !Define_SMW_Overworld_DisplayLifeCounter == !TRUE
	JSL.l SMW_LoadOverworldLifeCounter_Main
endif
if !SA1ROM == !TRUE
else
	REP.b #$20
	JSR.w HandleLevelTileCollision_Main
endif
	PLP
	PLY
endif
.InvalidMessage:
	STZ.w !RAM_SMW_Overworld_MarioScriptState
	INY
	INY
	INY
	INY
if !SA1ROM == !TRUE
	RTL
else
	RTS
endif

.TextBoxNotClosed:
if !SA1ROM == !TRUE
	RTL
else
	JMP.w ExitScriptProcessing
endif

Op68_TeleportOverworldPlayerToCoords:
	REP.b #$20
	LDX.w !RAM_SMW_Player_CurrentCharacterX2Lo
	LDA.w $0001,y
	STA.w !RAM_SMW_Overworld_MarioXPosLo,x
	LDA.w $0003,y
	STA.w !RAM_SMW_Overworld_MarioYPosLo,x
	LDA.w $0005,y
	SEC
	SBC.w #!Define_SMW_Overworld_FirstMapSublevel
	CMP.w !RAM_SMW_Overworld_MarioMap,x
	BEQ.b +
	STA.w !RAM_SMW_Overworld_MarioMap,x
	SEP.b #$20
	LDA.b #$0B
	STA.w !RAM_SMW_Misc_GameMode
	LDA.b #$01
	STA.b !RAM_SMW_Flag_SpritesLocked
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	JMP.w ExitScriptProcessing

+:
	SEP.b #$20
	INY
	INY
	INY
	INY
	INY
	INY
	INY
	RTS

;---------------------------------------------------------------------------

LoadEventsForCurrentSubmap:
	PHB
	PHK
	PLB
	JSR.w .Sub
	PLB
	RTL

.Sub:
	REP.b #$30
	LDX.w !RAM_SMW_Overworld_MarioScriptAddress
	PHX
	LDX.w !RAM_SMW_Overworld_MarioScriptAddress+$01
	PHX
	LDA.w !RAM_SMW_LM_Misc_CurrentLevelNumberLo
	SEC
	SBC.w #!Define_SMW_Overworld_FirstMapSublevel
	STA.b !RAM_SMW_Misc_ScratchRAM0E
	ASL
	ADC.b !RAM_SMW_Misc_ScratchRAM0E
	TAX
	CPX.w #SubmapScripts_End-SubmapScripts
	BCS.b +
	LDA.l SubmapScripts+$01,x
	BEQ.b +
	STA.w !RAM_SMW_Overworld_MarioScriptAddress+$01
	PHA
	PLB
	PLB
	LDA.l SubmapScripts,x
	STA.w !RAM_SMW_Overworld_MarioScriptAddress
	JSR.w ProcessScript
	REP.b #$10
+:
	PLX
	STX.w !RAM_SMW_Overworld_MarioScriptAddress+$01
	PLX
	STX.w !RAM_SMW_Overworld_MarioScriptAddress
	SEP.b #$30
	RTS

;---------------------------------------------------------------------------

!RAM_SMW_OWPlayerLevelCollision_CurrentLayer = !RAM_SMW_Misc_ScratchRAM0E

HandleLevelTileCollision:
.ScriptEntry:
	PHB
	PHK
	PLB
	PHY
	PHP
	SEP.b #$10
	REP.b #$20
	STZ.b !RAM_SMW_IO_ControllerHold2
	STZ.b !RAM_SMW_IO_ControllerHold1
	JSR.w .Main
	PLP
	PLY
	PLB
	RTL

.Main:
	JSR.w GetMap16Tiles
	REP.b #$10
	LDA.w !RAM_SMW_Overworld_MarioL1TileTouched
	CMP.w #!Define_SMW_Overworld_StartOfInteractiveTileMap16
	BCC.b +
	CMP.w #!Define_SMW_Overworld_EndOfInteractiveTileMap16+$01
	BCC.b InteractiveTile
+:
	LDA.w !RAM_SMW_Overworld_MarioL2TileTouched
	CMP.w #!Define_SMW_Overworld_StartOfInteractiveTileMap16
	BCC.b +
	CMP.w #!Define_SMW_Overworld_EndOfInteractiveTileMap16+$01
	BCC.b InteractiveTile
+:
	LDA.w #$FFFF
	STA.w !RAM_SMW_Overworld_TileScriptIndex
	LDA.w #$0000
	JSL.l UpdateLevelName
	SEP.b #$10
	RTS

InteractiveTile:
	SEC
	SBC.w #!Define_SMW_Overworld_StartOfInteractiveTileMap16
	STA.w !RAM_SMW_Overworld_MarioSaveLocation
	ASL
	STA.b !RAM_SMW_Misc_ScratchRAM00
	ADC.w !RAM_SMW_Overworld_MarioSaveLocation
	STA.w !RAM_SMW_Overworld_TileScriptIndex
	LDX.b !RAM_SMW_Misc_ScratchRAM00
	LDA.l LevelNameIndexTable,x
	JSL.l UpdateLevelName
	SEP.b #$10
	RTS

GetMap16Tiles:
	LDX.w !RAM_SMW_Player_CurrentCharacterX2Lo
	LDA.w !RAM_SMW_Overworld_MarioXPosLo,x
	STA.b !RAM_SMW_Misc_ScratchRAM00
	LDA.w !RAM_SMW_Overworld_MarioYPosLo,x
	STA.b !RAM_SMW_Misc_ScratchRAM02
	STZ.b !RAM_SMW_OWPlayerLevelCollision_CurrentLayer
	JSL.l GetMap16TileFromLevelBuffer_MarioLayer1
	STA.w !RAM_SMW_Overworld_MarioL1TileTouched
	LDA.b !RAM_SMW_Misc_LevelLayoutFlags-$01
	BPL.b NoLayer2Collision
	LDA.w #$0030
	STA.b !RAM_SMW_OWPlayerLevelCollision_CurrentLayer
	LDA.b !RAM_SMW_Misc_ScratchRAM00
	CLC
	ADC.b !RAM_SMW_Misc_SecondLevelLayerXPosLo
	STA.b !RAM_SMW_Misc_ScratchRAM00
	LDA.b !RAM_SMW_Misc_ScratchRAM02
	CLC
	ADC.b !RAM_SMW_Misc_SecondLevelLayerYPosLo
	STA.b !RAM_SMW_Misc_ScratchRAM02
	JSL.l GetMap16TileFromLevelBuffer_MarioLayer2
	STA.w !RAM_SMW_Overworld_MarioL2TileTouched
	;LDA.b !RAM_SMW_Misc_ScratchRAM00
	;SEC
	;SBC.b !RAM_SMW_Misc_SecondLevelLayerXPosLo
	;STA.b !RAM_SMW_Misc_ScratchRAM00
	;LDA.b !RAM_SMW_Misc_ScratchRAM02
	;SEC
	;SBC.b !RAM_SMW_Misc_SecondLevelLayerYPosLo
	;STA.b !RAM_SMW_Misc_ScratchRAM02
	RTS

NoLayer2Collision:
	STZ.w !RAM_SMW_Overworld_MarioL2TileTouched
	RTS

OutOfBoundsTile:
	LDA.w #$0000
	RTL

; Fast version of the various routines that get an index into the level buffer to determine what tile is being collided with.
; If all the vanilla routines were replaced with a similar routine, not only would you see a speed boost, but you'd also save RAM since $7E0CB6-$7E0CF5 wouldn't be needed anymore.
; SMW could really use a rewrite in general.

GetMap16TileFromLevelBuffer:
.MarioLayer1:
.MarioLayer2:
	LDA.b !RAM_SMW_Misc_ScratchRAM02
	CLC
	ADC.w #!Const_SMW_OWPlayer_CollisionPointYDisp
	AND.w #$FFF0
	STA.b !RAM_SMW_Blocks_YPosLo
	LDA.b !RAM_SMW_Misc_ScratchRAM00
	CLC
	ADC.w #!Const_SMW_OWPlayer_CollisionPointXDisp
	AND.w #$FFF0
	STA.b !RAM_SMW_Blocks_XPosLo
.EventEntry:
	CMP.b !RAM_SMW_Misc_ScreensInLvl-$01
	AND.w #$FF00
	BCS.b OutOfBoundsTile
	ASL
	ADC.b !RAM_SMW_Blocks_XPosLo
	XBA
	ADC.b !RAM_SMW_OWPlayerLevelCollision_CurrentLayer
	TAY
	LDA.b !RAM_SMW_Blocks_YPosLo
	CMP.w !RAM_SMW_LM_Misc_LevelScreenSizeLo
	BCS.b OutOfBoundsTile
	LDA.b !RAM_SMW_Blocks_XPosLo
	AND.w #$00F0
	LSR
	LSR
	LSR
	LSR
	ORA.b !RAM_SMW_Blocks_YPosLo
	ADC.w !RAM_SMW_LM_Misc_24BitL1LevelScreenPosLoPtrs,y
	REP.b #$10
	TAX
	LDA.l !RAM_SMW_Blocks_Map16TableLo&$FF0000,x
	STA.b !RAM_SMW_Misc_ScratchRAM0C
	LDA.l !RAM_SMW_Blocks_Map16TableHi&$FF0000,x
	SEP.b #$10
	TAY
	STY.b !RAM_SMW_Misc_ScratchRAM0D
	LDA.b !RAM_SMW_Misc_ScratchRAM0C
	CLC
	RTL

;---------------------------------------------------------------------------

HandleStarWarpLaunch:
	LDA.b !RAM_SMW_Counter_LocalFrames
	AND.b #$07
	BNE.b +
	LDA.w !RAM_SMW_Overworld_MarioStarWarpSpeed
	CMP.b #$04
	BCS.b +
	INC.w !RAM_SMW_Overworld_MarioStarWarpSpeed
+:
	REP.b #$20
	LDA.w #$0004
	STA.w !RAM_SMW_Overworld_CameraState
	LDA.w !RAM_SMW_Overworld_MarioStarWarpSpeed
	AND.w #$00FF
	STA.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w !RAM_SMW_Player_CurrentCharacterX2Lo
	LDA.w !RAM_SMW_Overworld_MarioYPosLo,x
	SEC
	SBC.b !RAM_SMW_Misc_ScratchRAM00
	STA.w !RAM_SMW_Overworld_MarioYPosLo,x
	SEC
	SBC.b !RAM_SMW_Mirror_CurrentLayer1YPosLo
	CLC
	ADC.w #$0018
	SEP.b #$20
	BMI.b .AboveScreen
	PLX
	PLX
	JMP.w ExitScriptProcessing

.AboveScreen:
	RTS

;---------------------------------------------------------------------------

ClearWindowHDMATable:
	LDX.w #$01BE
	LDA.b #$FF
-:
	STA.w !RAM_SMW_Misc_HDMAWindowEffectTable,x
	STZ.w !RAM_SMW_Misc_HDMAWindowEffectTable+$01,x
	DEX
	DEX
	BPL.b -
	RTS

;---------------------------------------------------------------------------

namespace SMW_ProcessOWPlayers

if !Define_SMW_Overworld_DisplayLevelName&!Define_SMW_Overworld_LevelNameType == !TRUE
DrawLevelName:
	LDY.w #$0000
	LDA.w #!Define_SMW_Overworld_LevelNameStringSize-$01
	STA.b !RAM_SMW_Misc_ScratchRAM00
-:
	LDA.l !RAM_SMW_Overworld_LevelNameIndex
	CLC
	ADC.b !RAM_SMW_Misc_ScratchRAM00
	TAX
	LDA.l LevelNames,x
	AND.w #$00FF
	CMP.w #$00FF
	BEQ.b +
	INY
+:
	DEC.b !RAM_SMW_Misc_ScratchRAM00
	BPL.b -
	LDA.w #$0000
	JSL.l SMW_MaxtTile_Get_Slot
	BCC.b .SlotNotGotten
	LDY.w !RAM_SMW_OAM_MaxTileOAMBufferIndex1
	PEA.w ((DrawLevelName>>8)&$00FF00)|(!RAM_SMW_IO_OAMBuffer>>16)
	PLB
	LDA.w #!Define_SMW_Overworld_LevelNameXPos*$08
	STA.b !RAM_SMW_DrawOWSprite_XPos
	LDA.w #!Define_SMW_Overworld_LevelNameYPos*$08
	STA.b !RAM_SMW_DrawOWSprite_YPos
	STZ.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	STZ.b !RAM_SMW_DrawOWSprite_CurrentYDisp
	STZ.b !RAM_SMW_DrawOWSprite_CurrentFlip
	STZ.b !RAM_SMW_DrawOWSprite_HighXBitAndTileSize
	STZ.b !RAM_SMW_Misc_ScratchRAM08
	LDX.w #(!Define_SMW_Overworld_LevelNameStringSize-$01)*$02
	BRA.b +

--:
	DEX
	DEX
	BMI.b ++
-:
	INC.b !RAM_SMW_Misc_ScratchRAM08
	LDA.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	CLC
	ADC.w #$0008
	STA.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	ADC.b !RAM_SMW_DrawOWSprite_XPos
	CMP.w #$0100
	BCC.b +
	STZ.b !RAM_SMW_DrawOWSprite_XPos
	STZ.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	LDA.w #$0008
	STA.b !RAM_SMW_DrawOWSprite_CurrentYDisp
+:
	LDA.l !RAM_SMW_Overworld_LevelNameIndex
	CLC
	ADC.b !RAM_SMW_Misc_ScratchRAM08
	PHX
	TAX
	LDA.l LevelNames,x
	PLX
	AND.w #$00FF
	CMP.w #$00FF
	BEQ.b --
	ORA.w #(!Define_SMW_Overworld_LevelNamePalette<<9)|$3000
	STA.b !RAM_SMW_DrawOWSprite_TileAndProp
	JSL.l BufferOverworldSpriteTile
	BPL.b -
++:
	PLB
.SlotNotGotten:
	RTS
endif

if !Define_SMW_Overworld_DisplayBorderMario == !TRUE
DrawBorderMario:
	LDA.w #!Define_SMW_Overworld_BorderMarioXPos
	CLC
	ADC.b !RAM_SMW_Mirror_CurrentLayer1XPosLo
	STA.b !RAM_SMW_Player_XPosLo
	LDA.w #!Define_SMW_Overworld_BorderMarioYPos
	CLC
	ADC.b !RAM_SMW_Mirror_CurrentLayer1YPosLo
	STA.b !RAM_SMW_Player_YPosLo
	SEP.b #$30
	LDA.b #$08
	STA.b !RAM_SMW_Player_XSpeed
	PHB
	LDA.b #SMW_SetPlayerPose_Main>>16
	PHA
	PLB
	JSL.l SMW_SetPlayerPose_Main
	PLB
	LDA.b #$03
	STA.w !RAM_SMW_Player_CurrentLayerPriority
	JSL.l SMW_PlayerGFXRt_Main
	LDA.b #$06
	STA.w !RAM_SMW_Player_NumberOfTilesToUpdate
	LDA.w !RAM_SMW_Player_AnimationTimer
	BEQ.b +
	DEC.w !RAM_SMW_Player_AnimationTimer
+:
	LDA.w !RAM_SMW_Timer_CapeFlapAnimation
	BEQ.b +
	DEC.w !RAM_SMW_Timer_CapeFlapAnimation
+:
	REP.b #$30
	LDY.w #$0006
	STY.b !RAM_SMW_Misc_ScratchRAM00
	LDA.w #$0000
	JSL.l SMW_MaxtTile_Get_Slot
	BCC.b .SlotNotGotten
	LDA.b !RAM_SMW_Misc_ScratchRAM00
	ASL
	ASL
	DEC
	DEC
	AND.w #$FFFE
	TAX
	ADC.w !RAM_SMW_OAM_MaxTileOAMBufferIndex1
	TAY
	PEA.w ((DrawBorderMario>>8)&$00FF00)|(!RAM_SMW_IO_OAMBuffer>>16)
	PLB
-:
	LDA.l !RAM_SMW_IO_OriginalOAMBuffer+$01E8,x
	STA.w SMW_OAMBuffer[$00].XDisp,y
	DEY
	DEY
	DEX
	DEX
	BPL.b -
	LDA.b !RAM_SMW_Misc_ScratchRAM00
	DEC
	AND.w #$FFFE
	TAX
	CLC
	ADC.l !RAM_SMW_OAM_MaxTileOAMBufferIndex2
	TAY
-:
	LDA.l !RAM_SMW_Sprites_OriginalOAMTileSizeBuffer+$7A,x
	STA.w SMW_OAMTileSizeBuffer[$00].Slot,y
	DEY
	DEY
	DEX
	DEX
	BPL.b -
	PLB
.SlotNotGotten:
	REP.b #$30
	RTS
endif

if !Define_SMW_Overworld_DisplayBorderMario&!Define_SMW_Overworld_DisplayBorderMarioBackground == !TRUE
DrawBorderMarioBackground:
	LDY.w #$0004
	LDA.w #$0000
	JSL.l SMW_MaxtTile_Get_Slot
	BCC.b .SlotNotGotten
	LDY.w !RAM_SMW_OAM_MaxTileOAMBufferIndex1
	PEA.w ((DrawBorderMarioBackground>>8)&$00FF00)|(!RAM_SMW_IO_OAMBuffer>>16)
	PLB
	LDA.w #!Define_SMW_Overworld_BorderMarioXPos-$06
	STA.b !RAM_SMW_DrawOWSprite_XPos
	LDA.w #!Define_SMW_Overworld_BorderMarioYPos+$01
	STA.b !RAM_SMW_DrawOWSprite_YPos
	LDA.w #((!Define_SMW_Overworld_BorderMarioBackgroundPalette-$08)<<9)|$30E0
	STA.b !RAM_SMW_DrawOWSprite_TileAndProp
	STZ.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	STZ.b !RAM_SMW_DrawOWSprite_CurrentYDisp
	STZ.b !RAM_SMW_DrawOWSprite_CurrentFlip
	LDX.w #$0006
	BRA.b +

-:
	LDA.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	CLC
	ADC.w #$0010
	STA.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	CMP.w #$0020
	BCC.b +
	STZ.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	LDA.w #$0010
	STA.b !RAM_SMW_DrawOWSprite_CurrentYDisp
+:
	LDA.w #$0001
	STA.b !RAM_SMW_DrawOWSprite_HighXBitAndTileSize
	JSL.l BufferOverworldSpriteTile
	BPL.b -
	PLB
.SlotNotGotten:
	RTS
endif

DrawScrollArrows:
if !Define_SMW_Overworld_ScrollArrowType == !ScrollArrowType_Sprite
	LDY.w !RAM_SMW_Overworld_ShowScrollArrows
	BEQ.b .SlotNotGotten
	BMI.b .SlotNotGotten
	LDA.w #$0000
	JSL.l SMW_MaxtTile_Get_Slot
	BCC.b .SlotNotGotten
	LDY.w !RAM_SMW_OAM_MaxTileOAMBufferIndex1
	PEA.w ((DrawScrollArrows>>8)&$00FF00)|(!RAM_SMW_IO_OAMBuffer>>16)
	PLB
	STZ.b !RAM_SMW_DrawOWSprite_XPos
	STZ.b !RAM_SMW_DrawOWSprite_YPos
	STZ.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	STZ.b !RAM_SMW_DrawOWSprite_CurrentYDisp
	STZ.b !RAM_SMW_DrawOWSprite_CurrentFlip
	LDX.w #$0006
	STX.b !RAM_SMW_DrawOWSprite_LoopCounter
-:
	LDA.l ScrollArrowTileAndProp,x
	STA.b !RAM_SMW_DrawOWSprite_TileAndProp
	LDA.l ScrollArrowXDisp,x
	STA.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	LDA.l ScrollArrowYDisp,x
	STA.b !RAM_SMW_DrawOWSprite_CurrentYDisp
	LDA.w #$0001
	STA.b !RAM_SMW_DrawOWSprite_HighXBitAndTileSize
	JSL.l BufferOverworldSpriteTile
	BPL.b -
	PLB
.SlotNotGotten:
	RTS

ScrollArrowXDisp:
	dw $0018,$00D8,$0078,$0078

ScrollArrowYDisp:
	dw $0070,$0070,$0030,$00B8

ScrollArrowTileAndProp:
	dw (!Define_SMW_Overworld_ScrollArrowPalette<<9)|$70E2,(!Define_SMW_Overworld_ScrollArrowPalette<<9)|$30E2
	dw (!Define_SMW_Overworld_ScrollArrowPalette<<9)|$30E4,(!Define_SMW_Overworld_ScrollArrowPalette<<9)|$B0E4

else
	SEP.b #$10
	LDY.b #!Define_SMW_StripeImage_ShowScrollArrows
	LDA.w !RAM_SMW_Overworld_ShowScrollArrows
	BMI.b ++
	BNE.b +
	LDY.b #!Define_SMW_StripeImage_RemoveScrollArrows
+:
	STY.b !RAM_SMW_Graphics_StripeImageToUpload
++:
	REP.b #$10
endif
	RTS

DrawOverworldPlayerAndBorderSprites:
	REP.b #$30
if !Define_SMW_Overworld_DisplayLevelName&!Define_SMW_Overworld_LevelNameType == !TRUE
	JSR.w DrawLevelName
endif
	JSR.w DrawScrollArrows
	; Insert more JSRs here if you intend on implementing more UI elementss
if !Define_SMW_Overworld_DisplayBorderMario&!Define_SMW_Overworld_DisplayBorderMarioBackground == !TRUE
	JSR.w DrawBorderMarioBackground
endif
if !Define_SMW_Overworld_DisplayBorderMario == !TRUE
	JSR.w DrawBorderMario
endif
	LDA.b !RAM_SMW_Flag_SpritesLocked
	AND.w #$0002
	BNE.b .Nevermind
	SEP.b #$20
	LDA.w !RAM_SMW_Flag_TwoPlayerGame
	REP.b #$20
	BEQ.b .OnlyDrawMario
	LDA.w !RAM_SMW_Overworld_MarioMap
	CMP.w !RAM_SMW_Overworld_LuigiMap
	BNE.b .OnlyDrawMario
	LDA.w !RAM_SMW_Player_CurrentCharacterX2Lo
	AND.w #$00FF
	EOR.w #$0002
	TAY
	LDX.w !RAM_SMW_Overworld_MarioAnimationState,y
	JSR.w (AnimationStatePtrs,x)
	LDA.w !RAM_SMW_Player_CurrentCharacterX2Lo
	EOR.w #$0002
	LSR
	TAX
	LDA.w !RAM_SMW_Player_MariosYoshi,x
	AND.w #$00FF
	STA.b !RAM_SMW_Misc_ScratchRAM08
	JSR.w DrawOWPlayerSprite
.OnlyDrawMario:
	LDY.w !RAM_SMW_Player_CurrentCharacterX2Lo
	LDX.w !RAM_SMW_Overworld_MarioAnimationState,y
	JSR.w (AnimationStatePtrs,x)
	LDA.w !RAM_SMW_Player_CurrentCharacterX2Lo
	LSR
	TAX
	LDA.w !RAM_SMW_Player_MariosYoshi,x
	AND.w #$00FF
	STA.b !RAM_SMW_Misc_ScratchRAM08
	JSR.w DrawOWPlayerSprite
.Nevermind:
	SEP.b #$10
	REP.b #$20
	RTL

PlayerProp:
	dw ((!Define_SMW_Overworld_MarioPalette-$08)<<9)|$2006,((!Define_SMW_Overworld_LuigiPalette-$08)<<9)|$2008

; Note: All of the below graphics tables' rows are ordered based on the player facing direction in this order: up, down, left, right.

TileAndProp:
	dw $0000,$0002,$0004,$4004			; Walk 1
	dw $0001,$0003,$0005,$4005			; Walk 2
	dw $4000,$4002,$0004,$4004			; Walk 3
	dw $4001,$4003,$0005,$4005			; Walk 4
	dw $0008,$000A,$000C,$400C			; Swim 1
	dw $0009,$000B,$000D,$400D			; Swim 2
	dw $000E,$000E,$000E,$000E			; Climbing 1
	dw $400E,$400E,$400E,$400E			; Climbing 2
	dw $0006,$0006,$0006,$0006			; Enter Level On Land
	dw $0007,$0007,$0007,$0007			; Enter Level In Water
	dw $0000,$0002,$0004,$4004			; Dead on land
	dw $0008,$000A,$000C,$400C			; Dead in water

YDisp:
	dw $0000,$0000,$0000,$0000			; Walk 1
	dw $0000,$0000,$0000,$0000			; Walk 2
	dw $0000,$0000,$0000,$0000			; Walk 3
	dw $0000,$0000,$0000,$0000			; Walk 4
	dw $0005,$0005,$0005,$0005			; Swim 1
	dw $0005,$0005,$0005,$0005			; Swim 2
	dw $0000,$0000,$0000,$0000			; Climbing 1
	dw $0000,$0000,$0000,$0000			; Climbing 2
	dw $0000,$0000,$0000,$0000			; Enter Level On Land
	dw $0005,$0005,$0005,$0005			; Enter Level In Water
	dw $0000,$0000,$0000,$0000			; Dead on land
	dw $0005,$0005,$0005,$0005			; Dead in water

DrawOWPlayerSprite:
	STZ.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	STZ.b !RAM_SMW_DrawOWSprite_CurrentFlip
	LDA.w !RAM_SMW_Overworld_MarioXPosLo,y
	SEC
	SBC.b !RAM_SMW_Mirror_CurrentLayer1XPosLo
	STA.b !RAM_SMW_DrawOWSprite_XPos
	LDA.w !RAM_SMW_Overworld_MarioYPosLo,y
	SEC
	SBC.b !RAM_SMW_Mirror_CurrentLayer1YPosLo
	STA.b !RAM_SMW_DrawOWSprite_YPos
	LDA.w !RAM_SMW_Overworld_MarioFacingDirection,y
	LSR
	CLC
	ADC.w !RAM_SMW_Overworld_MarioAnimationFrame,y
	ASL
	TAX
	LDA.w PlayerProp,y
	STA.b !RAM_SMW_Misc_ScratchRAM8E
	LDA.w !RAM_SMW_Overworld_MarioAnimationState,y
	STA.w !RAM_SMW_Misc_ScratchRAM7E18B6
	SEC
	SBC.w #!Const_SMW_OWPlayerAnimation_DeadOnLand
	CMP.w #$0003
	BCS.b .NotDead
	JMP.w .DrawHalo

.NotDead:
	LDA.b !RAM_SMW_Misc_ScratchRAM08
	BNE.b .DrawMarioOnYoshi
	LDY.w #$0001
	LDA.w #$0001
	JSL.l SMW_MaxtTile_Get_Slot
	BCS.b ..SlotGotten
	RTS

..SlotGotten:
	LDY.w !RAM_SMW_OAM_MaxTileOAMBufferIndex1
	PHB
	PEA.w !RAM_SMW_IO_OAMBuffer>>8
	PLB
	PLB
	JMP.w .DrawMarioAlone

.DrawMarioOnYoshi:
	LDY.w #$0005
	LDA.w #$0001
	JSL.l SMW_MaxtTile_Get_Slot
	BCS.b ..SlotGotten
	RTS

..SlotGotten:
	LDY.w !RAM_SMW_OAM_MaxTileOAMBufferIndex1
	PHB
	PEA.w !RAM_SMW_IO_OAMBuffer>>8
	PLB
	PLB
	TXA
	AND.w #$0006
	CMP.w #!Const_SMW_MarioFaceDown
	BNE.b ..DrawMarioFirst
	JSR.w ..DrawYoshi
	JSR.w ..DrawMario
	PLB
	RTS

..DrawMarioFirst:
	JSR.w ..DrawMario
	JSR.w ..DrawYoshi
	PLB
	RTS

..DrawYoshi:
	LDA.l YDisp,x
	STA.b !RAM_SMW_DrawOWSprite_CurrentYDisp
	LDA.b !RAM_SMW_Misc_ScratchRAM08
	SEC
	SBC.w #$0004
	XBA
	AND.w #$0E00
	STA.b !RAM_SMW_DrawOWSprite_TileAndProp
	PHX
	LDA.l .YoshiAnimIndex,x
	AND.w #$00FF
	STA.b !RAM_SMW_Misc_ScratchRAM08
	LDX.w #$0006
	STX.b !RAM_SMW_DrawOWSprite_LoopCounter
-:
	LDX.b !RAM_SMW_Misc_ScratchRAM08
	LDA.b !RAM_SMW_DrawOWSprite_TileAndProp
	AND.w #$0E00
	ORA.l .YoshiTileAndProp,x
	STA.b !RAM_SMW_DrawOWSprite_TileAndProp
	STZ.b !RAM_SMW_DrawOWSprite_HighXBitAndTileSize
	DEC.b !RAM_SMW_Misc_ScratchRAM08
	DEC.b !RAM_SMW_Misc_ScratchRAM08
	LDX.b !RAM_SMW_DrawOWSprite_LoopCounter
	LDA.l .YoshiXDisp,x
	STA.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	LDA.l .YoshiYDisp,x
	CLC
	ADC.b !RAM_SMW_DrawOWSprite_CurrentYDisp
	STA.b !RAM_SMW_DrawOWSprite_CurrentYDisp
	JSL.l BufferOverworldSpriteTile
	BPL.b -
	PLX
	RTS

..DrawMario:
	PHX
	LDA.l .MarioOnYoshiYDisp,x
	STA.b !RAM_SMW_DrawOWSprite_CurrentYDisp
	LDA.l .MarioOnYoshiXDisp,x
	STA.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	LDA.l .MarioOnYoshiTileAndProp,x
	AND.w #$FF00
	ORA.b !RAM_SMW_Misc_ScratchRAM8E
	STA.b !RAM_SMW_DrawOWSprite_TileAndProp
	LDA.w #$0001
	STA.b !RAM_SMW_DrawOWSprite_HighXBitAndTileSize
	JSL.l BufferOverworldSpriteTile
	PLX
	PHY
	PHB
	PHK
	PLB
	LDA.b !RAM_SMW_Misc_ScratchRAM8E
	CMP.w PlayerProp+$02
	BEQ.b ..DrawingLuigi
	LDY.w #$0000
	LDA.w .MarioOnYoshiTileAndProp,x
	AND.w #$00FF
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	ADC.w #DynamicOWMarioTiles
	BRA.b +

..DrawingLuigi:
	LDY.w #$0002
	LDA.w .MarioOnYoshiTileAndProp,x
	AND.w #$00FF
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	ADC.w #DynamicOWLuigiTiles
+:
	STA.w SMW_DynamicSpritePointersTop[$03].LowByte,y
	PLB
	PLY
	RTS

.DrawHalo:
	LDY.w #$0003
	LDA.w #$0001
	JSL.l SMW_MaxtTile_Get_Slot
	BCS.b ..SlotGotten
	RTS

..SlotGotten:
	LDY.w !RAM_SMW_OAM_MaxTileOAMBufferIndex1
	PHB
	PEA.w !RAM_SMW_IO_OAMBuffer>>8
	PLB
	PLB
	PHX
	LDA.w #$FFF9
	STA.b !RAM_SMW_DrawOWSprite_CurrentYDisp
	LDA.w #$207C
	STA.b !RAM_SMW_DrawOWSprite_TileAndProp
	STZ.b !RAM_SMW_DrawOWSprite_HighXBitAndTileSize
	JSL.l BufferOverworldSpriteTile
	LDA.w #$6000
	TSB.b !RAM_SMW_DrawOWSprite_TileAndProp
	LDA.w #$0008
	STA.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	STZ.b !RAM_SMW_DrawOWSprite_HighXBitAndTileSize
	JSL.l BufferOverworldSpriteTile
	STZ.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	PLX
.DrawMarioAlone:
	LDA.l YDisp,x
	STA.b !RAM_SMW_DrawOWSprite_CurrentYDisp
	LDA.l TileAndProp,x
	AND.w #$FF00
	ORA.b !RAM_SMW_Misc_ScratchRAM8E
	STA.b !RAM_SMW_DrawOWSprite_TileAndProp
	LDA.w #$0001
	STA.b !RAM_SMW_DrawOWSprite_HighXBitAndTileSize
	PHX
	JSL.l BufferOverworldSpriteTile
	PLX
	PLB
.SetPlayerGFXPointer:
	LDA.b !RAM_SMW_Misc_ScratchRAM8E
	CMP.w PlayerProp+$02
	BEQ.b ..DrawingLuigi
	LDY.w #$0000
	LDA.w TileAndProp,x
	AND.w #$00FF
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	ADC.w #DynamicOWMarioTiles
	BRA.b +

..DrawingLuigi:
	LDY.w #$0002
	LDA.w TileAndProp,x
	AND.w #$00FF
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	ASL
	ADC.w #DynamicOWLuigiTiles
+:
	STA.w SMW_DynamicSpritePointersTop[$03].LowByte,y
	RTS

.MarioOnYoshiTileAndProp:
	dw $000F,$0002,$0010,$4010			; Walk 1
	dw $000F,$0002,$0010,$4010			; Walk 2
	dw $000F,$0002,$0010,$4010			; Walk 3
	dw $000F,$0002,$0010,$4010			; Walk 4
	dw $0008,$000A,$000C,$400C			; Swim 1
	dw $0009,$000B,$000D,$400D			; Swim 2
	dw $000F,$000F,$000F,$400F			; Climbing 1
	dw $000F,$000F,$000F,$400F			; Climbing 2
	dw $0006,$0006,$0006,$0006			; Enter Level On Land
	dw $0007,$0007,$0007,$0007			; Enter Level In Water
	dw $000F,$0002,$0010,$4010			; Dead on land
	dw $0008,$000A,$000C,$400C			; Dead in water

.MarioOnYoshiXDisp:
	dw $0000,$0000,$0007,$FFF9			; Walk 1
	dw $0000,$0000,$0007,$FFF9			; Walk 2
	dw $0000,$0000,$0007,$FFF9			; Walk 3
	dw $0000,$0000,$0007,$FFF9			; Walk 4
	dw $0000,$0000,$0007,$FFF9			; Swim 1
	dw $0000,$0000,$0007,$FFF9			; Swim 2
	dw $0000,$0000,$0000,$0000			; Climbing 1
	dw $0000,$0000,$0000,$0000			; Climbing 2
	dw $0000,$0000,$0007,$FFF9			; Enter Level On Land
	dw $0000,$0000,$0007,$FFF9			; Enter Level In Water
	dw $0000,$0000,$0007,$FFF9			; Dead on land
	dw $0000,$0000,$0007,$FFF9			; Dead in water

.MarioOnYoshiYDisp:
	dw $FFFB,$FFF9,$FFFC,$FFFC			; Walk 1
	dw $FFFA,$FFF8,$FFFB,$FFFB			; Walk 2
	dw $FFFB,$FFF9,$FFFC,$FFFC			; Walk 3
	dw $FFFA,$FFF8,$FFFB,$FFFB			; Walk 4
	dw $0005,$FFFE,$0001,$0001			; Swim 1
	dw $0005,$FFFE,$0001,$0001			; Swim 2
	dw $FFFB,$FFFB,$FFFB,$FFFB			; Climbing 1
	dw $FFFA,$FFFA,$FFFA,$FFFA			; Climbing 2
	dw $FFFB,$FFF9,$FFFB,$FFFB			; Enter Level On Land
	dw $0000,$FFFE,$0000,$0000			; Enter Level In Water
	dw $FFFB,$FFF9,$FFFB,$FFFB			; Dead on land
	dw $0005,$FFFE,$0001,$0001			; Dead in water

.YoshiAnimIndex:
	dw $0006,$0016,$0026,$0036			; Walk 1
	dw $000E,$001E,$002E,$003E			; Walk 2
	dw $0006,$0016,$0026,$0036			; Walk 3
	dw $000E,$001E,$002E,$003E			; Walk 4
	dw $0046,$0056,$0066,$0076			; Swim 1
	dw $004E,$005E,$006E,$007E			; Swim 2
	dw $0006,$0006,$0006,$0006			; Climbing 1
	dw $000E,$000E,$000E,$000E			; Climbing 2
	dw $0016,$0016,$0016,$0016			; Enter Level On Land
	dw $0056,$0056,$0056,$0056			; Enter Level In Water
	dw $0016,$0016,$0016,$0016			; Dead on land
	dw $0046,$0046,$0046,$0046			; Dead in water

.YoshiTileAndProp:
	dw $2046,$2047,$203E,$203F			; Walk Up 1
	dw $6047,$6046,$603F,$603E			; Walk Up 2
	dw $202E,$202F,$203E,$203F			; Walk Down 1
	dw $602F,$602E,$603F,$603E			; Walk Down 2
	dw $2040,$2041,$2050,$2051			; Walk Left 1
	dw $2042,$2043,$2052,$2053			; Walk Left 2
	dw $6041,$6040,$6051,$6050			; Walk Right 1
	dw $6043,$6042,$6053,$6052			; Walk Right 2
	dw $2046,$2047,$2038,$6038			; Swim Up 1
	dw $602F,$602E,$2039,$6039			; Swim Up 2
	dw $202E,$202F,$2038,$6038			; Swim Down 1
	dw $602F,$602E,$2039,$6039			; Swim Down 2
	dw $2040,$2041,$2038,$6038			; Swim Left 1
	dw $2042,$2043,$2039,$6039			; Swim Left 2
	dw $6041,$6040,$2038,$6038			; Swim Right 1
	dw $6043,$6042,$2039,$6039			; Swim Right 2

.YoshiXDisp:
	dw $0000,$0008,$0000,$0008

.YoshiYDisp:
	dw $0000,$FFF8,$0000,$0008

AnimationStatePtrs:
	dw Anim00_Walking
	dw Anim02_Swimming
	dw Anim04_Climbing
	dw Anim06_StarWarp
	dw Anim08_EnterLevelOnLand
	dw Anim0A_EnterLevelInWater
	dw Anim0C_DeadOnLand
	dw Anim0E_DeadInWater

Anim02_Swimming:
	LDA.b !RAM_SMW_Counter_LocalFrames
	AND.w #$0008
	LSR
	ORA.w #$0010
	JMP.w ++

Anim00_Walking:
	LDA.b !RAM_SMW_Counter_LocalFrames
	AND.w #$0018
	LSR
	BRA.b ++

ClimbingXFlip:
	dw !Const_SMW_MarioFaceLeft,!Const_SMW_MarioFaceRight

StarWarpDirection:
	dw !Const_SMW_MarioFaceRight,!Const_SMW_MarioFaceLeft,!Const_SMW_MarioFaceUp,!Const_SMW_MarioFaceDown

Anim04_Climbing:
	LDA.w #!Const_SMW_MarioFaceUp
	STA.w !RAM_SMW_Overworld_MarioFacingDirection,y
	LDA.b !RAM_SMW_Counter_LocalFrames
	AND.w #$0008
	LSR
	ORA.w #$0018
	BRA.b ++

Anim08_EnterLevelOnLand:
	LDA.w #$0020
	BRA.b ++

Anim0A_EnterLevelInWater:
	LDA.w #$0024
	BRA.b ++

Anim06_StarWarp:
	LDA.b !RAM_SMW_Counter_LocalFrames
	AND.w #$0003
	BNE.b +
	LDX.w !RAM_SMW_Overworld_MarioFacingDirection,y
	LDA.w StarWarpDirection,x
	STA.w !RAM_SMW_Overworld_MarioFacingDirection,y
+:
	LDA.w #$0000
	BRA.b ++

Anim0E_DeadInWater:
	LDA.w #$002C
	BRA.b ++

Anim0C_DeadOnLand:
	LDA.w #$0028
++:
	STA.w !RAM_SMW_Overworld_MarioAnimationFrame,y
	RTS

namespace off

;---------------------------------------------------------------------------

HandleFreePlayerMovement:
	REP.b #$20
	LDA.b !RAM_SMW_Flag_SpritesLocked
	BNE.b +
	PHB
	PHK
	PLB
	PHY
	SEP.b #$10
	LDY.w !RAM_SMW_Player_CurrentCharacterX2Lo
	LDX.w !RAM_SMW_Overworld_MarioMovementState,y
	JSR.w (MovementStatePtrs,x)
	REP.b #$10
	PLY
	PLB
	LDA.w !RAM_SMW_Overworld_TileScriptIndex
	CMP.w #$FFFF
	BEQ.b +
	TAX
	LDA.b !RAM_SMW_IO_ControllerHold2
	ORA.b !RAM_SMW_IO_ControllerHold1
	AND.w #!Joypad_A|!Joypad_B|!Joypad_X|!Joypad_Y
	BEQ.b +
	LDA.l ScriptPointers_EnterLevelScripts,x
	CLC
	ADC.w #$FFFC
	TAY
	SEP.b #$20
	LDA.l ScriptPointers_EnterLevelScripts+$02,x
	PHA
	PLB
+:
	RTL

MovementStatePtrs:
	dw MovementState00_MovingAround
	dw MovementState02_SwimmingAround
	dw MovementState04_Climbing

MovementState04_Climbing:
	JSR.w HandleLevelTileCollision_Main
	LDA.b !RAM_SMW_IO_ControllerHold1
	AND.w #$000C
	BEQ.b +
	JSR.w HandleMovement
+:
	RTS

MovementState02_SwimmingAround:
MovementState00_MovingAround:
	JSR.w HandleLevelTileCollision_Main
	LDA.b !RAM_SMW_IO_ControllerHold1
	AND.w #$000F
	BEQ.b +
	JSR.w HandleMovement
+:
	RTS

HandleMovement:
	LDY.w !RAM_SMW_Player_CurrentCharacterX2Lo
	ASL
	TAX
	LDA.w FacingDirectionFromButtonInput-$02,x
	STA.w !RAM_SMW_Overworld_MarioFacingDirection,y
	LDA.w XSpeed,x
	CLC
	ADC.w !RAM_SMW_Overworld_MarioXPosLo,y
	STA.w !RAM_SMW_Overworld_MarioXPosLo,y
	LDA.w YSpeed,x
	CLC
	ADC.w !RAM_SMW_Overworld_MarioYPosLo,y
	STA.w !RAM_SMW_Overworld_MarioYPosLo,y
	RTS

FacingDirectionFromButtonInput:
	dw !Const_SMW_MarioFaceRight					; Right
	dw !Const_SMW_MarioFaceLeft						; Left
	dw !Const_SMW_MarioFaceDown						; Right+Left
	dw !Const_SMW_MarioFaceDown						; Down
	dw !Const_SMW_MarioFaceDown						; Down+Right
	dw !Const_SMW_MarioFaceDown						; Down+Left
	dw !Const_SMW_MarioFaceDown						; Down+Right+Left
	dw !Const_SMW_MarioFaceUp						; Up
	dw !Const_SMW_MarioFaceUp						; Up+Right
	dw !Const_SMW_MarioFaceUp						; Up+Left
	dw !Const_SMW_MarioFaceUp						; Up+Right+Left
	dw !Const_SMW_MarioFaceUp						; Down+Up
	dw !Const_SMW_MarioFaceUp						; Down+Up+Right
	dw !Const_SMW_MarioFaceUp						; Down+Up+Left
	dw !Const_SMW_MarioFaceUp						; Down+Up+Right+Left

XSpeed:
	dw $0000
	dw $0001
	dw $FFFF
	dw $0000
	dw $0000
	dw $0001
	dw $FFFF
	dw $0000
	dw $0000
	dw $0001
	dw $FFFF
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000

YSpeed:
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0001
	dw $0001
	dw $0001
	dw $0000
	dw $FFFF
	dw $FFFF
	dw $FFFF
	dw $0000
	dw $0000
	dw $0000
	dw $0000

;---------------------------------------------------------------------------

; If you've enabled an overworld border, this table adjusts the X/Y position of the camera for submaps so the border doesn't cover up what you could originally see.
; By default, all the submaps move the camera up by 8/16 pixels.

if !Define_SMW_Overworld_BorderSetting != !BorderSetting_None
MapCameraYOffset:
	dw $0000				; Main Map
	dw $FFF8				; Yoshi's Island
	dw $FFF0				; Vanilla Dome
	dw $FFF8				; Forest Of Illusion
	dw $FFF8				; Valley Of Bowser
	dw $FFF0				; Special World
	dw $FFF8				; Star World
.End:
endif

ExtraOverworldLoadStuff:
	REP.b #$20
	LDA.w #$0000
	STA.l !RAM_SMW_OWSpr_EventFadeTileBufferIndex
	LDX.w !RAM_SMW_Player_CurrentCharacterX2Lo
	LDA.b !RAM_SMW_Player_XPosLo
	STA.w !RAM_SMW_Overworld_MarioXPosLo,x
	LDA.b !RAM_SMW_Player_YPosLo
	STA.w !RAM_SMW_Overworld_MarioYPosLo,x
	STZ.w !RAM_SMW_Overworld_CameraState
	LDA.w #$FFFF
	STA.w !RAM_SMW_Overworld_ShowScrollArrows
	SEP.b #$20
	JSL.l HandleCameraScrolling_Main
	LDA.b #$01
	STA.w !RAM_SMW_Global_OnOverworldFlag
	STZ.w !RAM_SMW_Global_GameStateFlags
	REP.b #$30
	STZ.b !RAM_SMW_IO_ControllerHold1
	STZ.b !RAM_SMW_IO_ControllerHold2
if !Define_SMW_Overworld_BorderSetting != !BorderSetting_None
	LDY.w !RAM_SMW_Player_CurrentCharacterX2Lo
endif
	LDA.w !RAM_SMW_Flag_Layer1HorizontalScrollLevelSetting
	AND.w #$00FF
	BNE.b .NoXAdjustment
if !Define_SMW_Overworld_BorderSetting == !BorderSetting_Full
	LDA.w #$FFF0
	STA.w !RAM_SMW_Misc_Layer1YPosLo
	STA.w !RAM_SMW_Misc_Layer2YPosLo
	STA.b !RAM_SMW_Mirror_CurrentLayer1YPosLo
	STA.b !RAM_SMW_Mirror_CurrentLayer2YPosLo
else
	STZ.w !RAM_SMW_Misc_Layer1XPosLo
	STZ.w !RAM_SMW_Misc_Layer2XPosLo
	STZ.b !RAM_SMW_Mirror_CurrentLayer1XPosLo
	STZ.b !RAM_SMW_Mirror_CurrentLayer2XPosLo
endif
.NoXAdjustment:
	LDA.w !RAM_SMW_Flag_Layer1VerticalScrollLevelSetting
	AND.w #$00FF
	BNE.b .NoYAdjustment
if !Define_SMW_Overworld_BorderSetting != !BorderSetting_None
	LDA.w !RAM_SMW_Overworld_MarioMap,y
	ASL
	TAX
	CPX.w #MapCameraYOffset_End-MapCameraYOffset
	BCS.b .NoYAdjustment
	LDA.l MapCameraYOffset,x
	STA.w !RAM_SMW_Misc_Layer1YPosLo
	STA.w !RAM_SMW_Misc_Layer2YPosLo
	STA.b !RAM_SMW_Mirror_CurrentLayer1YPosLo
	STA.b !RAM_SMW_Mirror_CurrentLayer2YPosLo
else
	STZ.w !RAM_SMW_Misc_Layer1YPosLo
	STZ.w !RAM_SMW_Misc_Layer2YPosLo
	STZ.b !RAM_SMW_Mirror_CurrentLayer1YPosLo
	STZ.b !RAM_SMW_Mirror_CurrentLayer2YPosLo
endif
.NoYAdjustment:
	PHB
	PEA.w SMW_ProcessOWPlayers_DrawOverworldPlayerAndBorderSprites>>8
	PLB
	PLB
	SEP.b #$10
if !SA1ROM == !TRUE
	LDA.w #.SA1Main1
	STA.w !RAM_SMW_SA1_SA1CodePointerLo
	LDX.b #.SA1Main1>>16
	STX.w !RAM_SMW_SA1_SA1CodePointerBank
	SEP.b #$20
	JSR.w !RAM_SMW_SA1_BeginSA1ProcessingRoutine
	JMP.w .EndOfSA1Code1

.SA1Main1:
	PHB
	PEA.w SMW_ProcessOWPlayers_DrawOverworldPlayerAndBorderSprites>>8
	PLB
	PLB
	REP.b #$20
	JSR.w HandleLevelTileCollision_Main
	SEP.b #$30
	PLB
	RTL

.EndOfSA1Code1:
	REP.b #$20
else
	JSR.w HandleLevelTileCollision_Main
endif
	SEP.b #$20
	REP.b #$10
	LDY.w !RAM_SMW_Overworld_LevelNumberLo
	LDA.w !RAM_SMW_Misc_ExitLevelAction
	BEQ.b .NoMidpoint
	BPL.b .ResetMidpoint
	LDA.w !RAM_SMW_Flag_GotMidpoint
	BEQ.b .NoMidpoint
	LDA.w !RAM_SMW_Overworld_LevelStatusFlags,y
	ORA.b #!Const_SMW_LevelStatusFlags_GotMidpoint
	STA.w !RAM_SMW_Overworld_LevelStatusFlags,y
	BRA.b +

.ResetMidpoint:
	LDA.w !RAM_SMW_Overworld_LevelStatusFlags,y
	ORA.b #!Const_SMW_LevelStatusFlags_LevelBeaten
	AND.b #!Const_SMW_LevelStatusFlags_GotMidpoint^$FF
	STA.w !RAM_SMW_Overworld_LevelStatusFlags,y
+:
.NoMidpoint:
	STZ.w !RAM_SMW_Flag_GotMidpoint
	SEP.b #$10
	REP.b #$20
	LDY.w !RAM_SMW_Overworld_HDMATransitionEffectFlag
	BEQ.b +
	JMP.w +++

+:
	STZ.w !RAM_SMW_Overworld_MarioScriptStackPointer
	LDY.w !RAM_SMW_Overworld_RunIntroScriptFlag
	BEQ.b +
	LDY.b #$00
	STY.w !RAM_SMW_Overworld_RunIntroScriptFlag
	LDA.w #!Const_SMW_MarioFaceDown
	STA.w !RAM_SMW_Overworld_LuigiFacingDirection
	LDY.b #Script_IntroMarch>>16
	LDA.w #Script_IntroMarch
	BRA.b ++

+:
	LDY.w !RAM_SMW_Overworld_GameOverFlag
	BEQ.b +
	STZ.w !RAM_SMW_Overworld_GameOverFlag
	LDY.w !RAM_SMW_Player_CurrentCharacterX2Lo
	LDA.w !RAM_SMW_Overworld_MarioAnimationState,y
	CLC
	ADC.w #!Const_SMW_OWPlayerAnimation_DeadOnLand-!Const_SMW_OWPlayerAnimation_EnterLevelOnLand
	STA.w !RAM_SMW_Overworld_MarioAnimationState,y
	LDA.w #!Const_SMW_MarioFaceDown
	STA.w !RAM_SMW_Overworld_MarioFacingDirection,y
	LDY.b #Script_HandleGameOver>>16
	LDA.w #Script_HandleGameOver
	BRA.b ++

+:
	LDY.w !RAM_SMW_Player_CurrentCharacterX2Lo
	LDA.w !RAM_SMW_Overworld_MarioAnimationState,y
	CMP.w #!Const_SMW_OWPlayerAnimation_DeadOnLand
	BCS.b +
	SEC
	SBC.w #!Const_SMW_OWPlayerAnimation_EnterLevelOnLand
	CMP.w #$0003
	BCS.b +
	STA.w !RAM_SMW_Overworld_MarioAnimationState,y
+:
	REP.b #$10
	LDA.w #!Const_SMW_MarioFaceDown
	STA.w !RAM_SMW_Overworld_MarioFacingDirection
	STA.w !RAM_SMW_Overworld_LuigiFacingDirection
	LDA.w !RAM_SMW_Overworld_MarioSaveLocation
	ASL
	ADC.w !RAM_SMW_Overworld_MarioSaveLocation
	TAX
	LDA.l ScriptPointers_EventScripts+$02,x
	TAY
	LDA.l ScriptPointers_EventScripts,x
	SEP.b #$10
++:
	STA.w !RAM_SMW_Overworld_MarioScriptAddress
	STY.w !RAM_SMW_Overworld_MarioScriptAddress+$02
+++:
if !SA1ROM == !TRUE
	LDA.w #.SA1Main2
	STA.w !RAM_SMW_SA1_SA1CodePointerLo
	LDX.b #.SA1Main2>>16
	STX.w !RAM_SMW_SA1_SA1CodePointerBank
	SEP.b #$20
	JSR.w !RAM_SMW_SA1_BeginSA1ProcessingRoutine
	JMP.w .EndOfSA1Code2

.SA1Main2:
	PHB
	PEA.w SMW_ProcessOWPlayers_DrawOverworldPlayerAndBorderSprites>>8
	PLB
	PLB
	REP.b #$20
else
	PHP
	JSL.l InitializeOAMPointers
	PLP
endif
	JSL.l SMW_ProcessOWPlayers_DrawOverworldPlayerAndBorderSprites
	REP.b #$30
	PHP
	LDA.w !RAM_SMW_Global_SavedGameStateFlags-$01					; !Const_SMW_SavedGameStateFlags_AltOWPalettes
	BPL.b +
	LDY.w !RAM_SMW_Player_CurrentCharacterX2Lo
	LDA.w !RAM_SMW_Overworld_MarioMap,y
	STA.b !RAM_SMW_Misc_ScratchRAM00
	ASL
	ADC.b !RAM_SMW_Misc_ScratchRAM00
	TAX
	CPX.w #SpecialWorldPalettePtrs_End-SpecialWorldPalettePtrs
	BCS.b .InvalidMap
	LDA.l SpecialWorldPalettePtrs,x
	BEQ.b .InvalidMap
	TAY
	LDA.l SpecialWorldPalettePtrs+$02,x
	JSR.w LoadAltOWPalette
	BRA.b ++

+:
.InvalidMap:
if !Define_SMW_Overworld_AllowEditingTheBackAreaColor == !FALSE
	LDX.w !RAM_SMW_Palettes_BackgroundColorLo
	PHX
endif
	JSL.l SMW_LoadCustomLevelPalette_Main
if !Define_SMW_Overworld_AllowEditingTheBackAreaColor == !FALSE
	PLX
	STX.w !RAM_SMW_Palettes_BackgroundColorLo
	PLX
	STX.w !RAM_SMW_Palettes_BackgroundColorHi
endif
++:
	PLP
	LDX.w #!RAM_SMW_Palettes_PaletteMirror
	LDY.w #!RAM_SMW_Palettes_CopyOfPaletteMirror
	JSL.l SMW_PaletteBufferHijack_Main
	PLB
	LDX.w !RAM_SMW_Palettes_BackgroundColorLo
	STX.w !RAM_SMW_Palettes_CopyOfBackgroundColorLo
	SEP.b #$30
	REP.b #$10
	LDX.w #$00FF
-:
	STZ.w !RAM_SMW_OWSpr_SpriteID,x
if !SA1ROM|!PIXIFlag == !TRUE
	LDA.b #$00
	STA.l !RAM_SMW_Sprites_LoadStatus,x
endif
	DEX
	BPL.b -
	SEP.b #$10
	PHB
	PEA.w SMW_ParseLevelSpriteList_Main>>8
	PLB
	PLB
	LDA.b !RAM_SMW_Camera_Layer1ScrollingDirection
	PHA
	JSL.l SMW_CustomLevelDimensionsHacks_AnalyzeSpriteList
	REP.b #$20
	LDA.b !RAM_SMW_Mirror_CurrentLayer1XPosLo
	PHA
	SEC
	SBC.w #$0060
	STA.b !RAM_SMW_Mirror_CurrentLayer1XPosLo
	SEP.b #$20
	STZ.w !RAM_SMW_Misc_ScratchRAM7E18B6
-:
	PHK
	PEA.w .Return-$01
	PEA.w SMW_DropReservedItem_CODE_028071-$01
	JML.l SMW_ParseLevelSpriteList_Entry2
.Return:
	REP.b #$21
	LDA.b !RAM_SMW_Mirror_CurrentLayer1XPosLo
	ADC.w #$0010
	STA.b !RAM_SMW_Mirror_CurrentLayer1XPosLo
	SEP.b #$20
	INC.w !RAM_SMW_Misc_ScratchRAM7E18B6
	LDA.w !RAM_SMW_Misc_ScratchRAM7E18B6
	CMP.b #$20
	BCC.b -
	PLA
	STA.b !RAM_SMW_Mirror_CurrentLayer1XPosLo
	PLA
	STA.b !RAM_SMW_Mirror_CurrentLayer1XPosHi
	PLA
	STA.b !RAM_SMW_Camera_Layer1ScrollingDirection
	PLB
	JSL.l LoadEventsForCurrentSubmap
if !SA1ROM == !TRUE
	SEP.b #$20
	RTL

.EndOfSA1Code2:
endif
	JSL.l SMW_InitializeLevelLayer1And2Tilemaps_Main
	STZ.w !RAM_SMW_Overworld_MarioMovementState
	STZ.w !RAM_SMW_Overworld_LuigiMovementState
	STZ.w !RAM_SMW_Overworld_MarioWaitTimer
	STZ.w !RAM_SMW_Overworld_MarioStarWarpSpeed
	LDA.b #$02
	STA.w !RAM_SMW_Misc_NMIToUseFlag
if !SA1ROM == !TRUE
	PLB
endif
	RTL

LoadAltOWPalette:
	SEP.b #$20
	STZ.b !RAM_SMW_Misc_ScratchRAM04
	STA.b !RAM_SMW_Misc_ScratchRAM06
	LDX.w #$0000
-:
	JSR.w .ReadByte
	STA.w !RAM_SMW_Palettes_PaletteMirror,x
	INX
	CPX.w #$0200
	BCC.b -
	RTS

.ReadByte:
	LDA.b [!RAM_SMW_Misc_ScratchRAM04],y
	INY
	BNE.b +
	LDY.w #$8000
	INC.b !RAM_SMW_Misc_ScratchRAM06
+:
	RTS

CheckIfPlayersShouldSwitch:
	LDX.w !RAM_SMW_Player_CurrentCharacter
	JSR.w .StoreCurrentPlayersItems
	LDA.w !RAM_SMW_Flag_TwoPlayerGame
	BNE.b .TwoPlayerGame
	RTL

.TwoPlayerGame:
	LDA.w !RAM_SMW_Flag_SwitchPlayers
	BEQ.b .NoPlayerSwitch
.DoPlayerSwitch:
	STZ.w !RAM_SMW_Flag_SwitchPlayers
	LDA.w !RAM_SMW_Player_CurrentCharacter
	TAX
	EOR.b #$01
	TAY
	STA.w !RAM_SMW_Player_CurrentCharacter
	ASL
	STA.w !RAM_SMW_Player_CurrentCharacterX2Lo
	LDA.w !RAM_SMW_Player_MariosItemBox,y
	STA.w !RAM_SMW_Player_CurrentItemBox
	LDA.w !RAM_SMW_Player_MariosYoshi,y
	STA.w !RAM_SMW_Yoshi_CarryOverLevelsFlag
	STA.w !RAM_SMW_Yoshi_CurrentYoshiColor
	STA.w !RAM_SMW_Player_RidingYoshiFlag
	LDA.w !RAM_SMW_Player_MariosCoins,y
	STA.w !RAM_SMW_Player_CurrentCoinCount
	LDA.w !RAM_SMW_Player_MariosPowerUp,y
	STA.b !RAM_SMW_Player_CurrentPowerUp
	LDA.w !RAM_SMW_Player_MariosLives,y
	STA.w !RAM_SMW_Player_CurrentLifeCount
.NoPlayerSwitch:
	RTL

.StoreCurrentPlayersItems:
	LDA.w !RAM_SMW_Player_CurrentLifeCount
	BPL.b .NoGameOver
	LDY.w !RAM_SMW_Flag_SwitchPlayers
	BNE.b .NoGameOver
	INC.w !RAM_SMW_Overworld_GameOverFlag
.NoGameOver:
	STA.w !RAM_SMW_Player_MariosLives,x
	LDA.b !RAM_SMW_Player_CurrentPowerUp
	STA.w !RAM_SMW_Player_MariosPowerUp,x
	LDA.w !RAM_SMW_Player_CurrentCoinCount
	STA.w !RAM_SMW_Player_MariosCoins,x
	LDA.w !RAM_SMW_Yoshi_CarryOverLevelsFlag
	BEQ.b +
	STZ.w !RAM_SMW_Overworld_MarioAnimationState+$01,x
	LDA.w !RAM_SMW_Yoshi_CurrentYoshiColor
+:
	STA.w !RAM_SMW_Player_MariosYoshi,x
	LDA.w !RAM_SMW_Player_CurrentItemBox
	STA.w !RAM_SMW_Player_MariosItemBox,x
	RTS

;---------------------------------------------------------------------------

HandleAltKoopaColorsCheck:
	PHA
	LDA.w !RAM_SMW_Global_SavedGameStateFlags
	AND.b #!Const_SMW_SavedGameStateFlags_AltKoopaColors
	BEQ.b +
	PLA
if !SA1ROM == !TRUE
	PHY
endif
	JML.l CODE_02A98A

+:
	PLA
if !SA1ROM == !TRUE
	PHY
endif
	JML.l SMW_ParseLevelSpriteList_CODE_02A996

HandleAltSpriteGraphicsCheck1:
	LDA.w !RAM_SMW_Global_SavedGameStateFlags
	AND.b #!Const_SMW_SavedGameStateFlags_AltSP1GFX
	BEQ.b +
	LDA.w !RAM_SMW_Misc_GameMode
	SEC
	SBC.b #$0C
	CMP.b #$03
	BCC.b +
	JML.l CODE_00AA78

+:
	JML.l SMW_UploadGraphicsFiles_SkipSpecial

HandleAltSpriteGraphicsCheck2:
	LDA.w !RAM_SMW_Global_SavedGameStateFlags
	AND.b #!Const_SMW_SavedGameStateFlags_AltSP1GFX
	BNE.b +
	JML.l CODE_01982A

+:
	JML.l SMW_StunnedShellGFXRt_Return0198A6

HandleAltSpriteGraphicsCheck3:
	LDA.w !RAM_SMW_Global_SavedGameStateFlags
	AND.b #!Const_SMW_SavedGameStateFlags_AltSP1GFX
	BEQ.b +
	JML.l CODE_01B9D1

+:
	JML.l SMW_NorSprXXX_NetKoopas_Status08_CODE_01B9D6

HandleAltSpriteGraphicsCheck4:
	LDA.w !RAM_SMW_Global_SavedGameStateFlags
	AND.b #!Const_SMW_SavedGameStateFlags_AltSP1GFX
	BEQ.b +
	JML.l CODE_0CAE13

+:
	JML.l SMW_InitializeEnemyRollcallLayerPositions_CODE_0CAE48

HandleYoshiSavedMessage:
	LDY.w !RAM_SMW_Player_CurrentCharacterX2Lo
	REP.b #$20
	LDA.w !RAM_SMW_Overworld_MarioMap,y
	CMP.w #!Define_SMW_Overworld_YoshisIslandSublevel-!Define_SMW_Overworld_FirstMapSublevel
	SEP.b #$20
	BNE.b +
	LDA.w !RAM_SMW_Global_SavedGameStateFlags
	AND.b #!Const_SMW_SavedGameStateFlags_YoshiWasSaved
	ORA.w !RAM_SMW_Misc_IntroLevelFlag
	BNE.b +
	LDA.b #!Const_SMW_SavedGameStateFlags_YoshiWasSaved
	TSB.w !RAM_SMW_Global_SavedGameStateFlags
	JML.l CODE_01EC3B

+:
	LDA.b #$03
	JML.l SMW_NorSpr035_Yoshi_Status08_CODE_01EC40

HandleHammerBrosAggression:
	LDY.b #$00
	LDA.w !RAM_SMW_Global_GameStateFlags
	AND.b #!Const_SMW_GameStateFlags_SlowThrowingHammerBros
	BNE.b +
	INY
+:
	RTL

;---------------------------------------------------------------------------

LoadLevelFromOverworldHack:
	LDA.w !RAM_SMW_Misc_IntroLevelFlag
	BEQ.b .NoLevelOverride
	CMP.b #$E9
	BNE.b .NotIntroLevel
	REP.b #$30
	LDA.w #$00C5
	STA.b !RAM_SMW_Misc_ScratchRAM0E
	ASL
	JML.l SMW_SpecifySublevelToLoad_CODE_05D8BC

.NotIntroLevel:
	JML.l CODE_05D8A2

.NoLevelOverride:
	LDA.w !RAM_SMW_Overworld_WarpDestination
	STA.b !RAM_SMW_Misc_ScratchRAM0E
	LDA.w !RAM_SMW_Misc_GameMode
	SEC
	SBC.b #$0C
	CMP.b #$02
	BCC.b OnOverworld
	LDA.b #(SMW_SpecifySublevelToLoad_CODE_05D7D2-$01)>>16
	PHA
	PEA.w SMW_SpecifySublevelToLoad_CODE_05D7D2-$01
	REP.b #$20														;\ Necessary to prevent the No-Yoshi intro from glitching up.
	STZ.b !RAM_SMW_Mirror_CurrentLayer1XPosLo					;|
	STZ.b !RAM_SMW_Mirror_CurrentLayer2XPosLo					;/
	SEP.b #$20
	LDA.w !RAM_SMW_Overworld_WarpDestination+$01
	STZ.w !RAM_SMW_Overworld_WarpToChosenEntranceFlag
	JML.l SMW_LMSecondaryEntrancesHack_CODE_05DC53

OnOverworld:
	LDA.w !RAM_SMW_Overworld_WarpToChosenEntranceFlag
	BEQ.b LoadOverworld
	JSR.w StoreOWMarioPosToPlayerPosition
	PHK
	PEA.w .Return-$01
	PHB
	LDA.b #(SMW_SpecifySublevelToLoad_CODE_05D7D2-$01)>>16
	PHA
	PEA.w SMW_SpecifySublevelToLoad_CODE_05D7D2-$01
	LDA.w !RAM_SMW_Overworld_WarpDestination+$01
	STZ.w !RAM_SMW_Overworld_WarpToChosenEntranceFlag
	JML.l SMW_LMSecondaryEntrancesHack_CODE_05DC53
.Return:
	REP.b #$21
	LDA.b !RAM_SMW_Player_YPosLo						;\ Adjust the player position so he'll be standing a bit higher on the tile after the warp.
	ADC.w #$FFFA										;|
	STA.b !RAM_SMW_Player_YPosLo						;/
	LDX.w !RAM_SMW_Player_CurrentCharacterX2Lo
	LDA.w !RAM_SMW_LM_Misc_CurrentLevelNumberLo
	SEC
	SBC.w #!Define_SMW_Overworld_FirstMapSublevel
	STA.w !RAM_SMW_Overworld_MarioMap,x
	SEP.b #$30
	PLB
	RTL

LoadOverworld:
	REP.b #$31
	LDX.w !RAM_SMW_Player_CurrentCharacterX2Lo
	LDA.w !RAM_SMW_Overworld_MarioMap,x
	ADC.w #!Define_SMW_Overworld_FirstMapSublevel
	STA.b !RAM_SMW_Misc_ScratchRAM0E
	PHK
	PEA.w .Return-$01
	PHB
	ASL
	JML.l SMW_SpecifySublevelToLoad_CODE_05D8BC
.Return:
	JSR.w StoreOWMarioPosToPlayerPosition
	PLB
	RTL

StoreOWMarioPosToPlayerPosition:
	REP.b #$20
	LDX.w !RAM_SMW_Player_CurrentCharacterX2Lo
	LDA.w !RAM_SMW_Overworld_MarioXPosLo,x
	STA.b !RAM_SMW_Player_XPosLo
	LDA.w !RAM_SMW_Overworld_MarioYPosLo,x
	STA.b !RAM_SMW_Player_YPosLo
	SEP.b #$30
	RTS

CheckMidpointFlagOnLevelLoad:
	LDA.w !RAM_SMW_Misc_GameMode						; Don't check the midpoint flag if on the overworld.
	SEC
	SBC.b #$0C
	CMP.b #$02
	BCC.b .OnOverworld
	LDX.w !RAM_SMW_Overworld_LevelNumberLo
	LDA.w !RAM_SMW_Overworld_LevelStatusFlags,x
	RTL

.OnOverworld:
	LDA.b #$00
	RTL

;---------------------------------------------------------------------------

namespace HandleCameraScrolling

Main:
	PHB
	PEA.w XSpeed>>8
	PLB
	PLB
	REP.b #$20
	LDA.b !RAM_SMW_Mirror_CurrentLayer2YPosLo
	STA.l !RAM_SMW_LM_Misc_PreviousLayer2YPos
	LDA.b !RAM_SMW_Mirror_CurrentLayer2XPosLo
	STA.l !RAM_SMW_LM_Misc_PreviousLayer2XPos
	LDA.b !RAM_SMW_Mirror_CurrentLayer1YPosLo
	STA.l !RAM_SMW_LM_Misc_PreviousLayer1YPos
	LDA.b !RAM_SMW_Mirror_CurrentLayer1XPosLo
	STA.l !RAM_SMW_LM_Misc_PreviousLayer1XPos
	LDX.w !RAM_SMW_Overworld_CameraState
	JSR.w (CameraStatePtrs,x)
	LDY.w !RAM_SMW_Flag_Layer1HorizontalScrollLevelSetting
	BEQ.b NoHorizontalScroll
	JSR.w MoveCameraTowardsFocusPoint_X
	LDA.b !RAM_SMW_Mirror_CurrentLayer1XPosLo
if !Define_SMW_Overworld_BorderSetting == !BorderSetting_Full
	CMP.w #$FFF0
endif
	BPL.b +
if !Define_SMW_Overworld_BorderSetting == !BorderSetting_Full
	LDA.w #$FFF0
else
	LDA.w #$0000
endif
+:
	STA.b !RAM_SMW_Mirror_CurrentLayer1XPosLo
	STA.b !RAM_SMW_Mirror_CurrentLayer2XPosLo
	LDA.b !RAM_SMW_Camera_LastScreenHoriz
	AND.w #$00FF
	DEC
	XBA
if !Define_SMW_Overworld_BorderSetting == !BorderSetting_Full
	CLC
	ADC.w #$000F
endif
	BPL.b +
if !Define_SMW_Overworld_BorderSetting == !BorderSetting_Full
	LDA.w #$008F
else
	LDA.w #$0080
endif
+:
	CMP.b !RAM_SMW_Mirror_CurrentLayer1XPosLo
	BPL.b +
	STA.b !RAM_SMW_Mirror_CurrentLayer1XPosLo
	STA.b !RAM_SMW_Mirror_CurrentLayer2XPosLo
+:

	LDA.w !RAM_SMW_Overworld_CameraFocusXPos
if !Define_SMW_Overworld_BorderSetting == !BorderSetting_Full
	CMP.w #$FFF0
endif
	BPL.b +
if !Define_SMW_Overworld_BorderSetting == !BorderSetting_Full
	LDA.w #$FFF0
else
	LDA.w #$0000
endif
+:
	STA.w !RAM_SMW_Overworld_CameraFocusXPos
	LDA.b !RAM_SMW_Camera_LastScreenHoriz
	AND.w #$00FF
	DEC
	XBA
if !Define_SMW_Overworld_BorderSetting == !BorderSetting_Full
	CLC
	ADC.w #$000F
endif
	BPL.b +
if !Define_SMW_Overworld_BorderSetting == !BorderSetting_Full
	LDA.w #$008F
else
	LDA.w #$0080
endif
+:
	CMP.w !RAM_SMW_Overworld_CameraFocusXPos
	BPL.b +
	STA.w !RAM_SMW_Overworld_CameraFocusXPos
+:
NoHorizontalScroll:
	LDY.w !RAM_SMW_Flag_Layer1VerticalScrollLevelSetting
	BEQ.b NoVerticalScroll
	JSR.w MoveCameraTowardsFocusPoint_Y
	LDA.b !RAM_SMW_Mirror_CurrentLayer1YPosLo
if !Define_SMW_Overworld_BorderSetting != !BorderSetting_None
	CMP.w #$FFD8
endif
	BPL.b +
if !Define_SMW_Overworld_BorderSetting != !BorderSetting_None
	LDA.w #$FFD8
else
	LDA.w #$0000
endif
+:
	STA.b !RAM_SMW_Mirror_CurrentLayer1YPosLo
	STA.b !RAM_SMW_Mirror_CurrentLayer2YPosLo
	LDA.w !RAM_SMW_LM_Misc_LevelScreenSizeLo
	SEC
if !Define_SMW_Overworld_BorderSetting != !BorderSetting_None
	SBC.w #$00D0
else
	SBC.w #$00E1
endif
	CMP.b !RAM_SMW_Mirror_CurrentLayer1YPosLo
	BPL.b +
	STA.b !RAM_SMW_Mirror_CurrentLayer1YPosLo
	STA.b !RAM_SMW_Mirror_CurrentLayer2YPosLo
+:
	LDA.w !RAM_SMW_Overworld_CameraFocusYPos
if !Define_SMW_Overworld_BorderSetting != !BorderSetting_None
	CMP.w #$FFD8
endif
	BPL.b +
if !Define_SMW_Overworld_BorderSetting != !BorderSetting_None
	LDA.w #$FFD8
else
	LDA.w #$0000
endif
+:
	STA.w !RAM_SMW_Overworld_CameraFocusYPos
	LDA.w !RAM_SMW_LM_Misc_LevelScreenSizeLo
	SEC
if !Define_SMW_Overworld_BorderSetting != !BorderSetting_None
	SBC.w #$00D0
else
	SBC.w #$00E1
endif
	CMP.w !RAM_SMW_Overworld_CameraFocusYPos
	BPL.b +
	STA.w !RAM_SMW_Overworld_CameraFocusYPos
+:
NoVerticalScroll:
	SEP.b #$20
	LDX.b #$02
	LDA.b !RAM_SMW_Mirror_CurrentLayer1XPosLo
	SEC
	SBC.w !RAM_SMW_Misc_Layer1XPosLo
	STA.w !RAM_SMW_Misc_Layer1XDisp
	BEQ.b ++
	BPL.b +
	LDX.b #$00
+:
	STX.b !RAM_SMW_Camera_Layer1ScrollingDirection
	STX.b !RAM_SMW_Camera_Layer2ScrollingDirection
++:
	LDA.b !RAM_SMW_Mirror_CurrentLayer1YPosLo
	SEC
	SBC.w !RAM_SMW_Misc_Layer1YPosLo
	STA.w !RAM_SMW_Misc_Layer1YDisp
++:
	LDA.b !RAM_SMW_Mirror_CurrentLayer2XPosLo
	SEC
	SBC.w !RAM_SMW_Misc_Layer2XPosLo
	STA.w !RAM_SMW_Misc_Layer2XDisp
	LDA.b !RAM_SMW_Mirror_CurrentLayer2YPosLo
	SEC
	SBC.w !RAM_SMW_Misc_Layer2YPosLo
	STA.w !RAM_SMW_Misc_Layer2YDisp
	JSR.w HandleScreenShake
	JML.l SMW_HandleStandardLevelCameraScroll_CODE_00F7E8

CameraStatePtrs:
	dw State00_FollowPlayer
	dw State02_HandleFreeScroll
	dw State04_GoToSpecificSpot

State00_FollowPlayer:
	LDX.w !RAM_SMW_Player_CurrentCharacterX2Lo
	LDA.w !RAM_SMW_Overworld_MarioXPosLo,x
	SEC
	SBC.w #$0078
	STA.w !RAM_SMW_Overworld_CameraFocusXPos
	LDA.w !RAM_SMW_Overworld_MarioYPosLo,x
	SEC
	SBC.w #$0071
	STA.w !RAM_SMW_Overworld_CameraFocusYPos
	RTS

State04_GoToSpecificSpot:
	RTS

State02_HandleFreeScroll:
	PHB
	PHK
	PLB
	LDX.b #$00
	LDA.b !RAM_SMW_IO_ControllerHold1
	AND.w #(!Joypad_DPadL>>8)|(!Joypad_DPadR>>8)
	ASL
	JSR.w .UpdateMainMapFreeScrollingPosition
	LDX.b #$02
	LDA.b !RAM_SMW_IO_ControllerHold1
	AND.w #(!Joypad_DPadU>>8)|(!Joypad_DPadD>>8)
	ORA.w #$0010
	LSR
	JSR.w .UpdateMainMapFreeScrollingPosition
	STZ.w !RAM_SMW_Overworld_ShowScrollArrows
	LDY.b #$04
	LDA.b !RAM_SMW_Counter_GlobalFrames
	AND.w #$0018
	BNE.b +
	LDY.b #$00
+:
	TYA
	STY.w !RAM_SMW_Overworld_ShowScrollArrows
	LDA.w #(!Joypad_Start^$FFFF)|((!Joypad_Start^$FFFF)>>8)
	TRB.b !RAM_SMW_IO_ControllerHold1
	STZ.b !RAM_SMW_IO_ControllerHold2
	PLB
	RTS

.UpdateMainMapFreeScrollingPosition:
	TAY
	LDA.w !RAM_SMW_Overworld_CameraFocusXPos,x
	CLC
	ADC.w .DATA_048211,y
	STA.w !RAM_SMW_Overworld_CameraFocusXPos,x
	RTS

.DATA_048211:
	dw $0000,$0002,$FFFE,$0002
	dw $0000,$0002,$FFFE,$0002

MoveCameraTowardsFocusPoint:
.X:
	LDY.w !RAM_SMW_Misc_GameMode
	CPY.b #$0C
	BEQ.b +
	LDA.w !RAM_SMW_Overworld_CameraFocusXPos
	SEC
	SBC.b !RAM_SMW_Mirror_CurrentLayer1XPosLo
	STA.b !RAM_SMW_Misc_ScratchRAM0A
	BPL.b .CODE_0482C3
	EOR.w #$FFFF
	INC
.CODE_0482C3:
	LSR
	STA.b !RAM_SMW_Misc_ScratchRAM0C
	CMP.w #$0002
	BCS.b ++
+:
	LDA.w !RAM_SMW_Overworld_CameraFocusXPos
	STA.b !RAM_SMW_Mirror_CurrentLayer1XPosLo
	RTS

++:
	LDX.b #$00
	LDY.b #$00
	BRA.b .CODE_0482ED

.Y:
	LDY.w !RAM_SMW_Misc_GameMode
	CPY.b #$0C
	BEQ.b +
	LDA.w !RAM_SMW_Overworld_CameraFocusYPos
	SEC
	SBC.b !RAM_SMW_Mirror_CurrentLayer1YPosLo
	STA.b !RAM_SMW_Misc_ScratchRAM0B
	BPL.b .CODE_0482AE
	EOR.w #$FFFF
	INC
.CODE_0482AE:
	LSR
	STA.b !RAM_SMW_Misc_ScratchRAM0D
	CMP.w #$0002
	BCS.b ++
+:
	LDA.w !RAM_SMW_Overworld_CameraFocusYPos
	STA.b !RAM_SMW_Mirror_CurrentLayer1YPosLo
	RTS

++:
	LDX.b #$01
	TXY
.CODE_0482ED:
	SEP.b #$20
	PHY
	STZ.w !REGISTER_DividendLo
	LDY.b !RAM_SMW_Misc_ScratchRAM0C,x
	STY.w !REGISTER_DividendHi
	STA.w !REGISTER_Divisor
	NOP #6
	REP.b #$20
	LDA.w !REGISTER_QuotientLo
	LSR
	LSR
	SEP.b #$20
	LDY.b !RAM_SMW_Misc_ScratchRAM0B,x
	BPL.b .CODE_04830E
	EOR.b #$FF
	INC
.CODE_04830E:
	STA.b !RAM_SMW_Misc_ScratchRAM0B,x
	TXA
	EOR.b #$01
	TAX
	LDA.b #$40
	LDY.b !RAM_SMW_Misc_ScratchRAM0B,x
	BPL.b .CODE_04831C
	LDA.b #$C0
.CODE_04831C:
	STA.b !RAM_SMW_Misc_ScratchRAM0B,x
	PLY
.CODE_048320:
	TYA
	ASL
	TAX
	LDA.w !RAM_SMW_Misc_ScratchRAM0B,y
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC.w !RAM_SMW_Overworld_Layer1SubXPos,y
	STA.w !RAM_SMW_Overworld_Layer1SubXPos,y
	LDA.w !RAM_SMW_Misc_ScratchRAM0B,y
	PHP
	LSR
	LSR
	LSR
	LSR
	LDY.b #$00
	PLP
	BPL.b .CODE_048342
	ORA.b #$F0
	DEY
.CODE_048342:
	ADC.b !RAM_SMW_Mirror_CurrentLayer1XPosLo,x
	STA.b !RAM_SMW_Mirror_CurrentLayer1XPosLo,x
	STA.b !RAM_SMW_Mirror_CurrentLayer2XPosLo,x
	TYA
	ADC.b !RAM_SMW_Mirror_CurrentLayer1XPosHi,x
	STA.b !RAM_SMW_Mirror_CurrentLayer1XPosHi,x
	STA.b !RAM_SMW_Mirror_CurrentLayer2XPosHi,x
	REP.b #$20
	RTS

HandleScreenShake:
	REP.b #$20
	LDA.w !RAM_SMW_Overworld_ShakingScreenTimer
	BEQ.b ++
	CMP.w #$0002
	BCS.b +
	LDY.b #!Define_SMW_Sound1DF9_EndValleyOfBowserAppears
	STY.w !RAM_SMW_IO_SoundCh1
+:
	DEC.w !RAM_SMW_Overworld_ShakingScreenTimer
	LDA.b !RAM_SMW_Mirror_CurrentLayer1XPosLo
	EOR.w !RAM_SMW_ShakingLayer1DispX
	STA.b !RAM_SMW_Mirror_CurrentLayer1XPosLo
	LDA.b !RAM_SMW_Mirror_CurrentLayer1YPosLo
	EOR.w !RAM_SMW_ShakingLayer1DispY
	STA.b !RAM_SMW_Mirror_CurrentLayer1YPosLo
	LDA.b !RAM_SMW_Mirror_CurrentLayer2XPosLo
	EOR.w !RAM_SMW_ShakingLayer1DispX
	STA.b !RAM_SMW_Mirror_CurrentLayer2XPosLo
	LDA.b !RAM_SMW_Mirror_CurrentLayer2YPosLo
	EOR.w !RAM_SMW_ShakingLayer1DispY
	STA.b !RAM_SMW_Mirror_CurrentLayer2YPosLo
	LDX.w !RAM_SMW_Overworld_ShakingIntensity
	LDA.b !RAM_SMW_Counter_LocalFrames
	AND.l DATA_048231,x
	BNE.b +
	LDA.w !RAM_SMW_ShakingLayer1DispY
	EOR.w #$0001
	STA.w !RAM_SMW_ShakingLayer1DispY
	LDA.w !RAM_SMW_ShakingLayer1DispX
	EOR.w #$0001
	STA.w !RAM_SMW_ShakingLayer1DispX
	BRA.b +

++:
	STZ.w !RAM_SMW_ShakingLayer1DispY
	STZ.w !RAM_SMW_ShakingLayer1DispX
+:
	SEP.b #$20
	RTS

DATA_048231:
	dw $000F,$0007,$0003,$0001

namespace off

;---------------------------------------------------------------------------

SetStandardPPUSettings:
	STZ.w !RAM_SMW_Flag_UploadLoadScreenLettersToVRAM
	STZ.w !REGISTER_InitialScreenSettings
	STZ.w !REGISTER_MosaicSizeAndBGEnable
	LDA.b #$31
	STA.w !REGISTER_BG1AddressAndSize
	LDA.b #$39
	STA.w !REGISTER_BG2AddressAndSize
	LDA.b #$53
	STA.w !REGISTER_BG3AddressAndSize
	LDA.b #$00
	STA.w !REGISTER_BG1And2TileDataDesignation
	LDA.b #$04
	STA.w !REGISTER_BG3And4TileDataDesignation
	STZ.b !RAM_SMW_Mirror_BG1And2WindowMaskSettings
	STZ.b !RAM_SMW_Mirror_BG3And4WindowMaskSettings
	STZ.b !RAM_SMW_Mirror_ObjectAndColorWindowSettings
	STZ.w !REGISTER_BGWindowLogicSettings
	STZ.w !REGISTER_ColorAndObjectWindowLogicSettings
	STZ.w !REGISTER_MainScreenWindowMask
	STZ.w !REGISTER_SubScreenWindowMask
	LDA.b #$02
	STA.b !RAM_SMW_Mirror_ColorMathInitialSettings
	LDA.b #$80
	STA.w !REGISTER_Mode7TilemapSettings
	RTL

;---------------------------------------------------------------------------

; This is PIXI's "ChangeMap16.asm" routine.
; Although it's been optimized a bit to better fit into my patch.

BufferEventTile:
	TAX
	LDA.b !RAM_SMW_Blocks_YPosLo
	CMP.w !RAM_SMW_LM_Misc_LevelScreenSizeLo
	BCC.b .noEnd
	;SEC
	RTL

.noEnd:
	PHP
	PHB
	PHY
	PHX
	LDY.b !RAM_SMW_Blocks_XPosLo
	STY.b !RAM_SMW_Misc_ScratchRAM0C
	SEP.b #$30
	LDA.b !RAM_SMW_Blocks_XPosHi
	ASL
	ADC.b !RAM_SMW_Blocks_XPosHi
	TAY
	REP.b #$20
	LDA.b !RAM_SMW_Blocks_YPosLo
	STA.b !RAM_SMW_Misc_ScratchRAM0E
	AND.w #$FFF0
	STA.b !RAM_SMW_Misc_ScratchRAM08
	AND.w #$00F0
	ASL #2				; 0000 00YY YY00 0000
	XBA					; YY00 0000 0000 00YY
	STA.b !RAM_SMW_Misc_ScratchRAM06
	LDA.w !RAM_SMW_Misc_CurrentLayerBeingProcessedLo
	SEP.b #$20
	ASL
	TAX
	LDA.b !RAM_SMW_Misc_ScratchRAM0D
	LSR
	LDA.b !RAM_SMW_Misc_ScratchRAM0F
if !VRAMPatchOptimizeFlag == !FALSE
	AND.b #$00			; 0000 000y
else
	AND.b #$01			; 0000 000y
endif
	ROL					; 0000 00yx
	ASL #2				; 0000 yx00
if !VRAMPatchOptimizeFlag == !FALSE
	ORA.b #$30			; 0010 yx00
else
	ORA.b #$20
endif
	CPX.b #$00
	BEQ.b .noAdd
if !VRAMPatchOptimizeFlag == !FALSE
	ORA.b #$08
else
	ORA.b #$10			; 001l yx00
endif
.noAdd:
	TSB.b !RAM_SMW_Misc_ScratchRAM06			; $06 : 001l yxYY
	LDA.b !RAM_SMW_Blocks_XPosLo			; X LowByte
	AND.b #$F0			; XXXX 0000
	LSR #3				; 000X XXX0
	TSB.b !RAM_SMW_Misc_ScratchRAM07			; $07 : YY0X XXX0
	LSR
	TSB.b !RAM_SMW_Misc_ScratchRAM08
	LDA.w !RAM_SMW_Misc_LevelModeSetting
	ASL
	REP.b #$31
	ADC.l SMW_LevelDataLayoutTables_LoTablePtrs,x
	TAX
	TYA
if !SA1ROM == !TRUE
	ADC.l $000000,x
	TAX
	LDA.b !RAM_SMW_Misc_ScratchRAM08
	ADC.l $000000,x
else
	ADC.b $00,x
	TAX
	LDA.b !RAM_SMW_Misc_ScratchRAM08
	ADC.b $00,x
endif
	TAX
	PLA
	ASL
	TAY
	LSR
	SEP.b #$20
	STA.l !RAM_SMW_Blocks_Map16TableLo&$FF0000,x
	XBA
	STA.l !RAM_SMW_Blocks_Map16TableHi&$FF0000,x
	LDA.w !RAM_SMW_Misc_GameMode
	CMP.b #$0C
	BEQ.b .Return
	LDA.w !RAM_SMW_Misc_CurrentLayerBeingProcessedLo
	REP.b #$21
	BNE.b .horzL2
.horzL1:
	LDA.b !RAM_SMW_Mirror_CurrentLayer1XPosLo			;\
	SBC.w #$007F		; |$08 : Layer1X - 0x80
	STA.b !RAM_SMW_Misc_ScratchRAM08			;/
	LDA.b !RAM_SMW_Mirror_CurrentLayer1YPosLo			;  $0A : Layer1Y
	BRA.b +

.horzL2:
	LDA.b !RAM_SMW_Mirror_CurrentLayer2XPosLo			;\ $08 : Layer2X
	STA.b !RAM_SMW_Misc_ScratchRAM08			;/
	LDA.b !RAM_SMW_Mirror_CurrentLayer2YPosLo			;\ $0A : Layer2Y - 0x80
	SBC.w #$007F		;/
+:
	STA.b !RAM_SMW_Misc_ScratchRAM0A
	PHK
	PEA.w .Return-$01
	PEA.w SMW_LoadStripeImage_CODE_0084CF-$01
	JML.l SMW_GenericPage01Tile_CODE_00C0FB
.Return:
	PLY
	PLB
	PLP
	CLC
	RTL

;---------------------------------------------------------------------------

!RAM_SMW_PathMovement_XDistBetweenPlayerAndDest = !RAM_SMW_Misc_ScratchRAM00
!RAM_SMW_PathMovement_YDistBetweenPlayerAndDest = !RAM_SMW_Misc_ScratchRAM02
!RAM_SMW_PathMovement_AbsoluteValOfXDistBetweenPlayerAndDest = !RAM_SMW_Misc_ScratchRAM04
!RAM_SMW_PathMovement_AbsoluteValOfYDistBetweenPlayerAndDest = !RAM_SMW_Misc_ScratchRAM06
!RAM_SMW_PathMovement_CurrentVector = !RAM_SMW_Misc_ScratchRAM08
!RAM_SMW_PathMovement_LongVectorOfDistBetweenPlayerAndDest = !RAM_SMW_Misc_ScratchRAM0A
!RAM_SMW_PathMovement_LongVectorSpeed = !RAM_SMW_Misc_ScratchRAM0A
!RAM_SMW_PathMovement_ShortVectorOfDistBetweenPlayerAndDest = !RAM_SMW_Misc_ScratchRAM0C
!RAM_SMW_PathMovement_ShortVectorSpeed = !RAM_SMW_Misc_ScratchRAM0E
!RAM_SMW_PathMovement_LoopCounter = !RAM_SMW_Misc_ScratchRAM8A

HandlePathMovement:
	PHB
	PHK
	PLB
	LDA.w !RAM_SMW_Overworld_CurrentPlayerSpeedOffset+$01
	STA.b !RAM_SMW_PathMovement_LoopCounter
	STZ.b !RAM_SMW_PathMovement_LoopCounter+$01
-:
	JSR.w UpdateSpeedAndPosition
	DEC.b !RAM_SMW_PathMovement_LoopCounter
	LDA.b !RAM_SMW_PathMovement_LoopCounter
	BPL.b -
if !Define_SMW_Overworld_EnableAutoTurningWhileWalking == !TRUE
	LDY.w #$0000
	LDA.w !RAM_SMW_Player_OverworldYSpeedLo
	BPL.b +
	EOR.w #$FFFF
	INC
+:
	STA.b !RAM_SMW_Misc_ScratchRAM02
	LDA.w !RAM_SMW_Player_OverworldXSpeedLo
	BPL.b +
	EOR.w #$FFFF
	INC
+:
	STA.b !RAM_SMW_Misc_ScratchRAM00
	CMP.b !RAM_SMW_Misc_ScratchRAM02
	BEQ.b +++
	BCC.b +
	LDY.w #$0004
	LDA.w !RAM_SMW_Player_OverworldXSpeedLo
	BRA.b ++

+:
	LDA.w !RAM_SMW_Player_OverworldYSpeedLo
++:
	BMI.b +
	INY
	INY
+:
	LDX.w !RAM_SMW_Player_CurrentCharacterX2Lo
	TYA
	STA.w !RAM_SMW_Overworld_MarioFacingDirection,x
+++:
endif
	PLB
	CLC
	RTL

UpdateSpeedAndPosition:
	REP.b #$21
	LDA.w !RAM_SMW_Player_CurrentCharacterX2Lo
	ADC.w #$0004
	TAY
	LDX.w #$0002
CODE_049475:
	LDA.w !RAM_SMW_Player_OverworldXPosMarioIsGoingToLo,x
	SEC
	SBC.w !RAM_SMW_Overworld_MarioXPosLo,y
	STA.b !RAM_SMW_PathMovement_XDistBetweenPlayerAndDest,x
	BPL.b CODE_049484
	EOR.w #$FFFF
	INC
CODE_049484:
	STA.b !RAM_SMW_PathMovement_AbsoluteValOfXDistBetweenPlayerAndDest,x
	DEY
	DEY
	DEY
	DEY
	DEX
	DEX
	BPL.b CODE_049475
	LDY.w #$FFFF
	LDA.b !RAM_SMW_PathMovement_AbsoluteValOfXDistBetweenPlayerAndDest
	STA.b !RAM_SMW_PathMovement_LongVectorOfDistBetweenPlayerAndDest
	LDA.b !RAM_SMW_PathMovement_AbsoluteValOfYDistBetweenPlayerAndDest
	STA.b !RAM_SMW_PathMovement_ShortVectorOfDistBetweenPlayerAndDest
	CMP.b !RAM_SMW_PathMovement_AbsoluteValOfXDistBetweenPlayerAndDest
	BCC.b CODE_0494A4
	STA.b !RAM_SMW_PathMovement_LongVectorOfDistBetweenPlayerAndDest
	LDA.b !RAM_SMW_PathMovement_AbsoluteValOfXDistBetweenPlayerAndDest
	STA.b !RAM_SMW_PathMovement_ShortVectorOfDistBetweenPlayerAndDest
	LDY.w #$0001
CODE_0494A4:
	STY.b !RAM_SMW_PathMovement_CurrentVector
	SEP.b #$20
	LDA.w !RAM_SMW_Overworld_CurrentPlayerSpeedOffset
if !SA1ROM == !TRUE
	STA.w !REGISTER_SA1_MultiplicandOrDividendLo
	STZ.w !REGISTER_SA1_MultiplicandOrDividendHi
	STZ.w !REGISTER_SA1_ArithmeticType
	LDA.b !RAM_SMW_PathMovement_ShortVectorOfDistBetweenPlayerAndDest
	BEQ.b CODE_0494DA
	STA.w !REGISTER_SA1_MultiplierOrDivisorLo
	STZ.w !REGISTER_SA1_MultiplierOrDivisorHi
	REP.b #$20
	LDA.w !REGISTER_SA1_ArithmeticResultLo
	STA.w !REGISTER_SA1_MultiplicandOrDividendLo
	SEP.b #$20
	LDA.b #$01
	STA.w !REGISTER_SA1_ArithmeticType
	LDA.b !RAM_SMW_PathMovement_LongVectorOfDistBetweenPlayerAndDest
	STA.w !REGISTER_SA1_MultiplierOrDivisorLo
	STZ.w !REGISTER_SA1_MultiplierOrDivisorHi
	REP.b #$20
	LDA.w !REGISTER_SA1_ArithmeticResultLo
else
	STA.w !REGISTER_Multiplicand
	LDA.b !RAM_SMW_PathMovement_ShortVectorOfDistBetweenPlayerAndDest
	BEQ.b CODE_0494DA
	STA.w !REGISTER_Multiplier
	NOP #4
	REP.b #$20
	LDA.w !REGISTER_ProductOrRemainderLo
	STA.w !REGISTER_DividendLo
	SEP.b #$20
	LDA.b !RAM_SMW_PathMovement_LongVectorOfDistBetweenPlayerAndDest
	STA.w !REGISTER_Divisor
	NOP #6
	REP.b #$20
	LDA.w !REGISTER_QuotientLo
endif
CODE_0494DA:
	REP.b #$20
	STA.b !RAM_SMW_PathMovement_ShortVectorSpeed
	LDA.w !RAM_SMW_Overworld_CurrentPlayerSpeedOffset
	AND.w #$00FF
	STA.b !RAM_SMW_PathMovement_LongVectorSpeed
	LDX.w #$0002
CODE_0494F0:
	LDA.b !RAM_SMW_PathMovement_CurrentVector
	BMI.b CODE_0494F8
	LDA.b !RAM_SMW_PathMovement_LongVectorSpeed
	BRA.b CODE_0494FA

CODE_0494F8:
	LDA.b !RAM_SMW_PathMovement_ShortVectorSpeed
CODE_0494FA:
	BIT.b !RAM_SMW_PathMovement_XDistBetweenPlayerAndDest,x
	BPL.b CODE_049502
	EOR.w #$FFFF
	INC
CODE_049502:
	STA.w !RAM_SMW_Player_OverworldXSpeedLo,x
	LDA.b !RAM_SMW_PathMovement_CurrentVector
	EOR.w #$FFFF
	INC
	STA.b !RAM_SMW_PathMovement_CurrentVector
	DEX
	DEX
	BPL.b CODE_0494F0
	LDX.w #$0000
	LDA.b !RAM_SMW_PathMovement_CurrentVector
	BMI.b CODE_04951B
	LDX.w #$0002
CODE_04951B:
	LDA.b !RAM_SMW_PathMovement_XDistBetweenPlayerAndDest,x
	BEQ.b CODE_049522
	LDA.w !RAM_SMW_Player_CurrentCharacterX2Lo
	CLC
	ADC.w #$0004
	TAX
	LDY.w #$0002
CODE_04980E:
	LDA.w !RAM_SMW_Player_OverworldSubXPosLo,y
	AND.w #$00FF
	CLC
	ADC.w !RAM_SMW_Player_OverworldXSpeedLo,y
	STA.w !RAM_SMW_Player_OverworldSubXPosLo,y
	AND.w #$FF00
	BPL.b CODE_049823
	ORA.w #$00FF
CODE_049823:
	XBA
	CLC
	ADC.w !RAM_SMW_Overworld_MarioXPosLo,x
	STA.w !RAM_SMW_Overworld_MarioXPosLo,x
	DEX
	DEX
	DEX
	DEX
	DEY
	DEY
	BPL.b CODE_04980E
	RTS

CODE_049522:
	PLA
	PLB
	SEC
	RTL

;---------------------------------------------------------------------------

LoadOverworldSpritesHack:
	LDA.b [!RAM_SMW_Pointer_SpriteListDataLo],y
	STA.b !RAM_SMW_Misc_ScratchRAM05
	LDA.w !RAM_SMW_Misc_GameMode
	SEC
	SBC.b #$0C
	CMP.b #$03
	BCC.b .OnOverworld
	LDA.b !RAM_SMW_Misc_ScratchRAM05
	JML.l SMW_ParseLevelSpriteList_CODE_02A865

.OnOverworld:
	DEY
	PHX
if !SA1ROM == !TRUE
	LDX.w #!Define_SMW_MaxOverworldSpriteSlot
else
	LDX.b #!Define_SMW_MaxOverworldSpriteSlot
endif
-:
	LDA.w !RAM_SMW_OWSpr_SpriteID,x
	BEQ.b .AvailableSlot
	DEX
	DEX
	DEX
	DEX
	BPL.b -
	PLX
	JML.l SMW_ParseLevelSpriteList_CODE_02A846

.AvailableSlot:
	DEY
	LDA.b [!RAM_SMW_Pointer_SpriteListDataLo],y
	PHA
	AND.b #$F0
	STA.w !RAM_SMW_OWSpr_YPosLo,x
	PLA
	AND.b #$01
	ORA.b !RAM_SMW_Misc_ScratchRAM0A
	STA.w !RAM_SMW_OWSpr_YPosHi,x
	REP.b #$20
	LDA.b !RAM_SMW_Misc_ScratchRAM00
	STA.w !RAM_SMW_OWSpr_XPosLo,x
	STZ.w !RAM_SMW_OWSpr_ZPosLo,x
	STZ.w !RAM_SMW_OWSpr_Table7E0E15,x
	STZ.w !RAM_SMW_OWSpr_CurrentState,x
	STZ.w !RAM_SMW_OWSpr_YXPPCCCT,x
	STZ.w !RAM_SMW_OWSpr_XSpeed,x
	STZ.w !RAM_SMW_OWSpr_YSpeed,x
	STZ.w !RAM_SMW_OWSpr_ZSpeed,x
	STZ.w !RAM_SMW_OWSpr_Table7E0DF5,x
	STZ.w !RAM_SMW_OWSpr_Table7E0E05,x
	STZ.w !RAM_SMW_OWSpr_DecrementingTable7E0E25,x
	LDA.b !RAM_SMW_Misc_ScratchRAM05
	AND.w #$00FF
	STA.w !RAM_SMW_OWSpr_SpriteID,x
	PHX
	ASL
	ASL
	TAX
	LDA.l OverworldSpritePtrs-$02,x
	PLX
	STA.w !RAM_SMW_OWSpr_Properties-$01,x
	SEP.b #$20
	STZ.w !RAM_SMW_OWSpr_SubXPos,x
	STZ.w !RAM_SMW_OWSpr_SubYPos,x
	STZ.w !RAM_SMW_OWSpr_SubZPos,x
	LDA.b !RAM_SMW_Misc_ScratchRAM02
	STA.w !RAM_SMW_OWSpr_LoadIndex,x
	PLX
	JML.l SMW_ParseLevelSpriteList_CODE_02A846

;---------------------------------------------------------------------------

SetColorMathRegistersForPathExitTransition:
	LDA.b #$15
	STA.w !RAM_SMW_Mirror_MainScreenLayers
	LDA.b #$02
	STA.w !RAM_SMW_Mirror_SubScreenLayers
	LDA.b #$33
	STA.b !RAM_SMW_Mirror_BG1And2WindowMaskSettings
	STA.b !RAM_SMW_Mirror_ObjectAndColorWindowSettings
	RTL

;---------------------------------------------------------------------------

BufferLifeExchangerMenu:
	PHB
	PHK
	PLB
	JSR.w .Sub
	PLB
	RTL

.Sub:
	LDA.w !RAM_SMW_IO_ControllerPress1CopyP1
	ORA.w !RAM_SMW_IO_ControllerPress1CopyP2
	AND.b #!Joypad_Start>>8
	BEQ.b .DontCloseExchange
	LDX.w !RAM_SMW_Player_CurrentCharacter
	LDA.w !RAM_SMW_Player_MariosLives,x
	STA.w !RAM_SMW_Player_CurrentLifeCount
	INC.w !RAM_SMW_Overworld_MarioScriptState
	INC.w !RAM_SMW_Overworld_MarioScriptState
	PLA
	PLA
	PLB
	JML.l SMW_CloseOverworldPrompt_CODE_009C16

.DontCloseExchange:
	LDA.w !RAM_SMW_IO_ControllerPress1CopyP1
	AND.b #(!Joypad_Y>>8)|(!Joypad_B>>8)
	BNE.b .CODE_04F53B
	LDA.w !RAM_SMW_IO_ControllerPress1CopyP2
	AND.b #(!Joypad_Y>>8)|(!Joypad_B>>8)
	BEQ.b .CODE_04F56C
	EOR.b #(!Joypad_Y>>8)|(!Joypad_B>>8)
.CODE_04F53B:
	LDX.b #$01
	ASL
	BCS.b .CODE_04F541
	DEX
.CODE_04F541:
	CPX.w !RAM_SMW_Flag_WhoGetsLivesInExchangeMenu
	BEQ.b .CODE_04F54B
	LDA.b #$18
	STA.w !RAM_SMW_Timer_LifeExchangeBlinkingArrowFrames
.CODE_04F54B:
	STX.w !RAM_SMW_Flag_WhoGetsLivesInExchangeMenu
	TXA
	EOR.b #$01
	TAY
	LDA.w !RAM_SMW_Player_MariosLives,x
	BEQ.b .CODE_04F56C
	BMI.b .CODE_04F56C
	LDA.w !RAM_SMW_Player_MariosLives,y
	CMP.b #$62
	BPL.b .CODE_04F56C
	INC
	STA.w !RAM_SMW_Player_MariosLives,y
	DEC.w !RAM_SMW_Player_MariosLives,x
	LDA.b #!Define_SMW_Sound1DFC_StepOnLevelTile
	STA.w !RAM_SMW_IO_SoundCh3
.CODE_04F56C:
	REP.b #$30
	LDY.w #$0002
	LDA.w #$0000
	JSL.l SMW_MaxtTile_Get_Slot
	BCC.b ..SlotNotGotten
	LDA.w #DynamicOWMarioTiles+$0100
	STA.w SMW_DynamicSpritePointersTop[$03].LowByte
	LDA.w #DynamicOWLuigiTiles+$0100
	STA.w SMW_DynamicSpritePointersTop[$04].LowByte
	LDY.w !RAM_SMW_OAM_MaxTileOAMBufferIndex1
	LDX.w !RAM_SMW_OAM_MaxTileOAMBufferIndex2
	PEA.w ((BufferLifeExchangerMenu>>8)&$00FF00)|(!RAM_SMW_IO_OAMBuffer>>16)
	PLB
	LDA.w #$7848
	STA.w SMW_OAMBuffer[$00].XDisp,y
	LDA.w #$7890
	STA.w SMW_OAMBuffer[$01].XDisp,y
	LDA.w #$3406
	STA.w SMW_OAMBuffer[$00].Tile,y
	LDA.w #$3608
	STA.w SMW_OAMBuffer[$01].Tile,y
	SEP.b #$20
	LDA.b #$02
	STA.w SMW_OAMTileSizeBuffer[$00].Slot,x
	STA.w SMW_OAMTileSizeBuffer[$01].Slot,x
..SlotNotGotten:
	PLB
	SEP.b #$30
if !Define_SMW_Overworld_DisplayLifeCounter == !TRUE
	JSL.l SMW_LoadOverworldLifeCounter_Main
endif
	LDY.b #LifeExchangeText_End-LifeExchangeText
	TYA
	CLC
	ADC.l !RAM_SMW_Misc_StripeImageUploadIndexLo
	STA.l !RAM_SMW_Misc_StripeImageUploadIndexLo
	TAX
.CODE_04F5A1:
	LDA.w LifeExchangeText,y
	STA.l SMW_StripeImageUploadTable[$00].LowByte,x
	DEX
	DEY
	BPL.b .CODE_04F5A1
	INX
	REP.b #$20
	LDY.w !RAM_SMW_Player_MariosLives
	BMI.b .MarioGameOver
	LDA.w !RAM_SMW_Overworld_MarioAnimationState
	SEC
	SBC.w #!Const_SMW_OWPlayerAnimation_DeadOnLand
	CMP.w #$0003
	BCS.b +
	LDA.w !RAM_SMW_Overworld_MarioAnimationState
	AND.w #$0002
	STA.w !RAM_SMW_Overworld_MarioAnimationState
+:
	LDA.w #$38FC
	STA.l SMW_StripeImageUploadTable[$22].LowByte,x
	STA.l SMW_StripeImageUploadTable[$23].LowByte,x
.MarioGameOver:
	LDY.w !RAM_SMW_Player_LuigisLives
	BMI.b .LuigiGameOver
	LDA.w !RAM_SMW_Overworld_LuigiAnimationState
	SEC
	SBC.w #!Const_SMW_OWPlayerAnimation_DeadOnLand
	CMP.w #$0003
	BCS.b +
	LDA.w !RAM_SMW_Overworld_LuigiAnimationState
	AND.w #$0002
	STA.w !RAM_SMW_Overworld_LuigiAnimationState
+:
	LDA.w #$38FC
	STA.l SMW_StripeImageUploadTable[$26].LowByte,x
	STA.l SMW_StripeImageUploadTable[$27].LowByte,x
.LuigiGameOver:
	SEP.b #$20
	INC.w !RAM_SMW_Timer_LifeExchangeBlinkingArrowFrames
	LDA.w !RAM_SMW_Timer_LifeExchangeBlinkingArrowFrames
	AND.b #$18
	BEQ.b .CODE_04F600
	LDA.w !RAM_SMW_Flag_WhoGetsLivesInExchangeMenu
	ASL
	TAY
	REP.b #$20
	LDA.w .DATA_04F503,y
	STA.l SMW_StripeImageUploadTable[$1A].LowByte,x
	LDA.w .DATA_04F507,y
	STA.l SMW_StripeImageUploadTable[$1B].LowByte,x
	LDA.w .DATA_04F50B,y
	STA.l SMW_StripeImageUploadTable[$1E].LowByte,x
	LDA.w .DATA_04F50F,y
	STA.l SMW_StripeImageUploadTable[$1F].LowByte,x
	SEP.b #$20
.CODE_04F600:
	LDA.w !RAM_SMW_Player_MariosLives
	JSR.w .CODE_04F60E
	TXA
	CLC
	ADC.b #$0A
	TAX
	LDA.w !RAM_SMW_Player_LuigisLives
.CODE_04F60E:
	INC
	PHX
	JSL.l HexToDec
	TXY
	BNE.b .CODE_04F619
	LDX.b #$FC
.CODE_04F619:
	TXY
	PLX
	STA.l SMW_StripeImageUploadTable[$12].LowByte,x
	TYA
	STA.l SMW_StripeImageUploadTable[$11].LowByte,x
	RTS

.DATA_04F503:
	db $7D,$38,$7E,$78

.DATA_04F507:
	db $7E,$38,$7D,$78

.DATA_04F50B:
	db $7D,$B8,$7E,$F8

.DATA_04F50F:
	db $7E,$B8,$7D,$F8

;---------------------------------------------------------------------------

GetEventIndex:
	LDY.w #$0000
	BRA.b +

-:
	SBC.w #$0008
+:
	CMP.w #$0008
	BCC.b +
	INY
	BRA.b -

+:
	TAX
	RTL

;---------------------------------------------------------------------------

HexToDec:
	LDX.b #$00
-:
	CMP.b #$0A
	BCC.b +
	SBC.b #$0A
	INX
	BRA.b -

+
	RTL

;---------------------------------------------------------------------------

SetCollectionFlag:
.3UpMoon:
	REP.b #$10
	LDY.w !RAM_SMW_Overworld_LevelNumberLo
	LDA.w !RAM_SMW_Overworld_LevelStatusFlags,y
	ORA.b #!Const_SMW_LevelStatusFlags_Collected3UpMoon
	STA.w !RAM_SMW_Overworld_LevelStatusFlags,y
	SEP.b #$10
	RTL

.1upCheckpoints:
	REP.b #$10
	LDY.w !RAM_SMW_Overworld_LevelNumberLo
	LDA.w !RAM_SMW_Overworld_LevelStatusFlags,y
	ORA.b #!Const_SMW_LevelStatusFlags_CollectedAll1upCheckpoints
	STA.w !RAM_SMW_Overworld_LevelStatusFlags,y
	SEP.b #$10
	RTL

.YoshiCoins:
	REP.b #$10
	LDY.w !RAM_SMW_Overworld_LevelNumberLo
	LDA.w !RAM_SMW_Overworld_LevelStatusFlags,y
	ORA.b #!Const_SMW_LevelStatusFlags_CollectedAllYoshiCoins
	STA.w !RAM_SMW_Overworld_LevelStatusFlags,y
	SEP.b #$10
	RTL

StartSelectHack:
	REP.b #$10
	LDY.w !RAM_SMW_Overworld_LevelNumberLo
	LDA.w !RAM_SMW_Overworld_LevelStatusFlags,y
	AND.b #!Const_SMW_LevelStatusFlags_LevelBeaten
	SEP.b #$10
	RTL

CheckMidPointFlagHack:
	REP.b #$10
	LDY.w !RAM_SMW_Overworld_LevelNumberLo
	LDA.w !RAM_SMW_Overworld_LevelStatusFlags,y
	AND.b #!Const_SMW_LevelStatusFlags_GotMidpoint
	SEP.b #$10
	RTL

CheckForLevelsThatTriggerCutscenes:
	REP.b #$30
	LDX.w #$0010
	LDA.w !RAM_SMW_Overworld_LevelNumberLo
	CMP.w #!Define_SMW_Cutscene_Level2ThatTriggersCredits
	BEQ.b .TriggerCutscene
-:
	CMP.l LevelsThatTriggerCutscenes-$02,x
	BEQ.b .TriggerCutscene
	DEX
	DEX
	BNE.b -
	SEP.b #$30
	JML.l SMW_PlayerState00_Normal_CODE_00CA25

.TriggerCutscene:
	TXA
	LSR
	TAX
	SEP.b #$30
	JML.l SMW_PlayerState00_Normal_CODE_00CA20

LevelsThatTriggerCutscenes:
	dw !Define_SMW_Cutscene_LevelThatTriggersIggyCastleCutscene
	dw !Define_SMW_Cutscene_LevelThatTriggersMortonsCastleCutscene
	dw !Define_SMW_Cutscene_LevelThatTriggersLemmyCastleCutscene
	dw !Define_SMW_Cutscene_LevelThatTriggersLudwigCastleCutscene
	dw !Define_SMW_Cutscene_LevelThatTriggersRoyCastleCutscene
	dw !Define_SMW_Cutscene_LevelThatTriggersWendyCastleCutscene
	dw !Define_SMW_Cutscene_LevelThatTriggersLarryCastleCutscene
	dw !Define_SMW_Cutscene_Level1ThatTriggersCredits

;---------------------------------------------------------------------------

UpdateLevelName:
if !Define_SMW_Overworld_DisplayLevelName == !TRUE
	SEP.b #$20
	STA.b !RAM_SMW_Misc_ScratchRAM00
if !SA1ROM == !TRUE
	LDA.b #.SNESMain
	STA.w !RAM_SMW_SA1_SNESCodePointerLo
	LDA.b #.SNESMain>>8
	STA.w !RAM_SMW_SA1_SNESCodePointerHi
	LDA.b #.SNESMain>>16
	STA.w !RAM_SMW_SA1_SNESCodePointerBank
	LDA.b #$D0
	STA.w !REGISTER_SA1_SA1RQControlWrite
-:
	LDA.w !RAM_SMW_SA1_SNESDoneFlag
	BEQ.b -
	STZ.w !RAM_SMW_SA1_SNESDoneFlag
	REP.b #$20
	RTL

.SNESMain:
	REP.b #$10
	LDA.b !RAM_SMW_Misc_ScratchRAM00
endif
	STA.w !REGISTER_Multiplicand
	LDA.b #!Define_SMW_Overworld_LevelNameStringSize
	STA.w !REGISTER_Multiplier
if !Define_SMW_Overworld_LevelNameType == !LevelNameType_Sprite
	NOP #3
	REP.b #$20
	LDA.w !REGISTER_ProductOrRemainderLo
	STA.w !RAM_SMW_Overworld_LevelNameIndex
	SEP.b #$10
else
	PHB
	PEA.w ((!RAM_SMW_Misc_StripeImageUploadIndexLo>>8)&$00FF00)|(!RAM_SMW_Misc_StripeImageUploadIndexLo>>16)
	PLB
	PLB
	REP.b #$21
	LDA.w !RAM_SMW_Misc_StripeImageUploadIndexLo
	TAY
	ADC.w #!Define_SMW_Overworld_LevelNameStringSize*$02
	STA.b !RAM_SMW_Misc_ScratchRAM02
	ADC.w #$0004
	STA.w !RAM_SMW_Misc_StripeImageUploadIndexLo
	LDA.w #((!Define_SMW_Overworld_LevelNameStringSize*$02)-$01)<<8
	STA.w SMW_StripeImageUploadTable[$01].LowByte,y
	LDA.w #((!Define_SMW_Overworld_LevelNameXPos&$001F)<<8)|((!Define_SMW_Overworld_LevelNameXPos&$0020)>>3)|((!Define_SMW_Overworld_LevelNameYPos&$0007)<<13)|((!Define_SMW_Overworld_LevelNameYPos&$0018)>>3)|((!Define_SMW_Overworld_LevelNameYPos&$0020)>>2)|$0050
	STA.w SMW_StripeImageUploadTable[$00].LowByte,y
	LDA.l !REGISTER_ProductOrRemainderLo
	TAX
-:
	LDA.l LevelNames,x
	AND.w #$00FF
if !Define_SMW_Overworld_BorderSetting == !BorderSetting_None
	ORA.w #(!Define_SMW_Overworld_LevelNamePalette<<10)|$2000
else
	ORA.w #(!Define_SMW_Overworld_LevelNamePalette<<10)|$2100
endif
	STA.w SMW_StripeImageUploadTable[$02].LowByte,y
	INY
	INY
	INX
	CPY.b !RAM_SMW_Misc_ScratchRAM02
	BCC.b -
	LDA.w #$FFFF
	STA.w SMW_StripeImageUploadTable[$02].LowByte,y
	PLB
if !SA1ROM == !TRUE
	SEP.b #$10
endif
endif
endif
	RTL

;---------------------------------------------------------------------------

HandleSaveGame:
	PHY
	PHP
	REP.b #$30
if !Define_SMW_Overworld_SaveCollectablesToSRAM == !FALSE
	LDX.w #!RAM_SMW_Overworld_LevelStatusFlags
	LDY.w #!RAM_SMW_Overworld_BackUpOfLevelStatusFlags
	LDA.w #!RAM_SMW_Overworld_EventFlags-!RAM_SMW_Overworld_LevelStatusFlags-$01
	PHB
	MVN !RAM_SMW_Overworld_BackUpOfLevelStatusFlags>>16,!RAM_SMW_Overworld_LevelStatusFlags>>16
	PLB
	LDX.w #!RAM_SMW_Overworld_EventFlags-!RAM_SMW_Overworld_LevelStatusFlags-$02
-:
	LDA.w !RAM_SMW_Overworld_LevelStatusFlags,x
	AND.w #(!Const_SMW_LevelStatusFlags_CollectedAllYoshiCoins|!Const_SMW_LevelStatusFlags_CollectedAll1upCheckpoints|!Const_SMW_LevelStatusFlags_Collected3UpMoon|((!Const_SMW_LevelStatusFlags_CollectedAllYoshiCoins|!Const_SMW_LevelStatusFlags_CollectedAll1upCheckpoints|!Const_SMW_LevelStatusFlags_Collected3UpMoon)<<8))^$FFFF
	STA.w !RAM_SMW_Overworld_LevelStatusFlags,x
	DEX
	DEX
	BPL.b -
endif
if !Define_SMW_Overworld_SaveLuigiPosition == !FALSE
	LDX.w !RAM_SMW_Player_CurrentCharacterX2Lo
	TXA
	EOR.w #$0002
	TAY
	LDA.w !RAM_SMW_Overworld_MarioAnimationState,y
	PHA
	LDA.w !RAM_SMW_Overworld_MarioXPosLo,y
	PHA
	LDA.w !RAM_SMW_Overworld_MarioYPosLo,y
	PHA
	LDA.w !RAM_SMW_Overworld_MarioMap,y
	PHA
	LDA.w !RAM_SMW_Overworld_MarioAnimationState,x
	STA.w !RAM_SMW_Overworld_MarioAnimationState,y
	LDA.w !RAM_SMW_Overworld_MarioXPosLo,x
	STA.w !RAM_SMW_Overworld_MarioXPosLo,y
	LDA.w !RAM_SMW_Overworld_MarioYPosLo,x
	STA.w !RAM_SMW_Overworld_MarioYPosLo,y
	LDA.w !RAM_SMW_Overworld_MarioMap,x
	STA.w !RAM_SMW_Overworld_MarioMap,y
endif
	SEP.b #$30
	JSL.l SMW_SaveGame_Main
	REP.b #$30
if !Define_SMW_Overworld_SaveLuigiPosition == !FALSE
	LDA.w !RAM_SMW_Player_CurrentCharacterX2Lo
	EOR.w #$0002
	TAY
	PLA
	STA.w !RAM_SMW_Overworld_MarioMap,y
	PLA
	STA.w !RAM_SMW_Overworld_MarioYPosLo,y	
	PLA
	STA.w !RAM_SMW_Overworld_MarioXPosLo,y
	PLA
	STA.w !RAM_SMW_Overworld_MarioAnimationState,y
endif
if !Define_SMW_Overworld_SaveCollectablesToSRAM == !FALSE
	LDX.w #!RAM_SMW_Overworld_BackUpOfLevelStatusFlags
	LDY.w #!RAM_SMW_Overworld_LevelStatusFlags
	LDA.w #!RAM_SMW_Overworld_EventFlags-!RAM_SMW_Overworld_LevelStatusFlags-$01
	PHB
	MVN !RAM_SMW_Overworld_LevelStatusFlags>>16,!RAM_SMW_Overworld_BackUpOfLevelStatusFlags>>16
	PLB
endif
	PLP
	PLY
	RTL

;---------------------------------------------------------------------------

HandlePlayerSwitch:
	REP.b #$20
	LDA.w !RAM_SMW_Player_CurrentCharacter
	AND.w #$0001
	EOR.w #$0001
	TAX
	SEP.b #$20
	LDA.w !RAM_SMW_Player_MariosLives,x
	BMI.b .NoPlayerSwitch
	INC.w !RAM_SMW_Flag_SwitchPlayers
	LDA.b #$0B
	STA.w !RAM_SMW_Misc_GameMode
.NoPlayerSwitch:
	RTL

;---------------------------------------------------------------------------

HandleGameOver:
	PHY
	JSL.l .Sub
	PLY
	RTL

.Sub:
if !SA1ROM == !TRUE
	LDX.w #.SNESMain
	STX.w !RAM_SMW_SA1_SNESCodePointerLo
	LDX.w #.SNESMain>>8
	STX.w !RAM_SMW_SA1_SNESCodePointerHi
	LDA.b #$D0
	STA.w !REGISTER_SA1_SA1RQControlWrite
-:
	LDA.w !RAM_SMW_SA1_SNESDoneFlag
	BEQ.b -
	STZ.w !RAM_SMW_SA1_SNESDoneFlag
	RTL

.SNESMain:
endif
	SEP.b #$10
	LDA.w !RAM_SMW_Flag_ShowContinueAndEnd
	BEQ.b +
	JSL.l SMW_DisplayingContinueEnd_Main
	REP.b #$10
	RTL

+:
	LDA.b #$0B
	STA.w !RAM_SMW_Misc_GameMode
	REP.b #$10
	RTL

CheckIfEitherPlayerIsAlive:
	REP.b #$20
	LDA.w !RAM_SMW_Overworld_LuigiAnimationState
	SEC
	SBC.w #!Const_SMW_OWPlayerAnimation_DeadOnLand
	CMP.w #$03
	BCS.b .AtLeastOneAlive
	LDA.w !RAM_SMW_Overworld_MarioAnimationState
	SEC
	SBC.w #!Const_SMW_OWPlayerAnimation_DeadOnLand
	CMP.w #$0003
	BCS.b .AtLeastOneAlive
	TYA
	ADC.w #Script_HandleGameOver_NotTwoPlayer-Script_HandleGameOver_DoGameOverLifeExchange
	TAY
.AtLeastOneAlive:
	SEP.b #$20
	RTL

;---------------------------------------------------------------------------

if !Define_SMW_Global_UsingAltFileSelectMenu == !FALSE
pushpc
org $009D53|!FastROM
	JSL.l FiveDigitExitCount
	RTS
	padbyte $EA : pad SMW_BufferFileSelectText_CODE_009DB5
	assert pc() <= SMW_BufferFileSelectText_CODE_009DB5

pullpc
FiveDigitExitCount:
	REP.b #$20
	LDX.w #$0084
	STX.b !RAM_SMW_Misc_ScratchRAM00
	LDX.w #$0002
	BRA.b +

NextFile:
	LDA.b !RAM_SMW_Misc_ScratchRAM00
	SEC
	SBC.w #$0024
	STA.b !RAM_SMW_Misc_ScratchRAM00
	LDX.b !RAM_SMW_Misc_ScratchRAM02
	DEX
+:
	STX.b !RAM_SMW_Misc_ScratchRAM02
	BPL.b +
	SEP.b #$30
	RTL

+:
	LSR.b !RAM_SMW_Misc_ScratchRAM05
	BCS.b NextFile
	SEP.b #$30
	PHK
	PEA.w .Return-$01
	PEA.w SMW_LoadStripeImage_CODE_0084CF-$01
	JML.l SMW_BufferFileSelectText_CODE_009DB5
.Return:
	REP.b #$30
	BNE.b NextFile
	PHB
	PEA.w SMW_StripeImageUploadTable[$00].LowByte>>8
	PLB
	PLB
	LDY.b !RAM_SMW_Misc_ScratchRAM00
	LDA.w #$38FC
	STA.w SMW_StripeImageUploadTable[$01].LowByte,y
	STA.w SMW_StripeImageUploadTable[$02].LowByte,y
	STA.w SMW_StripeImageUploadTable[$03].LowByte,y
	STA.w SMW_StripeImageUploadTable[$04].LowByte,y
	STA.w SMW_StripeImageUploadTable[$05].LowByte,y
	LDA.w #$2000|(!Define_SMW_FileSelect_ExitCountPalette<<10)
	STA.b !RAM_SMW_Misc_ScratchRAM0A
	LDA.l !SRAM_SMW_MarioA_StartLocation+(!RAM_SMW_Counter_EventsTriggered-!RAM_SMW_Overworld_LevelStatusFlags),x
	STA.b !RAM_SMW_Misc_ScratchRAM0E
	CMP.w #!Define_SMW_Counter_TotalExits
	BCC.b NotMaxExits
if !Define_SMW_FileSelect_SpecialTilesAtMaxExits == !TRUE
if !Define_SMW_FileSelect_ExitCountDisplay == !ExitCountDisplay_5Digits
	LDA.w #$20FC|(!Define_SMW_FileSelect_MaxExitCountPalette<<10)
	STA.w SMW_StripeImageUploadTable[$01].LowByte,y
	LDA.w #$20FC|(!Define_SMW_FileSelect_MaxExitCountPalette<<10)
	STA.w SMW_StripeImageUploadTable[$02].LowByte,y
	LDA.w #$20FC|(!Define_SMW_FileSelect_MaxExitCountPalette<<10)
	STA.w SMW_StripeImageUploadTable[$03].LowByte,y
	LDA.w #$2087|(!Define_SMW_FileSelect_MaxExitCountPalette<<10)
	STA.w SMW_StripeImageUploadTable[$04].LowByte,y
	LDA.w #$2088|(!Define_SMW_FileSelect_MaxExitCountPalette<<10)
	STA.w SMW_StripeImageUploadTable[$05].LowByte,y
	BRA.b AtMaxExits
else
	LDA.w #$20FC|(!Define_SMW_FileSelect_MaxExitCountPalette<<10)
	STA.w SMW_StripeImageUploadTable[$01].LowByte,y
	LDA.w #$2087|(!Define_SMW_FileSelect_MaxExitCountPalette<<10)
	STA.w SMW_StripeImageUploadTable[$02].LowByte,y
	LDA.w #$2088|(!Define_SMW_FileSelect_MaxExitCountPalette<<10)
	STA.w SMW_StripeImageUploadTable[$03].LowByte,y
	BRA.b AtMaxExits
endif
else
	LDA.w #$2000|(!Define_SMW_FileSelect_MaxExitCountPalette<<10)
	STA.b !RAM_SMW_Misc_ScratchRAM0A
endif
NotMaxExits:
if !Define_SMW_FileSelect_ExitCountDisplay == !ExitCountDisplay_5Digits
	LDX.w #$0008
else
	LDX.w #$0004
endif
	STZ.b !RAM_SMW_Misc_ScratchRAM0C
--:
	STZ.b !RAM_SMW_Misc_ScratchRAM08
-:
	LDA.b !RAM_SMW_Misc_ScratchRAM0E
	SEC
	SBC.l DigitConversionTable,x
	BCC.b CantDivideAnymore
	STA.b !RAM_SMW_Misc_ScratchRAM0E
	INC.b !RAM_SMW_Misc_ScratchRAM08
	INC.b !RAM_SMW_Misc_ScratchRAM0C
	BRA.b -

CantDivideAnymore:
	CPX.w #$0000
	BEQ.b +
	LDA.b !RAM_SMW_Misc_ScratchRAM0C
	BEQ.b ++
+:
	LDA.b !RAM_SMW_Misc_ScratchRAM08
	ORA.b !RAM_SMW_Misc_ScratchRAM0A
	STA.w SMW_StripeImageUploadTable[$01].LowByte,y
++:
	INY
	INY
	DEX
	DEX
	BPL.b --
AtMaxExits:
	PLB
	JMP.w NextFile

DigitConversionTable:
	dw $0001,$000A,$0064,$03E8,$2710
else								; The original routine at this location.
if read1($009D53) == $5C
	SEP.b #$10
	LDA.b #$84
	STA.b !RAM_SMW_Misc_ScratchRAM00
	LDX.b #$02
CODE_009D5B:
	STX.b !RAM_SMW_Misc_ScratchRAM04
	LSR.b !RAM_SMW_Misc_ScratchRAM05
	BCS.b CODE_009DA6
	JSR.w CODE_009DB5
	BNE.b CODE_009DA6
	LDA.l !SRAM_SMW_MarioA_StartLocation+$8C,x
	SEP.b #$10
	CMP.b #!Define_SMW_Counter_TotalExits
	BCC.b CODE_009D76
	LDY.b #$87
	LDA.b #$88
	BRA.b CODE_009D7A

CODE_009D76:
	JSR.w SMW_HexToDec_Bank00
	TXY
CODE_009D7A:
	LDX.b !RAM_SMW_Misc_ScratchRAM00
	STA.l SMW_StripeImageUploadTable[$02].LowByte,x
	TYA
	BNE.b CODE_009D85
	LDY.b #$FC
CODE_009D85:
	TYA
	STA.l SMW_StripeImageUploadTable[$01].LowByte,x
	LDA.b #$38
	STA.l SMW_StripeImageUploadTable[$01].HighByte,x
	STA.l SMW_StripeImageUploadTable[$02].HighByte,x
	REP.b #$20
	LDY.b #$03
CODE_009D98:
	LDA.w #$38FC
	STA.l SMW_StripeImageUploadTable[$03].LowByte,x
	INX
	INX
	DEY
	BNE.b CODE_009D98
	SEP.b #$20
CODE_009DA6:
	SEP.b #$10
	LDA.b !RAM_SMW_Misc_ScratchRAM00
	SEC
	SBC.b #$24
	STA.b !RAM_SMW_Misc_ScratchRAM00
	LDX.b !RAM_SMW_Misc_ScratchRAM04
	DEX
	BPL.b CODE_009D5B
	RTS
endif
endif

;---------------------------------------------------------------------------

BeginClosingOverworldPrompt:
	INC.w !RAM_SMW_Overworld_MarioScriptState
	INC.w !RAM_SMW_Overworld_MarioScriptState
	JML.l SMW_CloseOverworldPrompt_CODE_009C16

;---------------------------------------------------------------------------

; For whatever strange reason, SMW doesn't clear the sprite RAM area on level load.
; Because the overworld uses this area now, this can cause a few bugs, such as Yoshi spawning in a turning state.

ClearSpriteRAM:
	REP.b #$30
	LDX.w #(!RAM_SMW_OWSpr_SubZPos-!RAM_SMW_OWSpr_Table7E0E05)+!Define_SMW_MaxOverworldSpriteSlot+$02
-:
	STZ.w !RAM_SMW_OWSpr_Table7E0E05,x
	DEX
	DEX
	BPL.b -
	SEP.b #$30
	RTS

;---------------------------------------------------------------------------

ClearPromptWindowImage:
	%SMW_StripeImageHeader(.ClearLine1, $04, $0E, 0, $0025, 3)
	db $FC,$38
.ClearLine1End:
	%SMW_StripeImageHeader(.ClearLine2, $04, $10, 0, $002D, 3)
.CearLine2End:
	db $FC,$38
	%SMW_StripeImageHeader(.ClearLine3, $0F, $11, 0, $0003, 3)
	db $FC,$38
.ClearLine3End:
	%SMW_StripeImageHeader(.ClearLine4, $08, $12, 0, $001D, 3)
	db $FC,$38
.ClearLine4End:
	db $FF

DisplayScrollArrows:
	%SMW_StripeImageHeader(.TopArrowTopHalf, $0F, $06, 0, $0000, 3)
	db $7E,$60|!Define_SMW_Overworld_ScrollArrowPalette<<2
	db $7E,$20|!Define_SMW_Overworld_ScrollArrowPalette<<2
.TopArrowTopHalfEnd:
	%SMW_StripeImageHeader(.TopArrowBottomHalf, $0F, $07, 0, $0000, 3)
	db $7F,$20|!Define_SMW_Overworld_ScrollArrowPalette<<2
	db $7F,$60|!Define_SMW_Overworld_ScrollArrowPalette<<2
.TopArrowBottomHalfEnd:
	%SMW_StripeImageHeader(.LeftArrowTopHalf, $03, $0E, 0, $0000, 3)
	db $7E,$60|!Define_SMW_Overworld_ScrollArrowPalette<<2
	db $7D,$60|!Define_SMW_Overworld_ScrollArrowPalette<<2
.LeftArrowTopHalfEnd:
	%SMW_StripeImageHeader(.LeftArrowBottomHalf, $03, $0F, 0, $0000, 3)
	db $7E,$E0|!Define_SMW_Overworld_ScrollArrowPalette<<2
	db $7D,$E0|!Define_SMW_Overworld_ScrollArrowPalette<<2
.LeftArrowBottomHalfEnd:
	%SMW_StripeImageHeader(.RightArrowTopHalf, $1B, $0E, 0, $0000, 3)
	db $7D,$20|!Define_SMW_Overworld_ScrollArrowPalette<<2
	db $7E,$20|!Define_SMW_Overworld_ScrollArrowPalette<<2
.RightArrowTopHalfEnd:
	%SMW_StripeImageHeader(.RightArrowBottomHalf, $1B, $0F, 0, $0000, 3)
	db $7D,$A0|!Define_SMW_Overworld_ScrollArrowPalette<<2
	db $7E,$A0|!Define_SMW_Overworld_ScrollArrowPalette<<2
.RightArrowBottomHalfEnd:
	%SMW_StripeImageHeader(.BottomArrowTopHalf, $0F, $17, 0, $0000, 3)
	db $7F,$A0|!Define_SMW_Overworld_ScrollArrowPalette<<2
	db $7F,$E0|!Define_SMW_Overworld_ScrollArrowPalette<<2
.BottomArrowTopHalfEnd:
	%SMW_StripeImageHeader(.BottomArrowBottomHalf, $0F, $18, 0, $0000, 3)
	db $7E,$E0|!Define_SMW_Overworld_ScrollArrowPalette<<2
	db $7E,$A0|!Define_SMW_Overworld_ScrollArrowPalette<<2
.BottomArrowBottomHalfEnd:
	db $FF

RemoveScrollArrows:
	%SMW_StripeImageHeader(.TopArrowTopHalf, $0F, $06, 0, $0003, 3)
	db $FC,$00
.TopArrowTopHalfEnd:
	%SMW_StripeImageHeader(.TopArrowBottomHalf, $0F, $07, 0, $0003, 3)
	db $FC,$00
.TopArrowBottomHalfEnd:
	%SMW_StripeImageHeader(.LeftArrowTopHalf, $03, $0E, 0, $0003, 3)
	db $FC,$00
.LeftArrowTopHalfEnd:
	%SMW_StripeImageHeader(.LeftArrowBottomHalf, $03, $0F, 0, $0003, 3)
	db $FC,$00
.LeftArrowBottomHalfEnd:
	%SMW_StripeImageHeader(.RightArrowTopHalf, $1B, $0E, 0, $0003, 3)
	db $FC,$00
.RightArrowTopHalfEnd:
	%SMW_StripeImageHeader(.RightArrowBottomHalf, $1B, $0F, 0, $0003, 3)
	db $FC,$00
.RightArrowBottomHalfEnd:
	%SMW_StripeImageHeader(.BottomArrowTopHalf, $0F, $17, 0, $0003, 3)
	db $FC,$00
.BottomArrowTopHalfEnd:
	%SMW_StripeImageHeader(.BottomArrowBottomHalf, $0F, $18, 0, $0003, 3)
	db $FC,$00
.BottomArrowBottomHalfEnd:
	db $FF

LifeExchangeText:
	%SMW_StripeImageHeader(.Mario, $09, $12, 0, $0000, 3)
	;dw "MARIO"
	db $16,$28,$0A,$28,$1B,$28,$12,$28,$18,$28
.MarioEnd:
	%SMW_StripeImageHeader(.Luigi, $12, $12, 0, $0000, 3)
	;dw "LUIGI"
	db $15,$28,$1E,$28,$12,$28,$10,$28,$12,$28
.LuigiEnd:
	%SMW_StripeImageHeader(.MarioLives, $0B, $10, 0, $0000, 3)
	dw $2826	; Small x
	;dw "00"
	db $00,$28,$00,$28
.MarioLivesEnd:
	%SMW_StripeImageHeader(.LuigiLives, $14, $10, 0, $0000, 3)
	dw $2826	; Small x
	;dw "00"
	db $00,$28,$00,$28
.LuigiLivesEnd:
	%SMW_StripeImageHeader(.ArrowTopHalf, $0F, $10, 0, $0000, 3)
	db $FC,$38,$FC,$38
.ArrowTopHalfEnd:
	%SMW_StripeImageHeader(.ArrowBottomHalf, $0F, $11, 0, $0000, 3)
	db $FC,$38,$FC,$38
.ArrowBottomHalfEnd:
	%SMW_StripeImageHeader(.MarioHalo, $09, $0E, 0, $0000, 3)
	dw $2985,$6985
.MarioHaloEnd:
	%SMW_StripeImageHeader(.LuigiHalo, $12, $0E, 0, $0000, 3)
	dw $2985,$6985
.LuigiHaloEnd:
.End:
	db $FF

;---------------------------------------------------------------------------

; This routine runs when idling on a level (unless the level's script doesn't JSL to it for some reason).
; Note that X/Y is 16-bit and Y contains the pointer for the script. Make note of that if you decide to add new code in here.

HandlePlayerIdlingOnLevelFunctions:
	LDA.b !RAM_SMW_Flag_SpritesLocked
	BEQ.b +
	RTL
+:
	LDA.b !RAM_SMW_IO_ControllerPress1
	BIT.b #!Joypad_Select>>8
	BEQ.b .SelectNotPressed
	;JSL.l XXXXXX									;\ Uncomment this out if you want to assign a function to pressing select
	;JMP.w .EndOfIdleFunctions					;/
	LDA.b !RAM_SMW_IO_ControllerPress1
.SelectNotPressed:
	BIT.b #!Joypad_Start>>8
	BEQ.b .StartNotPressed
if !Define_SMW_Overworld_AllowMapScrollingWithStart == !TRUE
	LDA.w !RAM_SMW_Flag_Layer1HorizontalScrollLevelSetting
	ORA.w !RAM_SMW_Flag_Layer1VerticalScrollLevelSetting
	BEQ.b +
	STZ.b !RAM_SMW_IO_ControllerHold1
	STZ.b !RAM_SMW_IO_ControllerPress1
	STZ.b !RAM_SMW_IO_ControllerHold2
	STZ.b !RAM_SMW_IO_ControllerPress2
	LDA.w !RAM_SMW_Overworld_CameraState
	EOR.b #$02
	STA.w !RAM_SMW_Overworld_CameraState
	BNE.b +
	LDX.w #$FFFF
	STA.w !RAM_SMW_Overworld_ShowScrollArrows
+:
endif
	;JSL.l XXXXXX									;\ Uncomment this out if you want to assign a function to pressing start
	;JMP.w .EndOfIdleFunctions					;/
.StartNotPressed:
	LDA.b !RAM_SMW_IO_ControllerPress2
	BIT.b #!Joypad_L
	BEQ.b .LNotPressed
	;JSL.l XXXXXX									;\ Uncomment this out if you want to assign a function to pressing L
	;JMP.w .EndOfIdleFunctions					;/
	LDA.b !RAM_SMW_IO_ControllerPress2
.LNotPressed:
	BIT.b #!Joypad_R
	BEQ.b .RNotPressed
	;JSL.l XXXXXX									;\ Uncomment this out if you want to assign a function to pressing R
	;JMP.w .EndOfIdleFunctions					;/
.RNotPressed:
if !Define_SMW_Overworld_AllowLifeExchange&!Define_SMW_Overworld_UseLRForLifeExchange == !TRUE
	LDA.w !RAM_SMW_Flag_TwoPlayerGame
	BEQ.b .NoLifeExchange
	LDA.w !RAM_SMW_IO_ControllerPress2CopyP1
	ORA.w !RAM_SMW_IO_ControllerPress2CopyP2
	AND.b #!Joypad_L|!Joypad_R
	BEQ.b .NoLifeExchange
	REP.b #$20
	LDX.w !RAM_SMW_Overworld_MarioScriptStackPointer
	INC.w !RAM_SMW_Overworld_MarioScriptStackPointer
	INC.w !RAM_SMW_Overworld_MarioScriptStackPointer
	INC.w !RAM_SMW_Overworld_MarioScriptStackPointer
	TYA
	ADC.w #$0004
	STA.w !RAM_SMW_Overworld_MarioScriptStack,x
	SEP.b #$20
	LDA.w !RAM_SMW_Overworld_MarioScriptAddress+$02
	STA.w !RAM_SMW_Overworld_MarioScriptStack+$02,x
	LDY.w #Script_BringUpLifeExchangePrompt-$04
	LDA.b #Script_BringUpLifeExchangePrompt>>16
	PHA
	PLB
.NoLifeExchange:
endif
.EndOfIdleFunctions:
	RTL

;---------------------------------------------------------------------------

SwitchPalaceSwitchInteractionHack:
	LDA.w !RAM_SMW_Global_SavedGameStateFlags
	AND.l SMW_HandleMenuCursor_DATA_009E7E,x
	BNE.b .SwitchAlreadyPressed
	LDA.l SMW_HandleMenuCursor_DATA_009E7E,x
	TSB.w !RAM_SMW_Global_SavedGameStateFlags
	LDA.b #$01
	JML.l SMW_RunPlayerBlockCode_CODE_00EEB7

.SwitchAlreadyPressed:
	JML.l SMW_RunPlayerBlockCode_CODE_00EED1

SwitchPalaceObjectHack:
	LDA.w !RAM_SMW_Global_SavedGameStateFlags
	AND.l SMW_HandleMenuCursor_DATA_009E7E,x
	RTL

;---------------------------------------------------------------------------

Layer3Fix:
if !SA1ROM == !TRUE
	STX.w !REGISTER_IRQNMIAndJoypadEnableFlags
else
	STA.w !REGISTER_IRQNMIAndJoypadEnableFlags
endif
	LDY.w !RAM_SMW_Misc_CurrentlyActiveBossEndCutscene
	CPY.b #$08
	BNE.b +
	JML.l SMW_VBlankRoutine_CODE_008283

+:
	JML.l SMW_VBlankRoutine_CODE_0082B0

ExtraOverworldVBlankStuff:
	JSL.l SMW_UploadLevelLayer1And2Tilemaps_Main
	JSR.w UploadOverworldPlayerGFX
	LDA.b !RAM_SMW_Mirror_Layer3XPosLo
	STA.w !REGISTER_BG3HorizScrollOffset
	LDA.b !RAM_SMW_Mirror_Layer3XPosHi
	STA.w !REGISTER_BG3HorizScrollOffset
	LDA.b !RAM_SMW_Mirror_Layer3YPosLo
	STA.w !REGISTER_BG3VertScrollOffset
	LDA.b !RAM_SMW_Mirror_Layer3YPosHi
	STA.w !REGISTER_BG3VertScrollOffset
	RTL

UploadOverworldPlayerGFX:
	PHD
	REP.b #$20
	LDA.w #DMA[$00].Parameters
	TCD
	LDX.b #$01
	LDY.b #$80
	STY.w !REGISTER_VRAMAddressIncrementValue
	STZ.b DMA[$00].SizeHi
	LDA.w #!Define_SMW_Overworld_MarioGFXVRAMAddress
	STA.w !REGISTER_VRAMAddressLo
	LDA.w #((!REGISTER_WriteToVRAMPortLo&$0000FF)<<8)+!DMAParams_TransferMode_2Regs1Write
	STA.b DMA[$00].Parameters
	LDA.w SMW_DynamicSpritePointersTop[$03].LowByte
	STA.b DMA[$00].SourceLo
	LDY.b #DynamicOWMarioTiles>>16
	STY.b DMA[$00].SourceBank
	LDY.b #$40
	STY.b DMA[$00].SizeLo
	STX.w !REGISTER_DMAEnable
	LDA.w #!Define_SMW_Overworld_MarioGFXVRAMAddress+$0100
	STA.w !REGISTER_VRAMAddressLo
	STY.b DMA[$00].SizeLo
	STX.w !REGISTER_DMAEnable
	LDY.w !RAM_SMW_Flag_TwoPlayerGame
	BEQ.b .OnePlayerGame
	LDA.w #!Define_SMW_Overworld_LuigiGFXVRAMAddress
	STA.w !REGISTER_VRAMAddressLo
	LDA.w SMW_DynamicSpritePointersTop[$04].LowByte
	STA.b DMA[$00].SourceLo
	LDY.b #DynamicOWLuigiTiles>>16
	STY.b DMA[$00].SourceBank
	LDY.b #$40
	STY.b DMA[$00].SizeLo
	STX.w !REGISTER_DMAEnable
	LDA.w #!Define_SMW_Overworld_LuigiGFXVRAMAddress+$0100
	STA.w !REGISTER_VRAMAddressLo
	STY.b DMA[$00].SizeLo
	STX.w !REGISTER_DMAEnable
.OnePlayerGame:
	SEP.b #$20
	PLD
	RTS

;---------------------------------------------------------------------------

LoadSaveFileData:
if !Define_SMW_Global_UsingAltSaveSystem == !TRUE
.Main:
	warn "Since you specified that you're using an alt save system, did you modify the code at 'LoadSaveFileData' to account for the new save system? If so, delete this warning so you won't see this again."
	RTL
else
.FileSelectEntry:
	STZ.w !RAM_SMW_Misc_IntroLevelFlag
	JSL.l .Main
	JML.l SMW_GameMode08_FileSelect_CODE_009D22

.Main:
	PHP
	PHB
	REP.b #$20
	LDA.w !RAM_SMW_Misc_CurrentSaveFile
	AND.w #$00FF
	SEP.b #$20
	TAX
	LDA.l SMW_SaveFileLocations_Hi,x
	XBA
	LDA.l SMW_SaveFileLocations_Lo,x
	PEA.w !SRAM_SMW_MarioA_StartLocation>>8
	PLB
	PLB
	REP.b #$31
	TAX
	ADC.w #!Define_SMW_Misc_SaveFileSize*$03
	TAY
	LDA.w #!Define_SMW_Misc_SaveFileSize/$02
	STA.b !RAM_SMW_Misc_ScratchRAM00
	PHX
CODE_009CFF:
	LDA.w !SRAM_SMW_MarioA_StartLocation,x
	STA.w !SRAM_SMW_MarioA_StartLocation,y
	INX
	INX
	INY
	INY
	DEC.b !RAM_SMW_Misc_ScratchRAM00
	BNE.b CODE_009CFF
	PLY
	LDX.w #$0000
CODE_009D14:
	LDA.w !SRAM_SMW_MarioA_StartLocation,y
	STA.l !RAM_SMW_Overworld_LevelStatusFlags,x
	INX
	INX
	INY
	INY
	CPX.w #!Define_SMW_Misc_SaveFileSize-$02
	BCC.b CODE_009D14
	PLB
	PLP
	RTL
endif

;---------------------------------------------------------------------------

; This is some routines from Vitor Vilela's MaxTile system in the SA-1 patch that's used if the SA-1 patch is not used.
; If the SA-1 patch is used, then its own MaxTile routines will run instead.
; Since this patch freed up $7F0000-$7F7FFF, I figured I could utilize some of it to make MaxTile work on the base SNES.
; It would be kind of dumb if the SA-1 and base SNES version of this patch needed a separate OAM system anyway, and MaxTile is the standard.
;
; Unlike regular MaxTile, Legacy mode is not supported since all the overworld sprites now use either Allocation or Direct mode.
; Plus, not supporting Legacy mode simplifies the implementation and saves cycles (extra important, since this code will run on the base SNES).

if !SA1ROM == !FALSE
SMW_MaxtTile_Get_Slot:
	STY.w !RAM_SMW_OAM_MaxTileOAMBufferIndex2
	ASL
	ASL
	ASL
	ASL
	TAY
	LDA.w !RAM_SMW_OAM_MaxTileOAMBufferIndex2
	ASL
	ASL
	STA.w !RAM_SMW_OAM_MaxTileOAMBufferIndex1
	LDA.w !RAM_SMW_OAM_MaxTileMirrorMax+$00,y
	SEC
	SBC.w !RAM_SMW_OAM_MaxTileOAMBufferIndex1
	CMP.w !RAM_SMW_OAM_MaxTileMirrorMax+$08,y
	BCC.b .NoSlotsAvailable
	STA.w !RAM_SMW_OAM_MaxTileMirrorMax+$00,y
	ADC.w #$0003
	STA.w !RAM_SMW_OAM_MaxTileOAMBufferIndex1
    LDA.w !RAM_SMW_OAM_MaxTileMirrorMax+$02,y
    SEC
    SBC.w !RAM_SMW_OAM_MaxTileOAMBufferIndex2
    STA.w !RAM_SMW_OAM_MaxTileMirrorMax+$02,y
    INC
	STA.w !RAM_SMW_OAM_MaxTileOAMBufferIndex2
	SEC
.NoSlotsAvailable:
	RTL

MoveBufferedDataIntoRealOAMBuffer:
	PEA.w ((SMW_GameMode00_LoadNintendoPresents_Mode04Finish>>8)&$00FF00)|(!RAM_SMW_OAM_TileSizeBufferMax>>16)
	PLB
	REP.b #$30
	LDA.w #$0200
	STA.b !RAM_SMW_Misc_ScratchRAM00
	%Restrict_Buffer(!RAM_SMW_OAM_MaxTilePointerMax)
	%Restrict_Buffer(!RAM_SMW_OAM_MaxTilePointerHigh)
	%Restrict_Buffer(!RAM_SMW_OAM_MaxTilePointerNormal)
	%Restrict_Buffer(!RAM_SMW_OAM_MaxTilePointerLow)
	LDA.w #$0080
	STA.b !RAM_SMW_Misc_ScratchRAM00
	%Restrict_Buffer(!RAM_SMW_OAM_MaxTilePointerMax+$02)
	%Restrict_Buffer(!RAM_SMW_OAM_MaxTilePointerHigh+$02)
	%Restrict_Buffer(!RAM_SMW_OAM_MaxTilePointerNormal+$02)
	%Restrict_Buffer(!RAM_SMW_OAM_MaxTilePointerLow+$02)
	LDY.w #!RAM_SMW_IO_OriginalOAMBuffer+$01FF
	%Copy_Priority(!RAM_SMW_OAM_MaxTilePointerLow, 3)
	%Copy_Priority(!RAM_SMW_OAM_MaxTilePointerNormal, 3)
	%Copy_Priority(!RAM_SMW_OAM_MaxTilePointerHigh, 3)
	%Copy_Priority(!RAM_SMW_OAM_MaxTilePointerMax, 3)
	LDY.w #!RAM_SMW_Sprites_OriginalOAMTileSizeBuffer+$7F
	%Copy_Priority(!RAM_SMW_OAM_MaxTilePointerLow+$02, 0)
	%Copy_Priority(!RAM_SMW_OAM_MaxTilePointerNormal+$02, 0)
	%Copy_Priority(!RAM_SMW_OAM_MaxTilePointerHigh+$02, 0)
	%Copy_Priority(!RAM_SMW_OAM_MaxTilePointerMax+$02, 0)
	SEP.b #$30
	PLB
	RTL

InitializeOAMPointers:
	REP.b #$20
	LDA.w #!RAM_SMW_OAM_OAMBufferMax-$04
	STA.w !RAM_SMW_OAM_MaxTilePointerMax+$08
	LDA.w #!RAM_SMW_OAM_OAMBufferMax+$01FC
	STA.w !RAM_SMW_OAM_MaxTilePointerMax+$00
	STA.w !RAM_SMW_OAM_MaxTilePointerMax+$04
	LDA.w #!RAM_SMW_OAM_OAMBufferHigh-$04
	STA.w !RAM_SMW_OAM_MaxTilePointerHigh+$08
	LDA.w #!RAM_SMW_OAM_OAMBufferHigh+$01FC
	STA.w !RAM_SMW_OAM_MaxTilePointerHigh+$00
	STA.w !RAM_SMW_OAM_MaxTilePointerHigh+$04
	LDA.w #!RAM_SMW_OAM_OAMBufferNormal-$04
	STA.w !RAM_SMW_OAM_MaxTilePointerNormal+8
	LDA.w #!RAM_SMW_OAM_OAMBufferNormal+$01FC
	STA.w !RAM_SMW_OAM_MaxTilePointerNormal+$00
	STA.w !RAM_SMW_OAM_MaxTilePointerNormal+$04
	LDA.w #!RAM_SMW_OAM_OAMBufferLow-$04
	STA.w !RAM_SMW_OAM_MaxTilePointerLow+$08
	LDA.w #!RAM_SMW_OAM_OAMBufferLow+$01FC
	STA.w !RAM_SMW_OAM_MaxTilePointerLow+$00
	STA.w !RAM_SMW_OAM_MaxTilePointerLow+$04
	LDA.w #!RAM_SMW_OAM_TileSizeBufferMax+$7F
	STA.w !RAM_SMW_OAM_MaxTilePointerMax+$02
	STA.w !RAM_SMW_OAM_MaxTilePointerMax+$06
	LDA.w #!RAM_SMW_OAM_TileSizeBufferHigh+$7F
	STA.w !RAM_SMW_OAM_MaxTilePointerHigh+$02
	STA.w !RAM_SMW_OAM_MaxTilePointerHigh+$06
	LDA.w #!RAM_SMW_OAM_TileSizeBufferNormal+$7F
	STA.w !RAM_SMW_OAM_MaxTilePointerNormal+$02
	STA.w !RAM_SMW_OAM_MaxTilePointerNormal+$06
	LDA.w #!RAM_SMW_OAM_TileSizeBufferLow+$7F
	STA.w !RAM_SMW_OAM_MaxTilePointerLow+$02
	STA.w !RAM_SMW_OAM_MaxTilePointerLow+$06
	SEP.b #$20
	RTL
endif

;---------------------------------------------------------------------------

	pushpc
	%InsertOverworldSprites()
	pullpc
EndOfBank04:
print ""
print "Total space used in bank 04: ",dec(EndOfBank04-StartOfBank04)," bytes."
padbyte $00 : pad $058000|!FastROM

;#############################################################################################################
;#############################################################################################################

freecode
ScriptingBank01:
	incsrc "Scripting.asm"

freedata
LevelNameAndMessageTextBank01:
	incsrc "LevelNameAndMessageText.asm"

DynamicOWMarioTiles:
	incbin "ExGraphics/DynamicOWMarioTiles.bin"

DynamicOWLuigiTiles:
	incbin "ExGraphics/DynamicOWLuigiTiles.bin"

print "Total freespace used: ",freespaceuse," bytes."
print ""
print "---------------------------------------------------------------------------"
print ""

;#############################################################################################################
;#############################################################################################################
