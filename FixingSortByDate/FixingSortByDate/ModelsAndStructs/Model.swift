//
//  Model.swift
//  FixingSortByDate
//
//  Created by Farkhat Kassimov on 23.05.2023.
//

import Foundation

struct Section {
    var sectionDate: Date
    let sessions: [Session]
}

struct Session {
    let dateModel: Date?
    let timeBegModel: Date?
    let timeEndModel: Date?
    let sessionModel: String?
    let venueModel: String?
    var formattedTimeBeg: String {
        guard let text = timeBegModel else {
            return ""
        }
        return DateFormatter.adjustedTimeFormat.string(from: text)
    }
    var formattedTimeEnd: String {
        guard let text = timeEndModel else {
            return ""
        }
        return DateFormatter.adjustedTimeFormat.string(from: text)
    }
}
