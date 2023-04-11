//
//  RestaurantView.swift
//  RockMountain
//
//  Created by Filipe Serafini on 11/04/23.
//

import SwiftUI

struct RestaurantsView: View {
    
    let restaurants = [
        Restaurant(image: "VeganTI", name: "Vegan TI"),
        Restaurant(image: "FazendaFuturo", name: "Fazenda Futuro"),
        Restaurant(image: "Coltivi", name: "Coltivi"),
        Restaurant(image: "Amazonika", name: "Amazonika"),
        Restaurant(image: "BoccaPizza", name: "Bocca Pizza"),
        Restaurant(image: "RisotteriaRio", name: "Risotteria Rio"),
        Restaurant(image: "CaldoRoots", name: "Caldo Roots"),
        Restaurant(image: "Fitzza", name: "Fitzza"),
        Restaurant(image: "FriendsFries", name: "Friends Fries"),
        Restaurant(image: "Nuu", name: "Nuu"),
    ]
    
    var body: some View {
        
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
                        restaurant
                    }
                }
            }
            
        }
        .padding()
    }
}

struct RestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsView()
    }
}
