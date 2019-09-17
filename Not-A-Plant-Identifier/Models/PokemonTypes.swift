//
//  PokemonTypes.swift
//  Not-A-Plant-Identifier
//
//  Created by Anthony Gonzalez on 9/16/19.
//  Copyright © 2019 The Bootlegged Pokémon Company. All rights reserved.
//

import Foundation
import UIKit

enum PokemonType: String {
    case bug = "bug"
    case dark = "dark"
    case dragon = "dragon"
    case electric = "electric"
    case fairy = "fairy"
    case fire = "fire"
    case fighting = "fighting"
    case flying = "flying"
    case ghost = "ghost"
    case grass = "grass"
    case ground = "ground"
    case ice = "ice"
    case normal = "normal"
    case poison = "poison"
    case psychic = "psychic"
    case rock = "rock"
    case steel = "steel"
    case water = "water"
  
    func setBGColor(view: UIView){
        switch self.rawValue {
        case "bug": view.backgroundColor = #colorLiteral(red: 0.5270935297, green: 0.586256206, blue: 0.06208767742, alpha: 1)
        case "dark": view.backgroundColor = #colorLiteral(red: 0.2185156941, green: 0.1712707579, blue: 0.1365462244, alpha: 1)
        case "dragon": view.backgroundColor = #colorLiteral(red: 0.3830757737, green: 0.3151979148, blue: 0.7345023155, alpha: 1)
        case "electric": view.backgroundColor = #colorLiteral(red: 0.8730222583, green: 0.5794603229, blue: 0.08330763131, alpha: 1)
        case "fairy": view.backgroundColor = #colorLiteral(red: 0.8867967725, green: 0.5503332019, blue: 0.889534533, alpha: 1)
        case "fire": view.backgroundColor = #colorLiteral(red: 0.8350636363, green: 0.1648910344, blue: 0.03053835966, alpha: 1)
        case "fighting": view.backgroundColor = #colorLiteral(red: 0.3143388927, green: 0.1449424028, blue: 0.06865201145, alpha: 1)
        case "flying": view.backgroundColor = #colorLiteral(red: 0.3601224124, green: 0.4528262019, blue: 0.8210052848, alpha: 1)
        case "ghost": view.backgroundColor = #colorLiteral(red: 0.2735272646, green: 0.2814652622, blue: 0.5052554011, alpha: 1)
        case "grass": view.backgroundColor = #colorLiteral(red: 0.3058364689, green: 0.570903182, blue: 0.1279414296, alpha: 1)
        case "ground": view.backgroundColor = #colorLiteral(red: 0.6684948802, green: 0.5390678644, blue: 0.2927357852, alpha: 1)
        case "ice": view.backgroundColor = #colorLiteral(red: 0.4301490188, green: 0.8266811967, blue: 0.9515028596, alpha: 1)
        case "normal": view.backgroundColor = #colorLiteral(red: 0.7545443177, green: 0.7414194942, blue: 0.6975663304, alpha: 1)
        case "poison": view.backgroundColor = #colorLiteral(red: 0.542719841, green: 0.2597581148, blue: 0.5646359324, alpha: 1)
        case "psychic": view.backgroundColor = #colorLiteral(red: 0.84272331, green: 0.218244642, blue: 0.3959510922, alpha: 1)
        case "rock": view.backgroundColor = #colorLiteral(red: 0.6057140827, green: 0.529781878, blue: 0.2314472795, alpha: 1)
        case "steel": view.backgroundColor = #colorLiteral(red: 0.5706357956, green: 0.5634247661, blue: 0.6288589239, alpha: 1)
        case "water": view.backgroundColor = #colorLiteral(red: 0.08909483999, green: 0.4139348269, blue: 0.7450439334, alpha: 1)
        default:
            view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
}

