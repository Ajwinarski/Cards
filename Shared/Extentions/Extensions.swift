//
//  Extensions.swift
//  Cards!
//
//  Created by Austin Winarski on 3/5/18.
//  Copyright © 2018 AustinsApps. All rights reserved.
//

import Foundation

//The Fisher-Yates / Knuth shuffle
extension Array {
    mutating func shuffle() {
        if count < 2 { return }
        for i in 0..<(count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            if i != j {
                (self[i], self[j]) = (self[j], self[i])
            }
        }
    }
}
