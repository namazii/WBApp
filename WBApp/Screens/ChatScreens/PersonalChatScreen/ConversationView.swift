//
//  ConversationView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 01.08.2024.
//

import SwiftUI
import ExyteChat
import UISystem

struct ConversationView: View {

    @Environment(\.presentationMode) var presentationMode

    @StateObject var viewModel: ConversationViewModel

    var body: some View {
        ChatView(messages: viewModel.messages) { draft in
            viewModel.sendMessage(draft)
        }
        .mediaPickerTheme(
            main: .init(
                text: .messageText,
                albumSelectionBackground: .customBackGround,
                fullscreenPhotoBackground: .customBackGround
            ),
            selection: .init(
                emptyTint: .messageText,
                emptyBackground: .black.opacity(0.25),
                selectedTint: .blue,
                fullscreenTint: .white
            )
        )
        .onDisappear {
            viewModel.resetUnreadCounter()
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(.backChevron)
                }
            }
            ToolbarItem(placement: .navigation) {
                HStack {
                    if let conversation = viewModel.conversation, conversation.isGroup {
                        HeaderTitleView(headerTitleView: conversation.title)
                    } else if let user = viewModel.users.first {
                        HeaderTitleView(headerTitleView: user.name)
                    }
                }
            }
        }
    }
}
