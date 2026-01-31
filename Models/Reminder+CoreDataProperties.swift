//
//  Reminder+CoreDataProperties.swift
//  Remindly
//
//  Created by Maurizio Altamura on 1/29/26.
//
//

import Foundation
import CoreData


extension Reminder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Reminder> {
        return NSFetchRequest<Reminder>(entityName: "Reminder")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var dueDate: Date?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var category: String?
    @NSManaged public var recurrenceType: String?
    @NSManaged public var recurrenceInterval: Int16
    @NSManaged public var recurrenceWeekday: Int16
    @NSManaged public var recurrenceMonthDay: Int16

}

extension Reminder : Identifiable {

}
