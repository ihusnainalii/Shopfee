//
//  ShopfeeLoadingView.swift
//  Shopfee
//
//  Created by Husnain Ali - ILI on 30/07/2024.
//

import SwiftUI

struct LoadingGifView: View {
    let url = Bundle.main.url(forResource: "loading", withExtension: "gif")!
    
    var body: some View {
        GifView(url)
            .frame(width: 200, height: 120)
            .mask {
                RoundedRectangle(cornerRadius: 16)
            }
    }
}

#Preview {
    LoadingGifView()
}
