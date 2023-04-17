//
//  Restaurant.swift
//  RockMountain
//
//  Created by Filipe Serafini on 11/04/23.
//

import SwiftUI

struct RestaurantCard: View {
    
    
    var restaurant: Restaurant
    
    var body: some View {
        
        ZStack {
            restaurant.image
                .resizable()
                .frame(width: 175, height: 175)
                .cornerRadius(14)
            
            Image("BlackSquare")
                .resizable()
                .frame(width: 175, height: 175)
                .cornerRadius(14)
                .opacity(0.5)
            
            Text(restaurant.name)
                .font(.title2)
                .bold()
                .foregroundColor(.white)
        }
        
    }
}

struct RestaurantCard_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCard(restaurant: Restaurant(image: Image("Amazonika"), name: "Amazonika", favorite: false, info: "Comidas amazonikas!", items: [RestaurantMenuItem(name: "Almondegas", description: "serve 2", price: "22")]))
    }
}
