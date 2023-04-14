//
//  ImageHeader.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 11/04/23.
//

import SwiftUI

struct ImageHeader<T: Detailable>: View {
    @Binding var details: T
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
        ImageHeader(details: .constant(attractionPlaceholder))
    }
}
