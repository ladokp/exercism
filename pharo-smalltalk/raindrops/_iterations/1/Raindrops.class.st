Class {
    #name: #Raindrops,
    #superclass: #Object,
    #category: #'Exercise@Raidrops'
}

{ #category : #translation }
Raindrops >> convertNumber: number [			
	result := WriteStream on: String new.
	number \\ 3 == 0 ifTrue: [ result nextPutAll: 'Pling'].
	number \\ 5 == 0 ifTrue: [ result nextPutAll: 'Plang'].
	number \\ 7 == 0 ifTrue: [ result nextPutAll: 'Plong'].

	result contents ifEmpty: [ result nextPutAll: number asString ].
	^ result contents
    ]