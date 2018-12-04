//
//  MenuViewController.swift
//  Cards!
//
//  Created by Austin Winarski on 5/10/18.
//  Copyright © 2018 AustinsApps. All rights reserved.
//

import UIKit
import SpriteKit

class MenuViewController: UIViewController {

    //let background = SKSpriteNode(imageNamed: "BackDrop.pdf")
    
    override func viewDidLoad() {
        print("Max Length \(ScreenSize.SCREEN_MAX_LENGTH).")
        print("Min Length \(ScreenSize.SCREEN_MIN_LENGTH).")
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
        }
    }
}
