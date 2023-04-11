//
//  FavoriteButton.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 11/04/23.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var select: Bool
    var body: some View {
        Button {
            select.toggle()
        } label: {
            Image(systemName: select ? "staroflife.fill" : "staroflife")
                .resizable()
                .frame(maxWidth: 30, maxHeight: 30)
        }
        .foregroundColor(Color(UIColor.label))
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(select: .constant(false))
    }
}
