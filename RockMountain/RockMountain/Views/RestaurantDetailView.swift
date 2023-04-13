//
//  RestaurantDetail.swift
//  RockMountain
//
//  Created by Filipe Serafini on 11/04/23.
//

import SwiftUI

struct RestaurantDetailView: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        
        VStack {
            ScrollView {
                
                ImageHeader(details: restaurant)
                
                VStack {
                    
                    if restaurant.isVegan == true {
                        
                        HStack {
                            Image(systemName: "leaf")
                                .opacity(0.5)
                            Text("Vegano")
                                .opacity(0.5)
                            Spacer()
                        }
                        .padding(.horizontal, 25)
                        .padding(.vertical, 10)
                        
                        Divider()
                            .frame(width: 250)
                            
                        
                    }
                    
                    ForEach (restaurant.items) { item in
                        MenuItemCard(item: item)
                            .padding(.bottom, 5)
                            
                    }
                }
                
                
            }
        }
        
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(restaurant: Restaurant(image: Image("Amazonika"), name: "Amazonika", favorite: false, info: "Comidas amazonikas!", items: [
            RestaurantMenuItem(name: "Almondegas de Lentilha (6 und)", description: "Esta porção serve até 2 pessoas", price: "22,00"),
            RestaurantMenuItem(name: "Bolinhos de Grão de Bico (6 und)", description: "Esta porção serve até 2 pessoas", price: "22,00"),
            RestaurantMenuItem(name: "Falafel (10 und)", description: "Esta porção serve até 2 pessoas", price: "25,00"),
            RestaurantMenuItem(name: "Bolinhos de Espinafre (10 und)", description: "Feitos de vagem e cenoura. \nContém glúten.", price: "20,00"),
            RestaurantMenuItem(name: "Mini Burger de Graãos", description: "Mini Burger de Grãos ao molho de mostarda acompanhado de pure de batata com ervas e jardineira de...", price: "30,00")
            ], isVegan: true))
    }
}
