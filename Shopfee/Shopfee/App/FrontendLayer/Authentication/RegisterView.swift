//
//  RegisterView.swift
//  Shopfee
//
//  Created by Husnain Ali on 30/07/2024.
//

import SwiftUI

enum RegisterFlow {
    case register
    case verifyOtp
    case createPin
    case done
}

struct RegisterView: View {
    
    @State var name: String = ""
    @State var phoneNumber: String = ""
    @State var otp: String = ""
    @State var isDisabled: Bool = true
    @State var verfifyOPT: Bool = false
    @State var enableLoadingView: Bool = false
    @State var navigateToLogin: Bool = false
    @State var navigateToConfirmOtp: Bool = false
    @State var navigateToCreatePin: Bool = false
    @State var navigateToHome: Bool = false
    @State var flow: RegisterFlow = .register
    
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
                            withAnimation {
                                flow = .register
                                verfifyOPT.toggle()
                                enableLoadingView.toggle()
                            }
                        }, onSecondaryAction: {
                            withAnimation {
                                verfifyOPT.toggle()
                            }
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
                                   subtitle: flow == .createPin ? "We are processing your account" : "we will send you the OTP code.",
                                   enableLoadingView: $enableLoadingView)
                .applyIf(flow == .register) { view in
                    view.onDisappear {
                        withAnimation {
                            navigateToConfirmOtp.toggle()
                        }
                    }
                }
                .applyIf(flow == .createPin) { view in
                    view.onDisappear {
                        withAnimation {
                            navigateToCreatePin.toggle()
                        }
                    }
                }
            })
            .navigationDestination(isPresented: $navigateToCreatePin) {
                PinView(viewModel: CreatePinViewModel())
                    .onDisappear {
                        withAnimation {
                            if flow == .createPin {
                                flow = .done
                                withAnimation {
                                    navigateToHome.toggle()
                                }
                            }
                        }
                    }
            }
            .sheet(isPresented: $navigateToHome, content: {
                Text("User is registered")
            })
            .navigationDestination(isPresented: $navigateToLogin) {
                LoginView()
            }
            .navigationDestination(isPresented: $navigateToConfirmOtp) {
                ConfirmOTPView(number: $phoneNumber, otp: $otp, flow: $flow)
                    .onDisappear {
                        withAnimation {
                            if flow == .verifyOtp {
                                flow = .createPin
                                withAnimation {
                                    enableLoadingView.toggle()
                                }
                            }
                        }
                    }
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
