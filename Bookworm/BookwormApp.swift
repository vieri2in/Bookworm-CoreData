//
//  BookwormApp.swift
//  Bookworm
//
//  Created by bin li on 7/20/23.
//

import SwiftUI

@main
struct BookwormApp: App {
  @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
