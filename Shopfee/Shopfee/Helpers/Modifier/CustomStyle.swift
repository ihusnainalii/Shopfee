//
//  CustomStyle.swift
//  Shopfee
//
//  Created by Husnain Ali - ILI on 30/07/2024.
//

import Foundation
import SwiftUI

struct CustomStyle: ViewModifier {
    var color: Color
    var font: Font
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(color)
            .font(font)
    }
}

extension View {
    func font(of style: Font, with color: Color) -> some View {
        self.modifier(CustomStyle(color: color, font: style))
    }
}
