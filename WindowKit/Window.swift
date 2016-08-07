//
//  Window.swift
//  WindowKit
//
//  Created by 林達也 on 2015/12/13.
//  Copyright © 2015年 jp.sora0077. All rights reserved.
//

import Foundation
import UIKit.UIWindow

public protocol Transparentable {}

final class Window: UIWindow, Transparentable {
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        guard let v = super.hitTest(point, with: event) else { return nil }
        
        if v == self { return nil }
        
        if v == self.rootViewController?.view { return nil }
        
        if let _ = v as? Transparentable { return nil }
        
        return v
    }
}
