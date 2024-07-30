//
//  OnboardingScreen.swift
//  Shopfee
//
//  Created by Husnain Ali - ILI on 30/07/2024.
//

import SwiftUI

struct OnboardingScreen: View {
    
    @State private var currentPage = 0
    @State private var pages = Onboarding.onboardingData
    let totalPages = 3
    @State private var navigateToRegister = false
    
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                
                Button {
                    navigateToRegister.toggle()
                } label: {
                    Text("Skip")
                        .font(of: .poppinsMedium14, with: .neutralDark)
                        .padding()
                }
                .padding(.leading, 20)
            }
            .padding(.bottom, 30)
            
            Spacer()
            
            TabView(selection: $currentPage) {
                ForEach(0..<totalPages, id: \.self) { index in
                    VStack {
                        Image(pages[index].image)
                            .aspectRatio(contentMode: .fit)
                            .offset(CGSize(width: -30, height: 0))
                        
                        VStack(alignment: .leading, spacing: 16) {
                            Text(pages[index].title)
                                .font(of: .poppinsBold20, with: .neutralDark)
                            Text(pages[index].description)
                                .font(of: .poppinsMedium16, with: .textParagraph)
                        }
                        .padding()
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            Spacer()
            
            HStack {
                
                PageIndicatorView(currentPage: $currentPage, pages: totalPages)
                    .padding(.leading, 20)
                
                Spacer()
                
                CustomButtonView(style: .both, title: currentPage == 2 ? "Login/Register" : "next", icon: AssetCatalog.Icons.fiArrowRight.image) {
                    if currentPage < totalPages - 1 {
                        currentPage += 1 // Next action
                    } else {
                        // Done action
                        navigateToRegister.toggle()
                    }
                }
                .frame(width: currentPage == 2 ? 174 : 156)
                .padding(.trailing)
            }
            .padding(.bottom, 30)
        }
        .animation(.interactiveSpring, value: currentPage)
        .fullScreenCover(isPresented: $navigateToRegister, content: {
            RegisterView()
        })
    }
}

#Preview {
    OnboardingScreen()
}
