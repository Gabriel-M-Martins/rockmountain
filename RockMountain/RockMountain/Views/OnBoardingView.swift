//
//  OnBoardingView.swift
//  RockMountain
//
//  Created by Luciana Lemos on 12/04/23.
//

import SwiftUI

struct OnBoardingView: View {
    @State var page = 0
    var body: some View {
        NavigationStack {
            TabView(selection: $page) {
                Welcome1View(page: $page)
                    .tag(0)
                
                Welcome2View()
                    .tag(1)
                
                
            }
            .tabViewStyle(.page)
            .onAppear(){
                UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.label
                UIPageControl.appearance().pageIndicatorTintColor = UIColor.secondaryLabel
                UIView.setAnimationsEnabled(true)
            }
            .frame(maxWidth: .infinity, maxHeight:.infinity)
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
