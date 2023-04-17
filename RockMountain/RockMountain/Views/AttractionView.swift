//
//  AttractionView.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 10/04/23.
//

import SwiftUI

func attractionPlaceholderGenerator(hour: Int, stage: Stage, name: String) -> Attraction {
    let imgs = ["foto1", "foto2", "foto3", "foto4", "foto5", "foto6", "foto7"]
    
    let date = DateParser.createDate(time: (hour, 30), day: .monday, year: 2023)!
    let dateInterval = DateParser.createDateInterval(start: date, duration: (1, 0))
    let show = Show(stage: stage, day: .monday, date: dateInterval)
    
    let attraction = Attraction(name: name, info: """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sed congue est, rhoncus cursus ante. Curabitur quis euismod risus. Duis ex nisi, feugiat quis iaculis eget, elementum non lorem. In vitae interdum metus, ut iaculis arcu. Nullam pellentesque gravida scelerisque. Fusce non ipsum id mi laoreet aliquet. Ut faucibus venenatis ipsum. Maecenas arcu nulla, sollicitudin ac placerat in, vehicula eu erat. Aliquam volutpat sollicitudin magna vel feugiat. Etiam ligula ligula, tristique et porta vel, sodales nec dolor. Cras sollicitudin odio vel aliquam egestas. Donec faucibus ipsum quis nulla mollis dignissim. Mauris tincidunt orci sed dignissim rhoncus.

Mauris semper sodales eros, a tincidunt tortor viverra id. Quisque nisl eros, pretium vel diam at, rutrum vestibulum nunc. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer ut est lobortis, porta eros vel, pharetra neque. Nunc suscipit dapibus tellus, sed accumsan eros. Sed sed est ullamcorper, bibendum leo eget, tempor augue. Sed rhoncus turpis massa, at feugiat nisi mollis quis. Proin fringilla rhoncus diam, ut tempus arcu.
""", favorite: true, image: Image(imgs.randomElement()!), show: show)
    
    return attraction
}

struct AttractionView: View {
    @State var searchText = ""
    @State var filterActive = false
    @State var showPopup = false
    @State var filter: AttractionFilter = .standard
    
    @Binding var attractions: [Attraction]
    
    private var attractionsFiltered: [(title: String, attractionsIndices: [Int] )] {
        filter.executeFilter(attractions: self.attractions, searched: searchText)
    }
    
    func colors(stage: Stage) -> (background: Color, text: Color) {
        switch stage {
        case .floresta:
            return (Color("ColorBlue"), Color("ColorGreen"))
        case .estrela:
            return (Color("ColorPink"), Color("ColorYellow"))
        case .mangolab:
            return (Color("ColorLight"), Color("ColorPink"))
        }
    }
    
    var body: some View {
            GeometryReader { reader in
                ScrollView(showsIndicators: false) {
//                    Divider()
//                        .padding(.horizontal)
//                        .navigationTitle("Atrações")
                    
                    HStack {
                        Text("Atrações")
                            .font(.largeTitle)
                            .bold()
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, 15)
                    
                    Divider()
                        .padding(.horizontal)
                    
                    SearchBar(searchText: $searchText, filter: $filter, size: CGSize(width: reader.size.width, height: reader.size.height * 0.4))
                    
                    let attractionsFiltered = self.attractionsFiltered
                    
                    ForEach(0..<attractionsFiltered.count, id: \.self) { categoryIdx in
                        var stage: Stage {
                            if attractionsFiltered[categoryIdx].title == "Palco Floresta" {
                                return Stage.floresta
                            }
                            
                            if attractionsFiltered[categoryIdx].title == "Palco Estrela" {
                                return Stage.estrela
                            }
                            
                            if attractionsFiltered[categoryIdx].title == "Palco Mangolab" {
                                return Stage.mangolab
                            }
                            
                            return Stage.estrela
                        }
                        
                        let colors = self.colors(stage: stage)
                        
                        VStack {
                            HStack {
                                PrettyTitle(title: attractionsFiltered[categoryIdx].title.uppercased(), backgroundColor: colors.background, textColor: colors.text)
                                
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
            .buttonStyle(PlainButtonStyle())
    }
}

struct AttractionView_Previews: PreviewProvider {
    static var previews: some View {
        let att =  [
            attractionPlaceholderGenerator(hour: 19, stage: .mangolab, name: "Maria"),
            attractionPlaceholderGenerator(hour: 9, stage: .floresta, name: "Julia"),
            attractionPlaceholderGenerator(hour: 19, stage: .estrela, name: "Jorge"),
            attractionPlaceholderGenerator(hour: 21, stage: .floresta, name: "Marco")
        ]
        
        return AttractionView(attractions: .constant(att))
    }
}
