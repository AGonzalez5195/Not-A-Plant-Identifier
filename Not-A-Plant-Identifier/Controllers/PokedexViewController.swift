//
//  ViewController.swift
//  Not-A-Plant-Identifier
//
//  Created by The Bootlegged Pokémon Company on 9/16/19.
//  Copyright © The Bootlegged Pokémon Company. All rights reserved.
//

import UIKit

class PokedexViewController: UIViewController {
    
    //MARK: -- Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    
    @IBAction func sortButtonPressed(_ sender: UIButton) {
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel) { (action) in
        }
        
        let nameAction = UIAlertAction(title: "Name",
                                       style: .default) { (action) in
                                        self.pokemon = Pokemon.getSortedName(arr: self.pokemon)
        }
        
        let numberAction = UIAlertAction(title: "Number",
                                         style: .default) { (action) in
                                            self.pokemon = Pokemon.getSortedNumber(arr: self.pokemon)
        }
        let alert = UIAlertController(title: nil,
                                      message: nil,
                                      preferredStyle: .actionSheet)
        alert.addAction(nameAction)
        alert.addAction(cancelAction)
        alert.addAction(numberAction)
        
        self.present(alert, animated: true) {
            alert.view.tintColor = #colorLiteral(red: 1, green: 0.2914688587, blue: 0.3886995912, alpha: 1)
        }
    }
    
    //MARK: -- Properties
    var pokemon = [Pokemon]() {
        didSet {
            DispatchQueue.main.async {
                self.pokemonCollectionView.reloadData()
            }
        }
    }
    
    var filteredPokemon: [Pokemon] {
        get {
            guard let searchString = searchString else { return pokemon }
            guard searchString != ""  else { return pokemon }
            switch searchBar.selectedScopeButtonIndex {
            case 0: return Pokemon.getFilteredPokemonByName(arr: pokemon, searchString: searchString)
            case 1: return Pokemon.getFilteredPokemonByNumber(arr: pokemon, searchString: searchString)
            case 2: return Pokemon.getFilteredPokemonByType(arr: pokemon, searchString: searchString)
            default: return pokemon
            }
        }
    }
    
    var searchString: String? = nil { didSet { self.pokemonCollectionView.reloadData()} }
    
    //MARK: -- Functions
    private func loadData() {
        PokeAPIClient.shared.getPokemon {
            (result) in DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let pokemonFromOnlineAPI):
                    self.pokemon = pokemonFromOnlineAPI
                    dump(pokemonFromOnlineAPI)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifer = segue.identifier else {fatalError("No identifier in segue")}
        switch segueIdentifer {
            
        case "segueToDetail":
            if let cell = sender as? PokemonCollectionViewCell, let indexPath = self.pokemonCollectionView.indexPath(for: cell) {
                
                let destVC = segue.destination as! detailViewController
                
                destVC.currentPokemonURL = "https://pokeapi.co/api/v2/pokemon/\(filteredPokemon[indexPath.row].name.lowercased())/"
                destVC.currentPokemonType = filteredPokemon[indexPath.row].type[0]
                destVC.currentPokemonTypeArray = filteredPokemon[indexPath.row].type
            }
            
        default:
            fatalError("unexpected segue identifier")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
}

//MARK: -- DataSource Methods
extension PokedexViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //When the number of Pokemon being returned is empty, this is displaying the "No Search Results" label in the background.
        if filteredPokemon.count == 0 {
            let noDataLabel: UILabel  = UILabel(frame: CGRect(x: 0, y: 0, width: pokemonCollectionView.bounds.size.width, height: pokemonCollectionView.bounds.size.height))
            noDataLabel.text = "No Search Results"
            noDataLabel.textColor = UIColor.black
            noDataLabel.textAlignment = .center
            pokemonCollectionView.backgroundView = noDataLabel
        } else {
            pokemonCollectionView.backgroundView = nil
        }
        return filteredPokemon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentPokemon = filteredPokemon[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonCell", for: indexPath) as! PokemonCollectionViewCell
        cell.configureCell(with: currentPokemon)
        return cell
    }
}

//MARK: -- Delegate Methods
extension PokedexViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
}

extension PokedexViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchString = searchText
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsScopeBar = false
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsScopeBar = true
        searchBar.setShowsCancelButton(true, animated: true)
        return true
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsScopeBar = false
        searchBar.setShowsCancelButton(false, animated: true)
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        pokemonCollectionView.reloadData()
    }
}

