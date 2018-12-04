//
//  GameScene.swift
//  Tripeak_iOS
//
//  Created by CodeCaptain on 12/30/15.
//  Copyright (c) 2015 CodeCaptain. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    private var gameSetupManager: GameSetupManager?
  
    override func didMove(to: SKView) {
        let gameSetupManager = GameSetupManager(gameScene: self)
        self.gameSetupManager = gameSetupManager
        self.gameSetupManager!.setup()
    }
  
}
