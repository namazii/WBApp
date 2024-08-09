//
//  ConversationsViewModel.swift
//  WBApp
//
//  Created by Назар Ткаченко on 02.08.2024.
//

import Foundation
import FirebaseFirestore

@MainActor
class ConversationsViewModel: ObservableObject {

    @Published var searchText = ""

    var filteredConversations: [Conversation] {
        if searchText.isEmpty {
            return dataStorage.conversations
        }
        return dataStorage.conversations.filter {
            $0.title.lowercased().contains(searchText.lowercased())
        }
    }

    @Published var showActivityIndicator = false

    func getData() async {
        showActivityIndicator = true
        await dataStorage.getUsers()
        await dataStorage.getConversations()
        showActivityIndicator = false
    }

    func subscribeToUpdates() {
        dataStorage.subscribeToUpdates()
    }
}
