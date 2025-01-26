
Flip:
	dw $0000,$4000

XDisp:
	dw $0000,$0010

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
	LDA.w #$3244
	STA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	LDA.w #$0020
	STA.w !RAM_SMW_OWSpr_XSpeed,x
	LDA.w #$FFF0
	STA.w !RAM_SMW_OWSpr_YSpeed,x
	LDA.w #$0002
	STA.w !RAM_SMW_OWSpr_CurrentState,x
	BRA.b State02_Move_Entry2

State02_Move:
	TYX
.Entry2:
	LDA.b !RAM_SMW_Flag_SpritesLocked
	BEQ.b +
	BRA.b GFXRt

+:
	JSL.l UpdateOverworldSpritePosition
GFXRt:
	LDA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	STA.b !RAM_SMW_DrawOWSprite_TileAndProp
	REP.b #$10
	LDY.w #$0002
	LDA.w #$0000
	JSL.l GetOWSpriteOnScreenPosition
	PEA.w ((SMW_ProcessOverworldSprites_Main>>8)&$00FF00)|(!RAM_SMW_IO_OAMBuffer>>16)
	PLB
	LDX.w #$0002
	STX.b !RAM_SMW_DrawOWSprite_LoopCounter
-:
	LDA.w #$0001
	STA.b !RAM_SMW_DrawOWSprite_HighXBitAndTileSize
	LDA.l XDisp,x
	STA.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	STZ.b !RAM_SMW_DrawOWSprite_CurrentYDisp
	LDA.l Flip,x
	STA.b !RAM_SMW_DrawOWSprite_CurrentFlip
	JSL.l BufferOverworldSpriteTile
	BPL.b -
	PLB
	RTL

EraseSprite:
	JML.l OWSubOffscreen_EraseSprite
