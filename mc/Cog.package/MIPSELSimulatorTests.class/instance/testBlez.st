tests - control
testBlez
	| result |
	self 
		testGenerateInto: 
			[:stream :compiler | 
			stream nextPut: (compiler addiuR: V0 R: ZR C: 4).
			stream nextPut: (compiler blezR: A0 offset: 8).
			stream nextPut: (compiler nop). "Delay slot"
			stream nextPut: (compiler addiuR: V0 R: ZR C: 3).
			stream nextPut: (compiler jR: RA).
			stream nextPut: (compiler nop). "Delay slot"]
		disassembly:
'00000000  24020004  addiu v0, zr, 4
00000004  18800002  blez a0, +8 ; =10
00000008  00000000  nop
0000000C  24020003  addiu v0, zr, 3
00000010  03E00008  jr ra
00000014  00000000  nop
'		run: 
			[:simulator | 
			result := simulator call: 0 with: -1 with: 0 with: 0 with: 0.
			self assert: result equals: 4.
			result := simulator call: 0 with: 0 with: 0 with: 0 with: 0.
			self assert: result equals: 4.
			result := simulator call: 0 with: 1 with: 0 with: 0 with: 0.
			self assert: result equals: 3].