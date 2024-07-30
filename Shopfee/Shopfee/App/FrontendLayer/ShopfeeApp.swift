//
//  ShopfeeApp.swift
//  Shopfee
//
//  Created by Husnain Ali - ILI on 30/07/2024.
//

import SwiftUI

@main
struct ShopfeeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            SplashScreen().loadView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
