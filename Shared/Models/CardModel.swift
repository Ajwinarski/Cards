//
//  CardModel.swift
//  Cards!
//
//  Created by Austin Winarski on 10/17/18.
//  Copyright © 2018 AustinsApps. All rights reserved.
//

import Foundation

class CardModel: NSObject {

    var suit: Suit
    var rank: Rank
    var asset: String {
        get {
            // Return the rank value followed by the suit letter
            return "\(rank.rawValue)\(suit.description)"
        }
    }
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
        super.init()
    }

}
