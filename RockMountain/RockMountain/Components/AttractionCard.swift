//
//  AttractionCard.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 10/04/23.
//

import SwiftUI

struct AttractionCard: View {
    @Binding var attraction: Attraction
    private var date: String {
        let formattedDates = DateParser.formatDateInterval(interval: attraction.show.date)
        return "\(formattedDates.start) - \(formattedDates.end)"
    }
    
    var body: some View {
        HStack(alignment: .top) {
            attraction.image
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .cornerRadius(35)
                .padding(.trailing, 5)
                .padding(.top, 5)
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(attraction.name)
                            .font(.title2)
                            .bold()
                        
                        Text("\(attraction.show.day.abrev()) | \(date)")
                        Text(attraction.show.stage.rawValue)
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
        return AttractionCard(attraction: .constant(attractionPlaceholderGenerator(hour: 19, stage: .floresta, name: "maria") ))
    }
}
