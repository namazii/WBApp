//
//  BackButtonNavBar.swift
//  WBApp
//
//  Created by Назар Ткаченко on 10.06.2024.
//

import SwiftUI

struct BackButtonNavBar: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(.backChevron)
        }
    }
}

#Preview {
    BackButtonNavBar()
}
