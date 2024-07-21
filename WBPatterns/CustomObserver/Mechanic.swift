//
//  mechanic.swift
//  WBPatterns
//
//  Created by Назар Ткаченко on 20.07.2024.
//

final class Mechanic {
    
    var observer: Observer?
    
    let name: String
    var zipcode: Zipcode
    
    var status: Status = .Idle {
        didSet {
            observer?.propertyChanged(propertyName: "Status", oldValue: oldValue.rawValue, newValue: status.rawValue,
                                      options: ["Zipcode": zipcode.value])
        }
    }
    
    init(name: String, location: Zipcode) {
        self.name = name
        self.zipcode = location
    }
}
