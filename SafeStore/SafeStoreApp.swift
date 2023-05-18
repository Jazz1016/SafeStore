//
//  SafeStoreApp.swift
//  SafeStore
//
//  Created by James Lea on 5/17/23.
//

import SwiftUI

@main
struct SafeStoreApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
