//
//  PokemonCollectionViewCell.swift
//  Not-A-Plant-Identifier
//
//  Created by The Bootlegged Pokémon Company on 9/16/19.
//  Copyright © The Bootlegged Pokémon Company. All rights reserved.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    
    func configureCell (with Pokemon: Pokemon) {
        self.backgroundColor = #colorLiteral(red: 0.7970843911, green: 1, blue: 0.5273691416, alpha: 1)
        self.pokemonNameLabel.text = Pokemon.name
        
        self.spinner.isHidden = false
        self.spinner.startAnimating()
        ImageHelper.shared.fetchImage(urlString: Pokemon.ThumbnailImage) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let imageFromOnline):
                    self.pokemonImage.image = imageFromOnline
                    self.spinner.isHidden = true
                    self.spinner.stopAnimating()
                }
            }
        }
    }
}
