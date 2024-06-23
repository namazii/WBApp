//
//  StringInterpolationView.swift
//  WBLocalizedCalendar
//
//  Created by Назар Ткаченко on 23.06.2024.
//

import SwiftUI

struct StringInterpolationView: View {
    
    @State private var selectedDate = Date()
    @State private var selectedLocale = Locale.current
    
    private var dateStyle = DateFormatter.Style.long
    private let localeEmojis = ["🇺🇸", "🇫🇷", "🇷🇺", "🇩🇪", "🇯🇵"]
    private let locales: [Locale] = [
        Locale(identifier: "en_US"), // 🇺🇸
        Locale(identifier: "fr_FR"), // 🇫🇷
        Locale(identifier: "ru_RU"), // 🇷🇺
        Locale(identifier: "de_DE"), // 🇩🇪
        Locale(identifier: "ja_JP")  // 🇯🇵
    ]
    
    var body: some View {
        VStack {
            DatePicker("Date", selection: $selectedDate, displayedComponents: [.date])
                .padding()
            
            Picker("Choose Language", selection: $selectedLocale) {
                ForEach(0..<locales.count, id: \.self) { item in
                    Text(self.localeEmojis[item]).tag(self.locales[item])
                }
            }
            .pickerStyle(.segmented)
            .padding()

            let dates = createDates(from: selectedDate, locale: selectedLocale)
            List {
                ForEach(dates, id: \.self) { dateText in
                    Text(dateText)
                        .font(dateText.contains("Today") ? .subheadline.bold() : .subheadline)
                }
            }
            .listStyle(.plain)
            .font(.subheadline)
        }
    }
}

extension StringInterpolationView {
    private func localizedDayNames(for locale: Locale) -> [String] {
        print(locale)
        
        let languageCode: String
        
        switch locale.identifier {
        case "de_DE":
            languageCode = LocalizePathName.german.rawValue
        case "en_US":
            languageCode = LocalizePathName.english.rawValue
        case "fr_FR":
            languageCode = LocalizePathName.french.rawValue
        case "ja_JP":
            languageCode = LocalizePathName.japanese.rawValue
        case "ru_RU":
            languageCode = LocalizePathName.russian.rawValue
        default:
            languageCode = LocalizePathName.english.rawValue
        }
        
        LocalizationManager.shared.setAppLanguage(languageCode)
        
        let names = [
            "Day before yesterday".LocalizedString("Day before yesterday"),
            "Yesterday".LocalizedString("Yesterday"),
            "Today".LocalizedString("Today"),
            "Tomorrow".LocalizedString("Tomorrow"),
            "Day after tomorrow".LocalizedString("Day after tomorrow")
        ]
        
        return names
    }


    private func createDates(from date: Date, locale: Locale) -> [String] {
        let calendar = Calendar.current
        let dayOffsets = [-2, -1, 0, 1, 2]
        let dayNames = localizedDayNames(for: locale)

        return dayOffsets.enumerated().map { index, offset in
            let newDate = calendar.date(byAdding: .day, value: offset, to: date)!
            return "\(dayNames[index]): \(spellOut: newDate, locale: locale)"
        }
    }
}

#Preview {
    StringInterpolationView()
}

