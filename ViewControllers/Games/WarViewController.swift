//
//  WarViewController.swift
//  Cards!
//
//  Created by Austin Winarski on 5/10/18.
//  Copyright © 2018 AustinsApps. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class WarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let view = self.view as! SKView? {
            //let scene = War(size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            let scene = War(size: view.bounds.size)
            
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
