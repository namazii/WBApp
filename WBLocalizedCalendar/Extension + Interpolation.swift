//
//  Extension + Interpolation.swift
//  WBLocalizedCalendar
//
//  Created by Назар Ткаченко on 23.06.2024.
//

import Foundation

extension String.StringInterpolation {
    mutating func appendInterpolation(spellOut date: Date, locale: Locale) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .month, .year, .hour, .minute, .second], from: date)

        let dateFormatter = NumberFormatter()
        dateFormatter.locale = locale
        dateFormatter.numberStyle = .spellOut

        guard let day = components.day, let month = components.month, let year = components.year,
              let hour = components.hour, let minute = components.minute, let second = components.second else {
            appendLiteral("Invalid date")
            return
        }

        let dayString = dateFormatter.string(from: NSNumber(value: day)) ?? "\(day)"
        let monthString = dateFormatter.string(from: NSNumber(value: month)) ?? "\(month)"
        let yearString = dateFormatter.string(from: NSNumber(value: year)) ?? "\(year)"

        let formattedDate = "\(dayString) \(monthString), \(yearString)"

        let timeFormatter = DateFormatter()
        timeFormatter.locale = locale
        timeFormatter.timeStyle = .medium

        let formattedTime = timeFormatter.string(from: date)

        let formattedDateTime = "\(formattedDate) \(formattedTime)"
        appendLiteral(formattedDateTime)
    }
}

