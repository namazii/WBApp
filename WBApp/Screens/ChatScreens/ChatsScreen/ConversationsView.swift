//
//  ConversationsView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 02.08.2024.
//

import SwiftUI
import UISystem

struct ConversationsView: View {
    
    @ObservedObject var dataStorage = DataStorageManager.shared
    @StateObject var viewModel = ConversationsViewModel()
    @StateObject var networkMonitor = NetworkMonitor()
    
    @State var showUsersList = false
    @State var navPath = NavigationPath()
    
    var body: some View {
        ZStack {
            Group {
                content
                if viewModel.showActivityIndicator {
                    ActivityIndicator()
                }
            }
        }
        .background(.customBackGround)
        .task {
            viewModel.subscribeToUpdates()
        }
    }
    
    
    var content: some View {
        NavigationStack(path: $navPath) {
            if !networkMonitor.isConnected {
                waitingForNetwork
            }
            VStack {
                SearchBarView(searchText: $viewModel.searchText)
                    .padding(.top, 16)
                    .padding(.horizontal, 24)
                List(viewModel.filteredConversations, id: \.id) { conversation in
                    HStack {
                        AvatarStackView(conversation: conversation)
                            .padding(.trailing, 12)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(conversation.displayTitle)
                                .font(.subheadline)
                                .bold()
                                .foregroundStyle(.titles)
                            LatestMessageView(latest: conversation.latestMessage ?? LatestMessageInChat(senderName: ""))
                        }
                        .background(.customBackGround)
                        
                        Spacer()
                        
                        if let unreadCounter = conversation.usersUnreadCountInfo[SessionManager.currentUserId], unreadCounter != 0 {
                            Text("\(unreadCounter)")
                                .font(15, .white, .semibold)
                                .padding(.horizontal, 7)
                                .padding(.vertical, 2)
                                .background(Color.blue.cornerRadius(.infinity))
                        }
                    }
                    .background(.customBackGround)
                    .background(
                        NavigationLink("", value: conversation)
                            .opacity(0)
                    ).background(.customBackGround)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowBackground(Color(.customBackGround))
                        .padding(.bottom, 16)
                }
                .padding(.top, 16)
                .padding(.horizontal, 24)
            }
            .background(Color(.customBackGround))
            .refreshable {
                await viewModel.getData()
            }
            .listStyle(.plain)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    HeaderTitleView(headerTitleView: LocalizedStringKey("Чаты").stringValue())
                        .padding(.leading, 24)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Conversation.self) { conversation in
                ConversationView(viewModel: ConversationViewModel(conversation: conversation))
            }
            .navigationDestination(for: User.self) { user in
                ConversationView(viewModel: ConversationViewModel(user: user))
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        showUsersList = true
                    } label: {
                        Image("plusImage")
                    }
                }
            }
        }
        
        .sheet(isPresented: $showUsersList) {
            UsersView(viewModel: UsersViewModel(), isPresented: $showUsersList, navPath: $navPath)
        }
    }
    
    //MARK: - Private Views
    private var waitingForNetwork: some View {
        VStack {
            Rectangle()
                .foregroundColor(.black.opacity(0.12))
                .frame(height: 1)
            HStack {
                Spacer()
                Image("waiting", bundle: .current)
                Text("Waiting for network")
                Spacer()
            }
            .padding(.top, 6)
            Rectangle()
                .foregroundColor(.black.opacity(0.12))
                .frame(height: 1)
        }
        .padding(.top, 8)
    }
}

//MARK: - AvatarStackView
struct AvatarStackView: View {
    let conversation: Conversation
    
    var body: some View {
        switch conversation.pictureURL {
        case .some(let url):
            AvatarView(url: url, size: 56)
        case .none:
            HStack {
                ForEach(conversation.notMeUsers) { user in
                    switch user.avatarURL {
                    case .some(let url):
                        AvatarView(url: url, size: 56)
                    case .none:
                        AvatarStub(firstName: user.name, lastName: user.name)
                    }
                }
            }
        }
    }
}

//MARK: - LatestMessageView
struct LatestMessageView: View {
    let latest: LatestMessageInChat
    
    var body: some View {
        HStack(spacing: 4) {
            if let text = latest.text {
                Text(text)
                    .font(.footnote)
                    .foregroundStyle(.metaDataGray)
            }
            Spacer()
            if let date = latest.createdAt?.timeAgoFormat() {
                Text(date)
                    .font(.footnote)
                    .foregroundStyle(.metaDataGray)
                    .lineLimit(1)
                    .offset(CGSize(width: 0, height: -25.0))
            }
        }
    }
}

#Preview {
    ConversationsView()
}

