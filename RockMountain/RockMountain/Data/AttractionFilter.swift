//
//  AttractionFilter.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 12/04/23.
//

import Foundation

enum AttractionFilter: Filter {
    case hour, stage, day, artist
    
    var title: String {
        switch self {
        case .day:
            return "Dia"
        case .stage:
            return "Palco"
        case .hour:
            return "Hora"
        case .artist:
            return "Artista"
        }
    }
    
    // TODO: substitute return values in each case for corresponding image name
    var imageName: String {
        switch self {
        case .day:
            return "img"
        case .stage:
            return "img"
        case .hour:
            return "img"
        case .artist:
            return "img"
        }
    }
}
