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
    var stage: Stage
    var img: Image
    @State var faved: Bool = false
    
    var body: some View {
        HStack(alignment: .center) {
            img
                .cornerRadius(50)
            
            VStack(alignment: .leading) {
                Text("Iza")
                    .font(.title2)
                    .bold()
                
                Text("\(day.abrev()) | \(hourStart) - \(hourEnd)")
                Text(stage.text())
            }
            
            Spacer()
            
            Button {
                faved.toggle()
            } label: {
                Image(systemName: faved ? "staroflife.fill" : "staroflife")
                    .imageScale(.large)
                    .padding(.trailing, 5)
            }
            .foregroundColor(Color(UIColor.label))
        }
        .padding(.horizontal)
    }
    
}

struct AttractionCard_Previews: PreviewProvider {
    static var previews: some View {
        AttractionCard(artist: "Iza", day: .sunday, hourStart: "21:30", hourEnd: "22:30", stage: .floresta, img: Image("img"))
    }
}