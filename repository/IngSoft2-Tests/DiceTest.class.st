Class {
	#name : #DiceTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DiceTest >> testCreatingRandomDiceWithAmountOfFacesMinus3Fails [
	|dice|
	self should: [dice := Dice randomWithAmountOfFaces: -3] raise: AssertionFailure withExceptionDo: [ :exception | self assert: exception messageText equals: 'you can not create a dice with less than 1 face' ]
	

]

{ #category : #tests }
DiceTest >> testRollDeterministicDiceOutcomes1 [
	| dice |
	dice := Dice deterministicWithAmountOfFaces: 4.
	self assert: dice roll equals: 1.
]

{ #category : #tests }
DiceTest >> testRollDeterministicDiceWithAmountOfFaces3AndRollOutcomeIsLessThan3 [
	| dice |
	dice := Dice deterministicWithAmountOfFaces: 3.
	self assert: dice roll <= 3
]