//
//  MyFourthAppApp.swift
//  MyFourthApp
//
//  Created by Diplomado on 22/09/23.
//

import SwiftUI

@main
struct MyFourthAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
