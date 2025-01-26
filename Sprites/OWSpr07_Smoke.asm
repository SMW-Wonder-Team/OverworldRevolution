
XDisp:
	dw $0009,$000A,$000B,$000C,$000B,$000A,$0009,$0008
	dw $0009,$000A,$000B,$000C,$000B,$000A,$0009,$0008

YDisp:
	dw $FFFF,$FFFF,$FFFE,$FFFD,$FFFD,$FFFC,$FFFB,$FFFB
	dw $FFFA,$FFF9,$FFF9,$FFF8,$FFF7,$FFF7,$FFF6,$FFF5

Tiles:
	dw $0028,$005F

Main:
	TXY
	LDA.w !RAM_SMW_OWSpr_CurrentState,x
	TAX
	JMP.w (StatePtrs,x)

StatePtrs:
	dw State00_Initialize
	dw State02_FloatAway

State00_Initialize:
	TYX
	LDA.w #$3068
	STA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	LDA.w #$0002
	STA.w !RAM_SMW_OWSpr_CurrentState,x
	LDA.w !RAM_SMW_OWSpr_YPosLo,x
	CLC
	ADC.w #$000A
	STA.w !RAM_SMW_OWSpr_YPosLo,x
	BRA.b State02_FloatAway_Entry2

State02_FloatAway:
	TYX
.Entry2:
	LDA.b !RAM_SMW_Flag_SpritesLocked
	BEQ.b +
	JMP.w GFXRt

+:
	LDA.b !RAM_SMW_Counter_LocalFrames
	AND.w #$000F
	BNE.b ++
	LDA.w !RAM_SMW_OWSpr07_Smoke_AnimationFrameCounter,x
	INC
	INC
	CMP.w #$0018
	BCC.b +
	LDA.w #$0000
+:
	STA.w !RAM_SMW_OWSpr07_Smoke_AnimationFrameCounter,x
++:
GFXRt:
	LDA.w !RAM_SMW_OWSpr07_Smoke_AnimationFrameCounter,x
	STA.b !RAM_SMW_Misc_ScratchRAM8C
	LDA.b !RAM_SMW_Counter_LocalFrames
	AND.w #$00FF
	STA.b !RAM_SMW_Misc_ScratchRAM08
	LDA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	STA.b !RAM_SMW_DrawOWSprite_TileAndProp
	STZ.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	STZ.b !RAM_SMW_DrawOWSprite_CurrentYDisp
	STZ.b !RAM_SMW_DrawOWSprite_CurrentFlip
	REP.b #$10
	LDY.w #$0003
	LDA.w #$0002
	JSl.l GetOWSpriteOnScreenPosition
	PEA.w ((SMW_ProcessOverworldSprites_Main>>8)&$00FF00)|(!RAM_SMW_IO_OAMBuffer>>16)
	PLB
	LDX.w #$0004
	STX.b !RAM_SMW_DrawOWSprite_LoopCounter
	BRA.b ++

-:
	LDA.b !RAM_SMW_Misc_ScratchRAM8C
	CLC
	ADC.w #$0018
	CMP.w #$0020
	AND.w #$001E
	STA.b !RAM_SMW_Misc_ScratchRAM8C
	BCC.b +
	LDA.b !RAM_SMW_DrawOWSprite_CurrentYDisp
	SBC.w #$000C
	STA.b !RAM_SMW_DrawOWSprite_CurrentYDisp
+:
	PHB
	PHK
	PLB
	LDX.w !RAM_SMW_Sprites_CurrentlyProcessedOverworldSprite
	JSL.l GetOWSpriteOnScreenPosition_Entry2
	PLB
++:
	STZ.b !RAM_SMW_DrawOWSprite_HighXBitAndTileSize
	LDX.b !RAM_SMW_Misc_ScratchRAM8C
 	LDA.b !RAM_SMW_DrawOWSprite_YPos
	CLC
	ADC.l YDisp,x
 	STA.b !RAM_SMW_DrawOWSprite_YPos
	LDA.b !RAM_SMW_DrawOWSprite_XPos
	CLC
	ADC.l XDisp,x
	STA.b !RAM_SMW_DrawOWSprite_XPos
	LDX.w #$0000
	LDA.b !RAM_SMW_Misc_ScratchRAM08
	CLC
	ADC.w #$000A
	STA.b !RAM_SMW_Misc_ScratchRAM08
	AND.w #$0020
	BEQ.b +
	LDX.w #$0002
+:
	LDA.b !RAM_SMW_DrawOWSprite_TileAndProp
	AND.w #$FF00
	ORA.l Tiles,x
	STA.b !RAM_SMW_DrawOWSprite_TileAndProp
	LDX.b !RAM_SMW_DrawOWSprite_LoopCounter
	JSL.l BufferOverworldSpriteTile
	BPL.b -
	PLB
	RTL
