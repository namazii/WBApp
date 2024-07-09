//
//  LocalizedStrings+String.swift
//  WBApp
//
//  Created by Назар Ткаченко on 05.07.2024.
//

import SwiftUI

extension LocalizedStringKey {
    func stringValue() -> String {
        let mirror = Mirror(reflecting: self)
        let attributeLabelAndValue = mirror.children.first { $0.label == "key" }
        return attributeLabelAndValue?.value as? String ?? ""
    }
}
