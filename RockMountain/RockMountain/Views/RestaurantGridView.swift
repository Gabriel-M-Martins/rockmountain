//
//  RestaurantView.swift
//  RockMountain
//
//  Created by Filipe Serafini on 11/04/23.
//

import SwiftUI

struct RestaurantGridView: View {
    
    let restaurants = [
        Restaurant(image: Image("VeganTI"), name: "Vegan TI"),
        Restaurant(image: Image("FazendaFuturo"), name: "Fazenda Futuro"),
        Restaurant(image: Image("Coltivi"), name: "Coltivi"),
        Restaurant(image: Image("Amazonika"), name: "Amazonika"),
        Restaurant(image: Image("BoccaPizza"), name: "Bocca Pizza"),
        Restaurant(image: Image("RisotteriaRio"), name: "Risotteria Rio"),
        Restaurant(image: Image("CaldoRoots"), name: "Caldo Roots"),
        Restaurant(image: Image("Fitzza"), name: "Fitzza"),
        Restaurant(image: Image("FriendsFries"), name: "Friends Fries"),
        Restaurant(image: Image("Nuu"), name: "Nuu"),
    ]
    
    var body: some View {
        
        
        NavigationStack {
            VStack {
                // titulo
                HStack {
                    Text("Food & Drink")
                        .font(.title)
                        .bold()
                    Spacer()
                }
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                        ForEach(restaurants, id: \.self) { restaurant in
                            NavigationLink {
                                RestaurantDetailView(image: restaurant.image, name: restaurant.name)
                            } label: {
                                RestaurantCard(restaurant: restaurant)
                            }
                        }
                    }
                }
                
            }
            .padding()
        }
    }
}

struct RestaurantGridView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantGridView()
    }
}
