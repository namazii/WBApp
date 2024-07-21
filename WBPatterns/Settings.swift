//
//  Settings.swift
//  WBPatterns
//
//  Created by Назар Ткаченко on 19.07.2024.
//

import SwiftUI

protocol Settings: ObservableObject {
    var isDarkModeEnabled: Bool { get set }
}

extension SettingsManager: Settings {}
