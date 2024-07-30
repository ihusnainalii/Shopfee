//
//  KeyboardHandling.swift
//  Shopfee
//
//  Created by Husnain Ali on 30/07/2024.
//

import Foundation
import SwiftUI

struct KeyboardHandling: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
    }
}

extension View {
    func closeKeyboardWhenTap() -> some View {
        self.modifier(KeyboardHandling())
    }
}
