import SwiftUI
import CoreData

struct ContentView: View {

    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Reminder.dueDate, ascending: true)],
        predicate: NSPredicate(format: "isCompleted == NO"),
        animation: .default
    )
    private var reminders: FetchedResults<Reminder>


    var body: some View {
        NavigationView {
            List {

                Section("Pending") {
                    ForEach(reminders.filter { $0.isOverdue }) {
                        ReminderRowView(reminder: $0)
                    }
                }

                Section("Upcoming") {
                    ForEach(reminders.filter { $0.isUpcoming }) {
                        ReminderRowView(reminder: $0)
                    }
                }
            }
            .navigationTitle("Reminders")
            .toolbar {
                NavigationLink {
                    AddReminderView()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}
