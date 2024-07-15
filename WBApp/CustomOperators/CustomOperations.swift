//
//  CustomOperations.swift
//  WBApp
//
//  Created by Назар Ткаченко on 15.07.2024.
//

infix operator ~==

func ~==(input: String, generated: String) -> Bool {
    return input == generated
}
