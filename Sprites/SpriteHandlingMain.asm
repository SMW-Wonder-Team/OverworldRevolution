include

;#############################################################################################################
;#############################################################################################################

macro OverworldSpritePtrsAndCode()
OverworldSpritePtrs:
	%SetOWSpritePointer(OWSpr01_Lakitu)				: %SetOWSpriteProperties(ProcessWhenOffscreen)
	%SetOWSpritePointer(OWSpr02_BlueBird)				: %SetOWSpriteProperties(ProcessWhenOffscreen)
	%SetOWSpritePointer(OWSpr03_CheepCheep)			: %SetOWSpriteProperties(DespawnOffscreen)
	%SetOWSpritePointer(OWSpr04_PiranhaPlant)		: %SetOWSpriteProperties(DespawnOffscreen)
	%SetOWSpritePointer(OWSpr05_Cloud)				: %SetOWSpriteProperties(DespawnOffscreen)
	%SetOWSpritePointer(OWSpr06_KoopaKid)				: %SetOWSpriteProperties(DespawnOffscreen)
	%SetOWSpritePointer(OWSpr07_Smoke)				: %SetOWSpriteProperties(DespawnOffscreen)
	%SetOWSpritePointer(OWSpr08_BowserSign)			: %SetOWSpriteProperties(DespawnOffscreen)
	%SetOWSpritePointer(OWSpr09_Bowser)				: %SetOWSpriteProperties(DespawnOffscreen)
	%SetOWSpritePointer(OWSpr0A_Boo)					: %SetOWSpriteProperties(DespawnOffscreen)
	%SetOWSpritePointer(OWSpr0B_LevelAppearSparkle)	: %SetOWSpriteProperties(ProcessWhenOffscreen)
	%SetOWSpritePointer(OWSpr0C_FlyingSwitchBlock)	: %SetOWSpriteProperties(DespawnOffscreen)
	%SetOWSpritePointer(OWSpr0D_EventFadeTile)		: %SetOWSpriteProperties(ProcessWhenOffscreen)
	%SetOWSpritePointer(OWSpr0E_DestroyTileSmoke)	: %SetOWSpriteProperties(ProcessWhenOffscreen)
	%SetOWSpritePointer(OWSpr0F_WaterSplash)			: %SetOWSpriteProperties(ProcessWhenOffscreen)
	%SetOWSpritePointer(OWSpr10_LightningGenerator)	: %SetOWSpriteProperties(ProcessWhenOffscreen)
	%SetOWSpritePointer(OWSpr11_CloudGenerator)		: %SetOWSpriteProperties(ProcessWhenOffscreen)
; Insert your custom sprite pointers here.
endmacro

;---------------------------------------------------------------------------

namespace SMW_ProcessOverworldSprites

Main:
	REP.b #$20
	JSR.w ProcessScript
	LDA.b !RAM_SMW_Flag_SpritesLocked
	AND.w #$0002
	BNE.b .NoSpriteDrawing
	PHB
	LDX.b #!Define_SMW_MaxOverworldSpriteSlot
-:
	LDA.w !RAM_SMW_OWSpr_SpriteID,x
	BEQ.b +
	STZ.w !RAM_SMW_Sprites_CurrentlyProcessedOverworldSprite
	STX.w !RAM_SMW_Sprites_CurrentlyProcessedOverworldSprite
	JSL.l ProcessOverworldSprite
	SEP.b #$10
	LDX.w !RAM_SMW_Sprites_CurrentlyProcessedOverworldSprite
+:
	DEX
	DEX
	DEX
	DEX
	BPL.b -
	PLB
	LDX.b #!Define_SMW_MaxOverworldSpriteSlot
	REP.b #$10
-:
	LDA.w !RAM_SMW_OWSpr_SpriteID,x
	BEQ.b .DrawNoShadow
	LDA.w !RAM_SMW_OWSpr_ZPosLo,x
	BEQ.b .DrawNoShadow
	STZ.w !RAM_SMW_Sprites_CurrentlyProcessedOverworldSprite
	STX.w !RAM_SMW_Sprites_CurrentlyProcessedOverworldSprite
	JSR.w DrawShadow
.DrawNoShadow:
	DEX
	DEX
	DEX
	DEX
	BPL.b -
.NoSpriteDrawing:
	JSL.l SMW_ProcessOWPlayers_DrawOverworldPlayerAndBorderSprites
	SEP.b #$30
	RTL

ProcessOverworldSprite:
	JSL.l OWSubOffscreen_Main								; Checking if this sprite should despawn before doing anything else.
																; If the sprite despawns here, then execution will jump back into the above loop instead of continuing.
	LDY.b !RAM_SMW_Flag_SpritesLocked						;\ Don't decrement any sprite tables if sprites are paused.
	BNE.b +													;/
	LDA.w !RAM_SMW_OWSpr_DecrementingTable7E0E25,x			;\ Decrement all the generic sprite RAM tables that are meant to decrement.
	BEQ.b +													;|
	DEC.w !RAM_SMW_OWSpr_DecrementingTable7E0E25,x			;/
+:																;
	REP.b #$10													; Set X/Y to 16-bit in order to index an upcoming table.
	LDA.w !RAM_SMW_OWSpr_SpriteID,x							;\ Multiply the sprite ID index by 4 and store it into Y
	ASL															;|
	ASL															;|
	TAY															;/
	LDA.w OverworldSpritePtrs-$03,y							;\
	PHA															;| Set the bank byte of the sprite's code location on the stack for later, as well as the byte that will be pulled to set the DBR
	STA.b $00,s												;/
	LDA.w OverworldSpritePtrs-$04,y							; Get the pointer for the sprite's main routine.
	PLB															;\	Set the DBR to the location of the sprite's status pointer table. This is a minor optimization that saves me from having to do the traditional bank wrapper PIXI sprites have.
																;/ This is slightly risky to do without preserving the bank. But, no sprite code is likely going to be placed in bank C0+ and every routine that modifies the DBR should always restore it.
	SEP.b #$10													; Set X/Y back to 8-bit, since 16-bit X/Y is not needed anymore. 
	PHA															; Store the lower two bytes of the sprite's code pointer on the stack.
	RTL															; Begin processing the sprite.

namespace off

;---------------------------------------------------------------------------

; This routine manages everything about the current sprite tile being drawn.
; Before calling it, you need to do some setup. Specifically:
; Call "GetOWSpriteOnScreenPosition" to get the on screen X/Y position of the sprite stored into $00/$02 and the OAM index.
; Store #$00/#$01 into $04 to indicate the tile is 8x8/16x16.
; Store the tile ID and YXPPCCCT properties into $06.
; Store the current X/Y flip of the tile into $0A.
; Store the current X disposition into $0C.
; Store the current Y disposition into $0E.
; Store the loop counter into $8E (if drawing multiple tiles).

!RAM_SMW_DrawOWSprite_XPos = !RAM_SMW_Misc_ScratchRAM00
!RAM_SMW_DrawOWSprite_YPos = !RAM_SMW_Misc_ScratchRAM02
!RAM_SMW_DrawOWSprite_HighXBitAndTileSize = !RAM_SMW_Misc_ScratchRAM04
!RAM_SMW_DrawOWSprite_TileAndProp = !RAM_SMW_Misc_ScratchRAM06
!RAM_SMW_DrawOWSprite_CurrentFlip = !RAM_SMW_Misc_ScratchRAM0A
!RAM_SMW_DrawOWSprite_CurrentXDisp = !RAM_SMW_Misc_ScratchRAM0C
!RAM_SMW_DrawOWSprite_CurrentYDisp = !RAM_SMW_Misc_ScratchRAM0E
!RAM_SMW_DrawOWSprite_LoopCounter = !RAM_SMW_Misc_ScratchRAM8A

BufferOverworldSpriteTile:
	LDA.b !RAM_SMW_DrawOWSprite_XPos
	CLC
	ADC.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	CMP.w #$0100
	ROL.b !RAM_SMW_DrawOWSprite_HighXBitAndTileSize
	STA.w SMW_OAMBuffer[$00].XDisp,y
	;CLC
	ADC.w #$0010
	CMP.w #$0110
	BCS.b .TileOffScreen
	LDA.b !RAM_SMW_DrawOWSprite_YPos
	;CLC
	ADC.b !RAM_SMW_DrawOWSprite_CurrentYDisp
	STA.w SMW_OAMBuffer[$00].YDisp,y
	CLC
	ADC.w #$0010
	CMP.w #$0100
	BCS.b .TileOffScreen
	PHX
	LDA.b !RAM_SMW_DrawOWSprite_TileAndProp
	EOR.b !RAM_SMW_DrawOWSprite_CurrentFlip
	STA.w SMW_OAMBuffer[$00].Tile,y
	LDA.l !RAM_SMW_OAM_MaxTileOAMBufferIndex2
	TAX
	INC
	STA.l !RAM_SMW_OAM_MaxTileOAMBufferIndex2
	LDA.w SMW_OAMTileSizeBuffer[$00].Slot,x
	AND.w #$FF00
	ORA.b !RAM_SMW_DrawOWSprite_HighXBitAndTileSize
	STA.w SMW_OAMTileSizeBuffer[$00].Slot,x
	PLX
-:
	INY
	INY
	INY
	INY
	DEX
	DEX
	STX.b !RAM_SMW_DrawOWSprite_LoopCounter
	RTL

.TileOffScreen:
	PHX
	LDA.l !RAM_SMW_OAM_MaxTileOAMBufferIndex2
	TAX
	INC
	STA.l !RAM_SMW_OAM_MaxTileOAMBufferIndex2
	LDA.w SMW_OAMTileSizeBuffer[$00].Slot,x
	AND.w #$FF00
	STA.w SMW_OAMTileSizeBuffer[$00].Slot,x
	PLX
	LDA.w #$F000
	STA.w SMW_OAMBuffer[$00].XDisp,y
	BRA.b -

;---------------------------------------------------------------------------

; The overworld sprite equivalent of "SubOffscreen" used for normal sprites.
; Unlike that routine, this one is called before executing the sprite's code, which will prevent it from processing on the frame it despawns.
; The only way to stop this behavior is if the sprite is given the "ProcessWhenOffscreen" property.
; Also, if you want to despawn an overworld sprite do "JML.l OWSubOffscreen_EraseSprite".

namespace OWSubOffscreen

Main:
	PHK																;\ Set the DBR to the current bank
	PLB																;/ The DBR is going to be changed again anyway, so no need to preserve it.
	LDA.w !RAM_SMW_OWSpr_Properties,x
	LSR
	BCC.b +
	RTL

+:
	LDA.w !RAM_SMW_OWSpr_XPosLo,x
	SEC
	SBC.b !RAM_SMW_Mirror_CurrentLayer1XPosLo
	STA.b !RAM_SMW_DrawOWSprite_XPos
	LDA.w !RAM_SMW_OWSpr_YPosLo,x
	SEC
	SBC.b !RAM_SMW_Mirror_CurrentLayer1YPosLo
	STA.b !RAM_SMW_DrawOWSprite_YPos
	LDA.w !RAM_SMW_OWSpr_YPosLo,x								;\ Is the sprite within range of the level's screen size
	CMP.w !RAM_SMW_LM_Misc_LevelScreenSizeLo					;|
	BPL.b SpriteFarOffScreen										;/ If not, erase the sprite
	LDA.b !RAM_SMW_DrawOWSprite_YPos							;\ Check if the sprite is within a variable range of the screen vertically.
	CMP.w !RAM_SMW_LM_Level_MaxYOffsetForSpriteSpawnRange		;|
	BPL.b SpriteFarOffScreen										;| If not, branch
	CMP.w !RAM_SMW_LM_Level_MinYOffsetForSpriteSpawnRange		;|
	BMI.b SpriteFarOffScreen										;|
	BRA.b SpriteOnScreenVertically								;/ Otherwise, branch to some code to check if the sprite is off screen horizontally

SpriteOnScreenVertically:
	LDA.b !RAM_SMW_DrawOWSprite_XPos							;\ Is the sprite within it's range?
	ADC.w MaxLeftRange											;|
	CMP.w MaxRightRange											;|
	BCC.b Return													;/ If so, return
SpriteFarOffScreen:
	PLA																;\ Perform a destructive return to return to the main sprite loop and prevent this sprite from executing.
	PLY																;/
EraseSprite:
	LDY.w !RAM_SMW_OWSpr_LoadIndex,x
	CPY.b #$FF
	BEQ.b OffScrKillSprite
	SEP.b #$20
if !SA1ROM|!PIXIFlag == !TRUE
	PHX
	TYX
	LDA.b #$00
	STA.l !RAM_SMW_Sprites_LoadStatus,x
	PLX
else
	LDA.b #$00
	STA.w !RAM_SMW_Sprites_LoadStatus,y
endif
	REP.b #$20
OffScrKillSprite:
	STZ.w !RAM_SMW_OWSpr_SpriteID,x
Return:
	RTL

MaxLeftRange:
	dw $0040

MaxRightRange:
	dw $0130+$0040

namespace off

;---------------------------------------------------------------------------

; This routine is responsible for drawing a shadow under any sprite that has a non-zero Z position.

DrawShadow:
	LDY.w #$0002
	LDA.w #$0003
    JSL.l SMW_MaxtTile_Get_Slot
	BCS.b .SlotGotten
	RTS

.SlotGotten:
	LDY.w !RAM_SMW_OAM_MaxTileOAMBufferIndex1
	LDA.w !RAM_SMW_OWSpr_XPosLo,x
	SEC
	SBC.b !RAM_SMW_Mirror_CurrentLayer1XPosLo
	STA.b !RAM_SMW_DrawOWSprite_XPos
	LDA.w !RAM_SMW_OWSpr_YPosLo,x
	SEC
	SBC.b !RAM_SMW_Mirror_CurrentLayer1YPosLo
	STA.b !RAM_SMW_DrawOWSprite_YPos
	LDA.w !RAM_SMW_OWSpr_YXPPCCCT,x
	AND.w #$3000
	ORA.w #$0229
	STA.b !RAM_SMW_DrawOWSprite_TileAndProp
	PEA.w ((SMW_ProcessOverworldSprites_Main>>8)&$00FF00)|(!RAM_SMW_IO_OAMBuffer>>16)
	PLB
	STZ.b !RAM_SMW_DrawOWSprite_HighXBitAndTileSize
	STZ.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	STZ.b !RAM_SMW_DrawOWSprite_CurrentYDisp
	STZ.b !RAM_SMW_DrawOWSprite_CurrentFlip
	JSL.l BufferOverworldSpriteTile
	LDA.w #$4000
	TSB.b !RAM_SMW_DrawOWSprite_TileAndProp
	STZ.b !RAM_SMW_DrawOWSprite_HighXBitAndTileSize
	LDA.w #$0008
	STA.b !RAM_SMW_DrawOWSprite_CurrentXDisp
	JSL.l BufferOverworldSpriteTile
	PLB
	LDX.w !RAM_SMW_Sprites_CurrentlyProcessedOverworldSprite
	RTS

;---------------------------------------------------------------------------

; This routine updates the sprite's X/Y/Z position based on its speed.
; Speeds are 16-bit, which means the range of speed is 128 pixels to 1/256th of a pixel per frame.
; If porting an existing sprite to this patch, to convert an 8-bit speed to 16-bit, add a 0/F to the front of the number and a 0 at the end. So, $F8 becomes $FF80.

UpdateOverworldSpritePosition:
	LDA.w !RAM_SMW_OWSpr_XSpeed,x
	CLC
	ADC.w !RAM_SMW_OWSpr_SubXPos,x
	STA.w !RAM_SMW_OWSpr_SubXPos,x
	LDA.w #$0000
	LDY.w !RAM_SMW_OWSpr_XSpeed+$01,x
	BPL.b +
	DEC
+:
	ADC.w !RAM_SMW_OWSpr_XPosHi,x
	STA.w !RAM_SMW_OWSpr_XPosHi,x
	LDA.w !RAM_SMW_OWSpr_YSpeed,x
	CLC
	ADC.w !RAM_SMW_OWSpr_SubYPos,x
	STA.w !RAM_SMW_OWSpr_SubYPos,x
	LDA.w #$0000
	LDY.w !RAM_SMW_OWSpr_YSpeed+$01,x
	BPL.b +
	DEC
+:
	ADC.w !RAM_SMW_OWSpr_YPosHi,x
	STA.w !RAM_SMW_OWSpr_YPosHi,x
	LDA.w !RAM_SMW_OWSpr_ZSpeed,x
	CLC
	ADC.w !RAM_SMW_OWSpr_SubZPos,x
	STA.w !RAM_SMW_OWSpr_SubZPos,x
	LDA.w #$0000
	LDY.w !RAM_SMW_OWSpr_ZSpeed+$01,x
	BPL.b +
	DEC
+:
	ADC.w !RAM_SMW_OWSpr_ZPosHi,x
	STA.w !RAM_SMW_OWSpr_ZPosHi,x
	RTL

;---------------------------------------------------------------------------

; This routine is the overworld equivalent of "GetDrawInfo" for normal sprites.
; This routine will store the sprite's current on screen X/Y position into $00/$02 and store the OAM buffer index into Y.
; Before calling this routine, A/X/Y all need to be 16-bit.
; Y must contain the number of tiles that will be drawn.
; A must contain the priority of the tiles.
; If no slots are available, the sprite will exit its routine and the next sprite will be processed. This means that the graphics routine should always be the last thing processed.

GetOWSpriteOnScreenPosition:
	JSL.l SMW_MaxtTile_Get_Slot
	BCS.b .SlotGotten
	PHB
	PLA
	PLA
	RTL

.SlotGotten:
	LDY.w !RAM_SMW_OAM_MaxTileOAMBufferIndex1
.Entry2:
	LDA.w !RAM_SMW_OWSpr_XPosLo,x
	SEC
	SBC.b !RAM_SMW_Mirror_CurrentLayer1XPosLo
	STA.b !RAM_SMW_DrawOWSprite_XPos
	LDA.w !RAM_SMW_OWSpr_YPosLo,x
	SEC
	SBC.b !RAM_SMW_Mirror_CurrentLayer1YPosLo
	CLC
	ADC.w !RAM_SMW_OWSpr_ZPosLo,x
	STA.b !RAM_SMW_DrawOWSprite_YPos
	RTL

;---------------------------------------------------------------------------

; This routine will spawn an overworld sprite at the location you specify.
; Before entering this routine, store 10 bytes into !RAM_SMW_Overworld_SpriteSpawnData for the 16-bit sprite ID, X position, Y position, Z position, and a parameter table in that order.
; In addition, Y should be set to the 16-bit address of !RAM_SMW_Overworld_SpriteSpawnData.

SpawnOverworldSprite:
	PHX
	PHY
	PHP
	REP.b #$30
	LDX.w #!Define_SMW_MaxOverworldSpriteSlot
-:
	LDA.w !RAM_SMW_OWSpr_SpriteID,x
	BNE.b +
	LDA.w $0003,y
	STA.w !RAM_SMW_OWSpr_XPosLo,x
	LDA.w $0005,y
	STA.w !RAM_SMW_OWSpr_YPosLo,x
	LDA.w $0007,y
	STA.w !RAM_SMW_OWSpr_ZPosLo,x
	LDA.w $0009,y
	STA.w !RAM_SMW_OWSpr_Table7E0E15,x
	LDA.w $0001,y
	STA.w !RAM_SMW_OWSpr_SpriteID,x
	PHX
	ASL
	ASL
	TAX
	LDA.l OverworldSpritePtrs-$02,x
	PLX
	STA.w !RAM_SMW_OWSpr_Properties-$01,x
	STZ.w !RAM_SMW_OWSpr_CurrentState,x
	STZ.w !RAM_SMW_OWSpr_YXPPCCCT,x
	STZ.w !RAM_SMW_OWSpr_XSpeed,x
	STZ.w !RAM_SMW_OWSpr_YSpeed,x
	STZ.w !RAM_SMW_OWSpr_ZSpeed,x
	STZ.w !RAM_SMW_OWSpr_Table7E0DF5,x
	STZ.w !RAM_SMW_OWSpr_Table7E0E05,x
	STZ.w !RAM_SMW_OWSpr_DecrementingTable7E0E25,x
	SEP.b #$20
	LDA.b #$FF
	STA.w !RAM_SMW_OWSpr_LoadIndex,x
	STZ.w !RAM_SMW_OWSpr_SubXPos,x
	STZ.w !RAM_SMW_OWSpr_SubYPos,x
	STZ.w !RAM_SMW_OWSpr_SubZPos,x
	PLP
	PLY
	PLX
	SEC
	RTL

+:
	DEX
	DEX
	DEX
	DEX
	BPL.b -
	PLP
	PLY
	PLX
	CLC
	RTL

;---------------------------------------------------------------------------

; This is the overworld sprite equivalent of "SubHorzPos"/"SubVertPos" for normal sprites.
; After exiting, $00/$02 will contain the distance between the current sprite and Mario/Luigi.
; And $06/$08 will contain the absolute value of that distance.

SubOverworldHorizAndVertPos:
	LDA.w !RAM_SMW_OWSpr_XPosLo,x
	LDY.w !RAM_SMW_Player_CurrentCharacterX2Lo
	SEC
	SBC.w !RAM_SMW_Overworld_MarioXPosLo,y
	STA.b !RAM_SMW_Misc_ScratchRAM00
	BPL.b +
	EOR.w #$FFFF
	INC
+:
	STA.b !RAM_SMW_Misc_ScratchRAM06
	LDA.w !RAM_SMW_OWSpr_YPosLo,x
	LDY.w !RAM_SMW_Player_CurrentCharacterX2Lo
	SEC
	SBC.w !RAM_SMW_Overworld_MarioYPosLo,y
	STA.b !RAM_SMW_Misc_ScratchRAM02
	BPL.b +
	EOR.w #$FFFF
	INC
+:
	STA.b !RAM_SMW_Misc_ScratchRAM08
	RTL

;---------------------------------------------------------------------------

;#############################################################################################################
;#############################################################################################################
