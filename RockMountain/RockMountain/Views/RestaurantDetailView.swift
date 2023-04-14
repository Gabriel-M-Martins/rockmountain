//
//  RestaurantDetail.swift
//  RockMountain
//
//  Created by Filipe Serafini on 11/04/23.
//

import SwiftUI

struct RestaurantDetailView: View {
    
    @Binding var restaurant: Restaurant
    
    var body: some View {
        
        ScrollView {
            VStack {
                ImageHeader(details: $restaurant)
                Spacer()
                
                
            }
        }
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(restaurant: .constant(Restaurant(image: Image("Amazonika"), name: "Amazonika", favorite: false, info: "Comidas amazonikas!")))
    }
}
