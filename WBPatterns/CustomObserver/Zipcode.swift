//
//  zipcode.swift
//  WBPatterns
//
//  Created by Назар Ткаченко on 20.07.2024.
//

final class Zipcode: Hashable, Equatable {
    let value: String
    var baseRate: Double
    var adjustment: Double
    var rate: Double {
        return baseRate + (baseRate * adjustment)
    }
    
    init (value: String, baseRate: Double) {
        self.value = value
        self.baseRate = baseRate
        self.adjustment = 0.0
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
    
}

func == (lhs: Zipcode, rhs: Zipcode) -> Bool {
    return lhs.value == rhs.value
}
