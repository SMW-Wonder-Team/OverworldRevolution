include

;#############################################################################################################
;#############################################################################################################

; Indexes into the level name table for each interactive tile.
; This allows you to assign a name to each tile.
; You can reuse the same name for multiple tiles to save on ROM space by giving those tiles the same index.
; Lastly, both this and the level name table can be expanded if you need more of either.

LevelNameIndexTable:
	dw $0000					; Level 000
	dw $0001					; Level 001
	dw $0002					; Level 002
	dw $0003					; Level 003
	dw $0004					; Level 004
	dw $0005					; Level 005
	dw $0006					; Level 006
	dw $0007					; Level 007
	dw $0008					; Level 008
	dw $0009					; Level 009
	dw $000A					; Level 00A
	dw $000B					; Level 00B
	dw $000C					; Level 00C
	dw $000D					; Level 00D
	dw $000E					; Level 00E
	dw $000F					; Level 00F
	dw $0010					; Level 010
	dw $0011					; Level 011
	dw $0012					; Level 012
	dw $0013					; Level 013
	dw $0014					; Level 014
	dw $0015					; Level 015
	dw $0016					; Level 016
	dw $0017					; Level 017
	dw $0018					; Level 018
	dw $0019					; Level 019
	dw $001A					; Level 01A
	dw $001B					; Level 01B
	dw $001C					; Level 01C
	dw $001D					; Level 01D
	dw $001E					; Level 01E
	dw $001F					; Level 01F
	dw $0020					; Level 020
	dw $0021					; Level 021
	dw $0022					; Level 022
	dw $0023					; Level 023
	dw $0024					; Level 024
	dw $0025					; Level 101
	dw $0026					; Level 102
	dw $0027					; Level 103
	dw $0028					; Level 104
	dw $0029					; Level 105
	dw $002A					; Level 106
	dw $002B					; Level 107
	dw $002C					; Level 108
	dw $002D					; Level 109
	dw $002E					; Level 10A
	dw $002F					; Level 10B
	dw $0030					; Level 10C
	dw $0031					; Level 10D
	dw $0032					; Level 10E
	dw $0033					; Level 10F
	dw $0034					; Level 110
	dw $0035					; Level 111
	dw $0036					; Level 112
	dw $0037					; Level 113
	dw $0038					; Level 114
	dw $0039					; Level 115
	dw $003A					; Level 116
	dw $003B					; Level 117
	dw $003C					; Level 118
	dw $003D					; Level 119
	dw $003E					; Level 11A
	dw $003F					; Level 11B
	dw $0040					; Level 11C
	dw $0041					; Level 11D
	dw $0042					; Level 11E
	dw $0043					; Level 11F
	dw $0044					; Level 120
	dw $0045					; Level 121
	dw $0046					; Level 122
	dw $0047					; Level 123
	dw $0048					; Level 124
	dw $0049					; Level 125
	dw $004A					; Level 126
	dw $004B					; Level 127
	dw $004C					; Level 128
	dw $004D					; Level 129
	dw $004E					; Level 12A
	dw $004F					; Level 12B
	dw $0050					; Level 12C
	dw $0051					; Level 12D
	dw $0052					; Level 12E
	dw $0053					; Level 12F
	dw $0054					; Level 130
	dw $0055					; Level 131
	dw $0056					; Level 132
	dw $0057					; Level 133
	dw $0058					; Level 134
	dw $0059					; Level 135
	dw $005A					; Level 136
	dw $005B					; Level 137
	dw $005C					; Level 138
	dw $005D					; Level 139
	dw $005E					; Level 13A
	dw $005F					; Level 13B
	dw $0060					; (Pipe) Donut Secret House -> Donut Secret 2
	dw $0061					; (Pipe) Donut Secret 2 -> Donut Secret House
	dw $0062					; (Pipe) Donut Secret 2 -> Donut Plains 3.
	dw $0063					; (Pipe) Donut Plains 3 -> Donut Secret 2
	dw $0064					; (Pipe) Vanilla Secret 1 -> Vanilla Secret 2
	dw $0065					; (Pipe) Vanilla Secret 2 -> Vanilla Secret 1
	dw $0066					; (Pipe) #3 Lemmy's Castle -> Cheese Bridge Area
	dw $0067					; (Pipe) Cheese Bridge Area -> #3 Lemmy's Castle
	dw $0068					; (Pipe) Chocolate Island 2 -> Chocolate Secret
	dw $0069					; (Pipe) Chocolate Secret -> Chocolate Island 2
	dw $006A					; (Pipe) Chocolate Secret -> #6 Wendy's Castle
	dw $006B					; (Pipe) #6 Wendy's Castle -> Chocolate Secret
	dw $006C					; (Path Exit) Yoshi's Island 1 -> Yellow Switch Palace
	dw $006D					; (Path Exit) Yellow Switch Palace -> Yoshi's Island 1
	dw $006E					; (Path Exit) #1 Iggy's Castle -> Donut Plains 1
	dw $006F					; (Path Exit) Donut Plains 1 -> #1 Iggy's Castle
	dw $0070					; (Path Exit) #2 Morton's Castle -> Vanilla Dome 1
	dw $0071					; (Path Exit) Vanilla Dome 1 -> #2 Morton's Castle
	dw $0072					; (Path Exit) #4 Ludwig's Castle -> Forest Of Illusion 1
	dw $0073					; (Path Exit) Forest Of Illusion 1 -> #4 Ludwig's Castle
	dw $0074					; (Path Exit) Forest Secret -> Forest Fortress
	dw $0075					; (Path Exit) Forest Fortress -> Forest Secret
	dw $0076					; (Path Exit) Forest Of Illusion 3 -> #5 Roy's Castle
	dw $0077					; (Path Exit) #5 Roy's Castle -> Forest Of Illusion 3
	dw $0078					; (Path Exit) Sunken Ghost Ship -> Valley Of Bowser 1
	dw $0079					; (Path Exit) Valley Of Bowser 1 -> Sunken Ghost Ship
	dw $007A					; (Star Warp) Donut Secret House -> Star Road 1
	dw $007B					; (Star Warp) Star Road 1 -> Donut Secret House
	dw $007C					; (Star Warp) Vanilla Secret 1 -> Star Road 2
	dw $007D					; (Star Warp) Star Road 2 -> Vanilla Secret 1
	dw $007E					; (Star Warp) Soda Lake -> Star Road 3
	dw $007F					; (Star Warp) Star Road 3 -> Soda Lake
	dw $0080					; (Star Warp) Forest Fortress -> Star Road 4
	dw $0081					; (Star Warp) Star Road 4 -> Forest Fortress
	dw $0082					; (Star Warp) Front Door -> Star Road 5
	dw $0083					; (Star Warp) Star Road 5 -> Front Door
	dw $0084					; (Star Warp) Star Road 5 -> Gnarly
	dw $0085					; (Star Warp) Gnarly -> Star Road 5
	dw $0086					; (Star Warp) Funky -> Yoshi's House
	dw $0025					; Destroyed Iggy's Castle
	dw $0007					; Destroyed Morton's Castle
	dw $0040					; Destroyed Lemmy's Castle
	dw $000E					; Destroyed Ludwig's Castle
	dw $0020					; Destroyed Roy's Castle
	dw $001A					; Destroyed Wendy's Castle
	dw $0034					; Destroyed Larry's Castle
	dw $000B					; Destroyed Vanilla Fortress
	dw $001F					; Destroyed Forest Fortress
	dw $001B					; Destroyed Chocolate Fortress
	dw $0035					; Destroyed Valley Fortress
	dw $0014					; Destroyed Yellow Switch Palace
	dw $0008					; Destroyed Green Switch Palace
	dw $003F					; Destroyed Red Switch Palace
	dw $0045					; Destroyed Blue Switch Palace

cleartable
if !Define_SMW_Overworld_LevelNameType == !LevelNameType_Sprite
	%LevelNameFont_Sprite()
elseif !Define_SMW_Overworld_BorderSetting == !BorderSetting_None
	%LevelNameFont_NoBorder()
else
	%LevelNameFont_Border()
endif

LevelNames:
.Level000:	db "                    "
.Level001:	db "VANILLA SECRET 2    "
.Level002:	db "VANILLA SECRET 3    "
.Level003:	db "TOP SECRET AREA     "
.Level004:	db "DONUT GHOST HOUSE   "
.Level005:	db "DONUT PLAINS 3      "
.Level006:	db "DONUT PLAINS 4      "
.Level007:	db "#2 MORTON'S CASTLE  "
.Level008:	db "GREEN SWITCH PALACE "
.Level009:	db "DONUT PLAINS 2      "
.Level00A:	db "DONUT SECRET 1      "
.Level00B:	db "VANILLA FORTRESS    "
.Level00C:	db "BUTTER BRIDGE 1     "
.Level00D:	db "BUTTER BRIDGE 2     "
.Level00E:	db "#4 LUDWIG'S CASTLE  "
.Level00F:	db "CHEESE BRIDGE AREA  "
.Level010:	db "COOKIE MOUNTAIN     "
.Level011:	db "SODA LAKE           "
.Level012:	db "STAR ROAD           "
.Level013:	db "DONUT SECRET HOUSE  "
.Level014:	db "YELLOW SWITCH PALACE"
.Level015:	db "DONUT PLAINS 1      "
.Level016:	db "STAR ROAD           "
.Level017:	db "#2 MORTON'S PLAINS  "
.Level018:	db "SUNKEN GHOST SHIP   "
.Level019:	db "#2 MORTON'S PLAINS  "
.Level01A:	db "#6 WENDY'S CASTLE   "
.Level01B:	db "CHOCOLATE FORTRESS  "
.Level01C:	db "CHOCOLATE ISLAND 5  "
.Level01D:	db "CHOCOLATE ISLAND 4  "
.Level01E:	db "STAR ROAD           "
.Level01F:	db "FOREST FORTRESS     "
.Level020:	db "#5 ROY'S CASTLE     "
.Level021:	db "CHOCO-GHOST HOUSE   "
.Level022:	db "CHOCOLATE ISLAND 1  "
.Level023:	db "CHOCOLATE ISLAND 3  "
.Level024:	db "CHOCOLATE ISLAND 2  "
.Level101:	db "#1 IGGY'S CASTLE    "
.Level102:	db "YOSHI'S ISLAND 4    "
.Level103:	db "YOSHI'S ISLAND 3    "
.Level104:	db "YOSHI'S HOUSE       "
.Level105:	db "YOSHI'S ISLAND 1    "
.Level106:	db "YOSHI'S ISLAND 2    "
.Level107:	db "VANILLA GHOST HOUSE "
.Level108:	db "STAR ROAD           "
.Level109:	db "VANILLA SECRET 1    "
.Level10A:	db "VANILLA DOME 3      "
.Level10B:	db "DONUT SECRET 2      "
.Level10C:	db "STAR ROAD           "
.Level10D:	db "FRONT DOOR          "
.Level10E:	db "BACK DOOR           "
.Level10F:	db "VALLEY OF BOWSER 4  "
.Level110:	db "#7 LARRY'S CASTLE   "
.Level111:	db "VALLEY FORTRESS     "
.Level112:	db "                    "
.Level113:	db "VALLEY OF BOWSER 3  "
.Level114:	db "VALLEY GHOST HOUSE  "
.Level115:	db "VALLEY OF BOWSER 2  "
.Level116:	db "VALLEY OF BOWSER 1  "
.Level117:	db "CHOCOLATE SECRET    "
.Level118:	db "VANILLA DOME 2      "
.Level119:	db "VANILLA DOME 4      "
.Level11A:	db "VANILLA DOME 1      "
.Level11B:	db "RED SWITCH PALACE   "
.Level11C:	db "#3 LEMMY'S CASTLE   "
.Level11D:	db "FOREST GHOST HOUSE  "
.Level11E:	db "FOREST OF ILLUSION 1"
.Level11F:	db "FOREST OF ILLUSION 4"
.Level120:	db "FOREST OF ILLUSION 2"
.Level121:	db "BLUE SWITCH PALACE  "
.Level122:	db "FOREST SECRET AREA  "
.Level123:	db "FOREST OF ILLUSION 3"
.Level124:	db "STAR ROAD           "
.Level125:	db "FUNKY               "
.Level126:	db "OUTRAGEOUS          "
.Level127:	db "MONDO               "
.Level128:	db "GROOVY              "
.Level129:	db "STAR ROAD           "
.Level12A:	db "GNARLY              "
.Level12B:	db "TUBULAR             "
.Level12C:	db "WAY COOL            "
.Level12D:	db "AWESOME             "
.Level12E:	db "STAR ROAD           "
.Level12F:	db "STAR ROAD           "
.Level130:	db "STAR WORLD 2        "
.Level131:	db "STAR ROAD           "
.Level132:	db "STAR WORLD 3        "
.Level133:	db "STAR ROAD           "
.Level134:	db "STAR WORLD 1        "
.Level135:	db "STAR WORLD 4        "
.Level136:	db "STAR WORLD 5        "
.Level137:	db "STAR ROAD           "
.Level138:	db "STAR ROAD           "
.Level139:	db "                    "
.Level13A:	db "                    "
.Level13B:	db "                    "
.Pipe1:	db "DSH TO DS2          "
.Pipe2:	db "DS2 TO DSH          "
.Pipe3:	db "DS2 TO DP3          "
.Pipe4:	db "DS3 TO DS2          "
.Pipe5:	db "VS1 TO VS2          "
.Pipe6:	db "VS2 TO VS1          "
.Pipe7:	db "3LC TO CBA          "
.Pipe8:	db "CBA TO 3LC          "
.Pipe9:	db "CI2 TO CS           "
.PipeA:	db "CS TO C12           "
.PipeB:	db "CS TO 6WC           "
.PipeC:	db "6WC TO CS           "
.Path1:	db "YI1 TO YSP          "
.Path2:	db "YSP TO YI1          "
.Path3:	db "1IC TO DP1          "
.Path4:	db "DP1 TO 1IG          "
.Path5:	db "2MC TO VD1          "
.Path6:	db "VD1 TO 2MC          "
.Path7:	db "4LC TO FOI1         "
.Path8:	db "FOI1 TO 4LC         "
.Path9:	db "FS TO FF            "
.PathA:	db "FF TO FS            "
.PathB:	db "FOI3 TO 5RC         "
.PathC:	db "5RC TO FOI3         "
.PathD:	db "SGS TO VOB1         "
.PathE:	db "VOB1 TO SGS         "
.Star1:	db "DSH TO SR1          "
.Star2:	db "SR1 TO DSH          "
.Star3:	db "VS1 TO SR2          "
.Star4:	db "SR2 TO VS1          "
.Star5:	db "SL TO SR3           "
.Star6:	db "SR3 TO SL           "
.Star7:	db "FF TO SR4           "
.Star8:	db "SR4 TO FF           "
.Star9:	db "FD TO SR5           "
.StarA:	db "SR5 TO FD           "
.StarB:	db "SR5 TO GNARLY       "
.StarC:	db "GNARLY TO SR5       "
.StarD:	db "FUNKY TO YH         "

cleartable

;#############################################################################################################
;#############################################################################################################

pushpc
org $0084F1|!FastROM
	dl SMW_CastleDestructionText_Iggy_Line8
	dl SMW_CastleDestructionText_Iggy_Line7
	dl SMW_CastleDestructionText_Iggy_Line6
	dl SMW_CastleDestructionText_Iggy_Line5
	dl SMW_CastleDestructionText_Iggy_Line4
	dl SMW_CastleDestructionText_Iggy_Line3
	dl SMW_CastleDestructionText_Iggy_Line2
	dl SMW_CastleDestructionText_Iggy_Line1
	dl SMW_CastleDestructionText_Morton_Line8
	dl SMW_CastleDestructionText_Morton_Line7
	dl SMW_CastleDestructionText_Morton_Line6
	dl SMW_CastleDestructionText_Morton_Line5
	dl SMW_CastleDestructionText_Morton_Line4
	dl SMW_CastleDestructionText_Morton_Line3
	dl SMW_CastleDestructionText_Morton_Line2
	dl SMW_CastleDestructionText_Morton_Line1
	dl SMW_CastleDestructionText_Lemmy_Line8
	dl SMW_CastleDestructionText_Lemmy_Line7
	dl SMW_CastleDestructionText_Lemmy_Line6
	dl SMW_CastleDestructionText_Lemmy_Line5
	dl SMW_CastleDestructionText_Lemmy_Line4
	dl SMW_CastleDestructionText_Lemmy_Line3
	dl SMW_CastleDestructionText_Lemmy_Line2
	dl SMW_CastleDestructionText_Lemmy_Line1
	dl SMW_CastleDestructionText_Ludwig_Line8
	dl SMW_CastleDestructionText_Ludwig_Line7
	dl SMW_CastleDestructionText_Ludwig_Line6
	dl SMW_CastleDestructionText_Ludwig_Line5
	dl SMW_CastleDestructionText_Ludwig_Line4
	dl SMW_CastleDestructionText_Ludwig_Line3
	dl SMW_CastleDestructionText_Ludwig_Line2
	dl SMW_CastleDestructionText_Ludwig_Line1
	dl SMW_CastleDestructionText_Roy_Line8
	dl SMW_CastleDestructionText_Roy_Line7
	dl SMW_CastleDestructionText_Roy_Line6
	dl SMW_CastleDestructionText_Roy_Line5
	dl SMW_CastleDestructionText_Roy_Line4
	dl SMW_CastleDestructionText_Roy_Line3
	dl SMW_CastleDestructionText_Roy_Line2
	dl SMW_CastleDestructionText_Roy_Line1
	dl SMW_CastleDestructionText_Wendy_Line8
	dl SMW_CastleDestructionText_Wendy_Line7
	dl SMW_CastleDestructionText_Wendy_Line6
	dl SMW_CastleDestructionText_Wendy_Line5
	dl SMW_CastleDestructionText_Wendy_Line4
	dl SMW_CastleDestructionText_Wendy_Line3
	dl SMW_CastleDestructionText_Wendy_Line2
	dl SMW_CastleDestructionText_Wendy_Line1
	dl SMW_CastleDestructionText_Larry_Line8
	dl SMW_CastleDestructionText_Larry_Line7
	dl SMW_CastleDestructionText_Larry_Line6
	dl SMW_CastleDestructionText_Larry_Line5
	dl SMW_CastleDestructionText_Larry_Line4
	dl SMW_CastleDestructionText_Larry_Line3
	dl SMW_CastleDestructionText_Larry_Line2
	dl SMW_CastleDestructionText_Larry_Line1
	assert pc() <= SMW_LoadStripeImage_DATA_008599
pullpc

;---------------------------------------------------------------------------

namespace SMW_CastleDestructionText
	%CastleDestructionTextFont()

Iggy:
	%SMW_StripeImageHeader(.Line1, $04, $13, 0, $0000, 3)
	dw "Mario  has  defeated the"
.Line1End:
	db $FF
	%SMW_StripeImageHeader(.Line2, $04, $14, 0, $0000, 3)
	dw "demented  Iggy Koopa  in" 
.Line2End:
	db $FF
	%SMW_StripeImageHeader(.Line3, $04, $15, 0, $0000, 3)
	dw "castle  #1  and  rescued"
.Line3End:
	db $FF
	%SMW_StripeImageHeader(.Line4, $04, $16, 0, $0000, 3)
	dw "Yoshi's  friend  who  is"
.Line4End:
	db $FF
	%SMW_StripeImageHeader(.Line5, $04, $17, 0, $0000, 3)
	dw "still trapped in an egg."
.Line5End:
	db $FF
	%SMW_StripeImageHeader(.Line6, $04, $18, 0, $0000, 3)
	dw "Together,    they    now"
.Line6End:
	db $FF
	%SMW_StripeImageHeader(.Line7, $04, $19, 0, $0000, 3)
	dw "travel to Donut Land.   "
.Line7End:
	db $FF
	%SMW_StripeImageHeader(.Line8, $04, $1A, 0, $0000, 3)
	db "                        "
.Line8End:
	db $FF

Morton:
	%SMW_StripeImageHeader(.Line1, $04, $13, 0, $0000, 3)
	dw "Morton   Koopa   Jr.  of"
.Line1End:
	db $FF
	%SMW_StripeImageHeader(.Line2, $04, $14, 0, $0000, 3)
	dw "castle  #2 is now just a" 
.Line2End:
	db $FF
	%SMW_StripeImageHeader(.Line3, $04, $15, 0, $0000, 3)
	dw "memory. The next area is"
.Line3End:
	db $FF
	%SMW_StripeImageHeader(.Line4, $04, $16, 0, $0000, 3)
	dw "the  underground Vanilla"
.Line4End:
	db $FF
	%SMW_StripeImageHeader(.Line5, $04, $17, 0, $0000, 3)
	dw "Dome.   What traps await"
.Line5End:
	db $FF
	%SMW_StripeImageHeader(.Line6, $04, $18, 0, $0000, 3)
	dw "Mario in this new world?"
.Line6End:
	db $FF
	%SMW_StripeImageHeader(.Line7, $04, $19, 0, $0000, 3)
	dw "What   will   become  of"
.Line7End:
	db $FF
	%SMW_StripeImageHeader(.Line8, $04, $1A, 0, $0000, 3)
	dw "Princess Toadstool?     "
.Line8End:
	db $FF

Lemmy:
	%SMW_StripeImageHeader(.Line1, $04, $13, 0, $0000, 3)
	dw "Mario has triumphed over"
.Line1End:
	db $FF
	%SMW_StripeImageHeader(.Line2, $04, $14, 0, $0000, 3)
	dw "Lemmy  Koopa  of  castle" 
.Line2End:
	db $FF
	%SMW_StripeImageHeader(.Line3, $04, $15, 0, $0000, 3)
	dw "#3.  Mario's  quest   is"
.Line3End:
	db $FF
	%SMW_StripeImageHeader(.Line4, $04, $16, 0, $0000, 3)
	dw "starting  to  get   much"
.Line4End:
	db $FF
	%SMW_StripeImageHeader(.Line5, $04, $17, 0, $0000, 3)
	dw "more difficult.     Have"
.Line5End:
	db $FF
	%SMW_StripeImageHeader(.Line6, $04, $18, 0, $0000, 3)
	dw "you  found  the Red  and"
.Line6End:
	db $FF
	%SMW_StripeImageHeader(.Line7, $04, $19, 0, $0000, 3)
	dw "Green Switches yet?     "
.Line7End:
	db $FF
	%SMW_StripeImageHeader(.Line8, $04, $1A, 0, $0000, 3)
	db "                        "
.Line8End:
	db $FF

Ludwig:
	%SMW_StripeImageHeader(.Line1, $04, $13, 0, $0000, 3)
	dw "Ludwig von  Koopa's days"
.Line1End:
	db $FF
	%SMW_StripeImageHeader(.Line2, $04, $14, 0, $0000, 3)
	dw "of    composing    Koopa" 
.Line2End:
	db $FF
	%SMW_StripeImageHeader(.Line3, $04, $15, 0, $0000, 3)
	dw "symphonies in castle  #4"
.Line3End:
	db $FF
	%SMW_StripeImageHeader(.Line4, $04, $16, 0, $0000, 3)
	dw "are over.  The Forest of"
.Line4End:
	db $FF
	%SMW_StripeImageHeader(.Line5, $04, $17, 0, $0000, 3)
	dw "Illusion   lies   ahead."
.Line5End:
	db $FF
	%SMW_StripeImageHeader(.Line6, $04, $18, 0, $0000, 3)
	dw "Mario must use his brain"
.Line6End:
	db $FF
	%SMW_StripeImageHeader(.Line7, $04, $19, 0, $0000, 3)
	dw "to solve  the puzzle  of"
.Line7End:
	db $FF
	%SMW_StripeImageHeader(.Line8, $04, $1A, 0, $0000, 3)
	dw "this perplexing forest. "
.Line8End:
	db $FF

Roy:
	%SMW_StripeImageHeader(.Line1, $04, $13, 0, $0000, 3)
	dw "Mario   found   his  way"
.Line1End:
	db $FF
	%SMW_StripeImageHeader(.Line2, $04, $14, 0, $0000, 3)
	dw "through  the  Forest  of" 
.Line2End:
	db $FF
	%SMW_StripeImageHeader(.Line3, $04, $15, 0, $0000, 3)
	dw "Illusion and  has put an"
.Line3End:
	db $FF
	%SMW_StripeImageHeader(.Line4, $04, $16, 0, $0000, 3)
	dw "end  to   Roy  Koopa  of"
.Line4End:
	db $FF
	%SMW_StripeImageHeader(.Line5, $04, $17, 0, $0000, 3)
	dw "castle  #5.   Onward  to"
.Line5End:
	db $FF
	%SMW_StripeImageHeader(.Line6, $04, $18, 0, $0000, 3)
	dw "the    dangerous    (but"
.Line6End:
	db $FF
	%SMW_StripeImageHeader(.Line7, $04, $19, 0, $0000, 3)
	dw "tasty) Chocolate Island!"
.Line7End:
	db $FF
	%SMW_StripeImageHeader(.Line8, $04, $1A, 0, $0000, 3)
	db "                        "
.Line8End:
	db $FF

Wendy:
	%SMW_StripeImageHeader(.Line1, $04, $13, 0, $0000, 3)
	dw "Wendy O. Koopa in castle"
.Line1End:
	db $FF
	%SMW_StripeImageHeader(.Line2, $04, $14, 0, $0000, 3)
	dw "#6  has  sung  her  last" 
.Line2End:
	db $FF
	%SMW_StripeImageHeader(.Line3, $04, $15, 0, $0000, 3)
	dw "song.  Mario  must  meet"
.Line3End:
	db $FF
	%SMW_StripeImageHeader(.Line4, $04, $16, 0, $0000, 3)
	dw "the  challenge  that  is"
.Line4End:
	db $FF
	%SMW_StripeImageHeader(.Line5, $04, $17, 0, $0000, 3)
	dw "now before him.    There"
.Line5End:
	db $FF
	%SMW_StripeImageHeader(.Line6, $04, $18, 0, $0000, 3)
	dw "is a  sunken  ship  that"
.Line6End:
	db $FF
	%SMW_StripeImageHeader(.Line7, $04, $19, 0, $0000, 3)
	dw "appears to be  a gateway"
.Line7End:
	db $FF
	%SMW_StripeImageHeader(.Line8, $04, $1A, 0, $0000, 3)
	dw "to the Valley of Bowser."
.Line8End:
	db $FF

Larry:
	%SMW_StripeImageHeader(.Line1, $04, $13, 0, $0000, 3)
	dw "Mario has defeated Larry"
.Line1End:
	db $FF
	%SMW_StripeImageHeader(.Line2, $04, $14, 0, $0000, 3)
	dw "Koopa in castle #7.  All"
.Line2End:
	db $FF
	%SMW_StripeImageHeader(.Line3, $04, $15, 0, $0000, 3)
	dw "that is left is Bowser's"
.Line3End:
	db $FF
	%SMW_StripeImageHeader(.Line4, $04, $16, 0, $0000, 3)
	dw "Castle  where   Princess"
.Line4End:
	db $FF
	%SMW_StripeImageHeader(.Line5, $04, $17, 0, $0000, 3)
	dw "Toadstool is being held."
.Line5End:
	db $FF
	%SMW_StripeImageHeader(.Line6, $04, $18, 0, $0000, 3)
	dw "Can Mario rescue her and"
.Line6End:
	db $FF
	%SMW_StripeImageHeader(.Line7, $04, $19, 0, $0000, 3)
	dw "restore     peace     to"
.Line7End:
	db $FF
	%SMW_StripeImageHeader(.Line8, $04, $1A, 0, $0000, 3)
	dw "Dinosaur Land?          "
.Line8End:
	db $FF

cleartable
namespace off

;---------------------------------------------------------------------------

pushpc
org $05B1A3|!FastROM
DisplayMessageRoutine:
if !Define_SMW_MessageText_UsingAltMessagingSystem == !FALSE
	LDX.b #$00
	TXA
	XBA
	LDA.w !RAM_SMW_Misc_DisplayMessage
	TAY
	CMP.b #$03
	REP.b #$30
	BEQ.b .YoshiSavedMessage
	AND.w #$00FF
	DEC
	STA.b !RAM_SMW_Misc_ScratchRAM00
	ASL
	ADC.b !RAM_SMW_Misc_ScratchRAM00
	TAY
	LDX.w !RAM_SMW_Overworld_LevelNumberLo
	LDA.w !RAM_SMW_Global_GameStateFlags-$01
	BPL.b .NotYoshisHouse							; !Const_SMW_GameStateFlags_RidingYoshiAffectsMessage
	LDA.w !RAM_SMW_Player_RidingYoshiFlag
	AND.w #$00FF
	BEQ.b .NotRidingYoshi
	TYA
	;CLC
	ADC.w #$0003
	TAY
.NotRidingYoshi:
.NotYoshisHouse:
.YoshiSavedMessage:
	TYA
	STA.b !RAM_SMW_Misc_ScratchRAM00
	TXA
	STX.b !RAM_SMW_Misc_ScratchRAM02
	ASL
	ASL
	ADC.b !RAM_SMW_Misc_ScratchRAM02
	ADC.b !RAM_SMW_Misc_ScratchRAM02
	ADC.b !RAM_SMW_Misc_ScratchRAM00
	TAX
	LDA.l MessageBoxText_Ptrs,x
	STA.b !RAM_SMW_Misc_ScratchRAM04
	LDA.l MessageBoxText_Ptrs+$01,x
	STA.b !RAM_SMW_Misc_ScratchRAM05
	LDA.b [!RAM_SMW_Misc_ScratchRAM04]
	AND.w #$00FF
	BEQ.b .NotSwitchPalaceMessage
	SEP.b #$30
	STA.w !RAM_SMW_Misc_ColorOfPalaceSwitchPressed1
	TAX
	DEX
	JSR.w SMW_DisplayMessage_DrawSwitchBlocks
	REP.b #$30
.NotSwitchPalaceMessage:
	PEA.w ((!RAM_SMW_Misc_StripeImageUploadTable&$FF0000)>>16)|((SMW_DisplayMessage_Main&$FF0000)>>8)
	PLB
	LDY.w !RAM_SMW_Misc_StripeImageUploadIndexLo
	LDX.w #$000E
.Loop:
	PHX
	LDA.l SMW_DisplayMessage_DATA_05A580,x
	STA.w !RAM_SMW_Misc_StripeImageUploadTable,y
	LDA.w #$2300
	STA.w !RAM_SMW_Misc_StripeImageUploadTable+$02,y
	LDX.w #$0011
-:
	INC.b !RAM_SMW_Misc_ScratchRAM04
	LDA.b [!RAM_SMW_Misc_ScratchRAM04]
	AND.w #$00FF
	ORA.w #$3900
	STA.w !RAM_SMW_Misc_StripeImageUploadTable+$04,y
	INY
	INY
	DEX
	BPL.b -
	INY
	INY
	INY
	INY
	PLX
	DEX
	DEX
	BPL.b .Loop
	LDA.w #$00FF
	STA.w !RAM_SMW_Misc_StripeImageUploadTable,y
	TYA	
	STA.w !RAM_SMW_Misc_StripeImageUploadIndexLo
	PLB
	BRA.b +
	padbyte $EA : pad SMW_DisplayMessage_CODE_05B241
+:
	assert pc() <= SMW_DisplayMessage_CODE_05B241

org $0084D9|!FastROM
	dl RemoveTextBox
pullpc

namespace MessageBoxText

Ptrs:
	dl Level000_Message1,Level000_Message2
	dl Level001_Message1,Level001_Message2
	dl Level002_Message1,Level002_Message2
	dl Level003_Message1,Level003_Message2
	dl Level004_Message1,Level004_Message2
	dl Level005_Message1,Level005_Message2
	dl Level006_Message1,Level006_Message2
	dl Level007_Message1,Level007_Message2
	dl Level008_Message1,Level008_Message2
	dl Level009_Message1,Level009_Message2
	dl Level00A_Message1,Level00A_Message2
	dl Level00B_Message1,Level00B_Message2
	dl Level00C_Message1,Level00C_Message2
	dl Level00D_Message1,Level00D_Message2
	dl Level00E_Message1,Level00E_Message2
	dl Level00F_Message1,Level00F_Message2
	dl Level010_Message1,Level010_Message2
	dl Level011_Message1,Level011_Message2
	dl Level012_Message1,Level012_Message2
	dl Level013_Message1,Level013_Message2
	dl Level014_Message1,Level014_Message2
	dl Level015_Message1,Level015_Message2
	dl Level016_Message1,Level016_Message2
	dl Level017_Message1,Level017_Message2
	dl Level018_Message1,Level018_Message2
	dl Level019_Message1,Level019_Message2
	dl Level01A_Message1,Level01A_Message2
	dl Level01B_Message1,Level01B_Message2
	dl Level01C_Message1,Level01C_Message2
	dl Level01D_Message1,Level01D_Message2
	dl Level01E_Message1,Level01E_Message2
	dl Level01F_Message1,Level01F_Message2
	dl Level020_Message1,Level020_Message2
	dl Level021_Message1,Level021_Message2
	dl Level022_Message1,Level022_Message2
	dl Level023_Message1,Level023_Message2
	dl Level024_Message1,Level024_Message2
	dl Level101_Message1,Level101_Message2
	dl Level102_Message1,Level102_Message2
	dl Level103_Message1,Level103_Message2
	dl Level104_Message1,Level104_Message2
	dl Level105_Message1,Level105_Message2
	dl Level106_Message1,Level106_Message2
	dl Level107_Message1,Level107_Message2
	dl Level108_Message1,Level108_Message2
	dl Level109_Message1,Level109_Message2
	dl Level10A_Message1,Level10A_Message2
	dl Level10B_Message1,Level10B_Message2
	dl Level10C_Message1,Level10C_Message2
	dl Level10D_Message1,Level10D_Message2
	dl Level10E_Message1,Level10E_Message2
	dl Level10F_Message1,Level10F_Message2
	dl Level110_Message1,Level110_Message2
	dl Level111_Message1,Level111_Message2
	dl Level112_Message1,Level112_Message2
	dl Level113_Message1,Level113_Message2
	dl Level114_Message1,Level114_Message2
	dl Level115_Message1,Level115_Message2
	dl Level116_Message1,Level116_Message2
	dl Level117_Message1,Level117_Message2
	dl Level118_Message1,Level118_Message2
	dl Level119_Message1,Level119_Message2
	dl Level11A_Message1,Level11A_Message2
	dl Level11B_Message1,Level11B_Message2
	dl Level11C_Message1,Level11C_Message2
	dl Level11D_Message1,Level11D_Message2
	dl Level11E_Message1,Level11E_Message2
	dl Level11F_Message1,Level11F_Message2
	dl Level120_Message1,Level120_Message2
	dl Level121_Message1,Level121_Message2
	dl Level122_Message1,Level122_Message2
	dl Level123_Message1,Level123_Message2
	dl Level124_Message1,Level124_Message2
	dl Level125_Message1,Level125_Message2
	dl Level126_Message1,Level126_Message2
	dl Level127_Message1,Level127_Message2
	dl Level128_Message1,Level128_Message2
	dl Level129_Message1,Level129_Message2
	dl Level12A_Message1,Level12A_Message2
	dl Level12B_Message1,Level12B_Message2
	dl Level12C_Message1,Level12C_Message2
	dl Level12D_Message1,Level12D_Message2
	dl Level12E_Message1,Level12E_Message2
	dl Level12F_Message1,Level12F_Message2
	dl Level130_Message1,Level130_Message2
	dl Level131_Message1,Level131_Message2
	dl Level132_Message1,Level132_Message2
	dl Level133_Message1,Level133_Message2
	dl Level134_Message1,Level134_Message2
	dl Level135_Message1,Level135_Message2
	dl Level136_Message1,Level136_Message2
	dl Level137_Message1,Level137_Message2
	dl Level138_Message1,Level138_Message2
	dl Level139_Message1,Level139_Message2
	dl Level13A_Message1,Level13A_Message2
	dl Level13B_Message1,Level13B_Message2

	%LevelNameFont_Border()

Level000:
.Message1:
	db $00
	db "Welcome!   This is"
	db "Dinosaur Land.  In"
	db "this strange  land"
	db "we    find    that"
	db "Princess Toadstool"
	db "is  missing again!"
	db "Looks  like Bowser"
	db "is at it again!   "

.Message2:
	db $00
	db "Hooray!  Thank you"
	db "for rescuing   me."
	db "My name  is Yoshi."
	db "On   my   way   to"
	db "rescue my friends,"
	db "Bowser trapped  me"
	db "in that egg.      "
	db "                  "

Level001:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level002:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level003:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level004:
.Message1:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

.Message2:
	db $00
	db "This  is  a  Ghost"
	db "House.     Can you"
	db "find   the   exit?"
	db "Hee,  hee,  hee..."
	db "Don't get lost!   "
	db "                  "
	db "                  "
	db "                  "

Level005:
.Message1:
	db $00
	db "You can  slide the"
	db "screen   left   or"
	db "right  by pressing"
	db "the L or R Buttons"
	db "on   top   of  the"
	db "controller.    You"
	db "may be able to ses"
	db "further ahead.    "

.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level006:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level007:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level008:
.Message1:
	db $04
	db "- SWITCH PALACE   "
	db "The  power  of the"
	db "switch  you   have"
	db "pushed  will  turn"
	db "                  "
	db "      into        "
	db "Your progress will"
	db "also   be   saved "

.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level009:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level00A:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level00B:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level00C:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level00D:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level00E:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level00F:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level010:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level011:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level012:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level013:
.Message1:
	db $00
	db "There   are   five"
	db "entrances  to  the"
	db "Star   World    in"
	db "Dinosaur     Land."
	db "Find  them all and"
	db "you   can   travel"
	db "between       many"
	db "different places. "

.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level014:
.Message1:
	db $01
	db "- SWITCH PALACE   "
	db "The  power  of the"
	db "switch  you   have"
	db "pushed  will  turn"
	db "                  "
	db "      into        "
	db "Your progress will"
	db "also   be   saved "

.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level015:
.Message1:
	db $00
	db "The red dot  areas"
	db "on  the  map  have"
	db "two      different"
	db "exits.      If you"
	db "have  the time and"
	db "skill,  be sure to"
	db "look for them.    "
	db "                  "

.Message2:
	db $00
	db "Use  Mario's  cape"
	db "to   soar  through"
	db "the air! Run fast,"
	db "jump, and hold the"
	db "Y Button.  To keep"
	db "balance,  use left"
	db "and  right  on the"
	db "Control Pad.      "

Level016:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level017:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level018:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level019:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level01A:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level01B:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level01C:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level01D:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level01E:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level01F:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level020:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level021:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level022:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level023:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level024:
.Message1:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

.Message2:
	db $00
	db "Here,   the  coins"
	db "you   collect   or"
	db "the time remaining"
	db "can  change   your"
	db "progress.  Can you"
	db "find  the  special"
	db "goal?             "
	db "                  "

Level101:
.Message1:
	db $00
	db "Press Up   on  the"
	db "Control Pad  while"
	db "jumping   and  you"
	db "can  cling  to the"
	db "fence.    To go in"
	db "the  door  at  the"
	db "end  of this area,"
	db "use Up also.      "

.Message2:
	db $00
	db "-POINT OF ADVICE- "
	db "One   of   Yoshi's"
	db "friends is trapped"
	db "in  the castle  by"
	db "Iggy Koopa.     To"
	db "defeat  him,  push"
	db "him into  the lava"
	db "pool.             "

Level102:
.Message1:
	db $00
	db "You   get    Bonus"
	db "Stars  if  you cut"
	db "the  tape  at  the"
	db "end  of each area."
	db "If you collect 100"
	db "Bonus  Stars   you"
	db "can   play  a  fun"
	db "bonus game.       "

.Message2:
	db $00
	db "If  you are  in an"
	db "area that you have"
	db "already   cleared,"
	db "you can  return to"
	db "the map screen  by"
	db "pressing    START,"
	db "then SELECT       "
	db "                  "

Level103:
.Message1:
	db $00
	db "When you  stomp on"
	db "an enemy,  you can"
	db "jump high  if  you"
	db "hold    the   jump"
	db "button.  Use Up on"
	db "the Control Pad to"
	db "jump high  in  the"
	db "shallow water.    "

.Message2:
	db $00
	db "-POINT OF ADVICE- "
	db "The big coins  are"
	db "Dragon Coins.   If"
	db "you  pick up  five"
	db "of  these  in  one"
	db "area,  you  get an"
	db "extra Mario.      "
	db "                  "

Level104:
.Message1:
	db $00
	db "Hello!   Sorry I'm"
	db "not  home,  but  I"
	db "have    gone    to"
	db "rescue  my friends"
	db "who were  captured"
	db "by Bowser.        "
	db "                ",$60,$61
	db "         - Yoshi",$62,$63

.Message2:
	db $00
	db "It is possible  to"
	db "fill in the dotted"
	db "line blocks.    To"
	db "fill in the yellow"
	db "ones, just go west"
	db "then north  to the"
	db "top     of     the"
	db "mountain.         "

Level105:
.Message1:
	db $00
	db "-POINT OF ADVICE- "
	db "You  can  hold  an"
	db "extra item  in the"
	db "box at  the top of"
	db "the screen.     To"
	db "use it,  press the"
	db "SELECT Button.    "
	db "                  "

.Message2:
	db $00
	db "-POINT OF ADVICE- "
	db "To   pick   up   a"
	db "shell,  use  the X"
	db "or  Y  Button.  To"
	db "throw    a   shell"
	db "upwards,  look  up"
	db "and let go of  the"
	db "button.           "

Level106:
.Message1:
	db $00
	db "To do a spin jump,"
	db "press    the     A"
	db "Button.    A Super"
	db "Mario   spin  jump"
	db "can break some  of"
	db "the   blocks   and"
	db "defeat some of the"
	db "tougher enemies.  "

.Message2:
	db $00
	db "-POINT OF ADVICE- "
	db "This   gate  marks"
	db "the middle of this"
	db "area.   By cutting"
	db "the tape here, you"
	db "can continue  from"
	db "close   to    this"
	db "point.            "

Level107:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level108:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level109:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level10A:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level10B:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level10C:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level10D:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level10E:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level10F:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level110:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level111:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level112:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level113:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level114:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level115:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level116:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level117:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level118:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level119:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level11A:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level11B:
.Message1:
	db $03
	db "- SWITCH PALACE   "
	db "The  power  of the"
	db "switch  you   have"
	db "pushed  will  turn"
	db "                  "
	db "      into        "
	db "Your progress will"
	db "also   be   saved "

.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level11C:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level11D:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level11E:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level11F:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level120:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level121:
.Message1:
	db $02
	db "- SWITCH PALACE   "
	db "The  power  of the"
	db "switch  you   have"
	db "pushed  will  turn"
	db "                  "
	db "      into        "
	db "Your progress will"
	db "also   be   saved "

.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level122:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level123:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level124:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level125:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level126:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level127:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level128:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level129:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level12A:
.Message1:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

.Message2:
	db $00
	db "Amazing!  Few have"
	db "made it  this far."
	db "Beyond  lies   the"
	db "Special      Zone."
	db "Complete  it   and"
	db "you can explore  a"
	db "strange new world."
	db "GOOD LUCK!        "

Level12B:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level12C:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level12D:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level12E:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level12F:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level130:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level131:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level132:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level133:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level134:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level135:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level136:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level137:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level138:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level139:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level13A:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

Level13B:
.Message1:
.Message2:
	db $00
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "
	db "                  "

cleartable
namespace off

RemoveTextBox:
	%SMW_StripeImageHeader(.ClearLine1, $07, $06, 0, $0023, 3)
	db $FC,$38
.ClearLine1End:
	%SMW_StripeImageHeader(.ClearLine2, $07, $07, 0, $0023, 3)
	db $FC,$38
.ClearLine2End:
	%SMW_StripeImageHeader(.ClearLine3, $07, $08, 0, $0023, 3)
	db $FC,$38
.ClearLine3End:
	%SMW_StripeImageHeader(.ClearLine4, $07, $09, 0, $0023, 3)
	db $FC,$38
.ClearLine4End:
	%SMW_StripeImageHeader(.ClearLine5, $07, $0A, 0, $0023, 3)
	db $FC,$38
.ClearLine5End:
	%SMW_StripeImageHeader(.ClearLine6, $07, $0B, 0, $0023, 3)
	db $FC,$38
.ClearLine6End:
	%SMW_StripeImageHeader(.ClearLine7, $07, $0C, 0, $0023, 3)
	db $FC,$38
.ClearLine7End:
	%SMW_StripeImageHeader(.ClearLine8, $07, $0D, 0, $0023, 3)
	db $FC,$38
.ClearLine8End:
	db $FF

else
	LDX.b #$16
	LDY.b #$01
	LDA.w SMW_DisplayMessage_DATA_05A590,x
	assert pc() <= SMW_DisplayMessage_CODE_05B250
pullpc
endif

;#############################################################################################################
;#############################################################################################################
