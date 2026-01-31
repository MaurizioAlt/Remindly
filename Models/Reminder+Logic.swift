//
//  Reminder+Logic.swift
//  Remindly
//
//  Created by Maurizio Altamura on 1/30/26.
//

import Foundation

extension Reminder {

    var unwrappedDueDate: Date {
        dueDate ?? Date.distantPast
    }
    
    var unwrappedTitle: String {
        title ?? "Untitled Reminder"
    }
    
    var unwrappedCategory: String {
        category ?? "Uncategorized"
    }
    
    var isOverdue: Bool {
        !isCompleted && unwrappedDueDate < Date()
    }

    var isUpcoming: Bool {
        !isCompleted && unwrappedDueDate >= Date()
    }

    func nextDueDate() -> Date? {
        let calendar = Calendar.current

        guard let type = RecurrenceType(rawValue: recurrenceType ?? "none") else {
            return nil
        }

        switch type {
        case .daily:
            return calendar.date(byAdding: .day,
                                 value: Int(recurrenceInterval),
                                 to: unwrappedDueDate)

        case .weekly:
            return calendar.date(byAdding: .weekOfYear,
                                 value: Int(recurrenceInterval),
                                 to: unwrappedDueDate)

        case .monthly:
            var comps = calendar.dateComponents([.year, .month], from: unwrappedDueDate)
            comps.month! += Int(recurrenceInterval)
            comps.day = Int(recurrenceMonthDay)
            return calendar.date(from: comps)

        case .none:
            return nil
        }
    }
}
