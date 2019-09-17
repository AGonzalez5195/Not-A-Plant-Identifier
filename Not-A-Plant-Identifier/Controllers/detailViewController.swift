//
//  detailViewController.swift
//  Not-A-Plant-Identifier
//
//  Created by The Bootlegged Pokémon Company on 9/16/19.
//  Copyright © The Bootlegged Pokémon Company. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {
    //MARK: -- Outlets
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonNumberLabel: UILabel!
    @IBOutlet weak var pokemonWeightLabel: UILabel!
    @IBOutlet weak var pokemonHeightLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var pokemonImage: UIImageView!
    
    //MARK: -- Properties
    var currentPokemonURL = String()
    var currentPokemonType = String()
    
    //MARK: -- IBActions
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: -- Functions
    private func loadData(from URL: String) {
        PokeAPI.getPokemonData(pokeAPIURL: URL) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let pokemonData):
                    self.setUpInformation(from: pokemonData)
                    self.loadImage(from: pokemonData)
                }
            }
        }
    }
    
    private func loadImage(from pokemonData: PokeAPI) {
        self.spinner.isHidden = false
        self.spinner.startAnimating()
        ImageHelper.shared.fetchImage(urlString: pokemonData.sprites.pokemonSprite) { (result) in
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
    
    private func setBackgroundColor(){
        let Type = PokemonType(rawValue: currentPokemonType)
        Type?.setBGColor(view: view)
    }
    
    private func setUpInformation(from Pokemon: PokeAPI) {
        pokemonNameLabel.text = Pokemon.name.capitalized
        pokemonHeightLabel.text = "Ht: \(Pokemon.height)"
        pokemonWeightLabel.text = "Wt: \(Pokemon.weight)"
        pokemonNumberLabel.text = "#\(Pokemon.id)"
        
    }
    
    private func prettifyUI () {
        backButton.layer.cornerRadius = 5
        backButton.layer.borderColor = UIColor.white.cgColor
        backButton.layer.borderWidth = 1.0
        setBackgroundColor()
        setCircleOutline()
    }
    
    private func setCircleOutline() {
        pokemonImage.layer.cornerRadius = pokemonImage.frame.size.width/2
        pokemonImage.clipsToBounds = true
        
        pokemonImage.layer.borderColor = UIColor.white.cgColor
        pokemonImage.layer.borderWidth = 2.0
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prettifyUI()
        loadData(from: currentPokemonURL)
        print(currentPokemonURL)
    }
}
