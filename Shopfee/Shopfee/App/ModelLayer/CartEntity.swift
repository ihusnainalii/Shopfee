//
//  CartEntity.swift
//  Shopfee
//
//  Created by Husnain Ali - ILI on 02/08/2024.
//

import Foundation
import SwiftUI

struct CartEntity: Identifiable, Equatable {
    
    static func == (lhs: CartEntity, rhs: CartEntity) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: String
    let name: String
    let ingredients: String
    let currency: String
    let price: Double
    var count: Int
    let imageUrl: String
    let customize: [FilterPickerItem]
    let extra: [ProductExtraEntity]
    let image: UIImage
    
    var totalPrice: Double {
        (price + extra.map { $0.price }.reduce(0, +) + extra.map { $0.price }.reduce(0, +)) * Double(count)
    }
    
    mutating func updateCount(_ count: Int) {
        self.count = count
    }
}
