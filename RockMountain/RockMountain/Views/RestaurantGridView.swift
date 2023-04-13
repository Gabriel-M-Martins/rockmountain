//
//  RestaurantView.swift
//  RockMountain
//
//  Created by Filipe Serafini on 11/04/23.
//

import SwiftUI

struct RestaurantGridView: View {
    
    let restaurants = [
        Restaurant(image: Image("VeganTI"), name: "Vegan TI", favorite: false, info: "aaa", items: [
            RestaurantMenuItem(name: "Almondegas de Lentilha (6 und)", description: "Esta porção serve até 2 pessoas", price: "22,00"),
            RestaurantMenuItem(name: "Bolinhos de Grão de Bico (6 und)", description: "Esta porção serve até 2 pessoas", price: "22,00"),
            RestaurantMenuItem(name: "Falafel (10 und)", description: "Esta porção serve até 2 pessoas", price: "25,00"),
            RestaurantMenuItem(name: "Bolinhos de Espinafre (10 und)", description: "Feitos de vagem e cenoura. \nContém glúten.", price: "20,00"),
            RestaurantMenuItem(name: "Mini Burger de Graãos", description: "Mini Burger de Grãos ao molho de mostarda acompanhado de pure de batata com ervas e jardineira de...", price: "30,00")
        
        ], isVegan: true),
        Restaurant(image: Image("FazendaFuturo"), name: "Fazenda Futuro", favorite: false, info: "aaa", items: [RestaurantMenuItem(name: "Almondegas", description: "serve 2", price: "22")]),
        Restaurant(image: Image("Coltivi"), name: "Coltivi", favorite: false, info: "aaa", items: [RestaurantMenuItem(name: "Almondegas", description: "serve 2", price: "22")]),
        Restaurant(image: Image("Amazonika"), name: "Amazonika", favorite: false, info: "aaa", items: [RestaurantMenuItem(name: "Almondegas", description: "serve 2", price: "22")]),
        Restaurant(image: Image("BoccaPizza"), name: "Bocca Pizza", favorite: false, info: "aaa", items: [RestaurantMenuItem(name: "Almondegas", description: "serve 2", price: "22")]),
        Restaurant(image: Image("RisotteriaRio"), name: "Risotteria Rio", favorite: false, info: "aaa", items: [RestaurantMenuItem(name: "Almondegas", description: "serve 2", price: "22")]),
        Restaurant(image: Image("CaldoRoots"), name: "Caldo Roots", favorite: false, info: "aaa", items: [RestaurantMenuItem(name: "Almondegas", description: "serve 2", price: "22")]),
        Restaurant(image: Image("Fitzza"), name: "Fitzza", favorite: false, info: "aaa", items: [RestaurantMenuItem(name: "Almondegas", description: "serve 2", price: "22")]),
        Restaurant(image: Image("FriendsFries"), name: "Friends Fries", favorite: false, info: "aaa", items: [RestaurantMenuItem(name: "Almondegas", description: "serve 2", price: "22")]),
        Restaurant(image: Image("Nuu"), name: "Nuu", favorite: false, info: "aaa", items: [RestaurantMenuItem(name: "Almondegas", description: "serve 2", price: "22")]),
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
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

struct RestaurantGridView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantGridView()
    }
}
