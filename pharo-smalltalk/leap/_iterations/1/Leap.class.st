Class {
	#name : #Leap,
	#superclass : #Object,
	#category : #'Exercise@Leap'
}

Leap >> leapYear: year [
	^ year % 4 == 0 and: 
        [year % 100 ~= 0 
            or: [year % 400 == 0]
        ]
]