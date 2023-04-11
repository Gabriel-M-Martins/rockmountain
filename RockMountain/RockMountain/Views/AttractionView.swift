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
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let start = formatter.date(from: "2023/10/08 21:30")!
        let end = formatter.date(from: "2023/10/08 22:30")!
        
        let show = Show(stage: .floresta, startTime: start, endTime: end, day: .monday)
        
        let attraction = Attraction(name: "Maria Bethânia", info: "", favorite: false, image: Image("img"), show: [show], type: .artist)
        
        return attraction
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    Divider()
                        .navigationTitle("Atrações")
                    
                    ForEach((1...20), id: \.self) { value in
                        NavigationLink {
                            
                        } label: {
                            AttractionCard(attraction: placeholder, showIdx: 0)
                        }
                        .buttonStyle(PlainButtonStyle())
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
