//
//  Pokemon.swift
//  Not-A-Plant-Identifier
//
//  Created by The Bootlegged Pokémon Company on 9/16/19.
//  Copyright © The Bootlegged Pokémon Company. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    let number: String
    let name: String
    let ThumbnailImage: String
    let type: [String]
    
     static func getFilteredPokemonByName(arr: [Pokemon], searchString: String) -> [Pokemon] {
        return arr.filter{$0.name.lowercased().contains(searchString.lowercased())}
    }
    
    static func getFilteredPokemonByNumber(arr: [Pokemon], searchString: String) -> [Pokemon] {
        return arr.filter{$0.number.lowercased().contains(searchString.lowercased())}
    }
    
    static func getFilteredPokemonByType(arr: [Pokemon], searchString: String) -> [Pokemon] {
        return arr.filter{$0.type.joinedStringFromArray.lowercased().contains(searchString.lowercased())}
    }
    
    static func getSortedName(arr: [Pokemon]) -> [Pokemon] {
        return arr.sorted{$0.name < $1.name}
       
    }
    
    static func getSortedNumber(arr: [Pokemon]) -> [Pokemon] {
        return arr.sorted{$0.number < $1.number}
    }
}

extension Pokemon: Equatable {
    static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        return lhs.number == rhs.number &&
            lhs.name == rhs.name &&
            lhs.ThumbnailImage == rhs.ThumbnailImage &&
            lhs.type == rhs.type
    }
}

