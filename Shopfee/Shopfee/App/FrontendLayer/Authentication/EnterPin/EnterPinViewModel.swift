//
//  EnterPinViewModel.swift
//  Shopfee
//
//  Created by Husnain Ali - ILI on 01/08/2024.
//

import Foundation
import SwiftUI

@MainActor
final class EnterPinViewModel: PinViewModelProtocol {

    @Published var pin: String = ""
    @Published var pinLength: Int = 6
    @Published var showPin: Bool = false
    
    @Published var image: Image = Image(.cuate)
    @Published var navigationTitle: String = "Input your PIN"
    @Published var descriptionTitle: String = ""
    @Published var descriptionSubtitle: String = "Enter 6 digit PIN for secure account access"
    
    @Published var enableContinueButton: Bool = false
    @Published var enableShowPin: Bool = false
    @Published var enableForgetPin: Bool = true
    
    func isEnabledConfirmButton() -> Bool {
        true
    }
}
