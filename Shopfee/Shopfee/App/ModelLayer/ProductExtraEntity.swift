//
//  ProductExtraEntity.swift
//  Shopfee
//
//  Created by Husnain Ali - ILI on 02/08/2024.
//

import Foundation

struct ProductExtraEntity: Identifiable, Equatable {
    let id: String
    let title: String
    let price: Double
    let currency: String
    
    var priceString: String {
        "+ \(currency). \(price)"
    }
}
