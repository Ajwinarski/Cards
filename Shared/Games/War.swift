//
//  War.swift
//  Cards!
//
//  Created by Austin Winarski on 4/2/18.
//  Copyright © 2018 AustinsApps. All rights reserved.
//

//import Foundation
import SpriteKit
import GameplayKit
import UIKit


class War: SKScene {
    
    let background = SKSpriteNode(imageNamed: "BackDrop")
    let flipButton = SKSpriteNode(imageNamed: "WarButton")
    
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH = max(SCREEN_WIDTH, SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(SCREEN_WIDTH, SCREEN_HEIGHT)
    
    let deck = Deck(1)                              // 1 for ace high
    var allCards = [Card]()
    var myCards = Hand()
    var dealerCards = Hand()
    var boardCards = Hand()
    var myCardsPos = CGPoint(x: 0, y: 0)
    var dealerCardsPos = CGPoint(x: 0, y: 0)
    var prevWinPos = CGPoint(x: 0, y: 0)
    var cardsOnBoardArr = [Card?]()
    var boardCardsArr = [[Card?]]()
    var call = 0
    var myScoreLabelNode:SKLabelNode!               // Label for my score
    var dealerScoreLabelNode:SKLabelNode!           // Label for dealer score
    var myScore = 0                                 // Make a score for my cards
    var dealerScore = 0                             // Make a score for the dealers cards
    
    
    
    // Runs once when scene loads
    override func didMove(to view: SKView) {
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.zPosition = zLevel.board.rawValue
        background.size.height = self.size.height
        background.size.width = self.size.width
        addChild(background)
        
        myCardsPos = CGPoint(x: self.size.width-80, y: self.size.height-180)
        dealerCardsPos = CGPoint(x: self.size.width-80, y: 180)
        
        flipButton.position = CGPoint(x: frame.midX, y: frame.midY)
        flipButton.zPosition = zLevel.board.rawValue
        addChild(flipButton)
        newGame()
        
        print("Max Length \(War.SCREEN_MAX_LENGTH).")
        print("Max Length \(War.SCREEN_MIN_LENGTH).")
    }
    
    // Called when a node is first pressed
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let node = self.atPoint(location)
            
            // If war button clicked...
            if node == flipButton {
                playFlip()
                if touch.tapCount > 1 {}
                checkValue()
            }
            
            // If cards selected...
            if let card = atPoint(location) as? Card {
                if touch.tapCount > 1 {
                    card.flip()
                    playFlip()
                }
                card.zPosition = zLevel.moving.rawValue
                card.removeAction(forKey: "drop")
                //card.run(SKAction.scale(to: 1.15, duration: 0.15), withKey: "pickup")
            }
        }
    }
    
    // Called to move cards
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
    
    // Called when touches end
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if let card = atPoint(location) as? Card {
                card.zPosition = zLevel.card.rawValue
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
    
    // Resets scores, shuffles and generates the two decks, begins a new game
    func newGame() {
        deck.new()
        setupDeck()
        setupScore()
    }
    
    // Ends the game
    func endGame() {
        // Show an end game animation
        //self.view?.presentScene(GameScene?)
        if myCards.length() == 0 {
            // Do dealer wins end game
        } else {
            // Do player wins end game
        }
    }
    
    // Create two hands with 26 cards each
    func setupDeck() {
        for item in 0...51 {
            if item % 2 == 0 {
                myCards.addCardToFront(card: deck.getTopCard())
                myCards.getFirst().position = myCardsPos
                //myCards.getFirst().zRotation = CGFloat(item)
                myCards.getFirst().setScale(0.6)
                addChild(myCards.getFirst())
            } else {
                dealerCards.addCardToFront(card: deck.getTopCard())
                dealerCards.getFirst().position = dealerCardsPos
                dealerCards.getFirst().setScale(0.6)
                addChild(dealerCards.getFirst())
            }
        }
    }
    
    // Puts number amount of cards in each deck on screen
    func setupScore() {
        myScoreLabelNode = SKLabelNode(fontNamed:"Avenir-Black")
        dealerScoreLabelNode = SKLabelNode(fontNamed:"Avenir-Black")
        // My label and cards on top
        myScoreLabelNode.position = CGPoint(x: size.width/2, y: size.height-80)
        dealerScoreLabelNode.position = CGPoint(x: size.width/2, y: 50)
        
        myScoreLabelNode.zPosition = 100
        dealerScoreLabelNode.zPosition = 100
        
        myScoreLabelNode.text = "Your card count: \(myCards.length())"
        dealerScoreLabelNode.text = "Dealer card count: \(dealerCards.length())"
        
        addChild(myScoreLabelNode)
        addChild(dealerScoreLabelNode)
    }
    
    // Updates on screen scores
    func updateScore() {
        myScoreLabelNode.text = "Your card count: \(myCards.length())"
        dealerScoreLabelNode.text = "Dealer card count: \(dealerCards.length())"
    }
    /*
     // Used to move cards from both decks to the table
     func moveCards(call: Int? = 0) {
     cardsOnBoardArr[0]!.flip()
     cardsOnBoardArr[1]!.flip()
     let moveMyCards = SKAction.moveBy(x: -size.width/2 , y: -size.height/8, duration: 0.6)
     let moveDealerCards = SKAction.moveBy(x: -size.width/2, y: size.height/8, duration: 0.6)
     cardsOnBoardArr[0]!.run(moveMyCards)
     cardsOnBoardArr[1]!.run(moveDealerCards)
     }*/
    
    // Adds cards to the board array
    func addCardsToBoardArr(card1: Card, card2: Card) {
        // Append dealers card first, then your card
        // Check card at...
        //      0 for my card
        //      1 for dealer card
        cardsOnBoardArr.insert(card2, at: cardsOnBoardArr.startIndex)
        cardsOnBoardArr.insert(card1, at: cardsOnBoardArr.startIndex)
        
        boardCardsArr.append([card1,card2])
    }
    
    // Put cards back into the proper hand
    func addCardsToHand(hand: Hand, cardArr: [Card?]) {
        for item in cardArr {
            hand.addCard(card: item!)
        }
    }
    
    // Put cards from 2D array back into the proper hand
    func add2DCardsToHand(hand: Hand, cardArr: [[Card?]]) {
        for trick in cardArr {
            for item in trick {
                hand.addCard(card: item!)
            }
        }
    }
    
    // Called when the War button is pressed
    func draw() {
        
        // Add cards to board array
        /*addCardsToBoardArr(card1: myCards.removeAndReturnFirst(), card2: dealerCards.removeAndReturnFirst())
         
         // Flip and move cards from board
         // process the values (who wins)
         for card in cardsOnBoardArr {
         card!.flip()
         }
         */
        
        // Add Cards to 2D array
        boardCardsArr.append([myCards.removeAndReturnFirst(), dealerCards.removeAndReturnFirst()])
        
        // Flip the cards
        for trick in boardCardsArr {
            for card in trick {
                card!.flip()
                //print("\(card?.getValue()) of \(card?.description) is \(card?.getFaceValue()) (0 for face down).")
            }
        }
        
        // Do the card checking on the board
        checkCardsOnBoard()
    }
    
    // Handles a war
    func war() -> Void {
        // Offset and position to move to
        call += 1
        let offset = 30 * call
        let moveMyCards = SKAction.moveBy(x: (-size.width/2 + CGFloat(offset)) , y: -size.height/8, duration: 0.4)
        let moveDealerCards = SKAction.moveBy(x: (-size.width/2 + CGFloat(offset)), y: size.height/8, duration: 0.4)
        let cardLift = SKAction.scale(to: 0.8, duration: 0.2)
        let cardLower = SKAction.scale(to: 0.6, duration: 0.2)
        
        // Add cards to the board and remove the cards from each deck
        addCardsToBoardArr(card1: myCards.removeAndReturnFirst(), card2: dealerCards.removeAndReturnFirst())
        
        updateScore()
        
        // Set the most recent cards' zPosition
        boardCardsArr[call][0]!.zPosition = CGFloat(call)
        boardCardsArr[call][1]!.zPosition = CGFloat(call)
        
        // If the cards are face up, check which one is greater
        if (call % 2 == 0) {
            boardCardsArr[call][0]!.flip()
            boardCardsArr[call][1]!.flip()
            
            // If player card is greater
            if (boardCardsArr[call][0]!.getValue() > boardCardsArr[call][1]!.getValue()) {
                boardCardsArr[call][1]!.run(moveDealerCards)
                let action = SKAction.sequence([moveMyCards,cardLift,cardLower])
                boardCardsArr[call][0]!.run(action)
                add2DCardsToHand(hand: myCards, cardArr: boardCardsArr)
                prevWinPos = myCardsPos
            }
                
                // If dealerCard is greater
            else if (boardCardsArr[call][0]!.getValue() < boardCardsArr[call][1]!.getValue()) {
                boardCardsArr[call][0]!.run(moveMyCards)
                let action = SKAction.sequence([moveDealerCards,cardLift,cardLower])
                boardCardsArr[call][1]!.run(action)
                add2DCardsToHand(hand: dealerCards, cardArr: boardCardsArr)
                prevWinPos = dealerCardsPos
            }
                
                // If another war occurs
            else {
                war()
            }
        } else {
            boardCardsArr[call][0]!.run(moveMyCards)
            boardCardsArr[call][1]!.run(moveDealerCards)
            war()
        }
    }
    
    // Move the cards from the board to the proper deck
    func moveCardsToPos(pos: CGPoint) {
        let moveMyCard = SKAction.move(to: pos, duration: 0.5)
        
        /*
         for card in cardsOnBoardArr {
         // Flip the card if it is faceUp
         if (card!.getFaceValue()){
         card!.flip()
         }
         card!.run(moveMyCard)
         }
         cardsOnBoardArr.removeAll()
         */
        
        for trick in boardCardsArr {
            for card in trick {
                // Flip the card if it is faceUp
                if (card!.getFaceValue()){
                    card!.flip()
                }
                card!.run(moveMyCard)
            }
        }
        boardCardsArr.removeAll()
    }
    
    // Brains of the game. Checks the value of the two cards being played
    func checkValue() {
        
        // If there are cards on the board and a new turn is starting,
        // move the cards to the proper deck of whomever last turn
        if (!cardsOnBoardArr.isEmpty) {
            moveCardsToPos(pos: prevWinPos)
            updateScore()
        }
        
        if (!boardCardsArr.isEmpty) {
            moveCardsToPos(pos: prevWinPos)
            updateScore()
        }
        
        // Put a card from each deck onto the board array,
        // then remove them from their respective decks
        draw()
    }
    
    // Checks the value of the cards on the board
    func checkCardsOnBoard() {
        let moveMyCards = SKAction.moveBy(x: -size.width/2 , y: -size.height/8, duration: 0.6)
        let moveDealerCards = SKAction.moveBy(x: -size.width/2, y: size.height/8, duration: 0.6)
        
        let cardLift = SKAction.scale(to: 0.8, duration: 0.2)
        let cardLower = SKAction.scale(to: 0.6, duration: 0.2)
        
        let wait = SKAction.wait(forDuration: 0.8)
        
        // if someone wins, pulse winning card and add both cards to deck
        //   also, move the cards back to the bottom of that deck
        // If myCard is greater
        if (boardCardsArr[0][0]!.getValue() > boardCardsArr[0][1]!.getValue()) {
            call = 0
            boardCardsArr[0][1]!.run(moveDealerCards)
            let action = SKAction.sequence([moveMyCards,cardLift,cardLower])
            boardCardsArr[0][0]!.run(action)
            add2DCardsToHand(hand: myCards, cardArr: boardCardsArr)
            prevWinPos = myCardsPos
        }
            
        // If dealerCard is greater
        else if (boardCardsArr[0][0]!.getValue() < boardCardsArr[0][1]!.getValue()) {
            call = 0
            boardCardsArr[0][0]!.run(moveMyCards)
            let action = SKAction.sequence([moveDealerCards,cardLift,cardLower])
            boardCardsArr[0][1]!.run(action)
            add2DCardsToHand(hand: dealerCards, cardArr: boardCardsArr)
            prevWinPos = dealerCardsPos
        }
            
        // If card values are equivalent. Trigger a war
        // if a war occurs
        //   pulse both cards, wait 1 second, then draw the next 2 from each deck
        //      first drawn card is face down, second is face up
        //   repeat the war until someone wins
        else {
            let action1 = SKAction.sequence([moveMyCards,cardLift,cardLower,wait])
            let action2 = SKAction.sequence([moveDealerCards,cardLift,cardLower,wait,SKAction.run(war)])
            boardCardsArr[call][0]!.run(action1)
            boardCardsArr[call][1]!.run(action2)
        }
        updateScore()
    }
    
    // Used to easily set the zPosition for different elements
    enum zLevel :CGFloat {
        case board = -1
        case card = 0
        case moving = 100
        case enlarged = 200
    }
    
}
