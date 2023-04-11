//
//  AttractionView.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 10/04/23.
//

import SwiftUI

struct AttractionView: View {
    @State var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    Divider()
                        .navigationTitle("Atrações")
                    
                    ForEach((1...20), id: \.self) { value in
                        AttractionCard(artist: "Iza", day: .monday, hourStart: "18:00", hourEnd: "20:00", stage: .estrela, img: Image("img"))
                    }
                }
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
