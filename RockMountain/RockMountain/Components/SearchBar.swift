//
//  SearchBar.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 13/04/23.
//

import SwiftUI

struct SearchBar<T: Filter>: View {
    @State private var searchText = ""
    @State private var showPopup = false
    @Binding var filters: [T]
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
            .sheet(isPresented: $showPopup,
                   onDismiss: {
                
                if filters.isEmpty {
                    filters.append(T.standard)
                }
                
            }) {
                PopUpCard(height: size.height, width: size.width, filters: $filters)
            }
            .padding(.leading, -10)
            .padding(.trailing)
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(filters: .constant([AttractionFilter]()), size: CGSize(width: 500, height: 400))
    }
}
