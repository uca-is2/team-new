Class {
	#name : #DeterministicDiceStrategy,
	#superclass : #Object,
	#instVars : [
		'deterministicStrategy'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'instance creation' }
DeterministicDiceStrategy class >> using: aSequence [
	^ self new initializeUsing: aSequence
]

{ #category : #initialization }
DeterministicDiceStrategy >> initializeUsing: aSequence [
deterministicStrategy := DeterministicStrategy using: aSequence
]

{ #category : #generating }
DeterministicDiceStrategy >> nextNumberUsing: anAmountOfFaces [
	^ deterministicStrategy next
]
