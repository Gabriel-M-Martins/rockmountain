//
//  AttractionDetailsView.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 11/04/23.
//

import SwiftUI

struct AttractionDetailsView: View {
    var attraction: Attraction
    var body: some View {
        ScrollView {
                ImageHeader(details: attraction, favoritable: true)
                
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
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let start = formatter.date(from: "2023/10/08 21:30")!
        let end = formatter.date(from: "2023/10/08 22:30")!
        
        let show = Show(stage: .floresta, startTime: start, endTime: end, day: .monday)
        
        let attraction = Attraction(name: "Maria Bethânia",
                                    info: """
 Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sed congue est, rhoncus cursus ante. Curabitur quis euismod risus. Duis ex nisi, feugiat quis iaculis eget, elementum non lorem. In vitae interdum metus, ut iaculis arcu. Nullam pellentesque gravida scelerisque. Fusce non ipsum id mi laoreet aliquet. Ut faucibus venenatis ipsum. Maecenas arcu nulla, sollicitudin ac placerat in, vehicula eu erat. Aliquam volutpat sollicitudin magna vel feugiat. Etiam ligula ligula, tristique et porta vel, sodales nec dolor. Cras sollicitudin odio vel aliquam egestas. Donec faucibus ipsum quis nulla mollis dignissim. Mauris tincidunt orci sed dignissim rhoncus.
 
 Mauris semper sodales eros, a tincidunt tortor viverra id. Quisque nisl eros, pretium vel diam at, rutrum vestibulum nunc. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer ut est lobortis, porta eros vel, pharetra neque. Nunc suscipit dapibus tellus, sed accumsan eros. Sed sed est ullamcorper, bibendum leo eget, tempor augue. Sed rhoncus turpis massa, at feugiat nisi mollis quis. Proin fringilla rhoncus diam, ut tempus arcu.
 
 """,
                                    favorite: false, image: Image("img"), show: [show], type: .artist)
        
        return AttractionDetailsView(attraction: attraction)
    }
}
