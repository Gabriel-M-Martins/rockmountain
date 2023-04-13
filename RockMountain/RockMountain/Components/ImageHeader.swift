//
//  ImageHeader.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 11/04/23.
//

import SwiftUI

struct ImageHeader: View {
    @State var details: Detailable
    var favoritable: Bool = false
    var height: Float = 300.0
    
    var body: some View {
        ZStack {
            details.image
                .resizable()
                .scaledToFill()
                .frame(height: CGFloat(height))
                .clipped()
            
            Rectangle()
                .fill(LinearGradient(colors: [.black, .clear], startPoint: UnitPoint(x: 0, y: 1.2), endPoint: UnitPoint(x: 0, y: 0.5)))
            
            VStack {
                Spacer()
                
                HStack {
                    Text(details.name)
                    
                    Spacer()
                    
                    if favoritable {
                        FavoriteButton(select: $details.favorite)
                    }
                }
                .font(.title)
                .bold()
                .foregroundColor(.white)
                .padding(.horizontal)
            }
            .padding(.bottom)
        }
    }
}

struct ImageHeader_Previews: PreviewProvider {
    static var previews: some View {
        let attraction = Attraction(name: "Maria Bethania", info: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", favorite: false, image: Image("img"), show: [], type: .artist)
        
        ImageHeader(details: attraction)
    }
}
