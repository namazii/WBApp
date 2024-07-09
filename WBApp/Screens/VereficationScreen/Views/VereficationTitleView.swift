//
//  VereficationTitleView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 05.07.2024.
//

import SwiftUI

struct VereficationTitleView: View {
    var body: some View {
        VStack(spacing: 8) {
            Text(LocalizedStringKey("Введите номер телефона"))
                .textStyle(with: .heading2)
                .foregroundColor(.onboardLogoTitle)
                .multilineTextAlignment(.center)
            Text(LocalizedStringKey("Мы вышлем код подтверждения \n на указанный номер"))
                .foregroundColor(.onboardLogoTitle)
                .textStyle(with: .bodyText2)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    VereficationTitleView()
}
