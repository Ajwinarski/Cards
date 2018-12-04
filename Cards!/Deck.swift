//
//  Deck.swift
//  Cards!
//
//  Created by Austin Winarski on 3/5/18.
//  Copyright © 2018 AustinsApps. All rights reserved.
//

import Foundation
import SpriteKit

// Deck: class
class Deck {
    // Generate a new Card class array object
    private var deck = [Card]()
    private var discarded = [Card]()
    
    // Var to "point" to value just before first card in the array
    private var deckIndex = -1
    
    // Runs when Deck class is called. Generates the first deck
    init(_ deck: Int = 0) {
        create(deck)
    }
    
    // Creates a deck (from [1c,1d,1h,...,13d,13h,13s]
    func create(_ high: Int = 0) {
        if high == 0 {
            for i in 1...13 {
                for Suit in [Card.Suit.clubs,.diamonds,.hearts,.spades] {
                    let tempCard = Card(value: i, suit:Suit.description(), faceUp: false)       // 0 for faceDown
                    tempCard.scale(to: CGSize(width: 100, height: 200))
                    deck.append(tempCard)
                }
            }
        } else {
            for i in 2...14 {
                for Suit in [Card.Suit.clubs,.diamonds,.hearts,.spades] {
                    let tempCard = Card(value: i, suit:Suit.description(), faceUp: false)       // 0 for faceDown
                    tempCard.scale(to: CGSize(width: 100, height: 200))
                    deck.append(tempCard)
                }
            }
        }
    }
    
    // Get top of the deck and move indexing "pointer" by 1
    func getTopCard()->Card{
        deckIndex += 1
        return deck[deckIndex]
    }
    
    // Shuffle the deck [Card] array
    func shuffle(){
        deck.shuffle()
    }
    
    // Shuffle and reset the "pointer" to the start of the array
    func new(){
        deckIndex = -1
        shuffle()
    }
    
    func burn() {
        discarded.append(deck[deckIndex])
        deck.remove(at: deckIndex)
    }
}
