bytecode generator support
genImmutabilityCheckStorePop: popBoolean ReceiverVariable: slotIndex
	<inline: true>
	| needStoreCheck |
	self assert: needsFrame. 
	needStoreCheck := self ssTopNeedsStoreCheck.
	"Note that ReceiverResultReg remains live after the trampoline."
	self ensureReceiverResultRegContainsSelf.
	self ssAllocateRequiredReg: ClassReg.
	self ssStoreAndReplacePop: popBoolean toReg: ClassReg.
	self ssFlushTo: simStackPtr.
	objectRepresentation 
		genStoreWithImmutabilityCheckSourceReg: ClassReg 
		slotIndex: slotIndex 
		destReg: ReceiverResultReg 
		scratchReg: TempReg 
		needsStoreCheck: needStoreCheck 
		needRestoreRcvr: true.
		
	^ 0