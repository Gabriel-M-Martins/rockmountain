//
//  RestaurantView.swift
//  RockMountain
//
//  Created by Filipe Serafini on 11/04/23.
//

import SwiftUI

struct RestaurantGridView: View {
    
    let restaurants = [
        Restaurant(image: Image("VeganTI"), name: "Vegan TI", favorite: false, info: "aaa"),
        Restaurant(image: Image("FazendaFuturo"), name: "Fazenda Futuro", favorite: false, info: "aaa"),
        Restaurant(image: Image("Coltivi"), name: "Coltivi", favorite: false, info: "aaa"),
        Restaurant(image: Image("Amazonika"), name: "Amazonika", favorite: false, info: "aaa"),
        Restaurant(image: Image("BoccaPizza"), name: "Bocca Pizza", favorite: false, info: "aaa"),
        Restaurant(image: Image("RisotteriaRio"), name: "Risotteria Rio", favorite: false, info: "aaa"),
        Restaurant(image: Image("CaldoRoots"), name: "Caldo Roots", favorite: false, info: "aaa"),
        Restaurant(image: Image("Fitzza"), name: "Fitzza", favorite: false, info: "aaa"),
        Restaurant(image: Image("FriendsFries"), name: "Friends Fries", favorite: false, info: "aaa"),
        Restaurant(image: Image("Nuu"), name: "Nuu", favorite: false, info: "aaa"),
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
                                RestaurantDetailView(restaurant: restaurant)
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
