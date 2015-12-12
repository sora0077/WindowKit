//
//  Manager.swift
//  WindowKit
//
//  Created by 林達也 on 2015/12/12.
//  Copyright © 2015年 jp.sora0077. All rights reserved.
//

import Foundation
import UIKit.UIWindow
import UIKit.UIScreen
import UIKit.UIView

public protocol WindowLevel: Hashable {

    var rawValue: UInt { get }
}

public final class Manager<Level: WindowLevel> {
    
    private weak var _keyWindow: UIWindow?
    private var _windows: [Level: UIWindow] = [:]
    
    public init(keyWindow: UIWindow) {
        _keyWindow = keyWindow
    }
    
    public subscript (level: Level) -> UIWindow {
        
        if let window = _windows[level] {
            return window
        }
        
        let window = Window(frame: UIScreen.mainScreen().bounds)
        window.windowLevel = UIWindowLevelNormal + UIWindowLevel(level.rawValue)
        window.hidden = false
        _windows[level] = window
    
        return window
    }
    
}
