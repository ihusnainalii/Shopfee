//
//  TextFieldView.swift
//  Shopfee
//
//  Created by Husnain Ali - ILI on 30/07/2024.
//

import SwiftUI

struct TextFieldView: View {
    
    var title: String
    var placeholder: String
    @Binding var text: String
    @FocusState var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(of: .poppinsRegular14, with: .textHeading)
            
            TextField(placeholder, text: $text)
                .font(of: .poppinsRegular14, with: isFocused ? .textHeading : .placeholder)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(isFocused ? .brand :  .disableField, lineWidth: 1)
                        .shadow(color: isFocused ? .fieldShadow : .clear, radius: 2, x: 0, y: 0)
                )
                .focused($isFocused)
                .tint(.brand)
        }
    }
}

#Preview {
    TextFieldView(title: "Name", placeholder: "Enter your name...", text: .constant(""))
}
