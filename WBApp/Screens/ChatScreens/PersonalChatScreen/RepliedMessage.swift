//
//  RepliedMessage.swift
//  WBApp
//
//  Created by Назар Ткаченко on 08.08.2024.
//

import SwiftUI

struct RepliedMessage: View {
    var text: String = ""
    
    var body: some View {
            VStack(alignment: .leading, spacing: 4) {
                Text("Вы")
                    .font(.caption).bold()
                    .foregroundColor(.noFillButton)
                Text(text)
                    .font(.caption)
                    .foregroundColor(.messageText)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 4)
                .fill(.circleCode)
                .background(RoundedRectangle(cornerRadius: 4)
                    .fill(.noFillButton)
                    .offset(x: -3))
            )
    }
}

#Preview {
    RepliedMessage(text: "Купи годзилу чел")
}
