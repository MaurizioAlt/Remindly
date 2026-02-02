//
//  RecurrencePickerView.swift
//  Remindly
//
//  Created by Maurizio Altamura on 1/31/26.
//

import Foundation
import SwiftUI

struct RecurrencePickerView: View {

    @Binding var type: RecurrenceType
    @Binding var interval: Int
    @Binding var monthDay: Int

    var body: some View {
        Section("Repeat") {

            Picker("Frequency", selection: $type) {
                Text("Never").tag(RecurrenceType.none)
                Text("Daily").tag(RecurrenceType.daily)
                Text("Weekly").tag(RecurrenceType.weekly)
                Text("Monthly").tag(RecurrenceType.monthly)
            }

            if type != .none {
                HStack {
                    Text("Every")

                    Stepper(
                        value: $interval,
                        in: 1...30
                    ) {
                        Text(interval == 1
                             ? type.unitSingular
                             : type.unitPlural)
                    }
                }
            }

            if type == .monthly {
                HStack {
                    Text("On the")
                    Picker("Day", selection: $monthDay) {
                        ForEach(1...31, id: \.self) {
                            Text($0.ordinal)
                        }
                    }
                    Text("day")
                }
            }
        }
    }
}
