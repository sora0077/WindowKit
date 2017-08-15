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
    static var mainWindowLevel: Self { get }
}

public final class Manager<Level: WindowLevel> {
    public var mainWindow: UIWindow { return _mainWindow }
    private weak var _mainWindow: UIWindow!
    private var _windows: [Level: UIWindow] = [:]

    public init(mainWindow: UIWindow) {
        _mainWindow = mainWindow
    }

    public subscript (level: Level) -> UIWindow {
        if level == .mainWindowLevel {
            return _mainWindow
        }
        return _windows[level] ?? {
            let window = Window(frame: UIScreen.main.bounds)
            window.windowLevel = UIWindowLevelNormal + UIWindowLevel(level.rawValue)
            window.isHidden = false
            _windows[level] = window
            return window
        }()
    }
}
