//
//  AttractionDetailsView.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 11/04/23.
//

import SwiftUI

struct AttractionDetailsView: View {
    @State var attraction: Attraction
    
    var body: some View {
        ScrollView {
            VStack {
                ImageHeader(image: attraction.artist.image, title: attraction.artist.name, favable: true)
                
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct AttractionDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let artist = Artist(name: "Maria Bethânia", description: "", image: Image("img"))
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let start = formatter.date(from: "2023/10/08 21:30")!
        let end = formatter.date(from: "2023/10/08 22:30")!
        
        let show = Show(stage: .floresta, startTime: start, endTime: end, day: .monday)
        
        let attraction = Attraction(show: show, artist: artist, faved: false)
        
        return AttractionDetailsView(attraction: attraction)
    }
}
