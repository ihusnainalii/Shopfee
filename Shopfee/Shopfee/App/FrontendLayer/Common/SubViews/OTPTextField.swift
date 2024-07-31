//
//  OTPTextField.swift
//  Shopfee
//
//  Created by Husnain Ali - ILI on 31/07/2024.
//

import SwiftUI

public struct OTPTextField<Content: View>: View {
    
    @Binding public var otp: String
    public let otpLength: Int
    public var spacing: CGFloat = 0
    @ViewBuilder public let content: (String, Int, Bool) -> Content // (pin, index, focused)

    @FocusState private var focusTextField: Bool
    
    public init(
        otp: Binding<String>,
        otpLength: Int,
        spacing: CGFloat,
        @ViewBuilder content: @escaping (String, Int, Bool) -> Content
    ) {
        self._otp = otp
        self.otpLength = otpLength
        self.spacing = spacing
        self.content = content
    }
    
    public var body: some View {
        HStack(spacing: spacing) {
            ForEach(0..<otpLength, id: \.self) { index in
                content(pin(at: index), index, index < otp.count)
                    .frame(maxWidth: .infinity)
            }
        }
        .frame(maxWidth: .infinity)
        .onTapGesture {
            focusTextField = true
        }
        .background {
            backgroundTextField
        }
        .onChange(of: otp) { _, _ in
            limitOTPToCount()
        }
    }
    
    private var backgroundTextField: some View {
        TextField("", text: $otp)
            .frame(width: 0, height: 0, alignment: .center)
            .font(Font.system(size: 0))
            .accentColor(.blue)
            .foregroundColor(.blue)
            .multilineTextAlignment(.center)
            .focused($focusTextField)
    }
    
    private func pin(at index: Int) -> String {
        guard otp.count > index else {
            return ""
        }
        return String(otp[index])
    }
    
    private func limitOTPToCount() {
        if otp.count > otpLength {
            otp = String(otp.prefix(otpLength))
        }
    }
}


#Preview {
    OTPTextField(otp: .constant("202"), otpLength: 5, spacing: 8) { pin, _, focused in
        Text(pin)
            .frame(width: 60, height: 70)
            .background(.gray)
            .mask(RoundedRectangle(cornerRadius: 16))
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(lineWidth: 1)
                    .fill(focused ? .brown : .clear)
            }
    }
}

