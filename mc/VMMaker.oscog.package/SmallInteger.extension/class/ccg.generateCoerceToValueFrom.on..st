*VMMaker-plugin generation
ccg: cg generateCoerceToValueFrom: aNode on: aStream
	"N.B.  The could be used both for generation and simulation so answer the result (for interpretation)"
	^cg generateCoerceToSmallIntegerValueFrom: aNode on: aStream