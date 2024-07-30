//
//  CustomButtonStyle.swift
//  Shopfee
//
//  Created by Husnain Ali - ILI on 30/07/2024.
//

import SwiftUI

enum CustomButtonType {
    case text
    case icon
    case both
}

struct CustomButtonView: View {
    
    var style: CustomButtonType
    var title: String
    var icon: Image?
    var action: Action
    @Binding var disabled: Bool
    
    init(style: CustomButtonType = .both,
         title: String,
         icon: Image? = nil,
         disabled: Binding<Bool> = .constant(false),
         action: @escaping Action) {
        self.style = style
        self.icon = icon
        self.title = title
        self.action = action
        _disabled = disabled
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Spacer()
                switch style {
                case .text:
                    textComponent()
                case .icon:
                    imageComponent()
                case .both:
                    textComponent()
                    imageComponent()
                }
                Spacer()
            }
        }
        .padding()
        .frame(height: 48)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(disabled ? .textDisabled : .brand)
        )
        .disabled(disabled)
    }
    
    @ViewBuilder func textComponent() -> some View {
        Text(title.capitalized)
            .font(of: .poppinsMedium14, with: .white)
    }
    
    @ViewBuilder func imageComponent() -> some View {
        if let icon {
            icon
                .resizable()
                .frame(width: 16, height: 16, alignment: .center)
        }
    }
}

#Preview {
    CustomButtonView(title: "proceed to home", 
                     icon: Image(.fiArrowRight),
                     disabled: .constant(true),
                     action: {
        
    })
}
