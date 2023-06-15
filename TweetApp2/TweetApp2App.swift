//
//  TweetApp2App.swift
//  TweetApp2
//
//  Created by itakura shouho on 2023/06/15.
//

import SwiftUI

@main
struct TweetApp2App: App {
    let persistenceController = PersistenceController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
