//
//  Pokemon.swift
//  collectionviewtest
//
//  Created by The Bootlegged Pokémon Company on 9/16/19.
//  Copyright © The Bootlegged Pokémon Company. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    let abilities: [String]
    let weight: Double
    let number: String
    let height: Double
    let name: String
    let ThumbnailImage: String
    let type: [String]
    
     static func getFilteredPokemonByName(arr: [Pokemon], searchString: String) -> [Pokemon] {
        return arr.filter{$0.name.lowercased().contains(searchString.lowercased())}
    }
    
    static func getFilteredPokemonByNumber(arr: [Pokemon], searchString: String) -> [Pokemon] {
        return arr.filter{$0.number.lowercased().contains(searchString.lowercased())}
    }
}

