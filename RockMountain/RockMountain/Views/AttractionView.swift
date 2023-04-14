//
//  AttractionView.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 10/04/23.
//

import SwiftUI

func attractionPlaceholderGenerator(hour: Int, stage: Stage, name: String) -> Attraction {
    let date = DateParser.createDate(time: (hour, 30), day: .monday, year: 2023)!
    let dateInterval = DateParser.createDateInterval(start: date, duration: (1, 0))
    let show = Show(stage: stage, day: .monday, date: dateInterval)
    
    let attraction = Attraction(name: name, info: """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sed congue est, rhoncus cursus ante. Curabitur quis euismod risus. Duis ex nisi, feugiat quis iaculis eget, elementum non lorem. In vitae interdum metus, ut iaculis arcu. Nullam pellentesque gravida scelerisque. Fusce non ipsum id mi laoreet aliquet. Ut faucibus venenatis ipsum. Maecenas arcu nulla, sollicitudin ac placerat in, vehicula eu erat. Aliquam volutpat sollicitudin magna vel feugiat. Etiam ligula ligula, tristique et porta vel, sodales nec dolor. Cras sollicitudin odio vel aliquam egestas. Donec faucibus ipsum quis nulla mollis dignissim. Mauris tincidunt orci sed dignissim rhoncus.

Mauris semper sodales eros, a tincidunt tortor viverra id. Quisque nisl eros, pretium vel diam at, rutrum vestibulum nunc. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer ut est lobortis, porta eros vel, pharetra neque. Nunc suscipit dapibus tellus, sed accumsan eros. Sed sed est ullamcorper, bibendum leo eget, tempor augue. Sed rhoncus turpis massa, at feugiat nisi mollis quis. Proin fringilla rhoncus diam, ut tempus arcu.
""", favorite: true, image: Image("img"), show: show)
    
    return attraction
}

struct AttractionView: View {
    @State var searchText = ""
    @State var filterActive = false
    @State var showPopup = false
    @State var filter: AttractionFilter = .standard
    
    @State var attractions: [Attraction] = [
        attractionPlaceholderGenerator(hour: 19, stage: .mangolab, name: "maria"),
        attractionPlaceholderGenerator(hour: 9, stage: .floresta, name: "maria"),
        attractionPlaceholderGenerator(hour: 19, stage: .estrela, name: "maria"),
        attractionPlaceholderGenerator(hour: 21, stage: .floresta, name: "jose")
    ]
    
    private var attractionsFiltered: [(title: String, attractionsIndices: [Int] )] {
        filter.executeFilter(attractions: self.attractions, searched: searchText)
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader { reader in
                ScrollView(showsIndicators: false) {
                    Divider()
                        .padding(.horizontal)
                        .navigationTitle("Atrações")
                    
                    SearchBar(searchText: $searchText, filter: $filter, size: CGSize(width: reader.size.width, height: reader.size.height * 0.4))
                    
                    let attractionsFiltered = self.attractionsFiltered
                    
                    ForEach(0..<attractionsFiltered.count, id: \.self) { categoryIdx in
                        VStack {
                            HStack {
                                PrettyTitle(title: attractionsFiltered[categoryIdx].title.uppercased())
                                
                                Spacer()
                            }
                            .padding(.vertical)
                            .padding(.horizontal, 30)
                            
                            ForEach(attractionsFiltered[categoryIdx].attractionsIndices, id: \.self) { attractionIdx in
                                NavigationLink {
                                    AttractionDetailsView(attraction: $attractions[attractionIdx])
                                } label: {
                                    AttractionCard(attraction: $attractions[attractionIdx])
                                }
                            }
                            
                            Spacer()
                                .frame(height: 15)
                        }
                        .background(.ultraThinMaterial)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.2), radius: 4)
                        .padding(.horizontal)
                    }
                    .padding(.bottom)
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct AttractionView_Previews: PreviewProvider {
    static var previews: some View {
        AttractionView()
    }
}
