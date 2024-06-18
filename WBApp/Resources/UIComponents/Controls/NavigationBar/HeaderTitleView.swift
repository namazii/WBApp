//
//  HeaderTitleView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 10.06.2024.
//

import SwiftUI

struct HeaderTitleView: View {
    @State var headerTitleView: String
    
    var body: some View {
        Text(headerTitleView)
            .foregroundStyle(.titles)
            .textStyle(with: .subHeading1)
    }
}

#Preview {
    HeaderTitleView(headerTitleView: "Header")
}
