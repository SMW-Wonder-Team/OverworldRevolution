
Tiles:
	dw $002A,$002C

Main:
	TXY
	LDA.w !RAM_SMW_OWSpr_CurrentState,x
	TAX
	JMP.w (StatePtrs,x)

StatePtrs:
	dw State00_Initialize
	dw State02_Animate

State00_Initialize:
	TYX
	SEP.b #$20
	JSL.l SMW_GetRand_Main
	REP.b #$20
	LDA.w !RAM_SMW_Misc_RandomByte1
	STA.w !RAM_SMW_OWSpr_Table7E0E15,x
	LDA.w #$3200
	STA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	LDA.w #$0002
	STA.w !RAM_SMW_OWSpr_CurrentState,x
	BRA.b State02_Animate_Entry2

State02_Animate:
	TYX
.Entry2:
	LDA.b !RAM_SMW_Flag_SpritesLocked
	BEQ.b +
	JMP.w GFXRt

+:
	INC.w !RAM_SMW_OWSpr_Table7E0E15,x
GFXRt:
	LDY.b #$00
	LDA.w !RAM_SMW_OWSpr_Table7E0E15,x
	AND.w #$0008
	BEQ.b +
	LDY.b #$02
+:
	LDA.w Tiles,y
	ORA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	STA.b !RAM_SMW_DrawOWSprite_TileAndProp
	REP.b #$10
	LDY.w #$0001
	LDA.w #$0002
	JSL.l GetOWSpriteOnScreenPosition
	PEA.w ((SMW_ProcessOverworldSprites_Main>>8)&$00FF00)|(!RAM_SMW_IO_OAMBuffer>>16)
	PLB
	LDA.w #$0001
	STA.b !RAM_SMW_DrawOWSprite_HighXBitAndTileSize
	STZ.b !RAM_SMW_DrawOWSprite_CurrentFlip
	STZ.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	STZ.b !RAM_SMW_DrawOWSprite_CurrentYDisp
	JSL.l BufferOverworldSpriteTile
	PLB
	RTL
