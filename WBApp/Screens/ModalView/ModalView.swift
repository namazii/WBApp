//
//  ModalView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 05.06.2024.
//

import SwiftUI

struct ModalView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Button(action: {dismiss()}) {
                Text("Dismiss")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .bold))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ModalView()
}
