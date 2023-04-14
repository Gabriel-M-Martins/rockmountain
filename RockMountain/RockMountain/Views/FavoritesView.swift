//
//  FavoritesView.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 14/04/23.
//

import SwiftUI

struct FavoritesView: View {
    @State var filter: AttractionFilter = .standard
    @State var searchText: String = ""
    
    @Binding var favoriteAttractions: [Attraction]
    
    var body: some View {
        NavigationStack {
            GeometryReader { reader in
                ScrollView {
                    Divider()
                        .padding(.horizontal)
                        .navigationTitle("Favoritos")
                    
                    SearchBar(searchText: $searchText, filter: $filter, size: CGSize(width: reader.size.width, height: reader.size.height * 0.4))
                }
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(favoriteAttractions: .constant([]))
    }
}
