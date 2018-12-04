//
//  Suit.swift
//  Cards!
//
//  Created by Austin Winarski on 10/17/18.
//  Copyright © 2018 AustinsApps. All rights reserved.
//

import Foundation

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
