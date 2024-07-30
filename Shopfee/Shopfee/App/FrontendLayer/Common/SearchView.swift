//
//  SearchView.swift
//  Shopfee
//
//  Created by Husnain Ali - ILI on 30/07/2024.
//

import SwiftUI

struct SearchView: View {
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        HStack {
            TextField(placeholder, text: $text)
                .frame(maxWidth: .infinity)
                .font(of: .poppinsRegular12, with: .textDisabled)
            
            Image(.fiSearch)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(.textDisabled)
        }
        .frame(height: 40)
        .padding(.horizontal, 14)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .stroke(lineWidth: 1.5)
                .fill(.brand100)
        }
    }
}

#Preview {
    SearchView(text: .constant(""), placeholder: "Search here...")
}
