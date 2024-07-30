//
//  TermAndConditionView.swift
//  Shopfee
//
//  Created by Husnain Ali - ILI on 30/07/2024.
//

import SwiftUI

struct TermAndConditionView: View {
    
    var privacyPolicy: Action
    var termsConditions: Action
    
    init(privacyPolicy: @escaping () -> Void,
         termsConditions: @escaping () -> Void) {
        self.privacyPolicy = privacyPolicy
        self.termsConditions = termsConditions
    }
    
    var attributedString: AttributedString {
        var string = AttributedString("""
By tapping "Register" you agree to our \nTerms of Use and Privacy Policy
""")
        
        if let privacyRange = string.range(of: "Privacy Policy") {
            string[privacyRange].link = URL(string: "privacy")
            string[privacyRange].foregroundColor = .textHeading
            string[privacyRange].font = .poppinsRegular12
        }
        
        if let termsRange = string.range(of: "Terms of Use") {
            string[termsRange].link = URL(string: "terms")
            string[termsRange].foregroundColor = .textHeading
            string[termsRange].font = .poppinsRegular12
        }
        
        return string
    }
    
    var body: some View {
        Text(attributedString)
            .environment(\.openURL, OpenURLAction { url in
                if url.absoluteString.contains("privacy") {
                    privacyPolicy()
                } else if url.absoluteString.contains("terms") {
                    termsConditions()
                }
                return .discarded
            })
            .font(of: .poppinsRegular12, with: .neutral)
            .padding()
            .multilineTextAlignment(.center)
            .lineSpacing(6)
    }
}
#Preview {
    TermAndConditionView(privacyPolicy: {}, termsConditions: {})
}
