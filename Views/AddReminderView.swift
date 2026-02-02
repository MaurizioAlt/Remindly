//
//  AddReminderView.swift
//  Remindly
//
//  Created by Maurizio Altamura on 1/30/26.
//

import Foundation
import SwiftUI

struct AddReminderView: View {

    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss

    @State private var title = ""
    @State private var dueDate = Date()
    @State private var category: ReminderCategory = .house
    @State private var recurrenceType: RecurrenceType = .none
    @State private var recurrenceInterval = 1
    @State private var recurrenceMonthDay = Calendar.current.component(.day, from: Date())


    var body: some View {
        Form {
            TextField("Title", text: $title)
            DatePicker("Due Date", selection: $dueDate)

            Picker("Category", selection: $category) {
                ForEach(ReminderCategory.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }

            RecurrencePickerView(
                type: $recurrenceType,
                interval: $recurrenceInterval,
                monthDay: $recurrenceMonthDay
            )
            
            if recurrenceType != .none {
                Text(recurrenceSummary)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.leading)
            }

            Button("Save") {
                saveReminder()
            }
        }
        .navigationTitle("New Reminder")
    }

    private func saveReminder() {
        let reminder = Reminder(context: viewContext)
        
        NotificationManager.shared.schedule(reminder: reminder)
        
        reminder.id = UUID()
        reminder.title = title
        reminder.dueDate = dueDate
        reminder.category = category.rawValue
        reminder.isCompleted = false
        reminder.recurrenceType = recurrenceType.rawValue
        reminder.recurrenceInterval = Int16(recurrenceInterval)
        reminder.recurrenceMonthDay = Int16(recurrenceMonthDay)

        try? viewContext.save()
        dismiss()
    }
    
    private var recurrenceSummary: String {
        switch recurrenceType {
        case .daily:
            return "Repeats every \(recurrenceInterval) " +
                   (recurrenceInterval == 1 ? "day" : "days")

        case .weekly:
            return "Repeats every \(recurrenceInterval) " +
                   (recurrenceInterval == 1 ? "week" : "weeks")

        case .monthly:
            return "Repeats every \(recurrenceInterval) " +
                   (recurrenceInterval == 1 ? "month" : "months") +
                   " on the \(recurrenceMonthDay.ordinal)"

        case .none:
            return ""
        }
    }

}
