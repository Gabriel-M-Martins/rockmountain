//
//  AttractionFilter.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 12/04/23.
//

import Foundation

enum AttractionFilter: String, Filter {
    case stage = "Palco", time = "Horário", alphabetic = "A - Z"
    
    var imageName: String {
        switch self {
        case .stage:
            return "paperplane.fill"
        case .time:
            return "calendar.badge.clock"
        case .alphabetic:
            return "list.bullet"
        }
    }
    
    static var standard: AttractionFilter {
        return AttractionFilter.time
    }
}
