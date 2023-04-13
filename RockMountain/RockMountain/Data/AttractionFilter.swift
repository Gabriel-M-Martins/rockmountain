//
//  AttractionFilter.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 12/04/23.
//

import Foundation

enum AttractionFilter: Filter {
    case stage, time, alphabetic
    
    var title: String {
        switch self {
        case .stage:
            return "Palco"
        case .time:
            return "Horário"
        case .alphabetic:
            return "A - Z"
            
        }
    }
    
    var imageName: String {
        switch self {
        case .stage:
            return "img"
        case .time:
            return "img"
        case .alphabetic:
            return "img"
        }
    }
}

