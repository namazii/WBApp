//
//  CharacterCell.swift
//  WBApp
//
//  Created by Назар Ткаченко on 30.07.2024.
//

import SwiftUI

struct CharacterCell: View {
    let image: String
    let name: String

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(height: 300)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                        .clipped()
                case .failure:
                    Color.gray
                        .frame(height: 300)
                @unknown default:
                    Color.red
                        .frame(height: 300)
                }
            }
            Text(name)
                .font(.headline)
        }
    }
}
