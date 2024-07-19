//
//  HeaderTitleView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 10.06.2024.
//

import SwiftUI

public struct HeaderTitleView: View {
    @State var headerTitleView: String
    
    public init(headerTitleView: String) {
        self.headerTitleView = headerTitleView
    }
    
    public var body: some View {
        Text(headerTitleView)
            .foregroundStyle(Color(.titles))
            .textStyle(with: .subHeading1)
    }
}

#Preview {
    HeaderTitleView(headerTitleView: "Header")
}
