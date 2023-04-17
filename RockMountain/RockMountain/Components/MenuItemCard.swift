//
//  MenuItemCard.swift
//  RockMountain
//
//  Created by Filipe Serafini on 11/04/23.
//

import SwiftUI

struct MenuItemCard: View {
    
    let item: RestaurantMenuItem
    
    var body: some View {
        
        HStack(alignment: .top) {
            
            VStack(alignment: .leading, spacing: 7) {
                Text(item.name)
                    .bold()
                
                Text(item.description)
                    .font(.subheadline)
                
            }
            
            Spacer()
            
            HStack {
                Image(systemName: "dollarsign")
                Text(item.price)
                    .bold()
            }
            
            
            
        }
        .padding(.horizontal, 25)
        .padding(.vertical, 8)
        
    }
}

struct MenuItemCard_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemCard(item: RestaurantMenuItem(name: "Almondegas de Lentilha (6und)", description: "Esta porção serve até 2 pessoas", price: "22,00"))
    }
}
