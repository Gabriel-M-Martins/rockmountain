//
//  SearchBar.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 13/04/23.
//

import SwiftUI

struct SearchBar<T: Filter>: View {
    @State private var showPopup = false

    @Binding var searchText: String
    @Binding var filter: T

    var size: CGSize
    
    var body: some View {
        HStack {
            // TODO: Localize TextField text before input
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
                Image(systemName: "line.3.horizontal.decrease.circle.fill")
                    .font(.title)
                
            }
            .buttonStyle(PlainButtonStyle())
            .sheet(isPresented: $showPopup) {
                PopUpCard(height: size.height, width: size.width, selectedFilter: $filter)
            }
            .padding(.leading, -10)
            .padding(.trailing)
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar<AttractionFilter>(searchText: .constant(""), filter: .constant(.standard), size: CGSize(width: 500, height: 400))
    }
}
