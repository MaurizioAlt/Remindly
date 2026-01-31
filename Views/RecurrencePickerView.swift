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
                ForEach(RecurrenceType.allCases, id: \.self) {
                    Text($0.rawValue.capitalized)
                }
            }

            if type != .none {
                Stepper("Every \(interval)", value: $interval, in: 1...30)
            }

            if type == .monthly {
                Stepper("Day \(monthDay)", value: $monthDay, in: 1...31)
            }
        }
    }
}
