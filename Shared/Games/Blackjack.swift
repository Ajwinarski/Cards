//
//  Blackjack.swift
//  Cards!
//
//  Created by Austin Winarski on 9/7/18.
//  Copyright © 2018 AustinsApps. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit


class Blackjack: SKScene {
    
    let background = SKSpriteNode(imageNamed: "BackDrop")
    let hitButton = SKSpriteNode(imageNamed: "HitButton")
    let dealButton = SKSpriteNode(imageNamed: "DealButton")
    let standButton = SKSpriteNode(imageNamed: "StandButton")
    let bottomTable = SKSpriteNode(imageNamed: "Wood")
    let bottomView = UIImageView()
    
    let money1 = Money(moneyValue: .one)
    let money5 = Money(moneyValue: .five)
    let money10 = Money(moneyValue: .ten)
    let money25 = Money(moneyValue: .twentyFive)
    let money100 = Money(moneyValue: .oneHundred)
    let money500 = Money(moneyValue: .fiveHundred)
    let deck = Deck(1)
    
    var allCards = [Card]()
    var myCards = Hand()
    var dealerCards = Hand()
    var boardCards = Hand()
    var dealerCardsPos = CGPoint(x: 0, y: 0)
    

    // Runs once when scene loads
    override func didMove(to view: SKView) {
        dealerCardsPos = CGPoint(x: self.size.width-80, y: self.size.height-180)
        
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.zPosition = zLevel.board.rawValue
        background.size.height = self.size.height
        background.size.width = self.size.width
        addChild(background)
        
//        bottomTable.position = CGPoint(x: frame.midX, y: frame.minY + (self.size.height / 12))
//        bottomTable.zPosition = zLevel.wood.rawValue
//        bottomTable.size.width = self.size.width
//        bottomTable.size.height = self.size.height / 6
//        addChild(bottomTable)
        
        dealButton.position = CGPoint(x: frame.midX, y: frame.midY)
        dealButton.zPosition = zLevel.board.rawValue
        addChild(dealButton)
        newGame()
    }
    
    func newGame() {
        setupDeck()
    }
    
    func setupButtons() {
        
    }
    
    func setupDeck() {
        for _ in 0...51 {
                dealerCards.addCardToFront(card: deck.getTopCard())
                dealerCards.getFirst().position = dealerCardsPos
                dealerCards.getFirst().setScale(0.6)
                addChild(dealerCards.getFirst())
            }
        }
    
    
    // Used to easily set the zPosition for different elements
    enum zLevel :CGFloat {
        case board = -3
        case wood = -2
        case chip = -1
        case card = 0
        case moving = 100
        case enlarged = 200
    }
}
