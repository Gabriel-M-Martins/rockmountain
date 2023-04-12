//
//  RestaurantDetail.swift
//  RockMountain
//
//  Created by Filipe Serafini on 11/04/23.
//

import SwiftUI

struct RestaurantDetailView: View {
    
    let image : Image
    let name : String
    
    
    var body: some View {
        
        ScrollView {
            VStack {
                ImageHeader(image: image, title: name)
                Spacer()
                
                
            }
        }
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(image: Image("Fitzza"), name: "Fitzza")
    }
}
