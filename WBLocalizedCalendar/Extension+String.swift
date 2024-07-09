//
//  Extension+String.swift
//  WBLocalizedCalendar
//
//  Created by Назар Ткаченко on 23.06.2024.
//

import Foundation

enum LocalizePathName: String {
    case german = "de"
    case english = "en"
    case french = "fr"
    case japanese = "ja"
    case russian = "ru"
}

extension String {
    
    func LocalizedString(_ key: String) -> String {
        return NSLocalizedString(key, bundle: LocalizationManager.shared.currentBundle(), comment: "")
    }
}

final class LocalizationManager {
    static let shared = LocalizationManager()
    
    private var currentLanguage: String {
        get {
            return UserDefaults.standard.string(forKey: "AppLanguage") ?? Locale.preferredLanguages.first ?? "en"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "AppLanguage")
        }
    }
    
    func setAppLanguage(_ languageCode: String) {
        if Bundle.main.localizations.contains(languageCode) {
            currentLanguage = languageCode
        }
    }
    
    func currentBundle() -> Bundle {
        if let path = Bundle.main.path(forResource: currentLanguage, ofType: "lproj") {
            if let bundle = Bundle(path: path) {
                return bundle
            } else {
                print("Bundle not found at path: \(path)")
            }
        } else {
            print("Path not found for resource: \(currentLanguage).lproj")
        }
        return Bundle.main
    }
}

