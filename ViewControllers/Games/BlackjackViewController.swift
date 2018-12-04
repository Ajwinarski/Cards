//
//  BlackjackViewController.swift
//  Cards!
//
//  Created by Austin Winarski on 9/7/18.
//  Copyright © 2018 AustinsApps. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class BlackjackViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Define the scene to be presented
            let scene = Blackjack(size: view.bounds.size)
            
            // Set the scale mode to fit the window
            scene.scaleMode = .aspectFill
            
            // Present the scene
            view.showsFPS = false
            view.showsNodeCount = false
            view.ignoresSiblingOrder = false
            view.presentScene(scene)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
