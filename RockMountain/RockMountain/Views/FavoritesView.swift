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
    
//    @State var favoriteAttractions: [Attraction] = [
//        attractionPlaceholderGenerator(hour: 19, stage: .mangolab, name: "maria"),
//        attractionPlaceholderGenerator(hour: 9, stage: .floresta, name: "maria"),
//        attractionPlaceholderGenerator(hour: 19, stage: .estrela, name: "maria"),
//        attractionPlaceholderGenerator(hour: 21, stage: .floresta, name: "jose")
//    ]
    
    @Binding var favoriteAttractions: [Attraction]
    
    private var favoriteAttractionsFiltered: [(title: String, attractionsIndices: [Int] )] {
        filter.executeFilter(attractions: favoriteAttractions, searched: searchText, onlyFavorites: true)
    }
    
    func colors(stage: Stage) -> (background: Color, text: Color) {
        switch stage {
        case .floresta:
            return (Color("ColorBlue"), Color("ColorGreen"))
        case .estrela:
            return (Color("ColorPink"), Color("ColorYellow"))
        case .mangolab:
            return (Color("ColorLight"), Color("ColorPink"))
        }
    }
    
    var body: some View {
            GeometryReader { reader in
                ScrollView {
//                    Divider()
//                        .padding(.horizontal)
//                        .navigationTitle("Favoritos")
                    
                    HStack {
                        Text("Favoritos")
                            .font(.largeTitle)
                            .bold()
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, 15)
                    
                    Divider()
                        .padding(.horizontal)
                    
                    SearchBar(searchText: $searchText, filter: $filter, size: CGSize(width: reader.size.width, height: reader.size.height * 0.4))
                    
                    let attractionsFiltered = self.favoriteAttractionsFiltered
                    
                    ForEach(0..<attractionsFiltered.count, id: \.self) { categoryIdx in
                        var stage: Stage {
                            if attractionsFiltered[categoryIdx].title == "Palco Floresta" {
                                return Stage.floresta
                            }
                            
                            if attractionsFiltered[categoryIdx].title == "Palco Estrela" {
                                return Stage.estrela
                            }
                            
                            if attractionsFiltered[categoryIdx].title == "Palco Mangolab" {
                                return Stage.mangolab
                            }
                            
                            return Stage.estrela
                        }
                        
                        let colors = self.colors(stage: stage)
                        
                        VStack {
                            HStack {
                                PrettyTitle(title: attractionsFiltered[categoryIdx].title.uppercased(), backgroundColor: colors.background, textColor: colors.text)
                                
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
        let att =  [
            attractionPlaceholderGenerator(hour: 19, stage: .mangolab, name: "Maria"),
            attractionPlaceholderGenerator(hour: 9, stage: .floresta, name: "Julia"),
            attractionPlaceholderGenerator(hour: 19, stage: .estrela, name: "Jorge"),
            attractionPlaceholderGenerator(hour: 21, stage: .floresta, name: "Marco")
        ]
        FavoritesView(favoriteAttractions: .constant(att))
//        FavoritesView(favoriteAttractions: .constant(attractions))
    }
}
