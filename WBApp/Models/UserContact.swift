//
//  UserContact.swift
//  WBApp
//
//  Created by Назар Ткаченко on 18.06.2024.
//

import Foundation

struct UserContact: Hashable {
    let id: Int
    let firstName: String
    let lastName: String
    let lastVisit: Date
    let avatar: String?
    let isOnline: Bool
    let isNews: Bool
}
