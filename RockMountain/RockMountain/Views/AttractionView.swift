//
//  AttractionView.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 10/04/23.
//

import SwiftUI

struct AttractionView: View {
    @State var searchText = ""
    @State var filterActive = false
    @State var showPopup = false
    @State var filters: [AttractionFilter] = []
    
    var placeholder: Attraction {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let start = formatter.date(from: "2023/10/08 21:30")!
        let end = formatter.date(from: "2023/10/08 22:30")!
        
        let show = Show(stage: .floresta, startTime: start, endTime: end, day: .monday)
        
        let attraction = Attraction(name: "Maria Bethânia", info: """
 Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sed congue est, rhoncus cursus ante. Curabitur quis euismod risus. Duis ex nisi, feugiat quis iaculis eget, elementum non lorem. In vitae interdum metus, ut iaculis arcu. Nullam pellentesque gravida scelerisque. Fusce non ipsum id mi laoreet aliquet. Ut faucibus venenatis ipsum. Maecenas arcu nulla, sollicitudin ac placerat in, vehicula eu erat. Aliquam volutpat sollicitudin magna vel feugiat. Etiam ligula ligula, tristique et porta vel, sodales nec dolor. Cras sollicitudin odio vel aliquam egestas. Donec faucibus ipsum quis nulla mollis dignissim. Mauris tincidunt orci sed dignissim rhoncus.
 
 Mauris semper sodales eros, a tincidunt tortor viverra id. Quisque nisl eros, pretium vel diam at, rutrum vestibulum nunc. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer ut est lobortis, porta eros vel, pharetra neque. Nunc suscipit dapibus tellus, sed accumsan eros. Sed sed est ullamcorper, bibendum leo eget, tempor augue. Sed rhoncus turpis massa, at feugiat nisi mollis quis. Proin fringilla rhoncus diam, ut tempus arcu.
 """, favorite: false, image: Image("img"), show: [show], type: .artist)
        
        return attraction
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader { reader in
                ScrollView(showsIndicators: false) {
                    Divider()
                        .padding(.horizontal)
                    
                    HStack {
                        TextField("Procurar", text: $searchText)
                            .padding(.horizontal)
                            .frame(height: 45)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding()
                            .overlay {
                                HStack {
                                    Spacer()
                                    
                                    Button {
                                        searchText = ""
                                    } label: {
                                        Label("clear", systemImage: "xmark")
                                            .foregroundColor(.gray)
                                            .opacity(searchText.isEmpty ? 0 : 1)
                                            .padding(30)
                                            .animation(.easeInOut, value: searchText.isEmpty)
                                    }
                                    .labelStyle(.iconOnly)
                                }
                            }
                        
                        Button {
                            showPopup.toggle()
                        } label: {
                            Image(systemName: filterActive ? "line.3.horizontal.decrease.circle.fill" : "line.3.horizontal.decrease.circle")
                                .font(.title)
                                .animation(.linear(duration: 0.1), value: filterActive)
                            
                        }
                        .sheet(isPresented: $showPopup, onDismiss: {filterActive = !filters.isEmpty}) {
                            PopUpCard(height: reader.size.height * 0.4, width: reader.size.width, filters: $filters)
                        }
                        .padding(.leading, -10)
                        .padding(.trailing)
                    }
                    .padding(.top, -13)
                    
                    
                    VStack {
                        Divider()
                            .navigationTitle("Atrações")
                        
                        ForEach((1...20), id: \.self) { value in
                            NavigationLink {
                                AttractionDetailsView(attraction: placeholder)
                            } label: {
                                AttractionCard(attraction: placeholder, showIdx: 0)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
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
