
XDisp:
	dw $0000,$0008,$0000,$0008

YDisp:
	dw $FFFF,$FFFF,$0007,$0007

LayerPtrOffset:
	dw $0000,$0030

Main:
	TXY
if !Define_SMW_Overworld_EnableFadeEffect == !TRUE	
	LDA.w !RAM_SMW_OWSpr_CurrentState,x
	TAX
	JMP.w (StatePtrs,x)

StatePtrs:
	dw State00_Initialize
	dw State02_FadeIn
	dw State04_SpawnMap16Tile

State00_Initialize:
	TYX
	LDA.w #$0002
	STA.w !RAM_SMW_OWSpr_CurrentState,x
	STZ.w !RAM_SMW_Timer_LevelEndFade
	STZ.w !RAM_SMW_Palettes_LevelEndColorFadeDirection
	LDX.b #$6E
-:
	LDA.w SMW_PaletteMirror[$00].LowByte,x
	STA.w SMW_CopyOfPaletteMirror[$01].LowByte,x
	STZ.w SMW_CopyOfPaletteMirror[$3A].LowByte,x
	DEX
	DEX
	BPL.b -
	LDX.b #$6E
--:
	LDY.b #$08
-:
	LDA.w SMW_PaletteMirror[$40].LowByte,x
	STA.w SMW_CopyOfPaletteMirror[$01].LowByte,x
	DEX
	DEX
	DEY
	BNE.b -
	TXA
	SEC
	SBC.w #$0010
	TAX
	BPL.b --
	JSR.w CODE_04EA8B
	JSR.w FadeOutBGTiles
	BRA.b State02_FadeIn_Entry2

State02_FadeIn:
	TYX
.Entry2:
	REP.b #$10
	LDX.w #$0006
	STX.b !RAM_SMW_Misc_ScratchRAM08
	BRA.b +

--:
	TXA
	CLC
	ADC.w #$0016
	STA.b !RAM_SMW_Misc_ScratchRAM08
	TAX
+:
	LDY.w #$0004
	LDA.w #$0003
	JSL.l SMW_MaxtTile_Get_Slot
	BCS.b .SlotGotten
	JMP.w .NoMoreSlots

.SlotGotten:
	LDY.w !RAM_SMW_OAM_MaxTileOAMBufferIndex1
	LDA.l !RAM_SMW_OWSpr_EventFadeTileBuffer_XPos-$06,x
	SEC
	SBC.b !RAM_SMW_Mirror_CurrentLayer1XPosLo
	STA.b !RAM_SMW_DrawOWSprite_XPos
	LDA.l !RAM_SMW_OWSpr_EventFadeTileBuffer_YPos-$06,x
	SEC
	SBC.b !RAM_SMW_Mirror_CurrentLayer1YPosLo
	STA.b !RAM_SMW_DrawOWSprite_YPos
	LDX.w #$0006
	STX.b !RAM_SMW_DrawOWSprite_LoopCounter
	PHB
	PEA.w !RAM_SMW_IO_OAMBuffer>>8
	PLB
	PLB
-:
	LDX.b !RAM_SMW_Misc_ScratchRAM08
	LDA.l !RAM_SMW_OWSpr_EventFadeTileBuffer_TilemapData,x
	AND.w #$C000
	STA.b !RAM_SMW_Misc_ScratchRAM04
	LDA.l !RAM_SMW_OWSpr_EventFadeTileBuffer_TilemapData,x
	AND.w #$1C00
	LSR
	ORA.b !RAM_SMW_Misc_ScratchRAM04
	ORA.w #$1100
	STA.b !RAM_SMW_Misc_ScratchRAM04
	LDA.l !RAM_SMW_OWSpr_EventFadeTileBuffer_TilemapData,x
	AND.w #$00FF
	ORA.b !RAM_SMW_Misc_ScratchRAM04
	STA.b !RAM_SMW_DrawOWSprite_TileAndProp
	LDX.b !RAM_SMW_DrawOWSprite_LoopCounter
	STZ.b !RAM_SMW_DrawOWSprite_HighXBitAndTileSize
	LDA.l XDisp,x
	STA.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	LDA.l YDisp,x
	STA.b !RAM_SMW_DrawOWSprite_CurrentYDisp
	STZ.b !RAM_SMW_DrawOWSprite_CurrentFlip
	DEC.b !RAM_SMW_Misc_ScratchRAM08
	DEC.b !RAM_SMW_Misc_ScratchRAM08
	JSL.l BufferOverworldSpriteTile
	BPL.b -
	PLB
	LDX.b !RAM_SMW_Misc_ScratchRAM08
	INX
	INX
	LDA.l !RAM_SMW_OWSpr_EventFadeTileBuffer_NextTileDirection-$01,x
	BMI.b +
	JMP.w --

+:
.NoMoreSlots:
	SEP.b #$30
if !SA1ROM == !TRUE
	LDY.b #$02												; This must be adjusted because the SA-1 removes the lag. Otherwise, the event processes at near light speed.
else
	LDY.b #$08
endif
	LDA.w !RAM_SMW_Overworld_EventRevealSpeed
	CMP.b #!Define_SMW_Overworld_SlowPathRevealDelay
	BNE.b +
	LDY.b #$01
+:
	STY.b !RAM_SMW_Misc_ScratchRAM8A
-:
	LDA.w !RAM_SMW_Timer_LevelEndFade
	JSL.l SMW_OverworldEventProcess04_FadeInLayer2Tile_CODE_00B006
	DEC.b !RAM_SMW_Misc_ScratchRAM8A
	BNE.b -
	REP.b #$20
	JSR.w CODE_04EA8B
	LDX.w !RAM_SMW_Sprites_CurrentlyProcessedOverworldSprite
	LDY.w !RAM_SMW_Timer_LevelEndFade
	CPY.b #$40
	BCC.b PaletteFadeNotFinished
	LDA.w #$0004
	STA.w !RAM_SMW_OWSpr_CurrentState,x
PaletteFadeNotFinished:
	RTL

State04_SpawnMap16Tile:
	TYX
	REP.b #$30
	LDX.w #$0000
-:
	LDA.l !RAM_SMW_OWSpr_EventFadeTileBuffer_XPos,x
	STA.b !RAM_SMW_Blocks_XPosLo
	LDA.l !RAM_SMW_OWSpr_EventFadeTileBuffer_YPos,x
	STA.b !RAM_SMW_Blocks_YPosLo
	LDA.l !RAM_SMW_OWSpr_EventFadeTileBuffer_Map16Tile,x
	AND.w #$8000
	ASL
	ROL
	STA.w !RAM_SMW_Misc_CurrentLayerBeingProcessedLo
	LDA.l !RAM_SMW_OWSpr_EventFadeTileBuffer_Map16Tile,x
	AND.w #$7FFF
	JSL.l BufferEventTile
	REP.b #$31
	LDA.l !RAM_SMW_OWSpr_EventFadeTileBuffer_NextTileDirection-$01,x
	BMI.b +
	TXA
	CLC
	ADC.w #$0010
	TAX
	BRA.b -

+:
	SEP.b #$10
	LDA.w #$0000
	STA.l !RAM_SMW_OWSpr_EventFadeTileBufferIndex
	LDX.w !RAM_SMW_Sprites_CurrentlyProcessedOverworldSprite
	JML.l OWSubOffscreen_EraseSprite

CODE_04EA8B:
	LDA.w #$0070
	STA.w SMW_CopyOfPaletteMirror[$00].LowByte
	LDA.w #$C070
	STA.w SMW_CopyOfPaletteMirror[$39].LowByte
	SEP.b #$20
	STZ.w SMW_CopyOfPaletteMirror[$72].LowByte
	LDA.b #$03
	STA.w !RAM_SMW_Palettes_PaletteUploadTableIndex
	REP.b #$20
	RTS

FadeOutBGTiles:
if !SA1ROM == !TRUE
	LDA.w #.SNESMain
	STA.w !RAM_SMW_SA1_SNESCodePointerLo
	LDA.w #.SNESMain>>8
	STA.w !RAM_SMW_SA1_SNESCodePointerHi
	LDX.b #$D0
	STX.w !REGISTER_SA1_SA1RQControlWrite
-:
	LDA.w !RAM_SMW_SA1_SNESDoneFlag
	BEQ.b -
	STZ.w !RAM_SMW_SA1_SNESDoneFlag
	BRA.b +

.SNESMain:
	LDA.l !RAM_SMW_Misc_StripeImageUploadIndexLo
	STA.b !RAM_SMW_Misc_ScratchRAM8C
	RTL

+:
endif
	REP.b #$10
if !SA1ROM == !TRUE
else
	LDA.l !RAM_SMW_Misc_StripeImageUploadIndexLo
	STA.b !RAM_SMW_Misc_ScratchRAM8C
endif
	LDX.w #$0000
-:
	PHX
	LDA.l !RAM_SMW_OWSpr_EventFadeTileBuffer_YPos,x
	AND.w #$FFF0
	STA.b !RAM_SMW_Blocks_YPosLo
	LDA.l !RAM_SMW_OWSpr_EventFadeTileBuffer_Map16Tile,x
	AND.w #$8000
	ASL
	ROL
	STA.w !RAM_SMW_Misc_CurrentLayerBeingProcessedLo
	ASL
	TAY
	LDA.w LayerPtrOffset,y
	STA.b !RAM_SMW_OWPlayerLevelCollision_CurrentLayer
	LDA.l !RAM_SMW_OWSpr_EventFadeTileBuffer_XPos,x
	AND.w #$FFF0
	STA.b !RAM_SMW_Blocks_XPosLo
	SEP.b #$10
	JSL.l GetMap16TileFromLevelBuffer_EventEntry
	REP.b #$10
	JSL.l BufferEventTile
	JSL.l AdjustPaletteOfBufferedTiles
	PLX
	LDA.l !RAM_SMW_OWSpr_EventFadeTileBuffer_NextTileDirection-$01,x
	BMI.b +
	TXA
	CLC
	ADC.w #$0010
	TAX
	BRA.b -

+:
	SEP.b #$10
	RTS

else
	JML.l OWSubOffscreen_EraseSprite
endif
