//
//  ProfileAccauntView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 18.06.2024.
//

import SwiftUI

struct ProfileAccauntView: View {
    
    let userContact: UserContact
    
    var body: some View {
        
        ZStack {
            Color(.customBackGround).ignoresSafeArea()
            ProfileAccountComponents(userContact: userContact, number: "+7 999 999-99-99")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        BackButtonNavBar()
                        HeaderTitleView(headerTitleView: LocalizedStringKey("contacts").stringValue())
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: MyEmptyView() ) {
                            Image(.editIcon)
                                .padding(.trailing, 24)
                        }
                    }
                }
                .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview(body: {
    ProfileAccauntView(userContact: .init(
        id: 0,
        firstName: "Aboba",
        lastName: "Abobus",
        lastVisit: Date(),
        avatar: "",
        isOnline: true,
        isNews: false))
})

fileprivate struct MyEmptyView: View {
    var body: some View {
        Color.clear
    }
}
