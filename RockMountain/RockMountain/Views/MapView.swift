//
//  MapView.swift
//  RockMountain
//
//  Created by Filipe Serafini on 12/04/23.
//

import SwiftUI

struct MapView: View {
    
    
    var body: some View {
        
        NavigationStack {
            
            VStack { // main VStack
                
                HStack { // title "Map"
                    Text("Mapa")
                        .font(.title)
                        .bold()
                    Spacer()
                }
                .padding(.horizontal)
                
                ZStack { // ZStack for map image and zoom button
                    ScrollView(.horizontal) {
                        Image("Mapa")
                            .resizable()
                            .frame(width: 1257, height: 627)
                    }
                    
                    VStack { // VStack to put zoom button down
                        Spacer()
                        
                        HStack { // HStack to put zoom button to rigth
                            
                            Spacer()
                            
                            NavigationLink {
                                
                                BigMapView()
                                
                            } label : {
                                
                                Image(systemName: "arrow.up.backward.and.arrow.down.forward")
                                    .font(.system(size: 15, weight: .semibold))
                                    .foregroundColor(.black)
                                    .frame(width: 35, height: 35)
                                    .background(Color.white)
                                    .clipShape(Circle())
                        
                            }
                        }
                        .padding()
                    }
                    
                }
                .frame(maxHeight: 627) //max size for ZStack (map image)
                
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
