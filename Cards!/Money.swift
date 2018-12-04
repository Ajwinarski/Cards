//
//  Money.swift
//  Cards!
//
//  Created by Austin Winarski on 9/7/18.
//  Copyright © 2018 AustinsApps. All rights reserved.
//

import Foundation
import SpriteKit

class Money: SKSpriteNode {
    // Default value to 1
    private var moneyValue = MoneyValue.one
    
    // Take in either a one, five, ten, twentyFive,
    //                  oneHundred, or fiveHundred
    init(moneyValue: MoneyValue) {
        var texture:SKTexture
        self.moneyValue = moneyValue
        
        switch moneyValue {
        case .one:
            texture = SKTexture(imageNamed: "1")
        case .five:
            texture = SKTexture(imageNamed: "5")
        case .ten:
            texture = SKTexture(imageNamed: "10")
        case .twentyFive:
            texture = SKTexture(imageNamed: "25")
        case .oneHundred:
            texture = SKTexture(imageNamed: "100")
        case .fiveHundred:
            texture = SKTexture(imageNamed: "500")
        }
        super.init(texture: texture, color: SKColor.clear, size: texture.size())
        self.name = "money"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func getValue()->MoneyValue{
        return moneyValue
    }
}

enum MoneyValue: Int{
    case one = 1
    case five = 5
    case ten = 10
    case twentyFive = 25
    case oneHundred = 100
    case fiveHundred = 500
}
