//
//  Extensions.swift
//  Not-A-Plant-Identifier
//
//  Created by Anthony Gonzalez on 9/17/19.
//  Copyright © 2019 The Bootlegged Pokémon Company. All rights reserved.
//

import Foundation
import UIKit


extension Sequence {
    var joinedStringFromArray: String {
        return map { "\($0)" }.joined(separator: ", ")
    }
}

extension UIButton {
    func shake() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 10, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 10, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: nil)
    }
    
}
