
Acceleration:
	dw $0008,$FFF8

MaxXSpeed:
	dw $0180,$FE80
	
MaxYSpeed:
	dw $00A0,$FF60

Prop:
	dw $0000,$4000

Main:
	TXY
	LDA.w !RAM_SMW_OWSpr_CurrentState,x
	TAX
	JMP.w (StatePtrs,x)

StatePtrs:
	dw State00_Initialize
	dw State02_FlyAround

State00_Initialize:
	TYX
	LDA.w #$0068
	STA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	LDA.w #$0002
	STA.w !RAM_SMW_OWSpr_CurrentState,x
	BRA.b State02_FlyAround_Entry2

State02_FlyAround:
	TYX
.Entry2:
	LDA.b !RAM_SMW_Flag_SpritesLocked
	BEQ.b +
	JMP.w GFXRt

+:
	JSL.l UpdateOverworldSpritePosition
	LDY.b #$00
	LDA.w !RAM_SMW_OWSpr_XSpeed,x
	BMI.b +
	LDY.b #$02
+:
	LDA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	AND.w #$00FF
	ORA.w Prop,y
	STA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	LDY.w !RAM_SMW_OWSpr09_Bowser_HorizontalMovementDirection,x
	LDA.w !RAM_SMW_OWSpr_XSpeed,x
	CLC
	ADC.w Acceleration,y
	STA.w !RAM_SMW_OWSpr_XSpeed,x
	CMP.w MaxXSpeed,y
	BNE.b +
	LDA.w !RAM_SMW_OWSpr09_Bowser_HorizontalMovementDirection,x
	EOR.w #$0002
	STA.w !RAM_SMW_OWSpr09_Bowser_HorizontalMovementDirection,x
+:
	LDY.w !RAM_SMW_OWSpr09_Bowser_VerticalMovementDirection,x
	LDA.w !RAM_SMW_OWSpr_YSpeed,x
	CLC
	ADC.w Acceleration,y
	STA.w !RAM_SMW_OWSpr_YSpeed,x
	CMP.w MaxYSpeed,y
	BNE.b +
	LDA.w !RAM_SMW_OWSpr09_Bowser_VerticalMovementDirection,x
	EOR.w #$0002
	STA.w !RAM_SMW_OWSpr09_Bowser_VerticalMovementDirection,x
+:
GFXRt:
	REP.b #$10
	LDY.w #$0001
	LDA.w #$0003
	JSL.l GetOWSpriteOnScreenPosition
	LDA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	STA.b !RAM_SMW_DrawOWSprite_TileAndProp
	PEA.w ((SMW_ProcessOverworldSprites_Main>>8)&$00FF00)|(!RAM_SMW_IO_OAMBuffer>>16)
	PLB
	LDA.w #$0001
	STA.b !RAM_SMW_DrawOWSprite_HighXBitAndTileSize
	LDA.w #$FFF8
	STA.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	STZ.b !RAM_SMW_DrawOWSprite_CurrentYDisp
	STZ.b !RAM_SMW_DrawOWSprite_CurrentFlip
	JSL.l BufferOverworldSpriteTile
	PLB
	RTL
