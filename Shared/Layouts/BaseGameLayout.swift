//
//  BaseGameLayout.swift
//  Cards!
//
//  Created by Austin Winarski on 10/16/18.
//  Copyright © 2018 AustinsApps. All rights reserved.
//

import Foundation
import UIKit


enum BaseGameLayoutDevice: Int {
    case IPhone4OrLess
    case IPhone5_SE
    case IPhone6_7_8
    case IPhone6P_7P_8P
    case IPhoneX_XS
    case IPhoneXR_XSM
    case IPad6OrLess
    case IPadPro10
    case IPadPro12
}

class BaseGameLayout: NSObject {
    
    class func setup(layout: BaseGameLayoutDevice) {
        switch layout {
        case .IPhone4OrLess:
            self.setupIphone4OrLess()
            break
        case .IPhone5_SE:
            self.setupIphone5_SE()
            break
        case .IPhone6_7_8:
            self.setupIphone6_7_8()
            break
        case .IPhone6P_7P_8P:
            self.setupIphone6P_7P_8P()
            break
        case .IPhoneX_XS:
            self.setupIphoneX_XS()
            break
        case .IPhoneXR_XSM:
            self.setupIphoneXR_XSM()
            break
        case .IPad6OrLess:
            self.setupIpad6OrLess()
            break
        case .IPadPro10:
            self.setupIpadPro10()
            break
        case .IPadPro12:
            self.setupIpadPro12()
            break
        }
    }
    
    class func setupIphone4OrLess() {
        print("GameLayout - <= iPhone 4")
    }
    class func setupIphone5_SE() {
        print("GameLayout - iPhone 5/SE")
    }
    class func setupIphone6_7_8() {
        print("GameLayout - iPhone 6/7/8")
    }
    class func setupIphone6P_7P_8P() {
        print("GameLayout - iPhone 6+/7+/8+")
    }
    class func setupIphoneX_XS() {
        print("GameLayout - iPhone X/XS")
    }
    class func setupIphoneXR_XSM() {
        print("GameLayout - iPhone X/XS")
    }
    class func setupIpad6OrLess() {
        print("GameLayout - <= iPad 6")
    }
    class func setupIpadPro10() {
        print("GameLayout - iPad Pro 10.5")
    }
    class func setupIpadPro12() {
        print("GameLayout - iPad Pro 12.9")
    }
    
}
