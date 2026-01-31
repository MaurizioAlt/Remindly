//
//  RemindlyApp.swift
//  Remindly
//
//  Created by Maurizio Altamura on 1/29/26.
//

import SwiftUI

@main
struct RemindlyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext).onAppear {
                    NotificationManager.shared.requestPermission()
                }
        }
    }
}
