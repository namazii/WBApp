//
//  AvatarImageView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 10.06.2024.
//

import SwiftUI

struct AvatarStub: View {
    
    //MARK: - Properties
    let firstName: String
    let lastName: String
    
    //MARK: - LifeCycle
    var body: some View {
        
        let initials = "\(firstName.prefix(1))\(lastName.prefix(1))"
        
        Text(initials)
            .textStyle(with: .bodyText1)
            .foregroundColor(.white)
            .frame(width: 48, height: 48)
            .background(RoundedRectangle(cornerRadius: 16)
                .fill(Color(.placeHolderAvatar)))
    }
}

#Preview {
    AvatarStub(firstName: "Aboba", lastName: "Abobus")
}
