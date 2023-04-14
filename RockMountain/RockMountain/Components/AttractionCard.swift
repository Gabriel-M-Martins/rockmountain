//
//  AttractionCard.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 10/04/23.
//

import SwiftUI

struct AttractionCard: View {
    @Binding var attraction: Attraction
    var showIdx: Int
    private var date: String {
        let formattedDates = DateParser.formatDateInterval(interval: attraction.show[showIdx].date)
        return "\(formattedDates.start) - \(formattedDates.end)"
    }
    
    var body: some View {
        HStack(alignment: .top) {
            attraction.image
                .cornerRadius(50)
                .padding(.trailing, 5)
                .padding(.top, 5)
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(attraction.name)
                            .font(.title2)
                            .bold()
                        
                        Text("\(attraction.show[showIdx].day.abrev()) | \(date)")
                        Text(attraction.show[showIdx].stage.text())
                    }
                    
                    Spacer()
                    
                    FavoriteButton(select: $attraction.favorite)
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
        let date = DateParser.createDate(time: (19, 30), day: .monday, year: 2023)!
        let dateInterval = DateParser.createDateInterval(start: date, duration: (1, 0))
        
        let show = Show(stage: .floresta, day: .monday, date: dateInterval)
        
        let attraction = Attraction(name: "Maria Bethânia", info: "", favorite: false, image: Image("img"), show: [show], type: .artist)
        
        return AttractionCard(attraction: .constant(attraction), showIdx: 0)
    }
}
