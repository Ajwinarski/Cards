//
//  TRIWireButton.swift
//  Tripeak
//
//  Created by CodeCaptain on 1/7/16.
//  Copyright © 2016 CodeCaptain. All rights reserved.
//

import SpriteKit

class TRIWireButton: TRIBaseButton {
  
  var action: Selector?
  
  var border: SKShapeNode!
  var label: SKLabelNode!
  var icon: SKSpriteNode!
  
  convenience init(color: SKColor, size: CGSize, title: String) {
    self.init()
    
    self.size = size
    
    let position = CGPoint(x: 0, y: 0)
    let borderSize = CGSize(width: size.width, height: size.height)
    self.border = SKShapeNode(
      rect: CGRect(
        origin: position,
        size: borderSize
      ),
      cornerRadius: 2.0
    )
    self.border.lineWidth = 4.0
    self.border.strokeColor = color
    self.border.position = CGPoint(
      x: -size.width / 2,
      y: -size.height / 2
    )
    self.addChild(self.border)
    
    self.label = SKLabelNode(text: title)
    self.addChild(self.label)
    self.label.fontSize = 24
    self.label.fontName = Fonts.HelveticaNeueLight.rawValue
    self.label.horizontalAlignmentMode = .Center
    self.label.verticalAlignmentMode = .Center
    
    self.updateHover(false, hover: self.hover)
    
  }
  
  convenience init(color: SKColor, size: CGSize, title: String, image: String) {
    self.init()
    
    self.size = size
    
    self.icon = SKSpriteNode(imageNamed: image)
    let aspectRatio = self.icon.size.width / self.icon.size.height
    let newSize = size.height * 0.5
    self.icon.size = CGSize(
      width: newSize,
      height: newSize / aspectRatio
    )
    self.addChild(self.icon)
    
    let position = CGPoint(x: 0, y: 0)
    let size = CGSize(width: size.width, height: size.height)
    self.border = SKShapeNode(
      rect: CGRect(
        origin: position,
        size: size
      ),
      cornerRadius: 2.0
    )
    self.border.lineWidth = 4.0
    self.border.strokeColor = color
    self.border.lineJoin = .Round
    self.border.position = CGPoint(
      x: -size.width / 2,
      y: -size.height / 2
    )
    self.addChild(self.border)
    
    self.label = SKLabelNode(text: title)
    self.addChild(self.label)
    self.label.fontName = Fonts.HelveticaNeueLight.rawValue
    self.label.position = CGPoint(
      x: self.label.position.x,
      y: -self.size.height / 2
    )
    
    self.updateHover(false, hover: self.hover)
    
  }
  
  override func updateHover(animated: Bool, hover: Bool) {
    var alpha: CGFloat = 1.0
    if !hover {
      alpha = 0.25
    }
    if animated {
      let action: SKAction = SKAction.fadeAlphaTo(alpha, duration: 0.1)
      self.border.runAction(action)
      self.label.runAction(action)
    } else {
      self.border.alpha = alpha
      self.label.alpha = alpha
    }
  }
  
  func updateLabelPosition() {
    self.label.position = CGPoint(
      x: self.label.position.x,
      y: self.label.position.y - self.label.fontSize - 20
    )
  }
  
}
