//
//  Stage.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 10/04/23.
//

import Foundation

enum Stage {
    case floresta, estrela, mangolab
    
    func text() -> String {
        switch self {
        case .floresta:
            return "Palco Floresta"
        case .estrela:
            return "Palco Estrela"
        case .mangolab:
            return "Palco Mangolab"
        }
    }
}
