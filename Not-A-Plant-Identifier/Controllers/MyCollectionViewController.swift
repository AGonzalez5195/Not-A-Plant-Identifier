//
//  MyCollectionViewController.swift
//  Not-A-Plant-Identifier
//
//  Created by The Bootlegged Pokémon Company on 9/16/19.
//  Copyright © The Bootlegged Pokémon Company. All rights reserved.
//

import UIKit

class MyCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var myPokemon = [Pokemon]() {
        didSet {
            DispatchQueue.main.async {
                self.myCollectionView.reloadData()
            }
        }
    }
    
    var selectedPokemonName = ""
    var selectedPokemonType = ""
    var selectedPokemon: Pokemon!
    
    let alert = UIAlertController(title: "Delete Pokemon", message: "Would you like to remove the selected Pokemon from your favorites list?", preferredStyle: .alert)
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myPokemon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! PokemonCollectionViewCell
        let myCurrentPokemon = myPokemon[indexPath.row]
        cell.configureCell(with: myCurrentPokemon)
        return cell
        
    }
    
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        guard let detailVC = segue.source as? detailViewController else { fatalError() }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
            let pokemon = detailVC.favoritedPokemon[0]
            self.myPokemon.append(pokemon)
            detailVC.favoritedPokemon = [Pokemon]()
            self.myCollectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedPokemon = myPokemon[indexPath.row]
        selectedPokemonName = myPokemon[indexPath.row].name
        selectedPokemonType = myPokemon[indexPath.row].type[0]
        
        self.present(alert, animated: true)
    }
    
    private func setUpAlerts() {
        alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: { action in
            for (i,v) in self.myPokemon.enumerated() {
                if v == self.selectedPokemon! {
                    self.myPokemon.remove(at: i)
                }
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        setUpAlerts()
        
    }
}
