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


public protocol WindowLevel: Hashable {

    var rawValue: Int { get }
}

public final class Manager<Level: WindowLevel> {
    
    public var keyWindow: UIWindow { return _keyWindow }
    private weak var _keyWindow: UIWindow!
    private var _windows: [Level: UIWindow] = [:]
    
    public init(keyWindow: UIWindow) {
        _keyWindow = keyWindow
    }
    
    public subscript (level: Level) -> UIWindow {
        
        if level.rawValue == 0 {
            return _keyWindow
        }
        
        if let window = _windows[level] {
            return window
        }
        
        let window = Window(frame: UIScreen.main().bounds)
        window.windowLevel = UIWindowLevelNormal + UIWindowLevel(level.rawValue)
        window.isHidden = false
        _windows[level] = window
    
        return window
    }
    
}
