//
//  DateExtension.swift
//  MidiOS
//
//  Created by elena hermina barbullushi on 13.02.21.
//

import Foundation

extension Date {
    var formattedAge: String {
        if let age = Calendar.current.dateComponents([.year], from: self, to: Date()).year {
            return "\(age) años"
        } else {
            return ""
        }
    }
}
