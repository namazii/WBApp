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
    private enum ImageURL {
        static let barbie = "https://s0.rbk.ru/v6_top_pics/media/img/9/24/347060792759249.webp"
        static let poebatMeme = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXMKlTGvFF15XZA7pWHbMlh4Tv8rMdVqdmig&s"
        static let alfa = "https://www.grazia.ru/upload/attach/e6b/e6b512b4232be912a087f9166040e6ec.jpg"
        static let skuf = "https://image.spletnik.ru/resize/fit=cover,gravity=0.5x0.5,format=auto,width=407,height=558,trim=0;0;0;0/https://image.spletnik.ru/image/2024/04/25/tdi1/original.webp"
    }
    @State private var contactSearch = ""
    private let contacts: [UserContact] = [
        .init(id: 0, firstName: "Abobus", lastName: "Aboba", lastVisit: Date(), avatar: ImageURL.alfa, isOnline: true, isNews: true),
        .init(id: 1, firstName: "Genius", lastName: "Alfa", lastVisit: Date(), avatar: ImageURL.barbie, isOnline: false, isNews: true),
        .init(id: 2, firstName: "Stive", lastName: "Jobs", lastVisit: Date(), avatar: ImageURL.poebatMeme, isOnline: true, isNews: false),
        .init(id: 3, firstName: "Artur", lastName: "Piroshkov", lastVisit: Date(), avatar: ImageURL.skuf, isOnline: false, isNews: false),
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
