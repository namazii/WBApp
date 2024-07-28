//
//  ContactsView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 05.06.2024.
//

import SwiftUI

struct ContactsView: View {
    //MARK: - Properties
    @Binding var contactPath: [UserContact]
    
    //MARK: - Private Properties
    @State private var contactSearch = ""
    private let contacts: [UserContact] = [
        .init(id: 0, firstName: "Abobus", lastName: "Aboba", lastVisit: Date(), avatar: APIConstants.ImageLinks.alfa, isOnline: true, isNews: true),
        .init(id: 1, firstName: "Genius", lastName: "Alfa", lastVisit: Date(), avatar: APIConstants.ImageLinks.barbie, isOnline: false, isNews: true),
        .init(id: 2, firstName: "Stive", lastName: "Jobs", lastVisit: Date(), avatar: APIConstants.ImageLinks.poebatMeme, isOnline: true, isNews: false),
        .init(id: 3, firstName: "Artur", lastName: "Piroshkov", lastVisit: Date(), avatar: APIConstants.ImageLinks.skuf, isOnline: false, isNews: false),
        .init(id: 4, firstName: "NoImage", lastName: "NoImage", lastVisit: Date(), avatar: nil, isOnline: false, isNews: false)
    ]
    private var filteredContacts: [UserContact] {
        if contactSearch.isEmpty {
            return contacts
        } else {
            return contacts.filter { contact in
                contact.firstName.lowercased().contains(contactSearch.lowercased()) ||
                contact.lastName.lowercased().contains(contactSearch.lowercased())
            }
        }
    }
    
    //MARK: - LifeCycle
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            SearchBarView(searchText: $contactSearch)
                .padding(.top, 16)
            
            List(filteredContacts, id: \.id) { contact in
                Button {
                    contactPath.append(contact)
                } label: {
                    ContantCellView(contact: contact)
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowBackground(Color(.customBackGround))
            }
            .listStyle(PlainListStyle())
            .background(Color(.customBackGround))
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 1)
        .background(Color(.customBackGround))
    }
}

#Preview {
    ContactsView(contactPath: .constant([UserContact(
        id: 1,
        firstName: "Anna",
        lastName: "Lisichkina",
        lastVisit: Date(),
        avatar: nil,
        isOnline: false,
        isNews: false
    )]))
}
