//
//  PokeAPI.swift
//  Not-A-Plant-Identifier
//
//  Created by The Bootlegged Pokémon Company on 9/16/19.
//  Copyright © The Bootlegged Pokémon Company. All rights reserved.
//

import Foundation

struct PokeAPI: Codable {
    let name: String
    let height: Double
    let weight: Double
    let id: Int
    let sprites: Sprites
    let stats: [Stat]
    
    
    static func getPokemonData(pokeAPIURL: String, completionHandler: @escaping (Result<PokeAPI,AppError>) -> () ) {
        
        NetworkManager.shared.fetchData(urlString: pokeAPIURL) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let pokeAPIData = try JSONDecoder().decode(PokeAPI.self, from: data)
                    completionHandler(.success(pokeAPIData))
                } catch {
                    completionHandler(.failure(.badJSONError))                }
            }
        }
    }
}

struct Sprites: Codable {
    let defaultPokemonSprite: String
    let shinyPokemonSprite: String

    enum CodingKeys: String, CodingKey {
        case defaultPokemonSprite = "front_default"
        case shinyPokemonSprite = "front_shiny"
    }
}

struct Stat: Codable {
    let base_stat: Int
}
