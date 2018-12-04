//
//  TRISimpleButton.swift
//  Tripeak
//
//  Created by CodeCaptain on 1/8/16.
//  Copyright © 2016 CodeCaptain. All rights reserved.
//

import SpriteKit

class TRISimpleButton: TRIBaseButton {
  
  private weak var defaultImg: SKSpriteNode?
  private weak var background: SKSpriteNode?
  
  override init(texture: SKTexture?, color: SKColor, size: CGSize) {
    super.init(texture: texture, color: color, size: size)
  }
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
  }
  
  convenience init(image: String, size: CGSize, color: UIColor) {
    self.init()
    
    self.size = size
    
    let background = SKSpriteNode(
      texture: nil,
      color: color,
      size: self.size
    )
    self.addChild(background)
    self.background = background
    
    let defaultImg = SKSpriteNode(
      imageNamed: image
    )
    self.addChild(defaultImg)
    let iconWidth: CGFloat = 25.0
    let aspect = iconWidth / defaultImg.size.height
    defaultImg.size = CGSize(
      width: iconWidth,
      height: iconWidth / aspect
    )
    self.defaultImg = defaultImg
    
    self.updateHover(
      false,
      hover: self.hover
    )
    
  }
  
  convenience init(image: String, size: CGSize) {
    self.init(image: image, size: size, color: UIColor.blackColor())
  }
  
  override func updateHover(animated: Bool, hover: Bool) {
    var alpha: CGFloat = 0.8
    if !hover {
      alpha = 0.2
    }
    if animated {
      let action: SKAction = SKAction.fadeAlphaTo(
        alpha,
        duration: 0.2
      )
      self.background!.runAction(action)
    } else {
      self.background!.alpha = alpha
    }
  }
  
}
