//
//  ProfileAccountComponents.swift
//  WBApp
//
//  Created by Назар Ткаченко on 18.06.2024.
//

import SwiftUI
import UISystem

struct ProfileAccountComponents: View {
    
    let userContact: UserContact
    let number: String
    private var fullName: String {
        return "\(userContact.firstName) \(userContact.lastName)"

    }
    
    var body: some View {
        VStack {
            ProfileAvatar(userContact: userContact)
            
            Text(fullName)
                .textStyle(with: .heading2)
                .font(.title)
                .padding(.top, 22)
            
            Text(number)
                .textStyle(with: .subHeading2)
                .foregroundColor(.gray)
                .padding(.bottom, 40)
            
            HStack(spacing: 12) {
                SocialMediaButton(imageName: "xTwitter")
                SocialMediaButton(imageName: "instagram")
                SocialMediaButton(imageName: "linkedIn")
                SocialMediaButton(imageName: "facebook")
            }
            Spacer()
        }
        .padding(.top, 46)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileAccountComponents(userContact: UserContact(
            id: 0,
            firstName: "Aboba",
            lastName: "Abobus",
            lastVisit: Date(),
            avatar: "",
            isOnline: true,
            isNews: false
        ), number: "+7 999 999-99-99")
    }
}
