//
//  ShopfeeLoadingView.swift
//  Shopfee
//
//  Created by Husnain Ali - ILI on 30/07/2024.
//

import SwiftUI

struct ShopfeeLoadingView: View {
    
    let title: String
    let subtitle: String
    
    @Binding var enableLoadingView: Bool
    
    var body: some View {
        VStack {
            LoadingGifView()
            
            VStack(spacing: 0) {
                Text(title)
                    .font(of: .poppinsMedium14, with: .textHeading)
                
                Text(subtitle)
                    .font(of: .poppinsRegular14, with: .textHeading)
            }
        }
        .foregroundStyle(.textHeading)
        .multilineTextAlignment(.center)
        .padding()
        .onAppear {
            onMainQueue(after: 3.0, withAnimation: .interactiveSpring) {
                enableLoadingView.toggle()
            }
        }
    }
}

#Preview {
    ShopfeeLoadingView(
        title: "Please wait a minute,",
        subtitle: "we will send you the OTP code.", 
        enableLoadingView: .constant(false)
    )
}
