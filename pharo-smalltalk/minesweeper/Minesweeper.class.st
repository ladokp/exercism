Class {
	#name : #Minesweeper,
	#superclass : #Object,
	#category : #'Exercise@Minesweeper'
}

{ #category : #exercism }
Minesweeper >> annotateMinefield: aCollection [
	aCollection ifEmpty: [ ^ aCollection ].

	^ aCollection
		withIndexCollect: [ :row :y | 
			row withIndexCollect: [ :cell :x | 
					cell = $*
						ifTrue: [ cell ]
						ifFalse: [ self neighbourValueIn: aCollection at: (x@y) ] ] ]
]

{ #category : #exercism }
Minesweeper >> neighbourValueIn: aCollection at: aPoint [
	^ (aPoint eightNeighbors sum: [ :p | aCollection mineAt: p ])
		asMinesweeperChar
]