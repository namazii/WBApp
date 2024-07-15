//
//  OnboardingView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 05.06.2024.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        ZStack {
            Color(.customBackGround)
                .edgesIgnoringSafeArea(.all)
            LogoAndButtonsView(buttonAction: {
                router.navigate(to: .vereficationScreen)
            }, userAgreementAction: {})
        }
    }
}

#Preview {
    OnboardingView()
}
