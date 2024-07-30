//
//  View+Extension.swift
//  Shopfee
//
//  Created by Husnain Ali - ILI on 30/07/2024.
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
}

