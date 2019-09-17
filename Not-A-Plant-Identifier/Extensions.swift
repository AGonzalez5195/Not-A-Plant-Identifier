//
//  Extensions.swift
//  Not-A-Plant-Identifier
//
//  Created by Anthony Gonzalez on 9/17/19.
//  Copyright © 2019 The Bootlegged Pokémon Company. All rights reserved.
//

import Foundation

extension Sequence {
    var joinedStringFromArray: String {
        return map { "\($0)" }.joined(separator: ", ")
    }
}
