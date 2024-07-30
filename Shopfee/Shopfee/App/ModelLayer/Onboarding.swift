//
//  Onboarding.swift
//  Shopfee
//
//  Created by Husnain Ali on 30/07/2024.
//

import Foundation

struct Onboarding {
    var title: String
    var description: String
    var image: String
}

extension Onboarding {
    static let onboardingData = [Onboarding(title: "Choose and customize your Drinks",
                                            description: "Customize your own drink exactly how you like it by adding any topping you like!!!",
                                            image: AssetCatalog.Icons.onboardingChoose.name),
                                 Onboarding(title: "Quickly and easly",
                                            description: "You can place your order quickly and easly without wasting time. You can also schedule orders via your smarthphone.",
                                            image: AssetCatalog.Icons.onboardingChoose.name),
                                 Onboarding(title: "Get and Redeem Voucher",
                                            description: "Exciting prizes await you! Redeem yours by collecting all the points after purchase in the app!",
                                            image: AssetCatalog.Icons.onboardingChoose.name)]
}


