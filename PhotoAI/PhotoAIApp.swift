//
//  PhotoAIApp.swift
//  PhotoAI
//
//  Created by Jakub Ruranski on 18/07/2023.
//

import SwiftUI

@main
struct PhotoAIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
