
Tiles:
	dw $004A,$0048

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
	LDA.w #$3200
	STA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	SEP.b #$20
	JSL.l SMW_GetRand_Main
	REP.b #$20
	LDA.w !RAM_SMW_Misc_RandomByte1
	STA.w !RAM_SMW_OWSpr_Table7E0E15,x
	LDA.w #$FDC0
	STA.w !RAM_SMW_OWSpr_ZSpeed,x
	LDA.w !RAM_SMW_OWSpr_ZPosLo,x
	CLC
	ADC.w !RAM_SMW_OWSpr_YPosLo,x
	STA.w !RAM_SMW_OWSpr_Table7E0E05,x
	LDA.w #$0002
	STA.w !RAM_SMW_OWSpr_CurrentState,x
	JSR.w SpawnWaterSplash
	BRA.b State02_Move_Entry2

EraseSprite:
	JSR.w SpawnWaterSplash
	JML.l OWSubOffscreen_EraseSprite

State02_Move:
	TYX
.Entry2:
	LDA.b !RAM_SMW_Flag_SpritesLocked
	BEQ.b +
	JMP.w GFXRt

+:
	LDA.w !RAM_SMW_OWSpr_ZSpeed,x
	BMI.b +
	LDA.w !RAM_SMW_OWSpr_ZPosLo,x
	CLC
	ADC.w !RAM_SMW_OWSpr_YPosLo,x
	CMP.w !RAM_SMW_OWSpr_Table7E0E05,x
	BCS.b EraseSprite
+:
	INC.w !RAM_SMW_OWSpr_Table7E0E15,x
	JSL.l UpdateOverworldSpritePosition
	LDA.w !RAM_SMW_OWSpr_ZSpeed,x
	ROL
	LDA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	AND.w #$3FFF
	BCS.b +
	ORA.w #$C000
+:	
	STA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	LDA.w !RAM_SMW_OWSpr_ZSpeed,x
	CLC
	ADC.w #$0010
	CMP.w #$01D0
	BEQ.b +
	STA.w !RAM_SMW_OWSpr_ZSpeed,x
+:
GFXRt:
	LDA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	LDY.b #$08
	BIT.w !RAM_SMW_OWSpr_ZSpeed,x
	BPL.b +
	LDY.b #$10
+:
	TYA
	LDY.b #$00
	AND.w !RAM_SMW_OWSpr_Table7E0E15,x
	AND.w #$00FF
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

SpawnWaterSplash:
	REP.b #$10
	LDA.w #!Define_SMW_SpriteID_OWSpr0F_WaterSplash
	STA.w !RAM_SMW_Overworld_SpriteSpawnData
	LDA.w !RAM_SMW_OWSpr_XPosLo,x
	STA.w !RAM_SMW_Overworld_SpriteSpawnData+$02
	LDA.w !RAM_SMW_OWSpr_YPosLo,x
	STA.w !RAM_SMW_Overworld_SpriteSpawnData+$04
	STZ.w !RAM_SMW_Overworld_SpriteSpawnData+$06
	STZ.w !RAM_SMW_Overworld_SpriteSpawnData+$08
	LDY.w #!RAM_SMW_Overworld_SpriteSpawnData-$01
	JSL.l SpawnOverworldSprite
	SEP.b #$10
	RTS
