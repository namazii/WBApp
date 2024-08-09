//
//  ContentView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 02.08.2024.
//

import SwiftUI

struct ContentView: View {


    @AppStorage(hasCurrentSessionKey) var hasCurrentSession = false

    var body: some View {
        Group {
            if hasCurrentSession {
                ConversationsView()
                    .background(.red)
            } else {
                AuthView()
            }
        }
        .onAppear {
            if hasCurrentSession {
                SessionManager.shared.loadUser()
            }
        }
    }
}
