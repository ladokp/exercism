Class {
	#name : #ReverseString,
	#superclass : #Object,
	#category : #'Exercise@ReverseString'
}

ReverseString >> reverseValue: string [	
	^ String streamContents: [ :stream |
		(string size) to: 1 by: -1 do: [ :index | stream nextPutAll: (string at: index) asString ]
		 ].
	
	

]