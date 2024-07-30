//
//  LoginView.swift
//  Shopfee
//
//  Created by Husnain Ali on 30/07/2024.
//

import SwiftUI

struct LoginView: View {
    
    @State var phoneNumber: String = ""
    @State var isDisabled: Bool = true
    @State var verfifyOPT: Bool = false
    @State var enableLoadingView: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                
                Spacer()
                
                AssetCatalog.Assets.logo.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 219)
                
                TextFieldView(title: "No. Handphone", placeholder: "Input your No. Handphone", text: $phoneNumber)
                    .padding(.top, 10)
                
                registerButton
                Spacer()
                loginButtonView
            }
            .padding()
            .closeKeyboardWhenTap()
            .disabled(verfifyOPT)
            .applyIf(verfifyOPT) { view in
                view.overlay {
                    PopUpView(
                        .otp(to: phoneNumber),
                        onPrimaryAction: {
                            verfifyOPT.toggle()
                            enableLoadingView.toggle()
                        }, onSecondaryAction: {
                            verfifyOPT.toggle()
                        }
                    )
                }
            }
            .onChange(of: phoneNumber, { _, _ in
                checkIfButtonShouldEnable()
            })
            .fullScreenCover(isPresented: $enableLoadingView, content: {
                ShopfeeLoadingView(title: "Please wait a minute,",
                                   subtitle: "we will send you the OTP code.",
                                   enableLoadingView: $enableLoadingView)
            })
            .navigationBarBackButtonHidden()
        }
    }
    
    private func checkIfButtonShouldEnable() {
        isDisabled = phoneNumber.isEmpty
    }
    
    private var registerButton: some View {
        Button("Login") {
            verfifyOPT.toggle()
        }
        .buttonStyle(.primary())
        .disabled(isDisabled)
    }
    
    private var loginButtonView: some View {
        HStack {
            Text("Don’t have an account? ")
                .foregroundStyle(.textParagraph)
            
            Button("Register") {
                dismiss()
            }
            .foregroundStyle(.brand)
        }
        .font(.poppinsMedium14)
    }
}

#Preview {
    RegisterView()
}
