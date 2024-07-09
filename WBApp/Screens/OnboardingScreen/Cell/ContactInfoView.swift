//
//  ContactInfoView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 10.06.2024.
//

import SwiftUI

struct ContactInfoView: View {
    //MARK: - Properties
    var contact: UserContact
    
    //MARK: - Private Properties
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    
    //MARK: - LifeCycle
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(contact.firstName + " " + contact.lastName)
                .font(.subheadline)
                .bold()
                .foregroundStyle(.titles)
            Text(contact.isOnline ? "Online" : "Last seen \(contact.lastVisit, formatter: dateFormatter)")
                .font(.footnote)
                .foregroundStyle(.metaDataGray)
                .lineLimit(1)
        }
        .padding(.top, 6)
    }
}

#Preview {
    ContactInfoView(contact: UserContact(
        id: 1,
        firstName: "Aboba",
        lastName: "Abobus",
        lastVisit: Date(),
        avatar: "name",
        isOnline: false,
        isNews: true
    )
    )
}
