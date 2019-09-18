//
//  PokeAPIClient.swift
//  Not-A-Plant-Identifier
//
//  Created by The Bootlegged Pokémon Company on 9/16/19.
//  Copyright © The Bootlegged Pokémon Company. All rights reserved.
//

import Foundation

class PokeAPIClient {
    private init() {}
    static let shared = PokeAPIClient()
    
    func getPokemon(completionHandler: @escaping (Result<[Pokemon],AppError>) -> Void ) {
        let urlStr = "https://www.pokemon.com/us/api/pokedex/Alola"
        NetworkManager.shared.fetchData(urlString: urlStr) { (result) in
            switch result {
            case .failure(let appError):
                completionHandler(.failure(appError))
            case .success(let data):
                do {
                    let data = try JSONDecoder().decode([Pokemon].self, from: data)
                    completionHandler(.success(data))
                } catch {
                    completionHandler(.failure(.badJSONError))                }
            }
        }
    }
    
    func getFavoritePokemon(searchString: String, completionHandler: @escaping (Result<[Pokemon],AppError>) -> Void ) {
        let urlStr = "https://www.pokemon.com/us/api/pokedex/"
        NetworkManager.shared.fetchData(urlString: urlStr) { (result) in
            switch result {
            case .failure(let appError):
                completionHandler(.failure(appError))
            case .success(let data):
                do {
                    let data = try JSONDecoder().decode([Pokemon].self, from: data)
                    completionHandler(.success(Pokemon.getFilteredPokemonByName(arr: data , searchString: searchString)))
                } catch {
                    completionHandler(.failure(.badJSONError))                }
            }
        }
    }

}

