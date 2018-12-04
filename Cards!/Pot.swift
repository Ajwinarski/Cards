//
//  Pot.swift
//  Cards!
//
//  Created by Austin Winarski on 9/7/18.
//  Copyright © 2018 AustinsApps. All rights reserved.
//

class Pot {
    private var pot = 0
    
    func addMoney(amount: Int){
        pot += amount
    }
    
    func getMoney()->Int{
        return pot
    }
    
    func reset(){
        pot = 0
    }
}
