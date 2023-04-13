//
//  Welcome1View.swift
//  RockMountain
//
//  Created by Luciana Lemos on 12/04/23.
//

import SwiftUI

struct Welcome1View: View {
    @Binding var page: Int
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 30) {
                        Text("Bem vinde!")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hue: 0.874, saturation: 1.0, brightness: 1.0, opacity: 0.671))
                        
                        Text("Estamos inaugurando mais este recurso nesta, que é a 8ª edição do festival, para tornar a sua experiência ainda mais especial!")
                            .lineSpacing(7)
                        
                    }
                    .padding()
                    
                    Spacer()
                    
                    
                }
                .padding()
                
                VStack {
                    Spacer()
                    
                    Button {
                        page += 1
                    } label: {
                        
                        Text("Próximo")
                            .padding()
                            .foregroundColor(.blue)
                            .background(.black)
                            .cornerRadius(15)
                        
                    }
                    .padding(.bottom, 40)
                }
            }
        }
    }
}

struct Welcome1View_Previews: PreviewProvider {
    static var previews: some View {
        Welcome1View(page: .constant(1))
    }
}
