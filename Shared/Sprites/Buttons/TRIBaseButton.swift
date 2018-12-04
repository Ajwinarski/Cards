//
//  TRIBaseButton.swift
//  Tripeak
//
//  Created by CodeCaptain on 1/7/16.
//  Copyright © 2016 CodeCaptain. All rights reserved.
//

typealias ObjectSelectorPair = (object: TRIWeakContainer<NSObject>, selector: Selector)

import SpriteKit

class TRIBaseButton: SKSpriteNode {
  
  var hover: Bool = false {
    didSet {
      self.updateHover(true, hover: self.hover)
    }
  }
  
  private var targets: [ObjectSelectorPair] = [ObjectSelectorPair]()
  
  func addTarget(target: NSObject, selector: Selector) {
    let weakTarget = TRIWeakContainer(value: target)
    self.targets.append((object: weakTarget, selector: selector))
  }
  
  func removeTarget(target: NSObject, selector: Selector) {
    var index: Int = 0
    for objectSelectorPair: ObjectSelectorPair in self.targets {
      let obj = objectSelectorPair.object
      let sel = objectSelectorPair.selector
      if obj.value == target && sel == selector {
        self.targets.removeAtIndex(index)
      }
      index++
    }
  }
  
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    self.hover = true
  }
  
  override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
    self.hover = false
    let touch = touches.first!
    if let parent = self.parent {
      let point = touch.locationInNode(parent)
      if self.containsPoint(point) {
        self.handlePress()
      }
    }
  }
  
  override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
    let touch = touches.first!
    if let parent = self.parent {
      let point = touch.locationInNode(parent)
      if self.containsPoint(point) {
        self.hover = true
      } else {
        self.hover = false
      }
    }
  }
  
  func handlePress() {
    for objectSelectorPair: ObjectSelectorPair in self.targets {
      let obj = objectSelectorPair.object
      let sel = objectSelectorPair.selector
      obj.value!.performSelector(sel)
    }
  }
  
  func updateHover(animated: Bool, hover: Bool) {
    var alpha: CGFloat = 1.0
    if !hover {
      alpha = 0.2
    }
    if animated {
      let action: SKAction = SKAction.fadeAlphaTo(alpha, duration: 0.1)
      self.runAction(action)
    } else {
      self.alpha = alpha
    }
  }
  
}
