Class {
	#name : #Minesweeper,
	#superclass : #Object,
	#category : #'Exercise@Minesweeper'
}

{ #category : #'as yet unclassified' }
Minesweeper >> annotateMinefield: minefield [
	^minefield withIndexCollect: [ :row :rowIndex |
		row withIndexCollect: [ :cell :colIndex |
			(cell = $*) ifTrue: [$*] ifFalse: [
				| mineCount |
				mineCount := 0.
				-1 to: 1 do: [ :deltaRow |
					-1 to: 1 do: [ :deltaCol |
						(((minefield at: (rowIndex + deltaRow) ifAbsent: '') 
							at: (colIndex + deltaCol) ifAbsent: $ ) = $*) 
							ifTrue: [mineCount := mineCount + 1]
					]
				].
				(mineCount = 0) ifTrue: [$ ] ifFalse: [ mineCount asCharacterDigit ]
			]
		]
	].
]
