//
//  SettingsManager.swift
//  WBPatterns
//
//  Created by Назар Ткаченко on 19.07.2024.
//

import Combine

final class SettingsManager: ObservableObject {
    static let shared = SettingsManager()
    
    @Published var isDarkModeEnabled: Bool = false
    
    private init() {}
}
