Class {
	#name : #TwoFer,
	#superclass : #Object,
	#category : #'Exercise@TwoFer'
}

TwoFer >> who [
	^ self who: 'you'
]

TwoFer >> who: name [
	^ 'One for ', name, ', one for me.'
]
