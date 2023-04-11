//
//  AttractionView.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 10/04/23.
//

import SwiftUI

struct AttractionView: View {
    @State var searchText = ""
    
    var placeholder: Attraction {
        let artist = Artist(name: "Maria Bethânia", description: "", image: Image("img"))
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let start = formatter.date(from: "2023/10/08 21:30")!
        let end = formatter.date(from: "2023/10/08 22:30")!
        
        let show = Show(stage: .floresta, startTime: start, endTime: end, day: .monday)
        
        return Attraction(show: show, artist: artist)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    Divider()
                        .navigationTitle("Atrações")
                    
                    ForEach((1...20), id: \.self) { value in
                        AttractionCard(attraction: placeholder)
                    }
                }
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 4)
                .padding(.horizontal)
                
            }
            
        }
        .searchable(text: $searchText)
    }
}

struct AttractionView_Previews: PreviewProvider {
    static var previews: some View {
        AttractionView()
    }
}
