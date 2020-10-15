//
//  HPMusicApp.swift
//  HPMusic
//
//  Created by Bill Chen on 2020/10/15.
//

import SwiftUI

@main
struct HPMusicApp: App {
//    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
