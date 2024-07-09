//
//  ViewModel.swift
//  WBApp
//
//  Created by Назар Ткаченко on 22.06.2024.
//

import Foundation

// 1.
@Observable
class UserContactViewModel {

    static let shared = UserContactViewModel()

    var userItems: [UserItem] = []
    
    func addUser(user: UserContact) { // работает
        let newUser = UserItem(id: .init(), contact: user)
        UserContactViewModel.shared.userItems.append(newUser)
    }
}
