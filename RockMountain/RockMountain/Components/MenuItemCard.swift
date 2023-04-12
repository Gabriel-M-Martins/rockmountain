//
//  MenuItemCard.swift
//  RockMountain
//
//  Created by Filipe Serafini on 11/04/23.
//

import SwiftUI

struct MenuItemCard: View {
    
    let image : String
    let name : String
    let description : String
    let price : String
    
    var body: some View {
        
        VStack {
            
            Divider()
            HStack {
                
                Image(image)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(50)
                
                VStack {
                
                    HStack {
                        Text(name)
                            .font(.title)
                            .bold()
                        
                        Spacer()
                        Image(systemName: "dollarsign")
                            .bold()
                        
                        Text(price)
                            .font(.title3)
                            .bold()
                        
                        Spacer()
                    }
                        
                    HStack {
                        Text(description)
                            .font(.subheadline)
                            .bold()
                        Spacer()
                    }
                    
                }
            }
            .padding()
            
            Divider()

        }
        
        
    }
}

struct MenuItemCard_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemCard(image: "Fitzza", name: "Fitzza", description: "Descricao do item do cardapiooooooooooooooooooooooo", price: "35,50")
    }
}
