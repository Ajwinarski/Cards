//
//  Card.swift
//  Cards!
//
//  Created by Austin Winarski on 3/4/18.
//  Copyright © 2018 AustinsApps. All rights reserved.
//

import SpriteKit
import Foundation

// Card: SKSpriteNode
// Used to hold the info for the proper ranks and suits of a deck of playing cards
class Card : SKSpriteNode {
    
    /* VARIABLES */
    private var suit: String = ""
    private var value: Int = 0
    private var faceUp: Bool = false
    
    /* TEXTURES */
    private var cardBack: String = "CardBackBlue"
    private var frontTexture: SKTexture!
    private var backTexture = SKTexture(imageNamed: "CardBackBlack")
    private var cardsSize: CGSize = GameSceneLayout.cardSize
    
    // Initialization function
    init(value: Int , suit: String , faceUp: Bool) {
        self.suit = suit
        self.value = value
        self.faceUp = faceUp
        
        // Make a texture and set the image equal to the string of the asset name
        let texture: SKTexture
        frontTexture = SKTexture(imageNamed: String(value) + suit)
        
        // Determine which side of the card you want to show
        if self.faceUp {
            texture = frontTexture
        } else {
            texture = backTexture
        }
        super.init(texture: texture, color: SKColor.clear, size: texture.size())
    }
    
    // Rank: enum
    // Used to generate the rank for the playing cards
    // type: Int
    enum Rank: Int {
        case two = 2
        case three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        
        static let allRanks = [
            Rank.two,
            Rank.three,
            Rank.four,
            Rank.five,
            Rank.six,
            Rank.seven,
            Rank.eight,
            Rank.nine,
            Rank.ten,
            Rank.jack,
            Rank.queen,
            Rank.king,
            Rank.ace,
        ]
        
        // Used to describe the name or value of the card
        func description() -> String {
            switch self {
            case .ace:
                return "Ace"
            case .jack:
                return "Jack"
            case .queen:
                return "Queen"
            case .king:
                return "King"
            default:
                return String(self.rawValue)
            }
        }
        
        // used to get the value associated with the number
        func value() -> Int {
            switch self {
            case .jack:
                return 11
            case .queen:
                return 12
            case .king:
                return 13
            case .ace:
                return 20
            default:
                return Int(self.rawValue)
            }
        }
    }
    
    // Suit: enum
    // Used to generate the suit for the playing cards
    // type String
    enum Suit: String {
        case spades, hearts, diamonds, clubs
        
        static let allSuits = [
            Suit.spades,
            Suit.hearts,
            Suit.diamonds,
            Suit.clubs
        ]
        
        // Used to describe the suit of the card
        func description() -> String {
            switch self {
            case .spades:
                return "S"
            case .hearts:
                return "H"
            case .diamonds:
                return "D"
            case .clubs:
                return "C"
            }
        }
    }
    
    // Gets value of card
    func getValue()->Int {
        return value
    }

    // Returns 1 if faceUp, 0 if faceDown
    func getFaceValue()->Bool {
        if self.faceUp {
            return true
        } else {
            return false
        }
    }
    
    //////////////////////////////////////////////////////////
    /////                   ANIMATIONS                  //////
    //////////////////////////////////////////////////////////
    
    // Flips card over
    func flip() {
        let flipFirstHalf = SKAction.scaleX(to: 0, duration: 0.12)
        let flipLastHalf = SKAction.scaleX(to: 0.6, duration: 0.12)
        var changeTexture: SKAction
        
        if faceUp {
            changeTexture = SKAction.setTexture(backTexture)
        } else {
            changeTexture = SKAction.setTexture(frontTexture)
        }
        
        //playFlip()
        
        // Flips halfway, changes texture, then flips the last half
        let action = SKAction.sequence([flipFirstHalf, changeTexture, flipLastHalf])
        self.run(action)
        
        faceUp = !faceUp
    }
    
    // Enlarge and shrink the card similar to a pulse
    func pulse() {
        let cardLift = SKAction.scale(to: 0.8, duration: 0.15)
        let cardLower = SKAction.scale(to: 0.6, duration: 0.15)
        //let cardFlash = SKAction.fadeAlpha(by: 0.8, duration: 0.4)
        //self.run(cardFlash)
        let action = SKAction.sequence([cardLift,cardLower])
        self.run(action)
    }
    
    //  Don't worry abut this (required for error checking SKSpriteNode)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
