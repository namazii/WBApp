//
//  UIApplication+EditingMode.swift
//  WBApp
//
//  Created by Назар Ткаченко on 08.07.2024.
//

import UIKit

extension UIApplication {
    func editingMode(_ force: Bool) {
        self.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
