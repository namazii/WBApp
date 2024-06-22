//
//  ContactsNavBarView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 10.06.2024.
//

import SwiftUI

struct ContactsNavBarView: View {
    @State var contactPath = [UserContact]()
    @State private var isProfilePresented = false

    init(contactPath: [UserContact] = [UserContact](), isProfilePresented: Bool = false) {
        self.contactPath = contactPath
        self.isProfilePresented = isProfilePresented
        guard let user = UserContactViewModel.shared.userItems.first?.contact else { return }
        self.contactPath.append(user) // работает
        print(user)
        print("Команды работают")
    }
    
    var body: some View {
        ZStack {
            NavigationStack(path: $contactPath) {
                ContactsView(contactPath: $contactPath)
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarLeading) {
                            HeaderTitleView(headerTitleView: "Контакты")
                                .padding(.leading, 24)
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: MyEmptyView() ) {
                                Image(.plus)
                                    .padding(.trailing, 24)
                            }
                        }
                    }
                    .navigationDestination(for: UserContact.self) { contact in
                        ProfileAccauntView(userContact: contact)
                            .fadeTransition(isPresented: isProfilePresented)
                            .onAppear {
                                withAnimation {
                                    isProfilePresented = true
                                }
                            }
                            .onDisappear {
                                withAnimation {
                                    isProfilePresented = false
                                }
                            }
                    }
            }
        }
    }
}

#Preview {
    ContactsNavBarView()
}

fileprivate struct MyEmptyView: View {
    var body: some View {
        Color.clear
    }
}

