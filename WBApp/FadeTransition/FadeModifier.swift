//
//  FadeModifier.swift
//  WBApp
//
//  Created by Назар Ткаченко on 18.06.2024.
//

import SwiftUI

struct FadeModifier: ViewModifier {
    let isPresented: Bool
    
    func body(content: Content) -> some View {
        content
            .opacity(isPresented ? 1 : 0)
            .animation(.easeInOut(duration: 0.3), value: isPresented)
    }
}

extension View {
    func fadeTransition(isPresented: Bool) -> some View {
        self.modifier(FadeModifier(isPresented: isPresented))
    }
}
