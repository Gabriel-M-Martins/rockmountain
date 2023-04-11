//
//  AttractionCard.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 10/04/23.
//

import SwiftUI

struct Show {
    var stage: Stage
    var startTime: Date
    var endTime: Date
    var day: Day
    
    @State var faved: Bool = false
}

struct Artist {
    var name: String
    var description: String
    var image: Image
    var shows: [Show] = []
}

struct Attraction {
    var show: Show
    var artist: Artist
}

struct AttractionCard: View {
    var artist: String
    var day: Day
    var hourStart: String
    var hourEnd: String
    var stage: Stage
    var img: Image
    @State var faved: Bool = false
    
    var body: some View {
        HStack(alignment: .top) {
            NavigationLink {
                // TODO: Go to artist's page
            } label: {
                img
                    .cornerRadius(50)
                    .padding(.trailing, 5)
                    .padding(.top, 5)
            }
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(artist)
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
                            .resizable()
                            .frame(maxWidth: 30, maxHeight: 30)
                    }
                    .foregroundColor(Color(UIColor.label))
                }
                
                Divider()
                    .background(Color.secondary)
            }

        }
        .padding(.horizontal)
    }
    
}

struct AttractionCard_Previews: PreviewProvider {
    static var previews: some View {
        AttractionCard(artist: "Maria Bethânia", day: .sunday, hourStart: "21:30", hourEnd: "22:30", stage: .floresta, img: Image("img"))
    }
}
