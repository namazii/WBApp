//
//  CustomAppIntent.swift
//  WBApp
//
//  Created by Назар Ткаченко on 22.06.2024.
//

import Foundation
import AppIntents
import WidgetKit


struct CustomAppIntent: AppIntent {
    static var title: LocalizedStringResource = "Add Value"
    
    static var description: IntentDescription? = IntentDescription("Add Value")
    
    func perform() async throws -> some IntentResult {
        let data: DataService = .init()
        data.add()
        
        WidgetCenter.shared.reloadAllTimelines()
        return .result()
    }
}
