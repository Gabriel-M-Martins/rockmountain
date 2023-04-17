//
//  AttractionDetailsView.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 11/04/23.
//

import SwiftUI

struct AttractionDetailsView: View {
    @Binding var attraction: Attraction
    var body: some View {
        ScrollView {
                ImageHeader(details: $attraction, favoritable: true)
                
                Spacer()
                
                Text(attraction.info)
                    .padding(.horizontal)
                    .padding(.vertical, 5)
            }
        .edgesIgnoringSafeArea(.top)
    }
}

struct AttractionDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AttractionDetailsView(attraction: .constant(attractionPlaceholderGenerator(hour: 19, stage: .floresta, name: "maria") ))
    }
}
