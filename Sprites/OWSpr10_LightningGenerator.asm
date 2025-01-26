
DATA_04F6F8:
	db $20,$58,$43,$CF,$18,$34,$A2,$5E

DATA_04F700:
	db $07,$05,$06,$07,$04,$06,$07,$05

Main:
	LDA.b !RAM_SMW_Flag_SpritesLocked
	BEQ.b +
	RTL

+:
	SEP.b #$20
	LDY.w !RAM_SMW_Palettes_LightningFlashColorIndex
	BNE.b CODE_04F73B
	LDA.b !RAM_SMW_Counter_LocalFrames
	LSR
	BCC.b CODE_04F76E
	DEC.w !RAM_SMW_Timer_WaitBeforeNextLightningFlash
	BNE.b CODE_04F76E
	TAY
	LDA.w DATA_04F700+$08,y
	AND.b #$07
	TAX
	LDA.w DATA_04F6F8,x
	STA.w !RAM_SMW_Timer_WaitBeforeNextLightningFlash
	LDY.w DATA_04F700,x
	STY.w !RAM_SMW_Palettes_LightningFlashColorIndex
	LDA.b #$08
	STA.w !RAM_SMW_Timer_LightningFrameDuration
	LDA.b #!Define_SMW_Sound1DFC_Thunder
	STA.w !RAM_SMW_IO_SoundCh3
CODE_04F73B:
	DEC.w !RAM_SMW_Timer_LightningFrameDuration
	BPL.b CODE_04F748
	DEC.w !RAM_SMW_Palettes_LightningFlashColorIndex
	LDA.b #$04
	STA.w !RAM_SMW_Timer_LightningFrameDuration
CODE_04F748:
	TYA
	ASL
	TAY
	LDX.w !RAM_SMW_Palettes_DynamicPaletteUploadIndex
	LDA.b #$02
	STA.w !RAM_SMW_Palettes_DynamicPaletteBytesToUpload,x
	LDA.b #$47
	STA.w !RAM_SMW_Palettes_DynamicPaletteCGRAMAddress,x
if !Define_SMW_Overworld_UseLightningPaletteFromROM == !FALSE
	LDA.w SMW_PaletteMirror[$28].LowByte,y
	STA.w !RAM_SMW_Palettes_DynamicPaletteColors,x
	LDA.w SMW_PaletteMirror[$28].HighByte,y
else
	LDA.l SMW_GlobalPalettes_BowserLightningFlash,x
	STA.w !RAM_SMW_Palettes_DynamicPaletteColors,x
	LDA.l SMW_GlobalPalettes_BowserLightningFlash+$01,x
endif
	STA.w !RAM_SMW_Palettes_DynamicPaletteColors+$01,x
	STZ.w !RAM_SMW_Palettes_DynamicPaletteColors+$02,x
	TXA
	CLC
	ADC.b #$04
	STA.w !RAM_SMW_Palettes_DynamicPaletteUploadIndex
CODE_04F76E:
	REP.b #$20
	RTL
