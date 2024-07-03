//
//  CellView.swift
//  WBLesson9
//
//  Created by Назар Ткаченко on 03.07.2024.
//

import SwiftUI

struct CellView: View {
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .stroke(style: StrokeStyle(lineWidth: 2, dash: [10]))
                .opacity(0.5)
            Text(generateRandomEmoji())
                .font(.largeTitle)
                .opacity(0.5)
        }
    }
    
    func generateRandomEmoji() -> String {
        let unicodeScalars = (0x1F300...0x1F3F0).map { UnicodeScalar($0)! }
        return String(unicodeScalars.randomElement()!)
    }
}
