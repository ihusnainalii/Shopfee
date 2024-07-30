//
//  RegisterView.swift
//  Shopfee
//
//  Created by Husnain Ali on 30/07/2024.
//

import SwiftUI

struct RegisterView: View {
    
    @State var name: String = ""
    @State var handphone: String = ""
    @State var isDisabled: Bool = false
    
    var body: some View {
        VStack(spacing: 8) {
            
            Spacer()
            
            AssetCatalog.Assets.logo.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 219)
            
            TextFieldView(title: "Name", placeholder: "Input your name", text: $name)
                .padding(.top, 24)
            
            TextFieldView(title: "No. Handphone", placeholder: "Input your No. Handphone", text: $handphone)
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
    }
    
    private var registerButton: some View {
        Button("Register") {
            
        }
        .buttonStyle(.primary())
        .disabled(isDisabled)
    }
    
    private var loginButtonView: some View {
        HStack {
            Text("Have an account? ")
                .foregroundStyle(.textParagraph)
            
            Button("Login") {
                
            }
            .foregroundStyle(.brand)
        }
        .font(.poppinsMedium14)
    }
}

#Preview {
    RegisterView()
}
