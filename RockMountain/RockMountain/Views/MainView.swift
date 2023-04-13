//
//  MainView.swift
//  RockMountain
//
//  Created by Ana Laura Quadrado Frisina on 13/04/23.
//

import SwiftUI
import UIKit

struct MainView: View {
    var body: some View {
        NavigationStack {
            TabView {
                
                Group {
                    EventsView()
                        .tabItem {
                            Label("Eventos", systemImage: "mountain.2")
                        }
                    
                    
                    AttractionView()
                        .tabItem {
                            Label("Atrações", systemImage: "guitars")
                                
                        }
                    
                    RestaurantGridView()
                        .tabItem {
                            Label("Bar", systemImage: "takeoutbag.and.cup.and.straw")
                        }
                    RestaurantGridView()
                        .tabItem {
                            Label("Favoritos", systemImage: "staroflife")
                        }
                    RestaurantGridView()
                        .tabItem {
                            Label("Mapa", systemImage: "map")
                            
                        }
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(Color.black, for: .tabBar)
                
                
            }
            .accentColor(.pink)
            
        }
        
        
        //        .onAppear() {
        //            //UITabBar.appearance().isTranslucent = false
        //            //UITabBar.appearance().backgroundColor = .red
        //            UITabBar.appearance().barStyle = .black
        //        }
        
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
