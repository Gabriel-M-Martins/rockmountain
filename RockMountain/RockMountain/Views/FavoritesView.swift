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
    
    @State var favoriteAttractions: [Attraction] = [
        attractionPlaceholderGenerator(hour: 19, stage: .mangolab, name: "maria"),
        attractionPlaceholderGenerator(hour: 9, stage: .floresta, name: "maria"),
        attractionPlaceholderGenerator(hour: 19, stage: .estrela, name: "maria"),
        attractionPlaceholderGenerator(hour: 21, stage: .floresta, name: "jose")
    ]
    
    private var favoriteAttractionsFiltered: [(title: String, attractionsIndices: [Int] )] {
        filter.executeFilter(attractions: favoriteAttractions, searched: searchText, onlyFavorites: true)
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader { reader in
                ScrollView {
                    Divider()
                        .padding(.horizontal)
                        .navigationTitle("Favoritos")
                    
                    SearchBar(searchText: $searchText, filter: $filter, size: CGSize(width: reader.size.width, height: reader.size.height * 0.4))
                    
                    let attractionsFiltered = self.favoriteAttractionsFiltered
                    
                    ForEach(0..<attractionsFiltered.count, id: \.self) { categoryIdx in
                        VStack {
                            HStack {
                                PrettyTitle(title: attractionsFiltered[categoryIdx].title.uppercased())
                                
                                Spacer()
                            }
                            .padding(.vertical)
                            .padding(.horizontal, 30)
                            
                            ForEach(attractionsFiltered[categoryIdx].attractionsIndices, id: \.self) { attractionIdx in
                                NavigationLink {
                                    AttractionDetailsView(attraction: $favoriteAttractions[attractionIdx])
                                } label: {
                                    AttractionCard(attraction: $favoriteAttractions[attractionIdx])
                                    // TODO: Animate when removing from favorites
                                }
                            }
                            
                            Spacer()
                                .frame(height: 15)
                        }
                        .background(.ultraThinMaterial)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.2), radius: 4)
                        .padding(.horizontal)
                    }
                    .padding(.bottom)
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
//        let attractions = [
//            attractionPlaceholderGenerator(hour: 19, stage: .mangolab, name: "maria"),
//            attractionPlaceholderGenerator(hour: 9, stage: .floresta, name: "maria"),
//            attractionPlaceholderGenerator(hour: 19, stage: .estrela, name: "maria"),
//            attractionPlaceholderGenerator(hour: 21, stage: .floresta, name: "jose")
//        ]
        
        FavoritesView()
//        FavoritesView(favoriteAttractions: .constant(attractions))
    }
}
