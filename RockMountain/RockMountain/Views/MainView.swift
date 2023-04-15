//
//  MainView.swift
//  RockMountain
//
//  Created by Ana Laura Quadrado Frisina on 13/04/23.
//

import SwiftUI
import UIKit

struct MainView: View {
    @State var attractions: [Attraction] = [
        attractionPlaceholderGenerator(hour: 19, stage: .mangolab, name: "Maria"),
        attractionPlaceholderGenerator(hour: 9, stage: .floresta, name: "Julia"),
        attractionPlaceholderGenerator(hour: 19, stage: .estrela, name: "Jorge"),
        attractionPlaceholderGenerator(hour: 21, stage: .floresta, name: "Marco")
    ]
    
    var body: some View {
        NavigationStack {
            
            TabView {
                
                Group {
                    EventsView()
                        .tabItem {
                            Label("Eventos", systemImage: "mountain.2")
                        }
                    
                    
                    AttractionView(attractions: $attractions)
                        .tabItem {
                            Label("Atrações", systemImage: "guitars")
                                
                        }
                    
                    RestaurantGridView()
                        .tabItem {
                            Label("Bar", systemImage: "takeoutbag.and.cup.and.straw")
                        }
                    
                    FavoritesView(favoriteAttractions: $attractions)
                        .tabItem {
                            Label("Favoritos", systemImage: "staroflife")
                        }
                    MapView()
                        .tabItem {
                            Label("Mapa", systemImage: "map")
                            
                        }
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(Color("ColorDark"), for: .tabBar)
                
                
            }
            .accentColor(Color("ColorPink"))
            
        }
        .navigationBarBackButtonHidden(true)
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
