//
//  LogoAndButtonsView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 05.06.2024.
//


import SwiftUI
import UISystem

struct LogoAndButtonsView: View {
    
    var buttonAction: () -> Void
    var userAgreementAction: () -> Void
    
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
            
            AgreementAndChatButtonsView
                .padding(
                    EdgeInsets(
                        top: Constants.zero,
                        leading: Constants.leadingPadding,
                        bottom: Constants.bottomPadding,
                        trailing: Constants.trailingPadding)
                )
        }
    }
    
    private var AgreementAndChatButtonsView: some View {
        VStack {
            Text(LocalizedStringKey("userAgreement"))
                .foregroundStyle(.metaDataGray)
                .textStyle(with: .metaData2)
                .multilineTextAlignment(.center)
            HStack {
                Button(LocalizedStringKey("Политикой Конфиденциальности")) {}
                    .textStyle(with: .metaData2)
                    .foregroundColor(.placeHolderAvatar)
                
                Text("и")
                    .foregroundStyle(.metaDataGray)
                    .textStyle(with: .metaData2)
                    .multilineTextAlignment(.center)
                
                Button(LocalizedStringKey("Условиями Использования")) {}
                    .textStyle(with: .metaData2)
                    .foregroundColor(.placeHolderAvatar)
                
            }
            .padding(.bottom, 13)
            
            Button(action: {
                buttonAction()
            }) {
                Text(LocalizedStringKey("startChat"))
            }
            .buttonStyle(CustomButtonStyle())
        }
    }
}
