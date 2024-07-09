//
//  SocialMediaButton.swift
//  WBApp
//
//  Created by Назар Ткаченко on 18.06.2024.
//

import SwiftUI

struct SocialMediaButton: View {
    let imageName: String
    
    var body: some View {
        Button(action: socialButtonTapped) {
            Image(imageName)
        }
    }
}

//MARK: - Private Methods
extension SocialMediaButton {
    private func socialButtonTapped() {
        print("tapped")
    }
}
