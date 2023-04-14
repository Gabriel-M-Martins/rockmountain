//
//  Day.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 10/04/23.
//

import Foundation

// TODO: Make it so the day abreviation is reactive to localization

enum Day: Int {
    case sunday, monday, tuesday, wednesday, thursday, friday, saturday
        
    func abrev() -> String {
        switch self {
        case .sunday:
            return "DOM"
        case .monday:
            return "SEG"
        case .tuesday:
            return "TER"
        case .wednesday:
            return "QUA"
        case .thursday:
            return "QUI"
        case .friday:
            return "SEX"
        case .saturday:
            return "SAB"
        }
    }
}
