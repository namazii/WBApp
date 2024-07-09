//
//  AddUserIntent.swift
//  WBApp
//
//  Created by Назар Ткаченко on 21.06.2024.
//

// 1.
import AppIntents

// 2.
struct AddUserIntent: AppIntent {
    
    // 3.
    static var title = LocalizedStringResource("Add a new user")
    
    // 4.
    @Parameter(title: "User FullName")
    var userFullName: String
    
    // 5.
    func perform() async throws -> some IntentResult {
        let fullName = splitFullName(fullName: userFullName)
        UserContactViewModel.shared.addUser(user: UserContact(id: 0, firstName: fullName.firstName, lastName: fullName.lastName, lastVisit: Date(), avatar: "", isOnline: false, isNews: false))
        return .result()
    }
    
    private func splitFullName(fullName: String) -> (firstName: String, lastName: String) {
        
        let nameComponents = fullName.split(separator: " ")
        let firstName = nameComponents.first.map(String.init) ?? ""
        let lastName = nameComponents.count > 1 ? nameComponents[1...].joined(separator: " ") : ""
        
        return (firstName, lastName)
    }
}

