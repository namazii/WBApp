//
//  observer.swift
//  WBPatterns
//
//  Created by Назар Ткаченко on 20.07.2024.
//

protocol Observer: AnyObject {
    func propertyChanged(propertyName: String, oldValue: Int, newValue: Int,
                         options: [String:String]?)
}
