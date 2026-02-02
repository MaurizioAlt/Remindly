//
//  RecurrenceDisplay.swift
//  Remindly
//
//  Created by Maurizio Altamura on 1/31/26.
//

import Foundation
import Foundation

extension Int {
    var ordinal: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}

extension RecurrenceType {
    var unitSingular: String {
        switch self {
        case .daily: return "day"
        case .weekly: return "week"
        case .monthly: return "month"
        case .none: return ""
        }
    }

    var unitPlural: String {
        unitSingular + "s"
    }
}
