//
//  subscriber.swift
//  WBPatterns
//
//  Created by Назар Ткаченко on 20.07.2024.
//

protocol Subscriber: AnyObject {
    var properties: [String] {get set}
    func notify(propertyName: String, oldValue: Int, newValue: Int, options: [String:String]?)
}
