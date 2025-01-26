
Flip:
	dw $0000,$4000

DATA_04FB94:
	dw $0002,$0008

DATA_04FB96:
	dw $0000,$000F

Main:
	TXY
	LDA.w !RAM_SMW_OWSpr_CurrentState,x
	TAX
	JMP.w (StatePtrs,x)

StatePtrs:
	dw State00_Initialize
	dw State02_Ambush
	dw State04_Retreat

State00_Initialize:
	TYX
	LDA.w #$226A
	STA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	LDA.w #$FF00
	STA.w !RAM_SMW_OWSpr_XSpeed,x
	LDA.w #$0002
	STA.w !RAM_SMW_OWSpr_CurrentState,x
	BRA.b State04_Retreat_Entry2

State02_Ambush:
State04_Retreat:
	TYX
.Entry2:
	LDA.b !RAM_SMW_Flag_SpritesLocked
	BEQ.b +
	JMP.w GFXRt

+:
	LDA.w !RAM_SMW_OWSpr06_KoopaKid_StateTimer,x
	BNE.b ++
	INC.w !RAM_SMW_OWSpr06_KoopaKid_AnimationTimer,x
	JSL.l UpdateOverworldSpritePosition
	LDY.w !RAM_SMW_OWSpr_CurrentState,x
	LDA.w !RAM_SMW_OWSpr_XPosLo,x
	AND.w #$000F
	CMP.w DATA_04FB96-$02,y
	BNE.b ++
	INC.w !RAM_SMW_OWSpr_CurrentState,x
	INC.w !RAM_SMW_OWSpr_CurrentState,x
	LDA.w !RAM_SMW_OWSpr_CurrentState,x
	CMP.w #$0006
	BCC.b +
	JML.l OWSubOffscreen_EraseSprite

+:
	LDA.w #$0040
	STA.w !RAM_SMW_OWSpr_XSpeed,x
	LDA.w #$0060
	STA.w !RAM_SMW_OWSpr06_KoopaKid_StateTimer,x
++:
GFXRt:
	LDA.w DATA_04FB94-$02,y
	LDY.b #$00
	AND.w !RAM_SMW_OWSpr06_KoopaKid_AnimationTimer,x
	BNE.b +
	LDY.b #$02
+:
	LDA.w Flip,y
	STA.b !RAM_SMW_DrawOWSprite_CurrentFlip
	LDA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	STA.b !RAM_SMW_DrawOWSprite_TileAndProp
	REP.b #$10
	LDY.w #$0001
	LDA.w #$0002
	JSL.l GetOWSpriteOnScreenPosition
	PEA.w ((SMW_ProcessOverworldSprites_Main>>8)&$00FF00)|(!RAM_SMW_IO_OAMBuffer>>16)
	PLB
	LDA.w #$0001
	STA.b !RAM_SMW_DrawOWSprite_HighXBitAndTileSize
	STZ.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	STZ.b !RAM_SMW_DrawOWSprite_CurrentYDisp
	JSL.l BufferOverworldSpriteTile
	PLB
	RTL
