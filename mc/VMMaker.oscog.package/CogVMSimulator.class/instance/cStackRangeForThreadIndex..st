multi-threading simulation switch
cStackRangeForThreadIndex: threadIndex
	"This method includes or excludes CoInterpreterMT methods as required.
	 Auto-generated by CogVMSimulator>>ensureMultiThreadingOverridesAreUpToDate"

	^self perform: #cStackRangeForThreadIndex:
		withArguments: {threadIndex}
		inSuperclass: (cogThreadManager ifNil: [CoInterpreterPrimitives] ifNotNil: [CoInterpreterMT])