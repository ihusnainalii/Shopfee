//
//  TabBarViewModel.swift
//  Shopfee
//
//  Created by Husnain Ali on 02/08/2024.
//

import Foundation
import Combine
import SwiftUI

@MainActor
final class TabBarViewModel: TabBarViewModelProtocol {
    
    @Published var items: [any TabBarItem] = []
    @Published var selectedItem: TabBarItemType = .home
    @Published var showTabBar: Bool = true
    @Published var cart: [CartEntity] = []

    private var showTabBarCancellable: Cancellable?
    private var cartCancellable: Cancellable?

    private let showTabBarPublisher: AnyPublisher<Bool, Never>

    init(showTabBarPublisher: AnyPublisher<Bool, Never>) {
        self.showTabBarPublisher = showTabBarPublisher
    }

    deinit {
        showTabBarCancellable?.cancel()
    }

    func cartTotalPrice() -> String {
        let currency = cart.first?.currency ?? ""
        let totalPrice = cart.map { $0.totalPrice }.reduce(0, +)

        return "\(currency)\(totalPrice)"
    }
}

private extension TabBarViewModel {
    func bindShowTabBar() {
        showTabBarCancellable = showTabBarPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.showTabBar, on: self)
    }
}
