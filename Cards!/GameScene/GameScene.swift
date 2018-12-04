//
//  GameScene.swift
//  Cards!
//
//  Created by Austin Winarski on 2/19/18.
//  Copyright © 2018 AustinsApps. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    let background = SKSpriteNode(imageNamed: "Backdrop.pdf")
    //var playButton = SKSpriteNode()
    //let playButtonTex = SKTexture(imageNamed: "Single Player.pdf")
    
    let deck = Deck()
    var allCards = [Card]()
    var myCards = Hand()
    var dealerCards = Hand()
    
    var myScoreLabelNode:SKLabelNode!               // Label for my score
    var dealerScoreLabelNode:SKLabelNode!           // Label for dealer score
    var myScore = 26                                 // Init my score to 26
    var dealerScore = 26                             // Init dealer score to 26
    
    override func didMove(to view: SKView) {
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.size.height = self.size.height + 10
        background.size.width = self.size.width + 10
        addChild(background)
        newGame()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)           // 1
            if let card = atPoint(location) as? Card {        // 2
                // Change this (moves card relative to touch position)
                card.position = location
                //card.position.x = card.position.x + (location.x - card.position.x)
                //card.position.y = location.y - (offset.y - card.position.y)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            //let node = self.atPoint(location)
            if let card = atPoint(location) as? Card {
                if touch.tapCount > 1 {
                    card.flip()
                    playFlip()
                }
                card.zPosition = CardLevel.moving.rawValue
                card.removeAction(forKey: "drop")
                //card.run(SKAction.scale(to: 1.15, duration: 0.15), withKey: "pickup")
            }
            
            //if node == playButton {
                //flipCards()
            //}
        }
    }

    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if let card = atPoint(location) as? Card {
                card.zPosition = CardLevel.board.rawValue
                card.removeFromParent()
                addChild(card)
                card.removeAction(forKey: "pickup")
                //card.run(SKAction.scale(to: 1.0, duration: 0.15), withKey: "drop")
                if touch.tapCount < 1 {
                    playPop()
                }
            }
        }
    }
    
    // Create two hands with 26 cards each
    func setupDeck() {
        for item in stride(from:51, to:0, by:-1) {
            if item % 2 == 0 {
                myCards.addCard(card: deck.getTopCard())
                myCards.getFirst().position = CGPoint(x: size.width-80, y: 180)
                addChild(myCards.getFirst())
            } else {
                dealerCards.addCard(card: deck.getTopCard())
                dealerCards.getFirst().position = CGPoint(x: size.width-80, y: size.height-180)
                addChild(dealerCards.getFirst())
            }
        }
    }
    
    func newGame() {
        myScore = myCards.length()
        dealerScore = dealerCards.length()
        deck.new()
        setupDeck()
        setupScore()
    }
    
    func setupScore() {
        myScoreLabelNode = SKLabelNode(fontNamed:"Avenir-Black")
        dealerScoreLabelNode = SKLabelNode(fontNamed:"Avenir-Black")
        
        myScoreLabelNode.position = CGPoint(x: size.width/2, y: 50)
        dealerScoreLabelNode.position = CGPoint(x: size.width/2, y: size.height-80)
        
        myScoreLabelNode.zPosition = 100
        dealerScoreLabelNode.zPosition = 100
        
        myScoreLabelNode.text = String(myScore)
        dealerScoreLabelNode.text = String(dealerScore)
        
        addChild(myScoreLabelNode)
        addChild(dealerScoreLabelNode)
    }
    
    func flipCards() {
        myCards.getFirst().flip()
        dealerCards.getFirst().flip()
    }

    
    enum CardLevel :CGFloat {
        case board = 10
        case moving = 100
        case enlarged = 200
    }
    //setupCards()
}
