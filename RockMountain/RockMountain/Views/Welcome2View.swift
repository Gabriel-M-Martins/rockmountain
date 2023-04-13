//
//  Welcome2View.swift
//  RockMountain
//
//  Created by Luciana Lemos on 12/04/23.
//

import SwiftUI

struct Welcome2View: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 45) {
                    Text("O que você encontra aqui?")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hue: 0.874, saturation: 1.0, brightness: 1.0, opacity: 0.671))
                    
                    VStack(alignment: .leading, spacing: 7) {
                        Text("• Atrações e horários;")
                        Text("• Mapa do parque;")
                        Text("• Cardápios;")
                        Text("• Informações sobre o evento;")
                        Text("\n\nÉ um prazer ter você com a gente!")
                        Text("Nos encontramos lá! #LetsHitTheRoad")
                        
                    }
                }
                
                
                Spacer()
                
                
            }
            .navigationBarHidden(true)
            
            
            VStack {
                Spacer()
                
                NavigationLink(destination: EventsView()) {
                    Text("Começar")
                        .padding()
                        .foregroundColor(.blue)
                        .background(.black)
                        .cornerRadius(10)
                        .padding(.bottom, 40)
                }
                
            }
        }
    }
}

struct Welcome2View_Previews: PreviewProvider {
    static var previews: some View {
        Welcome2View()
    }
}
