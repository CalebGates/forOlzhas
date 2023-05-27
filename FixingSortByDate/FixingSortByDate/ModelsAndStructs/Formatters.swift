//
//  Formatters.swift
//  FixingSortByDate
//
//  Created by Farkhat Kassimov on 23.05.2023.
//

import Foundation

extension DateFormatter {
    static let adjustedDateFormat: DateFormatter = {
        let formatterDate = DateFormatter()
        formatterDate.dateFormat = "dd MMMM yyyy"
        return formatterDate }() }

extension DateFormatter {
    static let adjustedTimeFormat: DateFormatter = {
        let formatterTime = DateFormatter()
        formatterTime.dateFormat = "HH:mm"
        return formatterTime }() }
