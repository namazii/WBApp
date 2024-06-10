//
//  OnboardingView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 05.06.2024.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var showingSheet: Bool = .init(false)
    
    var body: some View {
        ZStack {
            Color(.customBackGround)
                .edgesIgnoringSafeArea(.all)
            LogoAndButtonsView(
                userAgreementAction: { print("Пользовательское соглашение") },
                chatButtonAction: { showingSheet = true }
            )
        }
        .sheet(isPresented: $showingSheet) {
            ModalView()
        }
    }
}

#Preview {
    OnboardingView()
}
