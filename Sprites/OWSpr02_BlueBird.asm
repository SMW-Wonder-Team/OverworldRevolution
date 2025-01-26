
Acceleration:
	dw $0010,$FFF0

MaxXSpeed:
	dw $0100,$FF00

Flip:
	dw $0000,$4000

WingXDisp:
	dw $0008,$0007,$0004,$0007
	dw $0000,$0001,$0004,$0001

WingYDisp:
	dw $0001,$0007,$0009,$0007

WingTiles:
	dw $004E,$004F,$005E,$004F

Main:
	TXY
	LDA.w !RAM_SMW_OWSpr_CurrentState,x
	TAX
	JMP.w (StatePtrs,x)

StatePtrs:
	dw State00_Initialize
	dw State02_Move

State00_Initialize:
	TYX
	LDA.w #$364C
	STA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	SEP.b #$20
	JSL.l SMW_GetRand_Main
	REP.b #$20
	LDA.w !RAM_SMW_Misc_RandomByte1
	STA.w !RAM_SMW_OWSpr_Table7E0E15,x
	LDA.w #$FFC0
	STA.w !RAM_SMW_OWSpr_ZPosLo,x
	LDA.w #$0002
	STA.w !RAM_SMW_OWSpr_CurrentState,x
	BRA.b State02_Move_Entry2

State02_Move:
	TYX
.Entry2:
	LDA.b !RAM_SMW_Flag_SpritesLocked
	BEQ.b +
	JMP.w GFXRt

+:
	INC.w !RAM_SMW_OWSpr_Table7E0E15,x
	JSL.l SubOverworldHorizAndVertPos
	LDY.b #$00
	LDA.b !RAM_SMW_Misc_ScratchRAM00
	BMI.b +
	LDY.b #$02
+:
	LDA.w !RAM_SMW_OWSpr_XSpeed,x
	CLC
	ADC.w Acceleration,y
	CMP.w MaxXSpeed,y
	BEQ.b +
	STA.w !RAM_SMW_OWSpr_XSpeed,x
+:
	LDY.w !RAM_SMW_Player_CurrentCharacterX2Lo
	LDA.w !RAM_SMW_Overworld_MarioYPosLo,y
	CLC
	ADC.w #$000E
	STA.w !RAM_SMW_OWSpr_YPosLo,x
	JSL.l UpdateOverworldSpritePosition
GFXRt:
	LDY.b #$00
	LDA.w !RAM_SMW_OWSpr_XSpeed,x
	STA.b !RAM_SMW_Misc_ScratchRAM08
	BMI.b +
	LDY.b #$02
+:
	LDA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	AND.w #$3FFF
	ORA.w Flip,y
	STA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	STA.b !RAM_SMW_DrawOWSprite_TileAndProp
	REP.b #$10
	LDY.w #$0002
	LDA.w #$0001
	JSL.l GetOWSpriteOnScreenPosition
	LDA.w !RAM_SMW_OWSpr_Table7E0E15,x
	LSR
	LSR
	AND.w #$0006
	TAX
	PEA.w ((SMW_ProcessOverworldSprites_Main>>8)&$00FF00)|(!RAM_SMW_IO_OAMBuffer>>16)
	PLB
	STZ.b !RAM_SMW_DrawOWSprite_HighXBitAndTileSize
	LDA.l WingYDisp,x
	STA.b !RAM_SMW_DrawOWSprite_CurrentYDisp
	LDA.b !RAM_SMW_DrawOWSprite_TileAndProp
	AND.w #$FF00
	ORA.l WingTiles,x
	STA.b !RAM_SMW_DrawOWSprite_TileAndProp
	LDA.b !RAM_SMW_Misc_ScratchRAM08
	BMI.b +
	TXA
	CLC
	ADC.w #$0008
	TAX
+:
	LDA.l WingXDisp,x
	STA.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	JSL.l BufferOverworldSpriteTile
	LDA.l !RAM_SMW_Sprites_CurrentlyProcessedOverworldSprite
	TAX
	LDA.w #$0001
	STA.b !RAM_SMW_DrawOWSprite_HighXBitAndTileSize
	STZ.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	STZ.b !RAM_SMW_DrawOWSprite_CurrentYDisp
	STZ.b !RAM_SMW_DrawOWSprite_CurrentFlip
	LDA.l !RAM_SMW_OWSpr_YXPPCCCT,x
	STA.b !RAM_SMW_DrawOWSprite_TileAndProp
	JSL.l BufferOverworldSpriteTile
	PLB
	RTL
