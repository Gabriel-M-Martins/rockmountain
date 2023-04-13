//
//  EventsView.swift
//  RockMountain
//
//  Created by Luciana Lemos on 12/04/23.
//

import SwiftUI

struct EventsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Spacer()
                
                Text("Sobre o evento")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading)
                
                ZStack(alignment: .leading){
                    Image("music1")
                    
                    Text("Playlists")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .offset(x: 35, y: -70 )
                }
                
                ZStack(alignment: .leading) {
                    Image("loja1")
                    
                    Text("Lojinha")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .offset(x: 35, y: -70 )
                }
                
                ZStack(alignment: .leading) {
                    Image("mountain1")
                        .padding([.top, .leading])
                    
                    Text("Compromisso com a natureza")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .offset(x: 35, y: -60 )
                }
                
            }
            .padding(.horizontal)
        }
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
