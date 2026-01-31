//
//  ReminderRowView.swift
//  Remindly
//
//  Created by Maurizio Altamura on 1/30/26.
//

import Foundation
import SwiftUI

struct ReminderRowView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var reminder: Reminder


    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(reminder.unwrappedTitle)
                    .font(.headline)

                Text(reminder.unwrappedDueDate, style: .date)
                    .font(.caption)
                
                Text(reminder.unwrappedCategory)
                    .font(.caption2)
                    .foregroundColor(.secondary)

            }

            Spacer()
        }
        .foregroundColor(reminder.isOverdue ? .red : .primary)
        .swipeActions {
            Button("Done") {
                markCompleted()
            }
            .tint(.green)
        }
    }

    private func markCompleted() {
        withAnimation {
            if let nextDate = reminder.nextDueDate() {
                reminder.dueDate = nextDate
            } else {
                reminder.isCompleted = true
            }

            try? viewContext.save()
        }
    }
}
