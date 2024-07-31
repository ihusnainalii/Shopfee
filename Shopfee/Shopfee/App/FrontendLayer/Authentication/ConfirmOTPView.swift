//
//  ConfirmOTPView.swift
//  Shopfee
//
//  Created by Husnain Ali - ILI on 31/07/2024.
//

import SwiftUI

struct ConfirmOTPView: View {
    
    @Binding var number: String
    @Binding var otp: String
    @Binding var flow: RegisterFlow
    var otpLength: Int = 6
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 32) {
            
            VStack(spacing: 0) {
                Text(number)
                    .font(.poppinsMedium24)
                
                Text("Enter the 6-digit OTP code that has been sent from SMS to complete your account registration")
                    .font(.poppinsRegular12)
                    .multilineTextAlignment(.center)
                    .frame(minHeight: 44)
            }
            
            OTPTextFieldView(otp: $otp, otpLength: otpLength)
            
            HStack(spacing: 2) {
                Text("Haven't got the confirmation code yet?")
                    .font(.poppinsRegular12)
                    .multilineTextAlignment(.center)
                    .frame(minHeight: 44)
                
                Button("Resend") {
                    
                }
                .buttonStyle(.info)
            }
            
            Spacer()
            Button("Confirm") {
                flow = .verifyOtp
                dismiss()
            }
            .buttonStyle(.primary())
            .disabled(otp.count != otpLength)
        }
        .padding(.vertical)
        .padding()
        .background(Color.neutralLight)
        .tint(Color.brand)
        .foregroundStyle(.textHeading)
        .closeKeyboardWhenTap()
        .customizeNavigation(with: "Confirm OTP code")
    }
}

#Preview {
    ConfirmOTPView(number: .constant("7686767"), otp: .constant("123456"), flow: .constant(.verifyOtp))
}
