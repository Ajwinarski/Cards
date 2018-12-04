//
//  GameSceneLayout.swift
//  Cards!
//
//  Created by Austin Winarski on 10/17/18.
//  Copyright © 2018 AustinsApps. All rights reserved.
//

import UIKit

class GameSceneLayout: NSObject {
    
    static var tripeakOffsetBetweenCards: CGFloat = 2.0
    static var cardSizeMultiplier = 0.75
    static var cardSize: CGSize = CGSize(
        width: 77 * cardSizeMultiplier,
        height: 104 * cardSizeMultiplier
    )
}
