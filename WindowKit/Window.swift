//
//  Window.swift
//  WindowKit
//
//  Created by 林達也 on 2015/12/13.
//  Copyright © 2015年 jp.sora0077. All rights reserved.
//

import Foundation
import UIKit.UIWindow

final class Window: UIWindow {
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        
        guard let v = super.hitTest(point, withEvent: event) where v != self else {
            return nil
        }
        
        if v == self.rootViewController?.view {
            return nil
        }
        
        return v
    }
}
