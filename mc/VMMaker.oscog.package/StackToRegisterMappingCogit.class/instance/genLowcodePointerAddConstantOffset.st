inline primitive generators generated code
genLowcodePointerAddConstantOffset
	<option: #LowcodeVM>
	<inline: true>
	"Generated by the Lowcode instruction generator."
	| base offset |
	offset := extB.
	self allocateRegistersForLowcodeInteger: [:baseValue |
		base := baseValue.
	].

	self ssNativeTop nativePopToReg: base.
	self ssNativePop: 1.

	self AddCq: offset R: base.
	self ssPushNativeRegister: base.

	extB := 0.
	numExtB := 0.
	^ 0

