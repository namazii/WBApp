//
//  SearchBar.swift
//  WBApp
//
//  Created by Назар Ткаченко on 12.06.2024.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    
    var body: some View {
        TextField(Texts.SearchBar.search, text: $searchText)
            .textStyle(with: .bodyText1)
            .padding(40)
            .frame(height: 36)
            .background(Color(.searchBackGroundCollor))
            .cornerRadius(5)
            .overlay(
                HStack {
                    Image("magnifierImage")
                        .padding(.leading)
                    Spacer()
                }
                    .alignmentGuide(.leading) { $0[.leading] }
            )
    }
}
