//
//  Router.swift
//  WBApp
//
//  Created by Назар Ткаченко on 11.07.2024.
//

import SwiftUI

final class Router: ObservableObject {
    
    enum Destination: Codable, Hashable {
        case onboardingView
        case vereficationScreen
        case inputSMSCodeScreen(number: String)
        case dissmisScreen
    }
    
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
    
    @ViewBuilder
    func getDestination(_ destination: Destination) -> some View {
        switch destination {
        case .onboardingView:
            OnboardingView()
                .navigationBarBackButtonHidden()
        case .vereficationScreen:
            VereficationView()
                .navigationBarBackButtonHidden()
        case .inputSMSCodeScreen(let number):
            InputSMSCodeScreen(number: number)
                .navigationBarBackButtonHidden()
        case .dissmisScreen:
            ModalView()
        }
    }

}
