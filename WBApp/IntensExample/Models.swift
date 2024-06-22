//
//  Models.swift
//  WBApp
//
//  Created by Назар Ткаченко on 22.06.2024.
//

import Foundation
import AppIntents

struct UserItem: Identifiable {
    var id: UUID = UUID()
    var contact: UserContact
}

extension UserItem: AppEntity {
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "User"
    
    var displayRepresentation: DisplayRepresentation {
        .init(title: LocalizedStringResource(stringLiteral: "test"))
    }
    
    static var defaultQuery = UserQuery()
}

struct UserQuery: EntityQuery {
    func entities(for identifiers: [UUID]) async throws -> [UserItem] {
        UserContactViewModel.shared.userItems.filter { identifiers.contains($0.id) }
    }
}
