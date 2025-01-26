
Tiles:
	dw $0022,$0023,$0032,$0033,$0032,$0023,$0022

XDisp:
	dw $0000,$0008,$0000,$0008

YDisp:
	dw $FFFF,$FFFF,$0007,$0007

Flip:
	dw $0000,$4000,$8000,$C000

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
	LDA.w #$3000
	STA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	LDA.w #$001B
	STA.w !RAM_SMW_OWSpr_DecrementingTable7E0E25,x
	LDA.w #$0002
	STA.w !RAM_SMW_OWSpr_CurrentState,x
	LDY.b #!Define_SMW_Sound1DFC_Coin
	STY.w !RAM_SMW_IO_SoundCh3
	BRA.b State02_Animate_Entry2

EraseSprite:
	JML.l OWSubOffscreen_EraseSprite

State02_Animate:
	TYX
.Entry2:
	;LDA.b !RAM_SMW_Flag_SpritesLocked
	;BEQ.b +
	;JMP.w GFXRt

;+:
	LDA.w !RAM_SMW_OWSpr_DecrementingTable7E0E25,x
	BEQ.b EraseSprite
	AND.w #$001C
	LSR
	TAY
	LDA.w Tiles,y
	ORA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	STA.b !RAM_SMW_DrawOWSprite_TileAndProp
	REP.b #$10
	LDY.w #$0004
	LDA.w #$0003
	JSL.l GetOWSpriteOnScreenPosition
	PEA.w ((SMW_ProcessOverworldSprites_Main>>8)&$00FF00)|(!RAM_SMW_IO_OAMBuffer>>16)
	PLB
	LDX.w #$0006
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
