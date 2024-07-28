//
//  ProfileAvatar.swift
//  WBApp
//
//  Created by Назар Ткаченко on 18.06.2024.
//

import SwiftUI

struct ProfileAvatar: View {
    
    let userContact: UserContact
    @StateObject private var imageLoader = ImageLoader()
    
    var body: some View {
        Group {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
            } else {
                Image("userAvatarDefolt")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.gray.opacity(0.2))
            }
        }
        .onAppear {
            imageLoader.loadImage(from: userContact.avatar)
        }
    }
}

