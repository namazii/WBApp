//
//  UsersView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 01.08.2024.
//

import SwiftUI
import UISystem

struct UsersView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var dataStorage = DataStorageManager.shared
    
    @StateObject var viewModel: UsersViewModel
    @Binding var isPresented: Bool
    @Binding var navPath: NavigationPath
    
    @State private var showActivityIndicator = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack {
                    SearchBarView(searchText: $viewModel.searchableText)
                        .frame(height: 50)
                        .padding(.top, 16)
                        .padding(.horizontal, 24)
                        .background(.customBackGround)
                    
                    userList
                        .padding(.top, -30)
                }.background(.customBackGround)
                    .navigationTitle("New Message")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("Cancel") {
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                    }
            }
            
            if showActivityIndicator {
                ActivityIndicator()
                    .background(Color.black.opacity(0.5))
            }
        }
    }
    
    private var userList: some View {
        List(viewModel.filteredUsers, id: \.id) { user in
            UserRowView(user: user, navPath: $navPath, isPresented: $isPresented, viewModel: viewModel)
                .listRowBackground(Color(.clear))
        }
        .background(.clear)
        .scrollContentBackground(.hidden)
    }
}

struct UserRowView: View {
    let user: User
    @Binding var navPath: NavigationPath
    @Binding var isPresented: Bool
    @ObservedObject var viewModel: UsersViewModel
    
    var body: some View {
        HStack {
            switch user.avatarURL {
            case .some(let url):
                AvatarView(url: url, size: 48)
            case .none:
                AvatarStub(firstName: user.name, lastName: user.name)
            }
            Text(user.name)
                .font(.subheadline)
                .bold()
                .foregroundStyle(.titles)
        }
//        .background(.customBackGround)
        .listRowSeparator(.hidden)
//        .padding([.horizontal, .bottom], 16)
        .onTapGesture {
            selectUser(user)
        }
    }
    
    private func selectUser(_ user: User) {
        Task {
            if let conversation = await viewModel.conversationForUsers([user]) {
                navPath.append(conversation)
            } else {
                navPath.append(user)
            }
            isPresented = false
        }
    }
}
