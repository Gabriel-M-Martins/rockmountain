//
//  AttractionCard.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 10/04/23.
//

import SwiftUI

struct AttractionCard: View {
    var artist: String
    var day: Day
    var hourStart: String
    var hourEnd: String
    var palco: Palcos
    var img: Image
    var faved: Bool = true
    
    var body: some View {
        HStack(alignment: .center) {
            img
                .cornerRadius(50)
            
            VStack(alignment: .leading) {
                Text("Iza")
                    .font(.title2)
                    .bold()
                
                Text("\(day.abrev()) | \(hourStart) - \(hourEnd)")
                Text(palco.text())
            }
            
            Spacer()
            
            Image(systemName: faved ? "staroflife.fill" : "staroflife")
                .imageScale(.large)
            
        }
        .padding(.horizontal)
    }
    
}

struct AttractionCard_Previews: PreviewProvider {
    static var previews: some View {
        AttractionCard(artist: "Iza", day: .sunday, hourStart: "21:30", hourEnd: "22:30", palco: .floresta, img: Image("img"))
    }
}

enum Day {
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

enum Palcos {
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
