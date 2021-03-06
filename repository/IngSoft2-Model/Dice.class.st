Class {
	#name : #Dice,
	#superclass : #Object,
	#instVars : [
		'amountOfFaces',
		'rollingStrategy'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'creation validation' }
Dice class >> assertIsEmpty: sequence [
	sequence isEmpty
		ifTrue: [ MatchException signal: 'Sequence must have at least one number' ]
]

{ #category : #'creation validation' }
Dice class >> checkIsValid: anAmountOfFaces [
	anAmountOfFaces > 0
		ifFalse: [ MatchException signal: 'you can not create a dice with less than 1 face' ]
]

{ #category : #'creation validation' }
Dice class >> checkIsValidThrowing: sequence with: anAmountOfFaces [
	self assertIsEmpty: sequence.
	sequence
		detect: [ :aNumber | aNumber > anAmountOfFaces ]
		ifFound: [ MatchException
				signal: 'The sequence can not have a number bigger than amount of faces' ]
]

{ #category : #'instance creation' }
Dice class >> deterministicWithFaces: anAmountOfFaces throwing: sequence [
	self checkIsValid: anAmountOfFaces.
	self checkIsValidThrowing: sequence with: anAmountOfFaces.
	^ self with: anAmountOfFaces of: (DeterministicDiceStrategy using: sequence)
]

{ #category : #'instance creation' }
Dice class >> randomWithFaces: anAmountOfFaces [
	self checkIsValid: anAmountOfFaces.
	^ self with: anAmountOfFaces of: RandomDiceStrategy new
]

{ #category : #'instance creation' }
Dice class >> with: anAmountOfFaces of: aRollingStrategy [
	^ self new initializeWith: anAmountOfFaces of: aRollingStrategy
]

{ #category : #initialization }
Dice >> initializeWith: anAmountOfFaces of: aStrategyType [
	amountOfFaces := anAmountOfFaces.
	rollingStrategy := aStrategyType
]

{ #category : #'game play' }
Dice >> roll [
	^ rollingStrategy nextNumberUsing: amountOfFaces
]
