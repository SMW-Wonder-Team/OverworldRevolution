
XOffset:
	dw $FFE0,$0020,$00C0,$FFE0
	dw $FFE0,$0080,$FFE0,$0000

YOffset:
	dw $0070,$00E0,$00E0,$00B0
	dw $00E0,$00E0,$0070,$00E0

Main:
	LDA.b !RAM_SMW_Flag_SpritesLocked
	BNE.b +
	JSR.w SpawnCloud
+:
	RTL

SpawnCloud:
	SEP.b #$20
	JSL.l SMW_GetRand_Main
	REP.b #$31
	LDA.b !RAM_SMW_Counter_LocalFrames 
	AND.w #$00FF
	BNE.b .Return
	LDA.w !RAM_SMW_Misc_RandomByte1
	AND.w #$0030
	BNE.b .Return
	LDA.w #!Define_SMW_SpriteID_OWSpr05_Cloud
	STA.w !RAM_SMW_Overworld_SpriteSpawnData
	LDA.w !RAM_SMW_Misc_RandomByte1
	AND.w #$000E
	TAY
	LDA.b !RAM_SMW_Mirror_CurrentLayer1XPosLo
	ADC.w XOffset,y
	STA.w !RAM_SMW_Overworld_SpriteSpawnData+$02
	LDA.b !RAM_SMW_Mirror_CurrentLayer1YPosLo
	CLC
	ADC.w YOffset,y
	STA.w !RAM_SMW_Overworld_SpriteSpawnData+$04
	STZ.w !RAM_SMW_Overworld_SpriteSpawnData+$06
	STZ.w !RAM_SMW_Overworld_SpriteSpawnData+$08
	LDY.w #!RAM_SMW_Overworld_SpriteSpawnData-$01
	JSL.l SpawnOverworldSprite
.Return:
	SEP.b #$10
	RTS
