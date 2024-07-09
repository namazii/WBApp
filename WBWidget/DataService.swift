//
//  DataService.swift
//  WBApp
//
//  Created by Назар Ткаченко on 22.06.2024.
//

import Foundation
import SwiftUI

struct DataService {
    
    @AppStorage("Counter", store: UserDefaults(suiteName: "someOrganization.WBApp"))
    
    private var counter = 0
    
    func add() {
        counter += 1
    }
    
    func result() -> Int {
        return counter
    }
}
