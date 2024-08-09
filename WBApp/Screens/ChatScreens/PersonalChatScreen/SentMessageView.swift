//
//  SentMessageView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 09.08.2024.
//

import SwiftUI
import ExyteChat

struct SentMessageView: View {
    var message: Message
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 10) {
            Text(message.text)
            Text(message.createdAt, style: .time)
                .font(.caption)
            if !message.attachments.isEmpty {
                ForEach(message.attachments, id: \.id) { at in
                    AsyncImage(url: at.thumbnail)
                }
            }
        }
    }
}

#Preview {
    SentMessageView(message: Message(id: "1", user: User(id: "1", name: "you", avatarURL: nil, isCurrentUser: true), status: .read, createdAt: Date(), text: "testtest", attachments: [], recording: nil, replyMessage: nil))
}
