span functions
v4: descriptor LongForward: pc Branch: nExts Distance: aMethodObj
	"242		11110010	i i i i i i i i	Jump i i i i i i i i (+ Extend B * 256, where bbbbbbbb = sddddddd, e.g. -32768 = i=0, a=0, s=1)"
	"243		11110011	i i i i i i i i	Pop and Jump 0n True i i i i i i i i (+ Extend A * 256)"
	"244		11110100	i i i i i i i i	Pop and Jump 0n False i i i i i i i i (+ Extend A * 256)"
	<var: #descriptor type: #'BytecodeDescriptor *'>
	| extBValue |
	self assert: nExts >= 0.
	self parseV4Exts: nExts priorTo: pc in: aMethodObj into: [:ea :eb| extBValue := eb].
	^(objectMemory fetchByte: pc + 1 ofObject: aMethodObj)
	+ (extBValue << 8)