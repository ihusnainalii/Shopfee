//
//  CreatePinView.swift
//  Shopfee
//
//  Created by Husnain Ali - ILI on 31/07/2024.
//

import SwiftUI

struct PinView<ViewModel: PinViewModelProtocol>: View {

    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack(spacing: 32) {
           
            VStack(spacing: 32) {
                image
                descriptionView
                pinTextField
            }
            
            Spacer()
            if viewModel.enableContinueButton {
                confirmButton
            }
        }
        .padding(.vertical)
        .padding()
        .background(Color.neutralLight)
        .tint(Color.brand)
        .foregroundStyle(.textHeading)
        .closeKeyboardWhenTap()
        .animation(.interactiveSpring(), value: viewModel.showPin)
        .customizeNavigation(with: viewModel.navigationTitle)
    }
    
    private var image: some View {
        viewModel.image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
    }
    
    private var descriptionView: some View {
        VStack(spacing: 8) {
            Text(viewModel.descriptionTitle)
                .font(.poppinsMedium14)
            
            Text(viewModel.descriptionSubtitle)
                .font(.poppinsRegular14)
        }
        .foregroundStyle(.textHeading)

    }
    
    private var pinTextField: some View {
        VStack {
            PinTextField(
                pin: $viewModel.pin,
                pinLength: viewModel.pinLength,
                showPin: viewModel.showPin
            )
            
            if viewModel.enableShowPin {
                showHidePin
            }
            
            if viewModel.enableForgetPin {
                forgetPinButton
            }
        }
        .applyIf(!viewModel.enableContinueButton) { view in
            view.onChange(of: viewModel.pin) { _, newValue in
                if newValue.count == viewModel.pinLength {
                    dismiss()
                }
            }
        }
    }
    
    private var showHidePin: some View {
        Button {
            withAnimation {
                viewModel.showPin.toggle()
            }
        } label: {
            HStack {
                Text(viewModel.showPin ? "Hide your PIN" :"Show your PIN")
                Image(systemName: viewModel.showPin ? "eye.slash" : "eye")
            }
        }
        .buttonStyle(.ghost)
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    private var forgetPinButton: some View {
        HStack(spacing: 2) {
            Text("Forgot PIN?")
                .font(.poppinsRegular12)
                .multilineTextAlignment(.center)
                .frame(minHeight: 44)
            
            Button("Change PIN.") {
                
            }
            .buttonStyle(.info)
        }
    }
    
    private var confirmButton: some View {
        Button("Confirm") {
            withAnimation {
                dismiss()
            }
        }
        .buttonStyle(.primary())
        .disabled(!viewModel.isEnabledConfirmButton())
    }
}

#Preview {
    PinView(viewModel: CreatePinViewModel())
}
