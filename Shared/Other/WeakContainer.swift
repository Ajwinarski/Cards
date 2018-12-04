//
//  WeakContainer.swift
//  Cards!
//
//  Created by Austin Winarski on 10/16/18.
//  Copyright © 2018 AustinsApps. All rights reserved.
//

class WeakContainer<T: AnyObject> {
    weak var value: T?
    
    init (value: T) {
        self.value = value
    }
}
