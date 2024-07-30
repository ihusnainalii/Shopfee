//
//  SplashScreen.swift
//  Shopfee
//
//  Created by Husnain Ali on 30/07/2024.
//

import SwiftUI

struct SplashScreen: View {
    
    @State var isNavigateToHome = false
    
    var body: some View {
        VStack {
            AssetCatalog.Assets.logo1.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250)
                .onAppear {
                    onMainQueue(after: 2.0) {
                        withAnimation {
                            isNavigateToHome.toggle()
                        }
                    }
                }
        }
        .fullScreenCover(isPresented: $isNavigateToHome, content: {
            OnboardingScreen()
        })
    }
}

#Preview {
    SplashScreen()
}
