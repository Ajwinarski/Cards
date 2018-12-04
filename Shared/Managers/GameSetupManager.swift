//
//  GameSetupManager.swift
//  Cards!
//
//  Created by Austin Winarski on 10/17/18.
//  Copyright © 2018 AustinsApps. All rights reserved.
//

import UIKit

class GameSetupManager: NSObject {

    private weak var gameScene: GameScene?
    private var cardDeck: [CardModel] = []
    
    init(gameScene: GameScene) {
        super.init()
        self.gameScene = gameScene
    }
    
    func setup() {
        self.createDeck()
        self.shuffleDeck()
        self.setupTripeak()
    }
    
    func createDeck() {
        for suit: Suit in Suit.allSuits {
            for rank: Rank in Rank.allRanks {
                self.cardDeck.append(
                    CardModel(suit: suit, rank: rank)
                )
            }
        }
    }
    
    func shuffleDeck() {
        cardDeck.shuffle()
    }
    
    func setupPeakWithTopPositionAtPoint(point:CGPoint) -> [Cards] {
        let dummyCard = Cards()
        let offset = GameSceneLayout.tripeakOffsetBetweenCards
        var x: CGFloat = 0
        var y: CGFloat = 0
        
        // Top Card
        x = point.x
        y = point.y - dummyCard.size.height / 2
        let topCard = self.createCard(x: x, y: y)
        
        // Middle Left Card
        x = topCard.position.x - topCard.size.width / 2 - offset
        y = topCard.position.y - topCard.size.height / 2
        let middleLeftCard = self.createCard(x: x, y: y)
        
        // Middle Right Card
        x = topCard.position.x + topCard.size.width / 2 + offset
        y = topCard.position.y - topCard.size.height / 2
        let middleRightCard = self.createCard(x: x, y: y)
        
        // Bottom Left Card
        x = middleLeftCard.position.x - middleLeftCard.size.width / 2 - offset
        y = middleLeftCard.position.y - middleLeftCard.size.height / 2
        let bottomLeftCard = self.createCard(x: x, y: y)
        
        // Bottom Middle Card
        x = topCard.position.x
        y = middleLeftCard.position.y - middleLeftCard.size.height / 2
        let bottomMiddleCard = self.createCard(x: x, y: y)
        
        // Bottom Right Card
        x = middleRightCard.position.x + middleRightCard.size.width / 2 + offset
        y = middleLeftCard.position.y - middleLeftCard.size.height / 2
        let bottomRightCard = self.createCard(x: x, y: y)
        
        return [topCard,
            middleLeftCard, middleRightCard,
            bottomLeftCard, bottomMiddleCard, bottomRightCard]
    }
    
    func setupTripeak() {
        self.setupPeakWithTopPositionAtPoint(point: CGPoint(x: self.gameScene!.size.width / 2,
                                                            y: self.gameScene!.size.height / 2))
    }
    
    private func createCard(x: CGFloat, y: CGFloat) -> Cards {
        let card = Cards(cardModel: (cardDeck.first!))
        card.position = CGPoint(x: x, y: y)
        self.gameScene!.addChild(card)
        
        return card
    }
}
