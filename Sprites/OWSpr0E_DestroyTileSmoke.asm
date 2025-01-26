
Tiles:
	dw $0073
	dw $0073
	dw $0072
	dw $0072
	dw $005F
	dw $005F
	dw $0028
	dw $0028
	dw $0028
	dw $0028
	dw $0028

XDisp:
	dw $FFF5,$0011,$FFF2,$0015
	dw $FFF5,$0011,$FFF3,$0014
	dw $FFF5,$0011,$FFF3,$0014
	dw $FFF6,$0010,$FFF4,$0013
	dw $FFF7,$000F,$FFF5,$0012
	dw $FFF8,$000E,$FFF7,$0011
	dw $FFFA,$000D,$FFF9,$0010
	dw $FFFC,$000C,$FFFB,$000D
	dw $FFFF,$000A,$FFFE,$000B
	dw $0001,$0007,$0001,$0007

YDisp:
	dw $FFF7,$FFF7,$0010,$0011
	dw $FFF7,$FFF7,$000F,$0010
	dw $FFF7,$FFF7,$000F,$0010
	dw $FFF8,$FFF8,$000E,$000F
	dw $FFF9,$FFF9,$000D,$000E
	dw $FFFA,$FFFA,$000B,$000C
	dw $FFFB,$FFFB,$000A,$000A
	dw $FFFD,$FFFD,$0009,$0009
	dw $FFFF,$FFFF,$0007,$0007
	dw $0000,$0000,$0006,$0006

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
	LDA.w #$3600
	STA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	LDA.w #$0027
	STA.w !RAM_SMW_OWSpr_DecrementingTable7E0E25,x
	LDA.w #$0002
	STA.w !RAM_SMW_OWSpr_CurrentState,x
	LDY.b #!Define_SMW_Sound1DFC_CastleCollapse
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
	AND.w #$003C
	LSR
	TAY
	LDA.w Tiles,y
	ORA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	STA.b !RAM_SMW_DrawOWSprite_TileAndProp
	TYA
	ASL
	ASL
	ADC.w #$0006
	STA.b !RAM_SMW_Misc_ScratchRAM08
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
	LDX.b !RAM_SMW_Misc_ScratchRAM08
	LDA.l XDisp,x
	STA.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	LDA.l YDisp,x
	STA.b !RAM_SMW_DrawOWSprite_CurrentYDisp
	DEC.b !RAM_SMW_Misc_ScratchRAM08
	DEC.b !RAM_SMW_Misc_ScratchRAM08
	LDX.b !RAM_SMW_DrawOWSprite_LoopCounter
	LDA.l Flip,x
	STA.b !RAM_SMW_DrawOWSprite_CurrentFlip
	JSL.l BufferOverworldSpriteTile
	BPL.b -
	PLB
	RTL
