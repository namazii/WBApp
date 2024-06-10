//
//  AgreementAndChatButtonsView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 05.06.2024.
//

import SwiftUI

struct AgreementAndChatButtonsView: View {
    
    // MARK: - Constants
    private enum Constants {
        static let spacing: CGFloat = .init(18)
        static let cornerRadius: CGFloat = .init(24)
    }
    
    var userAgreementButtonPressed: () -> Void
    var chatButtonPressed: () -> Void
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: Constants.spacing) {
            
            Button(action: userAgreementButtonPressed) {
                Text(Texts.OnboardingScreen.userAgreement)
                    .foregroundStyle(.onboardUserAgreeButtonTitle)
                    .textStyle(with: .bodyText1)
                    .multilineTextAlignment(.center)
            }
            
            Button(action: chatButtonPressed) {
                Text(Texts.OnboardingScreen.startChat)                    
            }.buttonStyle(CustomFillButtonStyle())
        }
    }
}

#Preview {
    AgreementAndChatButtonsView(userAgreementButtonPressed: {}, chatButtonPressed: {})
}
