//
//  DataController.swift
//  Bookworm
//
//  Created by bin li on 7/20/23.
//
import CoreData
import Foundation
class DataController: ObservableObject {
  let container = NSPersistentContainer(name: "Bookworm")
  init() {
    container.loadPersistentStores { _, error in
      if let error = error as? NSError {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    }
  }
}
