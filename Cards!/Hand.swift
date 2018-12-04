//
//  Hand.swift
//  Cards!
//
//  Created by Austin Winarski on 3/5/18.
//  Copyright © 2018 AustinsApps. All rights reserved.
//

import Foundation
import SpriteKit

class Hand {
    /* VARIABLES */
    private var hand = [Card]()
    private var index = -1
    
    func addCard(card: Card) {
        hand.append(card)
    }
    
    func addCardToFront(card: Card) {
        // Adds card to top of hand
        hand.insert(card, at: hand.startIndex)
    }
    
    func removeLast() {
        //print(hand[hand.count-1].description," ", hand[hand.count-1].getValue())
        hand.remove(at: hand.endIndex)
    }
    
    func removeAndReturnLast()-> Card {
        let temp = getLast()
        removeLast()
        return temp
    }
    
    func removeFirst() {
        //print(hand[hand.count-1].description," ", hand[hand.count-1].getValue())
        hand.remove(at: hand.startIndex)
    }
    
    func removeAndReturnFirst()-> Card {
        let temp = getFirst()
        removeFirst()
        return temp
    }
    
    func getLast()-> Card {
        return hand.last!
    }
    
    func getFirst()-> Card {
        return hand.first!
    }
    
    func frontToBack() {
        let temp = getFirst()
        removeFirst()
        addCard(card: temp)
    }
    
    /*func updatePosition() {
        hand.first?.zPosition = 1
    }*/
    
    func reset() {
        index = -1
        hand.removeAll()
    }

    func length()-> Int {
        return hand.count
    }
}
