//
//  BigMapView.swift
//  RockMountain
//
//  Created by Filipe Serafini on 12/04/23.
//

import SwiftUI

struct BigMapView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        ZStack {
            Spacer()
                .navigationBarBackButtonHidden(true)
                .toolbar(content: {
                    ToolbarItem (placement: .navigationBarLeading)  {
                        
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(.blue)
                                .frame(width: 35, height: 35)
                                .background(Color.black)
                                .clipShape(Circle())
                        })
                    }
                })
            
            ZoomableScrollView {
                Image("MapaHorizontal")
                    .resizable()
                    .frame(width: 627, height: 1257)
                
            }
            .ignoresSafeArea()
        }
    }
}






struct BigMapView_Previews: PreviewProvider {
    static var previews: some View {
        BigMapView()
    }
}
