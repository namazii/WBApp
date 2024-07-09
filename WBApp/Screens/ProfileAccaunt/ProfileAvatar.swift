//
//  ProfileAvatar.swift
//  WBApp
//
//  Created by Назар Ткаченко on 18.06.2024.
//

import SwiftUI

struct ProfileAvatar: View {
    
    let userContact: UserContact
    
    var body: some View {
        if let imageName = userContact.avatar, let url = URL(string: imageName) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    Image(.userAvatarDefolt)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .foregroundColor(.gray.opacity(0.2))
                case .success(let image):

                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                case .failure:
                    Image(.userAvatarDefolt)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .foregroundColor(.gray.opacity(0.2))
                @unknown default:
                    EmptyView()
                }
            }
        } else {
            Image(.userAvatarDefolt)
                .resizable()
                .frame(width: 200, height: 200)
                .foregroundColor(.gray.opacity(0.2))
        }
    }
}
