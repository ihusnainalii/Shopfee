//
//  PinViewModelProtocol.swift
//  Shopfee
//
//  Created by Husnain Ali - ILI on 31/07/2024.
//

import Foundation
import SwiftUI

@MainActor
protocol PinViewModelProtocol: ObservableObject {
    var pin: String { get set }
    var pinLength: Int { get set }
    var showPin: Bool { get set }
    var enableShowPin: Bool { get set }
    var enableForgetPin: Bool { get set }
    var enableContinueButton: Bool { get set }
    
    var image: Image { get set }
    var navigationTitle: String { get set }
    var descriptionTitle: String { get set }
    var descriptionSubtitle: String { get set }
    
    func isEnabledConfirmButton() -> Bool
}
