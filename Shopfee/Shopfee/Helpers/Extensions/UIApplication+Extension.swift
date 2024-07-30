//
//  UIApplication+Extension.swift
//  Shopfee
//
//  Created by Husnain Ali on 30/07/2024.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
