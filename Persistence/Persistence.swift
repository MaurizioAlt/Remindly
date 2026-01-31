//
//  Persistence.swift
//  Remindly
//
//  Created by Maurizio Altamura on 1/29/26.
//

import CoreData

struct PersistenceController {

    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Remindly")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved Core Data error \(error), \(error.userInfo)")
            }
        }

        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}

extension PersistenceController {
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        let viewContext = controller.container.viewContext

        for i in 0..<5 {
            let reminder = Reminder(context: viewContext)
            reminder.id = UUID()
            reminder.title = "Sample Reminder \(i)"
            reminder.dueDate = Date().addingTimeInterval(Double(i) * 86400)
            reminder.isCompleted = false
            reminder.category = "House Work"
        }

        try? viewContext.save()
        return controller
    }()
}
