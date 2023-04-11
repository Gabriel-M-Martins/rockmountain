//
//  ImageHeader.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 11/04/23.
//

import SwiftUI

struct ImageHeader: View {
    var image: Image
    var title: String
    var favable: Bool = false
    
    var body: some View {
        ZStack {
            image
                .resizable()
                .scaledToFill()
            
            Rectangle()
                .fill(LinearGradient(colors: [.black, .clear], startPoint: UnitPoint(x: 0, y: 1.2), endPoint: UnitPoint(x: 0, y: 0.5)))
            
            VStack {
                Spacer()
                
                HStack {
                    Text(title)
                    
                    Spacer()
                    
                    if favable {
                        Image(systemName: "staroflife")
                        
                    }
                }
                .font(.title)
                .bold()
                .foregroundColor(.white)
                .padding(.horizontal)
            }
            .padding(.bottom)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ImageHeader_Previews: PreviewProvider {
    static var previews: some View {
        ImageHeader(image: Image("img"), title: "placeholder")
    }
}
