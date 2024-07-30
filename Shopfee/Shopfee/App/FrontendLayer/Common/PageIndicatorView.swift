//
//  PageIndicatorView.swift
//  Shopfee
//
//  Created by Husnain Ali on 30/07/2024.
//

import SwiftUI

struct PageIndicatorView: View {
    
    @Binding var currentPage: Int
    var pages: Int
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(Array(0..<pages), id: \.self) { index in
                if currentPage == index {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.brand)
                        .frame(width: 24, height: 12)
                        .animation(.easeInOut, value: currentPage)
                } else {
                    Circle()
                        .fill(Color.textDisabled)
                        .frame(width: 12, height: 12)
                        .animation(.easeInOut, value: currentPage)
                }
            }
        }
    }
}

#Preview {
    PageIndicatorView(currentPage: .constant(0), pages: 3)
}
