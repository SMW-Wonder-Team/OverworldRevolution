include
; This patch nukes all the original overworld code/data as well as anything that Lunar Magic inserts.
; That way, none of this code/data wastes ROM space.
; Note that this only occurs the first time you apply the patch. This way, you can utilize the freed up space without it getting overwritten.
; Which means, saving the overworld data in Lunar Magic will cause leaked free space, so don't do it!
; Also, nothing in bank 04 is touched, as the main part of the patch will overwrite all of bank 04 anyway.

	print ""

!TEMP1 = 0
!TEMP2 = 0
!TEMP3 = 0
!TEMP4 = 0
!TEMP5 = 0
!TEMP6 = 0
!TEMP7 = 0
!TEMP8 = 0
!TEMP9 = 0
!TEMP10 = 0

macro HandleBankingCrossingRATSTag(Param1, Param2)
if !<Param1>&$00FFFF == $008000
	!<Param2> #= read2(!<Param1>-$8004)
	!StarFlag #= read4(!<Param1>-$8008)
	org !<Param1>-$008008
		fillbyte $00 : fill $08
else
	org !<Param1>-$08
		fillbyte $00 : fill $08
	!<Param2> #= read2(!<Param1>-$04)
	!StarFlag #= read4(!<Param1>-$08)
endif
endmacro

if read1($03BB20) != $FF
	!TEMP1 #= read3($03BB57)|!FastROM
	%HandleBankingCrossingRATSTag(TEMP1, TEMP2)
	org !TEMP1
		padbyte $00 : pad !TEMP1+!TEMP2+$01
		print "About To Be Deleted: 0x",hex(!TEMP2+$09, 4)," byte(s) of LM's Level Name text at $",hex(!TEMP1, 6)
	org $03BB20|!FastROM
		padbyte $FF : pad $03BB90|!FastROM
		print "About To Be Deleted: 0x",hex($03BB90-$03BB20, 4)," byte(s) of LM's Level Name ASM hack at $",hex($03BB20|!FastROM, 6)
endif
if read1($03BB90)	!= $FF
	if read1($03BBD8) == $BF
		!TEMP1 #= read3($03BBD9)|!FastROM
		%HandleBankingCrossingRATSTag(TEMP1, TEMP2)
		!TEMP3 #= 0
		!TEMP4 #= 1
		!PrevAddr #= 0
		while !TEMP3 < !TEMP2
			!TEMP5 #= read3(!TEMP1+!TEMP3)|!FastROM
			if !PrevAddr != !TEMP5
				%HandleBankingCrossingRATSTag(TEMP5, TEMP6)
				if !StarFlag == $52415453
					org !TEMP5
						padbyte $00 : pad !TEMP5+!TEMP6+$01
						print "About To Be Deleted: 0x",hex(!TEMP6+$09, 4)," byte(s) of LM Message Text Block ",dec(!TEMP4)," at $",hex(!TEMP5, 6)
						!TEMP4 #= !TEMP4+$01
				endif
			endif
			!TEMP3 #= !TEMP3+$03
			!PrevAddr #= !TEMP5
		endwhile
		org !TEMP1
			padbyte $00 : pad !TEMP1+!TEMP2+$01
			print "About To Be Deleted: 0x",hex(!TEMP2+$09, 4)," byte(s) of LM's Expanded Message Box Pointer Table data at $",hex(!TEMP1, 6)
	else
		!TEMP1 #= read3($03BC0B)|!FastROM
		%HandleBankingCrossingRATSTag(TEMP1, TEMP2)
		org !TEMP1
			padbyte $00 : pad !TEMP1+!TEMP2+$01
			print "About To Be Deleted: 0x",hex(!TEMP2+$09, 4)," byte(s) of LM's Message Box Text data at $",hex(!TEMP1, 6)
	endif
	org $03BB90|!FastROM
		padbyte $FF : pad $03BCA0|!FastROM
		print "About To Be Deleted: 0x",hex($03BCA0-$03BB90, 4)," byte(s) of LM's Level Message ASM hack at $",hex($03BB90|!FastROM, 6)
endif
if read1($03BE80) != $FF
org $03BE80|!FastROM
	padbyte $FF : pad $03C000|!FastROM
	print "About To Be Deleted: 0x",hex($03C000-$03BE80, 4)," byte(s) of LM's Initial Level Flags/Message Pointer table at $",hex($03BE80|!FastROM, 6)
endif
if (read1($04DCC1)<<16)|read2($04DCBC)&(!FastROM^$FFFFFF) != $05D000
	!TEMP1 #= (read1($04DCC1)<<16)|read2($04DCBC)|!FastROM
	%HandleBankingCrossingRATSTag(TEMP1, TEMP2)
	org !TEMP1
		padbyte $00 : pad !TEMP1+!TEMP2+$01
		print "About To Be Deleted: 0x",hex(!TEMP2+$09, 4)," byte(s) of LM's Expanded Overworld Layer 1 Map16 data at $",hex(!TEMP1, 6)
endif
if read1($04D7F9) != $A9
	!TEMP1 #= (read1($04D808)<<16)|read2($04D803)|!FastROM
	%HandleBankingCrossingRATSTag(TEMP1, TEMP2)
	!TEMP3 #= (read1($04D827)<<16)|read2($04D822)|!FastROM
	%HandleBankingCrossingRATSTag(TEMP3, TEMP4)
	org !TEMP1
		padbyte $00 : pad !TEMP1+!TEMP2+$01
		print "About To Be Deleted: 0x",hex(!TEMP2+$09, 4)," byte(s) of LM's Compressed Translevel Number data at $",hex(!TEMP1, 6)
	org !TEMP3
		padbyte $00 : pad !TEMP3+!TEMP4+$01
		print "About To Be Deleted: 0x",hex(!TEMP4+$09, 4)," byte(s) of LM's Compressed Overworld Layer 1 Tilemap (high bytes) at $",hex(!TEMP3, 6)
endif
if read1($049A35) == $22
	!TEMP1 #= read3($049A36)|!FastROM
	%HandleBankingCrossingRATSTag(TEMP1, TEMP2)
	!TEMP3 #= read3(!TEMP1+$11)|!FastROM
	%HandleBankingCrossingRATSTag(TEMP3, TEMP4)
	org !TEMP3
		padbyte $00 : pad !TEMP3+!TEMP4+$01
		print "About To Be Deleted: 0x",hex(!TEMP4+$09, 4)," byte(s) of LM's Expanded Path Exits data at $",hex(!TEMP3, 6)
	org !TEMP1
		padbyte $00 : pad !TEMP1+!TEMP2+$01
		print "About To Be Deleted: 0x",hex(!TEMP2+$09, 4)," byte(s) of LM's Expanded Path Exits ASM hack at $",hex(!TEMP1, 6)
endif
if read1($048086) == $22
	!TEMP1 #= read3($048087)|!FastROM
	%HandleBankingCrossingRATSTag(TEMP1, TEMP2)
	!TEMP3 #= read3(!TEMP1+$4A)|!FastROM
	%HandleBankingCrossingRATSTag(TEMP3, TEMP4)
	!TEMP7 #= read3(!TEMP1+$E1)|!FastROM
	%HandleBankingCrossingRATSTag(TEMP7, TEMP8)
	if ((read2(!TEMP1+$57)<<8)|read2(!TEMP1+$61))&(!FastROM^$FFFFFF) != $000000
		!TEMP5 #= ((read2(!TEMP1+$57)<<8)|read2(!TEMP1+$61))|!FastROM
		%HandleBankingCrossingRATSTag(TEMP5, TEMP6)
		org !TEMP5
			padbyte $00 : pad !TEMP5+!TEMP6+$01
			print "About To Be Deleted: 0x",hex(!TEMP6+$09, 4)," byte(s) of LM's Global Overworld ExAnimation data at $",hex(!TEMP5, 6)
	endif
	if read3(!TEMP7+$00)&(!FastROM^$FFFFFF) != $0000FF
		!TEMP9 #= read3(!TEMP7)|!FastROM
		%HandleBankingCrossingRATSTag(TEMP9, TEMP10)
		org !TEMP9
			padbyte $00 : pad !TEMP9+!TEMP10+$01
			print "About To Be Deleted: 0x",hex(!TEMP10+$09, 4)," byte(s) of LM's Main Map ExAnimation data at $",hex(!TEMP9, 6)
	endif
	if read3(!TEMP7+$03)&(!FastROM^$FFFFFF) != $0000FF
		!TEMP9 #= read3(!TEMP7+$03)|!FastROM
		%HandleBankingCrossingRATSTag(TEMP9, TEMP10)
		org !TEMP9
			padbyte $00 : pad !TEMP9+!TEMP10+$01
			print "About To Be Deleted: 0x",hex(!TEMP10+$09, 4)," byte(s) of LM's Yoshi Island ExAnimation data at $",hex(!TEMP9, 6)
	endif
	if read3(!TEMP7+$06)&(!FastROM^$FFFFFF) != $0000FF
		!TEMP9 #= read3(!TEMP7+$06)|!FastROM
		%HandleBankingCrossingRATSTag(TEMP9, TEMP10)
		org !TEMP9
			padbyte $00 : pad !TEMP9+!TEMP10+$01
			print "About To Be Deleted: 0x",hex(!TEMP10+$09, 4)," byte(s) of LM's Vanilla Dome ExAnimation data at $",hex(!TEMP9, 6)
	endif
	if read3(!TEMP7+$09)&(!FastROM^$FFFFFF) != $0000FF
		!TEMP9 #= read3(!TEMP7+$09)|!FastROM
		%HandleBankingCrossingRATSTag(TEMP9, TEMP10)
		org !TEMP9
			padbyte $00 : pad !TEMP9+!TEMP10+$01
			print "About To Be Deleted: 0x",hex(!TEMP10+$09, 4)," byte(s) of LM's Forest Of Illusion ExAnimation data at $",hex(!TEMP9, 6)
	endif
	if read3(!TEMP7+$0C)&(!FastROM^$FFFFFF) != $0000FF
		!TEMP9 #= read3(!TEMP7+$0C)|!FastROM
		%HandleBankingCrossingRATSTag(TEMP9, TEMP10)
		org !TEMP9
			padbyte $00 : pad !TEMP9+!TEMP10+$01
			print "About To Be Deleted: 0x",hex(!TEMP10+$09, 4)," byte(s) of LM's Valley of Bowser ExAnimation data at $",hex(!TEMP9, 6)
	endif
	if read3(!TEMP7+$0F)&(!FastROM^$FFFFFF) != $0000FF
		!TEMP9 #= read3(!TEMP7+$0F)|!FastROM
		%HandleBankingCrossingRATSTag(TEMP9, TEMP10)
		org !TEMP9
			padbyte $00 : pad !TEMP9+!TEMP10+$01
			print "About To Be Deleted: 0x",hex(!TEMP10+$09, 4)," byte(s) of LM's Special World ExAnimation data at $",hex(!TEMP9, 6)
	endif
	if read3(!TEMP7+$12)&(!FastROM^$FFFFFF) != $0000FF
		!TEMP9 #= read3(!TEMP7+$12)|!FastROM
		%HandleBankingCrossingRATSTag(TEMP9, TEMP10)
		org !TEMP9
			padbyte $00 : pad !TEMP9+!TEMP10+$01
			print "About To Be Deleted: 0x",hex(!TEMP10+$09, 4)," byte(s) of LM's Star World ExAnimation data at $",hex(!TEMP9, 6)
	endif
	org !TEMP7
		padbyte $00 : pad !TEMP7+!TEMP8+$01
		print "About To Be Deleted: 0x",hex(!TEMP8+$09, 4)," byte(s) of LM's Overworld ExAnimation pointer table at $",hex(!TEMP7, 6)
	org !TEMP3
		padbyte $00 : pad !TEMP3+!TEMP4+$01
		print "About To Be Deleted: 0x",hex(!TEMP4+$09, 4)," byte(s) of LM's Overworld ExAnimation setting data at $",hex(!TEMP3, 6)
	org !TEMP1
		padbyte $00 : pad !TEMP1+!TEMP2+$01
		print "About To Be Deleted: 0x",hex(!TEMP2+$09, 4)," byte(s) of LM's Overworld ExAnimation ASM hack at $",hex(!TEMP1, 6)	
endif
if read1($00AD32) == $22
	!TEMP1 #= read3($00AD33)|!FastROM
	%HandleBankingCrossingRATSTag(TEMP1, TEMP2)
	!TEMP3 #= read2(!TEMP1+$12)|(read1(!TEMP1+$1E)<<16)|!FastROM
	%HandleBankingCrossingRATSTag(TEMP3, TEMP4)
	org !TEMP3
		padbyte $00 : pad !TEMP3+!TEMP4+$01
		print "About To Be Deleted: 0x",hex(!TEMP4+$09, 4)," byte(s) of LM's Custom Overworld Palette data at $",hex(!TEMP3, 6)
	org !TEMP1
		padbyte $00 : pad !TEMP1+!TEMP2+$01
		print "About To Be Deleted: 0x",hex(!TEMP2+$09, 4)," byte(s) of LM's Custom Overworld Palette ASM hack at $",hex(!TEMP1, 6)
endif
if read3($04EE5A)&(!FastROM^$FFFFFF) != $04DD8D
	!TEMP1 #= read3($04EE5A)|!FastROM
	%HandleBankingCrossingRATSTag(TEMP1, TEMP2)
	org !TEMP1
		padbyte $00 : pad !TEMP1+!TEMP2+$01
		print "About To Be Deleted: 0x",hex(!TEMP2+$09, 4)," byte(s) of LM's Custom Overworld Event data at $",hex(!TEMP1, 6)	
endif
if read3($04EAF5)&(!FastROM^$FFFFFF) != $0C8000
	!TEMP1 #= read3($04EAF5)|!FastROM
	%HandleBankingCrossingRATSTag(TEMP1, TEMP2)
	org !TEMP1
		padbyte $00 : pad !TEMP1+!TEMP2+$01
		print "About To Be Deleted: 0x",hex(!TEMP2+$09, 4)," byte(s) of LM's Custom Overworld Event Tile ID data at $",hex(!TEMP1, 6)
endif
if (read1($04DC79)<<16)|read2($04DC72)&(!FastROM^$FFFFFF) != $04A533
	!TEMP1 #= (read1($04DC79)<<16)|read2($04DC72)|!FastROM
	%HandleBankingCrossingRATSTag(TEMP1, TEMP2)
	org !TEMP1
		padbyte $00 : pad !TEMP1+!TEMP2+$01
		print "About To Be Deleted: 0x",hex(!TEMP2+$09, 4)," byte(s) of LM's Custom Overworld Layer 2 Tilemap data at $",hex(!TEMP1, 6)
endif
if (read1($04DD4A)<<16)|read2($04DD45)&(!FastROM^$FFFFFF) != $0C8D00
	!TEMP1 #= (read1($04DD4A)<<16)|read2($04DD45)|!FastROM
	%HandleBankingCrossingRATSTag(TEMP1, TEMP2)
	org !TEMP1
		padbyte $00 : pad !TEMP1+!TEMP2+$01
		print "About To Be Deleted: 0x",hex(!TEMP2+$09, 4)," byte(s) of LM's Custom Overworld Event YXPCCCTT data at $",hex(!TEMP1, 6)
endif
if read3($04E471)&(!FastROM^$FFFFFF) != $04E359
	!TEMP1 #= read3($04E471)|!FastROM
	%HandleBankingCrossingRATSTag(TEMP1, TEMP2)
	org !TEMP1
		padbyte $00 : pad !TEMP1+!TEMP2+$01
		print "About To Be Deleted: 0x",hex(!TEMP2+$09, 4)," byte(s) of LM's Expanded Event Pointer table at $",hex(!TEMP1, 6)
endif
if read1($04E9F7) == $22
	!TEMP1 #= read3($04E9F8)|!FastROM
	%HandleBankingCrossingRATSTag(TEMP1, TEMP2)
	!TEMP3 #= (read3(!TEMP1+$0D))|!FastROM
	%HandleBankingCrossingRATSTag(TEMP3, TEMP4)
	!TEMP5 #= (read3(!TEMP1+$22))|!FastROM
	%HandleBankingCrossingRATSTag(TEMP5, TEMP6)
	!TEMP7 #= (read3(!TEMP1+$28))|!FastROM
	%HandleBankingCrossingRATSTag(TEMP7, TEMP8)
	!TEMP9 #= (read3(!TEMP1+$34))|!FastROM
	%HandleBankingCrossingRATSTag(TEMP9, TEMP10)
	org !TEMP3
		padbyte $00 : pad !TEMP3+!TEMP4+$01
		print "About To Be Deleted: 0x",hex(!TEMP4+$09, 4)," byte(s) of LM's Unknown Silent Event Pointer Data at $",hex(!TEMP3, 6)
	org !TEMP5
		padbyte $00 : pad !TEMP5+!TEMP6+$01
		print "About To Be Deleted: 0x",hex(!TEMP6+$09, 4)," byte(s) of LM's Unknown Silent Event Data Block 1 at $",hex(!TEMP5, 6)
	org !TEMP7
		padbyte $00 : pad !TEMP7+!TEMP8+$01
		print "About To Be Deleted: 0x",hex(!TEMP8+$09, 4)," byte(s) of LM's Unknown Silent Event Data Block 2 at $",hex(!TEMP7, 6)
	org !TEMP9
		padbyte $00 : pad !TEMP9+!TEMP10+$01
		print "About To Be Deleted: 0x",hex(!TEMP10+$09, 4)," byte(s) of LM's Unknown Silent Event Data Block 3 at $",hex(!TEMP9, 6)
	org !TEMP1
		padbyte $00 : pad !TEMP1+!TEMP2+$01
		print "About To Be Deleted: 0x",hex(!TEMP2+$09, 4)," byte(s) of LM's Silent Event ASM hack at $",hex(!TEMP1, 6)
endif
if read3($04E69C)&(!FastROM^$FFFFFF) != $04E5B6
	!TEMP1 #= read3($04E69C)|!FastROM
	%HandleBankingCrossingRATSTag(TEMP1, TEMP2)
	org !TEMP1
		padbyte $00 : pad !TEMP1+!TEMP2+$01
		print "About To Be Deleted: 0x",hex(!TEMP2+$09, 4)," byte(s) of LM's Destroy Tile Layer 1 Location data at $",hex(!TEMP1, 6)
endif
if read1($04EDDD) == $22
	!TEMP1 #= read3($04EDDE)|!FastROM
	%HandleBankingCrossingRATSTag(TEMP1, TEMP2)
	org !TEMP1
		padbyte $00 : pad !TEMP1+!TEMP2+$01
		print "About To Be Deleted: 0x",hex(!TEMP2+$09, 4)," byte(s) of LM's Destroy Tile Fix ASM hack at $",hex(!TEMP1, 6)
endif
if read3($04EEC9)&(!FastROM^$FFFFFF) != $04E587
	!TEMP1 #= read3($04EEC9)|!FastROM
	%HandleBankingCrossingRATSTag(TEMP1, TEMP2)
	org !TEMP1
		padbyte $00 : pad !TEMP1+!TEMP2+$01
		print "About To Be Deleted: 0x",hex(!TEMP2+$09, 4)," byte(s) of LM's Destroy Tile VRAM Address data at $",hex(!TEMP1, 6)
endif
if read3($04E67C)&(!FastROM^$FFFFFF) != $04E5D6
	!TEMP1 #= read3($04E67C)|!FastROM
	%HandleBankingCrossingRATSTag(TEMP1, TEMP2)
	org !TEMP1
		padbyte $00 : pad !TEMP1+!TEMP2+$01
		print "About To Be Deleted: 0x",hex(!TEMP2+$09, 4)," byte(s) of LM's Destroy Tile Event ID data at $",hex(!TEMP1, 6)
endif
if read1($04F767) == $22
	!TEMP1 #= read3($04F768)|!FastROM
	%HandleBankingCrossingRATSTag(TEMP1, TEMP2)
	org !TEMP1
		padbyte $00 : pad !TEMP1+!TEMP2+$01
		print "About To Be Deleted: 0x",hex(!TEMP2+$09, 4)," byte(s) of LM's 'Use ROM Data for Lightning Animation' Setting ASM hack at $",hex(!TEMP1, 6)
endif
if read3($0EF55D) != $FFFFFF
	!TEMP1 #= read3($0EF55D)|!FastROM
	%HandleBankingCrossingRATSTag(TEMP1, TEMP2)
	org !TEMP1
		padbyte $00 : pad !TEMP1+!TEMP2+$01
		print "About To Be Deleted: 0x",hex(!TEMP2+$09, 4)," byte(s) of LM's Custom Overworld Sprite data at $",hex(!TEMP1, 6)
endif
org $05D000|!FastROM
	padbyte $FF : pad $05D668|!FastROM
	print "About To Be Deleted: 0x",hex($05D608-$05D000, 4)," byte(s) of the Vanilla Overworld Layer 1 Map16 data at $",hex($05D000|!FastROM, 6)
	print "About To Be Deleted: 0x",hex($05D668-$05D608, 4)," byte(s) of the Vanilla Overworld Event ID Table at $",hex($05D608|!FastROM, 6)
org $0C8000|!FastROM
	padbyte $FF : pad $0C936A|!FastROM
	print "About To Be Deleted: 0x",hex($0C936A-$0C8000, 4)," byte(s) of the Vanilla Layer 2 Event Tile ID data at $",hex($0C8000|!FastROM, 6)
org $00B3D8|!FastROM
	padbyte $FF : pad $00B5DE|!FastROM
	print "About To Be Deleted: 0x",hex($00B5DE-$00B3D8, 4)," byte(s) of the Vanilla Overworld Palette data at $",hex($00B3D8|!FastROM, 6)
org $00B732|!FastROM
	padbyte $FF : pad $00B882|!FastROM
	print "About To Be Deleted: 0x",hex($00B882-$00B732, 4)," byte(s) of the Vanilla Special World Palette data at $",hex($00B732|!FastROM, 6)
org $00A4E3|!FastROM
	padbyte $FF : pad $00A59C|!FastROM
	print "About To Be Deleted: 0x",hex($00A521-$00A4E3, 4)," byte(s) of the Vanilla Overworld Tile Animation Upload routine at $",hex($00A4E3|!FastROM, 6)
	print "About To Be Deleted: 0x",hex($00A594-$00A521, 4)," byte(s) of the Vanilla Overworld Layer 1 and 2 Tilemap Upload routine at $",hex($00A521|!FastROM, 6)
	print "About To Be Deleted: 0x",hex($00A59C-$00A594, 4)," byte(s) of the Vanilla Overworld Palette Buffering routine at $",hex($00A594|!FastROM, 6)
org $00AD1E|!FastROM
	padbyte $FF : pad $00ADA6|!FastROM
	print "About To Be Deleted: 0x",hex($00ADA6-$00AD1E, 4)," byte(s) of the Vanilla Overworld Palette Buffering routine at $",hex($00AD1E|!FastROM, 6)
org $0CF7DF|!FastROM
	padbyte $FF : pad $0CFFDF|!FastROM
	print "About To Be Deleted: 0x",hex($0CFFDF-$0CF7DF, 4)," byte(s) of the Vanilla Overworld Layer 1 Tilemap data (low bytes) at $",hex($0CF7DF|!FastROM, 6)
org $048000|!FastROM
	padbyte $FF : pad $0480D2|!FastROM
	;padbyte $FF : pad $058000|!FastROM
	print "About To Be Deleted: 0x8000 byte(s) of everything from bank 04"

; Various random hijacks that remove references to bank 04 code/data.
; Mainly ones that don't need to be applied every time the patch is inserted.

org $009AA4|!FastROM
	BRA.b +						; Prevent initializing the overworld sprites when loading the title screen.
	NOP #2
+:

org $0096DB|!FastROM
	BRA.b +						;\ Prevent initializing the overworld events during level load(?)
	NOP #12						;/ I don't know if the JSL here actually ever gets run, but I'm disabling it just in case.
+:

org $00A27B|!FastROM				;\ Integrate my "Bonus Game Midpoint Fix" patch, as it frees up a now unused byte of RAM
	BRA.b +						;|
	NOP								;|
+:									;|
									;|
org $00A281|!FastROM				;|
	BRA.b +						;|
	NOP								;|
+:									;|
									;|
org $00CA28|!FastROM				;|
	RTS								;|
	NOP #2							;|
									;|
org $05B150|!FastROM				;|
	LDA.b #$01						;|
	BRA +							;|
	NOP #4							;|
+:									;/

	print ""
	warn "Applying this patch will delete all the vanilla/Lunar Magic overworld data. If you have anything important in your overworld, back it up now before proceeding!"
