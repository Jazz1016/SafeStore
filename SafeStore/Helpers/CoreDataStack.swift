//
//  CoreDataStack.swift
//  SafeStore
//
//  Created by James Lea on 5/17/23.
//

import CoreData

enum CoreDataStack {

    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SafeStoreData")
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                fatalError("Error loading persistent stores \(error)")
            }
        }
        return container
    }()

    static var context: NSManagedObjectContext { container.viewContext }

    static func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error saving context \(error)")
            }
        }
    }
    
    static func delete(safetyTip: SafetyTip) {
            context.delete(safetyTip)
            saveContext()
        }
}
