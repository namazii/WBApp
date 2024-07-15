//
//  smsCodeTitlesView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 10.07.2024.
//

import SwiftUI

struct smsCodeTitlesView: View {
    
    @Binding var number: String
    
    var body: some View {
        Text(LocalizedStringKey("Введите код"))
            .textStyle(with: .heading2)
            .multilineTextAlignment(.center)
            .padding(.bottom, 8)
        Text(LocalizedStringKey("Отправили код на номер"))
            .textStyle(with: .bodyText2)
            .multilineTextAlignment(.center)
            .padding(.bottom, 4)
        Text(LocalizedStringKey(number))
            .textStyle(with: .bodyText2)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    smsCodeTitlesView(number: .constant("+7 999 999-99-99"))
}
