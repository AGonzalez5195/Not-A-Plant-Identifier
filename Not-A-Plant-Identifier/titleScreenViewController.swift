//
//  titleScreenViewController.swift
//  Not-A-Plant-Identifier
//
//  Created by Anthony Gonzalez on 9/17/19.
//  Copyright © 2019 The Bootlegged Pokémon Company. All rights reserved.
//

import UIKit

class titleScreenViewController: UIViewController {

    @IBAction func pokeballButton(_ sender: UIButton) {
        sender.shake()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) { [unowned self] in
            self.performSegue(withIdentifier: "pokeSegue", sender: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
