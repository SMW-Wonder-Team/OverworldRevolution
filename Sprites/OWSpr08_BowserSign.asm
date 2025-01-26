
Tiles:
	dw $006C,$006D,$006E,$006F

XDisp:
	dw $0000,$0008,$0010,$0018

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
	LDA.w #$0002
	STA.w !RAM_SMW_OWSpr_CurrentState,x
	LDA.w !RAM_SMW_OWSpr_YPosLo,x
	CLC
	ADC.w #$0008
	STA.w !RAM_SMW_OWSpr_YPosLo,x
	BRA.b State02_Animate_Entry2

State02_Animate:
	TYX
.Entry2:
	;LDA.b !RAM_SMW_Flag_SpritesLocked
	;BEQ.b +
	;JMP.w GFXRt

;+:
	LDA.b !RAM_SMW_Counter_LocalFrames-$01
	LSR
	AND.w #$0600
	ORA.w #$3000
	STA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	STA.b !RAM_SMW_DrawOWSprite_TileAndProp
	REP.b #$10
	LDY.w #$0004
	LDA.w #$0002
	JSL.l GetOWSpriteOnScreenPosition
	PEA.w ((SMW_ProcessOverworldSprites_Main>>8)&$00FF00)|(!RAM_SMW_IO_OAMBuffer>>16)
	PLB
	LDX.w #$0006
	STX.b !RAM_SMW_DrawOWSprite_LoopCounter
-:
	STZ.b !RAM_SMW_DrawOWSprite_HighXBitAndTileSize
	LDA.b !RAM_SMW_DrawOWSprite_TileAndProp
	AND.w #$FF00
	ORA.l Tiles,x
	STA.b !RAM_SMW_DrawOWSprite_TileAndProp
	LDA.l XDisp,x
	STA.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	STZ.b !RAM_SMW_DrawOWSprite_CurrentYDisp
	STZ.b !RAM_SMW_DrawOWSprite_CurrentFlip
	JSL.l BufferOverworldSpriteTile
	BPL.b -
	PLB
	RTL
