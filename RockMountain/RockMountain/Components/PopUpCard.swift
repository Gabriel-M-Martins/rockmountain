//
//  PopUpCard.swift
//  RockMountain
//
//  Created by Gabriel Medeiros Martins on 12/04/23.
//

import SwiftUI

struct PopUpCard<T: Filter>: View {
    var height: Double
    var width: Double
    @Binding var filters: [T]
    
    var body: some View {
        VStack {
            Divider()
                .padding(.horizontal, width * 0.45)
            
            Text("Ordenar por")
                .font(.title2)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Spacer()
                    
                    ForEach(Array(T.allCases), id: \.self) { filter in
                        HStack {
                            Spacer()
                            
                            Button {
                                if let idx = filters.firstIndex(where: {$0.title == filter.title}) {
                                    filters.remove(at: idx)
                                } else {
                                    filters.append(filter)
                                }
                            } label: {
                                VStack {
                                    Image(filter.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 100)
                                        .clipShape(Circle())
                                    
                                    Text(filter.title)
                                }
                            }
                            .opacity(filters.contains(where: {$0.title == filter.title}) ? 0.5 : 1)
                            .buttonStyle(PlainButtonStyle())
                            
                            Spacer()
                        }
                    }
                    Spacer()
                }
                .frame(width: width)
                .padding(.trailing)
            }
            .padding(.top)
        }
        .padding(.top, -30)
        .presentationDetents([.height(height)])
        .presentationDragIndicator(.hidden)
    }
}

struct PopUpCard_Previews: PreviewProvider {
    static var previews: some View {
        PopUpCard<AttractionFilter>(height: 150, width: 400, filters: .constant([]))
    }
}
