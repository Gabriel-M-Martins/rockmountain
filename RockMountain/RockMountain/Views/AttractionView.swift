//
//  AttractionView.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 10/04/23.
//

import SwiftUI

var attractionPlaceholder: Attraction {
    let date = DateParser.createDate(time: (19, 30), day: .monday, year: 2023)!
    let dateInterval = DateParser.createDateInterval(start: date, duration: (1, 0))
    let show = Show(stage: .floresta, day: .monday, date: dateInterval)
    
    let attraction = Attraction(name: "Maria Bethânia", info: """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sed congue est, rhoncus cursus ante. Curabitur quis euismod risus. Duis ex nisi, feugiat quis iaculis eget, elementum non lorem. In vitae interdum metus, ut iaculis arcu. Nullam pellentesque gravida scelerisque. Fusce non ipsum id mi laoreet aliquet. Ut faucibus venenatis ipsum. Maecenas arcu nulla, sollicitudin ac placerat in, vehicula eu erat. Aliquam volutpat sollicitudin magna vel feugiat. Etiam ligula ligula, tristique et porta vel, sodales nec dolor. Cras sollicitudin odio vel aliquam egestas. Donec faucibus ipsum quis nulla mollis dignissim. Mauris tincidunt orci sed dignissim rhoncus.

Mauris semper sodales eros, a tincidunt tortor viverra id. Quisque nisl eros, pretium vel diam at, rutrum vestibulum nunc. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer ut est lobortis, porta eros vel, pharetra neque. Nunc suscipit dapibus tellus, sed accumsan eros. Sed sed est ullamcorper, bibendum leo eget, tempor augue. Sed rhoncus turpis massa, at feugiat nisi mollis quis. Proin fringilla rhoncus diam, ut tempus arcu.
""", favorite: false, image: Image("img"), show: [show])
    
    return attraction
}

struct AttractionView: View {
    @State var searchText = ""
    @State var filterActive = false
    @State var showPopup = false
    @State var filters: [AttractionFilter] = [.standard]
    
    @State var attractions: [Attraction] = [attractionPlaceholder, attractionPlaceholder, attractionPlaceholder, attractionPlaceholder, attractionPlaceholder, attractionPlaceholder]
    
    var body: some View {
        NavigationStack {
            GeometryReader { reader in
                ScrollView(showsIndicators: false) {
                    Divider()
                        .padding(.horizontal)
                        .navigationTitle("Atrações")
                    
                    SearchBar(filters: $filters, size: CGSize(width: reader.size.width, height: reader.size.height * 0.4))
                    
                    VStack {
                        HStack {
                            PrettyTitle(title: "Palco Teste")
                            
                            Spacer()
                        }
                        .padding(.vertical)
                        .padding(.horizontal, 30)
                        
                        
                        ForEach(0..<attractions.count, id: \.self) { idx in
                            
                            NavigationLink {
                                AttractionDetailsView(attraction: $attractions[idx])
                            } label: {
                                AttractionCard(attraction: $attractions[idx], showIdx: 0)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        
                        Spacer()
                            .frame(height: 15)
                    }
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.2), radius: 4)
                    .padding(.horizontal)
                }
            }
            .accentColor(Color(UIColor.label))
        }
    }
}

struct AttractionView_Previews: PreviewProvider {
    static var previews: some View {
        AttractionView()
    }
}
