//
//  AttractionCard.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 10/04/23.
//

import SwiftUI

struct AttractionCard: View {
    @State var attraction: Attraction
    var showIdx: Int
    
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
                        
                        Text("\(attraction.show[showIdx].day.abrev()) | \(attraction.show[showIdx].formattedStartTime()) - \(attraction.show[showIdx].formattedEndTime())")
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
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let start = formatter.date(from: "2023/10/08 21:30")!
        let end = formatter.date(from: "2023/10/08 22:30")!
        
        let show = Show(stage: .floresta, startTime: start, endTime: end, day: .monday)
        
        let attraction = Attraction(name: "Maria Bethânia", info: "", favorite: false, image: Image("img"), show: [show], type: .artist)
        
        return AttractionCard(attraction: attraction, showIdx: 0)
    }
}
