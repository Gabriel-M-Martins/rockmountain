//
//  ShowLogoScreen.swift
//  RockMountain
//
//  Created by Luciana Lemos on 17/04/23.
//

import SwiftUI

struct ShowLogoScreen: View {
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    @State private var seconds = 0.0
    @State private var goToView: Bool = false
    let timeInSeconds = 0.5
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            Image("rock")
        }
        .fullScreenCover(isPresented: $goToView, content: {
            OnBoardingView()
        })
        .onReceive(timer) { input in
            if seconds >= timeInSeconds {
                UIView.setAnimationsEnabled(false)
                self.goToView = true
            } else {
                self.seconds += 0.5
            }
        }
        .ignoresSafeArea()
    }
}

struct ShowLogoScreen_Previews: PreviewProvider {
    static var previews: some View {
        ShowLogoScreen()
    }
}
