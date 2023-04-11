//
//  Restaurant.swift
//  RockMountain
//
//  Created by Filipe Serafini on 11/04/23.
//

import SwiftUI

struct Restaurant: View, Hashable {
    
    var image: String
    var name: String
    
    var body: some View {
        
        ZStack {
            Image(image)
                .resizable()
                .frame(width: 175, height: 175)
                .cornerRadius(14)
            
            Image("BlackSquare")
                .resizable()
                .frame(width: 175, height: 175)
                .cornerRadius(14)
                .opacity(0.5)
            
            Text(name)
                .font(.title2)
                .bold()
                .foregroundColor(.white)
        }
        
    }
}

struct Restaurant_Previews: PreviewProvider {
    static var previews: some View {
        Restaurant(image: "VeganTI", name: "Vegan TI")
    }
}
