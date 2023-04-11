//
//  AttractionCard.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 10/04/23.
//

import SwiftUI

struct AttractionCard: View {
    @State var attraction: Attraction
    
    var body: some View {
        HStack(alignment: .top) {
            attraction.artist.image
                .cornerRadius(50)
                .padding(.trailing, 5)
                .padding(.top, 5)
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(attraction.artist.name)
                            .font(.title2)
                            .bold()
                        
                        Text("\(attraction.show.day.abrev()) | \(attraction.show.formattedStartTime()) - \(attraction.show.formattedEndTime())")
                        Text(attraction.show.stage.text())
                    }
                    
                    Spacer()
                    
                    Button {
                        attraction.show.faved.toggle()
                    } label: {
                        Image(systemName: attraction.show.faved ? "staroflife.fill" : "staroflife")
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
        let artist = Artist(name: "Maria Bethânia", description: "", image: Image("img"))
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let start = formatter.date(from: "2023/10/08 21:30")!
        let end = formatter.date(from: "2023/10/08 22:30")!
        
        let show = Show(stage: .floresta, startTime: start, endTime: end, day: .monday)
        
        let attraction = Attraction(show: show, artist: artist)
        
        return AttractionCard(attraction: attraction)
    }
}
