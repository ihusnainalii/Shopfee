//
//  RegisterView.swift
//  Shopfee
//
//  Created by Husnain Ali on 30/07/2024.
//

import SwiftUI

struct RegisterView: View {
    
    @State var name: String = ""
    @State var phoneNumber: String = ""
    @State var isDisabled: Bool = true
    @State var verfifyOPT: Bool = false
    @State var enableLoadingView: Bool = false
    @State var navigateToLogin: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                
                Spacer()
                
                AssetCatalog.Assets.logo.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 219)
                
                TextFieldView(title: "Name", placeholder: "Input your name", text: $name)
                    .padding(.top, 24)
                
                TextFieldView(title: "No. Handphone", placeholder: "Input your No. Handphone", text: $phoneNumber)
                    .padding(.top, 10)
                
                TermAndConditionView(privacyPolicy: {
                    
                }, termsConditions: {
                    
                })
                
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
            .onChange(of: name, { _, _ in
                checkIfButtonShouldEnable()
            })
            .onChange(of: phoneNumber, { _, _ in
                checkIfButtonShouldEnable()
            })
            .fullScreenCover(isPresented: $enableLoadingView, content: {
                ShopfeeLoadingView(title: "Please wait a minute,",
                                   subtitle: "we will send you the OTP code.",
                                   enableLoadingView: $enableLoadingView)
            })
            .navigationDestination(isPresented: $navigateToLogin) {
                LoginView()
            }
        }
    }
    
    private func checkIfButtonShouldEnable() {
        isDisabled = (name.isEmpty && phoneNumber.isEmpty)
    }
    
    private var registerButton: some View {
        Button("Register") {
            verfifyOPT.toggle()
        }
        .buttonStyle(.primary())
        .disabled(isDisabled)
    }
    
    private var loginButtonView: some View {
        HStack {
            Text("Have an account? ")
                .foregroundStyle(.textParagraph)
            
            Button("Login") {
                navigateToLogin.toggle()
            }
            .foregroundStyle(.brand)
        }
        .font(.poppinsMedium14)
    }
}

#Preview {
    RegisterView()
}
