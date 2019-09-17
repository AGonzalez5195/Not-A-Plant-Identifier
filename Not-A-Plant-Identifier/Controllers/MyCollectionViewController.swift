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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
    }
}
