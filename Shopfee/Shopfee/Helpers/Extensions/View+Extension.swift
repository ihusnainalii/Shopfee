//
//  View+Extension.swift
//  Shopfee
//
//  Created by Husnain Ali on 30/07/2024.
//

import SwiftUI

public extension View {
    
    @ViewBuilder
    func applyIf(_ condition: Bool, _ modifer: (Self) -> some View) -> some View {
        if condition {
            AnyView(modifer(self))
        } else {
            AnyView(self)
        }
    }
    
    @ViewBuilder
    func navigationTitle(_ title: String) -> some View {
        toolbar {
            ToolbarItem(placement: .principal) {
                Text(title)
                    .font(.poppinsMedium16)
                    .foregroundStyle(.textHeading)
            }
        }
    }
}

