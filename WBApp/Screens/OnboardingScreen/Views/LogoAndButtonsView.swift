//
//  LogoAndButtonsView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 05.06.2024.
//


import SwiftUI

struct LogoAndButtonsView: View {
    
    @Binding var isPresent: Bool
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
                isPresent.toggle()
            }) {
                Text(LocalizedStringKey("startChat"))
            }
            .buttonStyle(CustomFillButtonStyle())
        }
    }
}
