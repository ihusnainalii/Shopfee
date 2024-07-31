//
//  CustomBackButton.swift
//  Shopfee
//
//  Created by Husnain Ali - ILI on 31/07/2024.
//

import SwiftUI

struct CustomBackButton: ViewModifier {
    
    @Environment(\.dismiss) var dismiss
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(.fiArrowLeft)
                            .resizable()
                            .frame(width: 24, height: 24, alignment: .center)
                    }
                }
            }
    }
}

extension View {
    func customBackButton() -> some View {
        self.modifier(CustomBackButton())
    }
}

