//
//  MenuScene.swift
//  Cards!
//
//  Created by Austin Winarski on 4/3/18.
//  Copyright © 2018 AustinsApps. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    
    let background = SKSpriteNode(imageNamed: "BackDrop.pdf")
    
    override func didMove(to view: SKView) {
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.size.height = self.size.height + 10
        background.size.width = self.size.width + 10
        self.addChild(background)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            // if you click the node, do something
            if node == background {
                if view != nil {
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = GameScene(size:CGSize(width: screenWidth, height: screenHeight))
                    //let scene:SKScene =
                    self.view?.presentScene(scene, transition: transition)
                }
            }
        }
    }
    
    // Screen width.
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    // Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
}
