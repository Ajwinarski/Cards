//
//  TRIBaseOverlay.swift
//  Tripeak
//
//  Created by CodeCaptain on 1/7/16.
//  Copyright © 2016 CodeCaptain. All rights reserved.
//

import SpriteKit

class TRIBaseOverlay: SKNode {
  
  weak var gameScene: TRIGameScene?
  weak private var backgroundSprite: SKSpriteNode!
  internal var sizeReference: CGSize!
  internal var center: CGPoint {
    get {
      return CGPoint(
        x: self.sizeReference.width / 2,
        y: self.sizeReference.height / 2
      )
    }
  }
  
  init(withSize size: CGSize) {
    super.init()
    self.setup(withSize: size)
  }
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
  }
  
  func hide(completion: (() -> Void)?) {
    // Create a fade action
    let action = SKAction.fadeAlphaTo(
      0,
      duration: 0.3
    )
    // Run the action on self
    self.runAction(
      action,
      completion: {
        self.hidden = true
        self.alpha = 1.0
        // If we have a completion block, execute it
        if let completion = completion {
          completion()
        }
    })
  }
  
  internal func fadeInBackground() {
    self.backgroundSprite.alpha = 0
    // Create the action
    let bgFadeAction = SKAction.fadeAlphaTo(
      1.0,
      duration: 0.5
    )
    bgFadeAction.timingMode = .EaseOut
    // Run the action on the background
    self.backgroundSprite.runAction(bgFadeAction)
  }
  
  internal func fadeIn(
    element: SKNode,
    delay: NSTimeInterval,
    completion: (() -> Void)?) {
      
      element.alpha = 0
      
      // Create an action array
      var actions: [SKAction] = []
      // If the delay is set, add a wait action
      if delay > 0 {
        let delayAction = SKAction.waitForDuration(delay)
        // Add it to the array
        actions.append(delayAction)
      }
      
      // Create a fade action
      let fadeAction = SKAction.fadeAlphaTo(1.0, duration: 0.8)
      fadeAction.timingMode = .EaseOut
      // Add it to the array
      actions.append(fadeAction)
      
      // Run an action sequence with the actions array on the input element
      element.runAction(SKAction.sequence(actions), completion: {
        // If we have a completion, run it
        if let completion = completion {
          completion()
        }
      })
      
  }
  
  internal func animateElementUp(
    element: SKNode,
    endPosition: CGPoint,
    completion: (() -> Void)?) {
      
      // Set the position offset
      let offset: CGFloat = 20.0
      
      element.alpha = 0
      
      // Calculate the starting point
      let point = CGPoint(
        x: endPosition.x,
        y: endPosition.y - offset
      )
      element.position = point
      
      // Wait action
      let elementDelayAction = SKAction.waitForDuration(0.4)
      
      // Move action
      let elementMoveAction = SKAction.moveTo(
        endPosition,
        duration: 0.4
      )
      elementMoveAction.timingMode = .EaseOut
      
      // Fade action
      let elementFadeAction = SKAction.fadeAlphaTo(
        1.0,
        duration: 0.4
      )
      elementFadeAction.timingMode = .EaseOut
      
      // Create a group with the move and fade action
      let elementGroupAction = SKAction.group(
        [elementMoveAction, elementFadeAction]
      )
      
      // Run the action sequence
      element.runAction(
        SKAction.sequence([elementDelayAction, elementGroupAction]),
        completion: {
          // If we have a completion block, execute it
          if let completion = completion {
            completion()
          }
      })
  }
  
  internal func setup(withSize size: CGSize) {
    
    self.sizeReference = size
    
    // Create the background sprite
    let backgroundSprite = SKSpriteNode(
      color: SKColor.blackColor().colorWithAlphaComponent(0.95),
      size: self.sizeReference
    )
    
    backgroundSprite.position = self.center
    self.addChild(backgroundSprite)
    self.backgroundSprite = backgroundSprite
    
    self.hidden = true
    
  }
  
}
