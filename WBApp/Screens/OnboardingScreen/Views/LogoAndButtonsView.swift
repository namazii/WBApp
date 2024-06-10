//
//  LogoAndButtonsView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 05.06.2024.
//

import SwiftUI

struct LogoAndButtonsView: View {
    
    // MARK: - Constants
    private enum Constants {
        static let logoTopPadding: CGFloat = .init(45)
        static let logoleadingPadding: CGFloat = .init(42)
        static let logoTrailingPadding: CGFloat = .init(31)
        static let zero: CGFloat = .init(0)
        static let leadingPadding: CGFloat = .init(24)
        static let trailingPadding: CGFloat = .init(24)
        static let bottomPadding: CGFloat = .init(20)
    }
    
    var userAgreementAction: () -> Void
    var chatButtonAction: () -> Void
    
    // MARK: - Body
    var body: some View {
        VStack {
            LogoTextView()
                .padding(
                    EdgeInsets(
                        top: Constants.logoTopPadding,
                        leading: Constants.logoleadingPadding,
                        bottom: Constants.zero,
                        trailing: Constants.logoTrailingPadding
                    )
                )
            Spacer()
            
            AgreementAndChatButtonsView(
                userAgreementButtonPressed: userAgreementAction,
                chatButtonPressed: chatButtonAction
            )
            .padding(
                EdgeInsets(
                    top: Constants.zero,
                    leading: Constants.leadingPadding,
                    bottom: Constants.bottomPadding,
                    trailing: Constants.trailingPadding)
            )
        }
    }
}

#Preview {
    LogoAndButtonsView(userAgreementAction: {}, chatButtonAction: {})
}
