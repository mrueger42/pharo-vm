inline primitive generators generated code
genLowcodeStoreObjectFieldAt
	<option: #LowcodeVM>
	<inline: true>
	"Generated by the Lowcode instruction generator."
	| fieldIndex object value |
	self allocateRegistersForLowcodeIntegerOop2: [:fieldIndexValue :valueValue :objectValue |
		fieldIndex := fieldIndexValue.
		value := valueValue.
		object := objectValue.
	].

	self ssTop popToReg: value.
	self ssPop: 1.
	self ssNativeTop nativePopToReg: fieldIndex.
	self ssNativePop: 1.
	self ssTop popToReg: object.
	self ssPop: 1.

	objectRepresentation genLcStore: value object: object at: fieldIndex.

	^ 0

