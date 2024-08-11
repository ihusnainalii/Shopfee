//
//  TabBarViewModelProtocol.swift
//  Shopfee
//
//  Created by Husnain Ali - ILI on 02/08/2024.
//

import Foundation
import SwiftUI

@MainActor
protocol TabBarViewModelProtocol: ObservableObject {
    var items: [any TabBarItem] { get set }
    var selectedItem: TabBarItemType { get set }
    var showTabBar: Bool { get set }

    var cart: [CartEntity] { get set }

    func cartTotalPrice() -> String
}
