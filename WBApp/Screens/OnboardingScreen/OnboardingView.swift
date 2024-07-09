//
//  OnboardingView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 05.06.2024.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var isPresent: Bool = .init(false)
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color(.customBackGround)
                    .edgesIgnoringSafeArea(.all)
                LogoAndButtonsView(isPresent: $isPresent, userAgreementAction: {})
            }
            .navigationDestination(isPresented: $isPresent) {
                VereficationView()
            }
        }
    }
}

#Preview {
    OnboardingView()
}
