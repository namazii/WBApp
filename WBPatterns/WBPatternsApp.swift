//
//  WBPatternsApp.swift
//  WBPatterns
//
//  Created by Назар Ткаченко on 19.07.2024.
//

import SwiftUI

@main
struct WBPatternsApp: App {
    @StateObject private var settingsManager = SettingsManager.shared
    
    var body: some Scene {
        WindowGroup {
            RootView(settings: settingsManager) // Dependency Injection
        }
    }
}
