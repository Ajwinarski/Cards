//
//  Cards.swift
//  Cards!
//
//  Created by Austin Winarski on 10/17/18.
//  Copyright © 2018 AustinsApps. All rights reserved.
//

import SpriteKit

class Cards: SKNode {
    
    var cardModel: CardModel?
    weak var front: SKSpriteNode?
    var size: CGSize = GameSceneLayout.cardSize
    
    override init() {
        super.init()
    }
    
    init(cardModel: CardModel) {
        super.init()
        self.cardModel = cardModel
        let front = SKSpriteNode(imageNamed: cardModel.asset)
        front.size = size
        self.addChild(front)
        self.front = front
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
