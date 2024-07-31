//
//  OTPTextFieldView.swift
//  Shopfee
//
//  Created by Husnain Ali - ILI on 31/07/2024.
//

import SwiftUI

struct OTPTextFieldView: View {
    
    @Binding var otp: String
    let otpLength: Int
    
    var body: some View {
        OTPTextField(otp: $otp, otpLength: otpLength, spacing: 8) { pin, _, focused in
            Text(pin)
                .foregroundStyle(.textHeading)
                .font(.poppinsMedium32)
                .frame(maxWidth: .infinity)
                .frame(height: 70)
                .background(.neutralMediam)
                .mask(RoundedRectangle(cornerRadius: 12))
                .background {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(lineWidth: 1)
                        .fill(focused ? .brand : .clear)
                        .shadow(color: focused ? .brand : .clear, radius: 2)
                }
        }
        .keyboardType(.numberPad)
    }
}

#Preview {
    OTPTextFieldView(otp: .constant(""), otpLength: 6)
}
