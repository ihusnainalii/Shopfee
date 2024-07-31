//
//  CreatePinViewModel.swift
//  Shopfee
//
//  Created by Husnain Ali - ILI on 31/07/2024.
//

import Foundation
import SwiftUI

@MainActor
final class CreatePinViewModel: PinViewModelProtocol {
    
    @Published var pin: String = ""
    @Published var pinLength: Int = 6
    @Published var showPin: Bool = false
    
    @Published var image: Image = Image(.cuate)
    @Published var navigationTitle: String = "Create a PIN"
    @Published var descriptionTitle: String = "Finally, Your final step...."
    @Published var descriptionSubtitle: String = "Enter 6 numbers to keep your account safe"
    
    @Published var enableShowPin: Bool = true
    @Published var enableForgetPin: Bool = false
    @Published var enableContinueButton: Bool = true
    
    func isEnabledConfirmButton() -> Bool {
        true
    }
}
