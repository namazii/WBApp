//
//  WBAppApp.swift
//  WBApp
//
//  Created by Назар Ткаченко on 05.06.2024.
//

import SwiftUI

@main
struct WBAppApp: App {
//    @ObservedObject var router = Router()
    
    var body: some Scene {
        WindowGroup {
//            NavigationStack(path: $router.navPath) {
//                router.getDestination(.onboardingView)
//                    .navigationDestination(for: Router.Destination.self) { destination in
//                        router.getDestination(destination)
//                    }
//            }
//            .environmentObject(router)
            RickAndMortyScreen()
        }
    }
}
