//
//  Discard.swift
//  Cards!
//
//  Created by Austin Winarski on 6/10/18.
//  Copyright © 2018 AustinsApps. All rights reserved.
//

import Foundation
import SpriteKit

class Discard {
    private var discard = [Card]()
    
    func discard(card: Card) {
        discard.append(card)
    }
    
    func reset() {
        discard.removeAll()
    }
    
    func length()-> Int {
        return discard.count
    }
}
