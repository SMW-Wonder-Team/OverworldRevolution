
Tiles:
	dw $0073,$0072,$0063,$0062

XDisp:
	dw $0000,$0008

YDisp:
	dw $FFFF,$FFFF

Flip:
	dw $0000,$4000

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
	LDA.w #$3600
	STA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	LDA.w #$0010
	STA.w !RAM_SMW_OWSpr_DecrementingTable7E0E25,x
	LDA.w #$0002
	STA.w !RAM_SMW_OWSpr_CurrentState,x
	LDY.b #!Define_SMW_Sound1DF9_Swim
	STY.w !RAM_SMW_IO_SoundCh1
	BRA.b State02_Animate_Entry2

EraseSprite:
	JML.l OWSubOffscreen_EraseSprite

State02_Animate:
	TYX
.Entry2:
	LDA.w !RAM_SMW_OWSpr_DecrementingTable7E0E25,x
	BEQ.b EraseSprite
	LSR
	AND.w #$0006
	TAY
	LDA.w Tiles,y
	ORA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	STA.b !RAM_SMW_DrawOWSprite_TileAndProp
	REP.b #$10
	LDY.w #$0002
	LDA.w #$0002
	JSL.l GetOWSpriteOnScreenPosition
	PEA.w ((SMW_ProcessOverworldSprites_Main>>8)&$00FF00)|(!RAM_SMW_IO_OAMBuffer>>16)
	PLB
	LDX.w #$0002
	STX.b !RAM_SMW_DrawOWSprite_LoopCounter
-:
	STZ.b !RAM_SMW_DrawOWSprite_HighXBitAndTileSize
	LDA.l XDisp,x
	STA.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	LDA.l YDisp,x
	STA.b !RAM_SMW_DrawOWSprite_CurrentYDisp
	LDA.l Flip,x
	STA.b !RAM_SMW_DrawOWSprite_CurrentFlip
	JSL.l BufferOverworldSpriteTile
	BPL.b -
	PLB
	RTL
