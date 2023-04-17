//
//  PrettyTitle.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 14/04/23.
//

import SwiftUI

struct PrettyTitle: View {
    var title: String
    var backgroundColor: Color = .blue
    var textColor: Color = .green
    
    var body: some View {
        Text(title)
            .font(Font.custom("SairaCondensed-ExtraBold", size: 32, relativeTo: .title))
            .foregroundColor(textColor)
            .shadow(color: .black, radius: 2)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.black, lineWidth: 3)
                    .padding(.horizontal, -10)

                RoundedRectangle(cornerRadius: 10)
                    .fill(backgroundColor)
                    .padding(.horizontal, -10)
            }
    }
}

struct PrettyTitle_Previews: PreviewProvider {
    static var previews: some View {
        PrettyTitle(title: "Palco Teste")
    }
}
