
InitialXSpeed:
	dw $0000,$FD80,$FD00,$FD80,$0000,$0280,$0300,$0280

InitialYSpeed:
	dw $FD00,$FD80,$0000,$0280,$0300,$0280,$0000,$FD80

Main:
	TXY
	LDA.w !RAM_SMW_OWSpr_CurrentState,x
	TAX
	JMP.w (StatePtrs,x)

StatePtrs:
	dw State00_Initialize
	dw State02_FlyAway

State00_Initialize:
	TYX
	LDA.w !RAM_SMW_Misc_ColorOfPalaceSwitchPressed1
	AND.w #$00FF
	DEC
	ASL
	XBA
	ORA.w #$30E6
	STA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	LDA.w !RAM_SMW_OWSpr_Table7E0E15,x
	AND.w #$0007
	ASL
	TAY
	LDA.w InitialXSpeed,y
	STA.w !RAM_SMW_OWSpr_XSpeed,x
	LDA.w InitialYSpeed,y
	STA.w !RAM_SMW_OWSpr_YSpeed,x
	LDA.w #$FD00
	STA.w !RAM_SMW_OWSpr_ZSpeed,x
	LDA.w #$0002
	STA.w !RAM_SMW_OWSpr_CurrentState,x
	LDY.b #!Define_SMW_Sound1DFC_OverworldSwitchBlockEjection
	STY.w !RAM_SMW_IO_SoundCh3
	BRA.b State02_FlyAway_Entry2

State02_FlyAway:
	TYX
.Entry2:
	LDA.b !RAM_SMW_Flag_SpritesLocked
	BEQ.b +
	JMP.w GFXRt

+:
	LDA.w !RAM_SMW_OWSpr_ZPosLo,x
	BEQ.b +
	BPL.b EraseSprite
+:
	LDA.w !RAM_SMW_OWSpr_ZSpeed,x
	CLC
	ADC.w #$0010
	BMI.b +
	CMP.w #$0400
	BCC.b +
	LDA.w #$0400
+:
	STA.w !RAM_SMW_OWSpr_ZSpeed,x
	JSL.l UpdateOverworldSpritePosition
GFXRt:
	REP.b #$10
	LDY.w #$0001
	LDA.w #$0001
	JSL.l GetOWSpriteOnScreenPosition
	LDA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	STA.b !RAM_SMW_DrawOWSprite_TileAndProp
	PEA.w ((SMW_ProcessOverworldSprites_Main>>8)&$00FF00)|(!RAM_SMW_IO_OAMBuffer>>16)
	PLB
	LDA.w #$0001
	STA.b !RAM_SMW_DrawOWSprite_HighXBitAndTileSize
	STZ.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	STZ.b !RAM_SMW_DrawOWSprite_CurrentYDisp
	STZ.b !RAM_SMW_DrawOWSprite_CurrentFlip
	JSL.l BufferOverworldSpriteTile
	PLB
	RTL

EraseSprite:
	JML.l OWSubOffscreen_EraseSprite
