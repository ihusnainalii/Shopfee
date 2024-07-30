//
//  OTPPopUpItem.swift
//  Shopfee
//
//  Created by Husnain Ali - ILI on 30/07/2024.
//

import Foundation
import SwiftUI

struct OTPPopUpItem: PopUpItem {
    let phoneNumber: String
    var image: Image = Image(.otp)
    var title: String = "Send OTP code"
    var subTitle: String {
        "We will send the OTP code via SMS. Make sure the number \(phoneNumber) is active"
    }
    var primaryButtonTitle: String = "Confirm"
    var secondaryButtonTitle: String = "Cancel"
}

extension PopUpItem where Self == OTPPopUpItem {
    static func otp(to phoneNumber: String) -> any PopUpItem {
        OTPPopUpItem(phoneNumber: phoneNumber)
    }
}
