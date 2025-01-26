
Acceleration:
	dw $0010,$FFF0

MaxSpeed:
	dw $0100,$FF00

DATA_04F8B6:
	dw $0010,$0008,$0020,$0020

DATA_04F8BE:
	dw $0010,$0030,$0008,$0010

CloudXDisp:
	dw $0001,$0003,$0001,$0001
	dw $0001,$0001,$0001,$0002

CloudYDisp:
	dw $000C,$0012,$0012,$000C
	dw $000C,$0012,$0012,$000C

Main:
	TXY
	LDA.w !RAM_SMW_OWSpr_CurrentState,x
	TAX
	JMP.w (StatePtrs,x)

StatePtrs:
	dw State00_Initialize
	dw State02_Move
	;dw State04_HomeInOnMario

State00_Initialize:
	TYX
	LDA.w #$3226
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
	LDA.w !RAM_SMW_OWSpr01_Lakitu_HorizAndVertMovementDirection,x
	AND.w #$0002
	EOR.w #$0002
	TAY
	LDA.w !RAM_SMW_OWSpr_ZSpeed,x
	CLC
	ADC.w Acceleration,y
	STA.w !RAM_SMW_OWSpr_ZSpeed,x
	CMP.w MaxSpeed,y
	BNE.b +
	LDA.w !RAM_SMW_OWSpr01_Lakitu_HorizAndVertMovementDirection,x
	EOR.w #$0002
	STA.w !RAM_SMW_OWSpr01_Lakitu_HorizAndVertMovementDirection,x
+:
	JSL.l SubOverworldHorizAndVertPos
	LDY.w !RAM_SMW_OWSpr01_Lakitu_FollowMarioRangeIndex,x
	LDA.w !RAM_SMW_OWSpr01_Lakitu_HorizAndVertMovementDirection-$01,x
	ASL
	EOR.b !RAM_SMW_Misc_ScratchRAM00
	BPL.b +
	LDA.b !RAM_SMW_Misc_ScratchRAM06
	CMP.w DATA_04F8B6,y
	LDA.w #$0040
	BCS.b ++
+:
	LDA.w !RAM_SMW_OWSpr01_Lakitu_HorizAndVertMovementDirection-$01,x
	EOR.b !RAM_SMW_Misc_ScratchRAM02
	ASL
	BCC.b ++
	LDA.b !RAM_SMW_Misc_ScratchRAM08
	CMP.w DATA_04F8BE,y
	LDA.w #$0080
++:
	BCC.b +
	EOR.w !RAM_SMW_OWSpr01_Lakitu_HorizAndVertMovementDirection,x
	STA.w !RAM_SMW_OWSpr01_Lakitu_HorizAndVertMovementDirection,x
	SEP.b #$20
	JSL.l SMW_GetRand_Main
	REP.b #$20
	AND.w #$0006
	STA.w !RAM_SMW_OWSpr01_Lakitu_FollowMarioRangeIndex,x
+:
	LDA.w !RAM_SMW_OWSpr01_Lakitu_HorizAndVertMovementDirection,x
	AND.w #$0040
	ASL
	ASL
	ASL
	XBA
	EOR.w #$0002
	TAY
	LDA.w !RAM_SMW_OWSpr_XSpeed,x
	CLC
	ADC.w Acceleration,y
	CMP.w MaxSpeed,y
	BEQ.b +
	STA.w !RAM_SMW_OWSpr_XSpeed,x
+:
	LDA.w !RAM_SMW_OWSpr01_Lakitu_HorizAndVertMovementDirection,x
	AND.w #$0080
	ASL
	ASL
	XBA
	EOR.w #$0002
	TAY
	LDA.w !RAM_SMW_OWSpr_YSpeed,x
	CLC
	ADC.w Acceleration,y
	CMP.w MaxSpeed,y
	BEQ.b +
	STA.w !RAM_SMW_OWSpr_YSpeed,x
+:
	JSL.l UpdateOverworldSpritePosition
GFXRt:
	REP.b #$10
	LDY.w #$0005
	LDA.w #$0001
	JSL.l GetOWSpriteOnScreenPosition
	LDA.w !RAM_SMW_OWSpr_Table7E0E15,x
	AND.w #$0010
	LSR
	ORA.w #$0006
	STA.b !RAM_SMW_Misc_ScratchRAM08
	LDA.w #$0001
	STA.b !RAM_SMW_DrawOWSprite_HighXBitAndTileSize
	LDA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	STA.b !RAM_SMW_DrawOWSprite_TileAndProp
	STZ.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	STZ.b !RAM_SMW_DrawOWSprite_CurrentYDisp
	STZ.b !RAM_SMW_DrawOWSprite_CurrentFlip
	PEA.w ((SMW_ProcessOverworldSprites_Main>>8)&$00FF00)|(!RAM_SMW_IO_OAMBuffer>>16)
	PLB
	JSL.l BufferOverworldSpriteTile
	LDX.w #$0006
	STX.b !RAM_SMW_DrawOWSprite_LoopCounter
	STZ.b !RAM_SMW_DrawOWSprite_CurrentFlip
	LDA.b !RAM_SMW_DrawOWSprite_TileAndProp
	AND.w #$FF00
	ORA.w #$0028
	STA.b !RAM_SMW_DrawOWSprite_TileAndProp
-:
	STZ.b !RAM_SMW_DrawOWSprite_HighXBitAndTileSize
	LDX.b !RAM_SMW_Misc_ScratchRAM08
	LDA.b !RAM_SMW_DrawOWSprite_XPos
	CLC
	ADC.l CloudXDisp,x
	STA.b !RAM_SMW_DrawOWSprite_XPos
	LDA.l CloudYDisp,x
	STA.b !RAM_SMW_DrawOWSprite_CurrentYDisp
	DEC.b !RAM_SMW_Misc_ScratchRAM08
	DEC.b !RAM_SMW_Misc_ScratchRAM08
	LDX.b !RAM_SMW_DrawOWSprite_LoopCounter
	JSL.l BufferOverworldSpriteTile
	BPL.b -
	PLB
	RTL

;State04_HomeInOnMario:
	;TYX
	;RTL

