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
    @Binding var selectedFilter: T
    
    var body: some View {
        VStack {
            Divider()
                .padding(.horizontal, width * 0.45)

            Text("Ordenar por")
                .font(.title2)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Array(T.allCases), id: \.self) { filter in
                        let selected = selectedFilter == filter
                        
                        HStack {
                            Spacer()
                            
                            Button {
                                
                                if selected {
                                    selectedFilter = T.standard
                                } else {
                                    selectedFilter = filter
                                }
                                
                            } label: {
                                VStack {
                                    ZStack {
                                        Circle()
                                            .frame(height: 90)
                                            .foregroundColor(selected ? .black : Color(UIColor.lightGray))
                                            .animation(.linear(duration: 0.1), value: selected)
                                        
                                        Image(systemName: filter.imageName)
                                            .font(.system(size: 30))
                                            .bold()
                                            .foregroundColor(selected ? .purple : Color(UIColor.gray))
                                            .animation(.linear(duration: 0.1), value: selected)
                                    }
                                    
                                    Text(filter.rawValue)
                                }
                            }
                            .opacity(selected ? 1 : 0.5)
                            .buttonStyle(PlainButtonStyle())
                            
                            Spacer()
                        }
                    }
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
        PopUpCard<AttractionFilter>(height: 150, width: 400, selectedFilter: .constant(.standard))
    }
}
