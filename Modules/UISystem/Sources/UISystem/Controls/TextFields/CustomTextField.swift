//
//  CustomTextField.swift
//  WBApp
//
//  Created by Назар Ткаченко on 02.08.2024.
//

import SwiftUI

public struct CustomTextField: View {
    
    public var placeholder: String
    @Binding var text: String
    @Binding var error: Bool
    @FocusState private var isFocused: Bool
    
    public init(placeholder: String, text: Binding<String>, error: Binding<Bool>) {
        self.placeholder = placeholder
        self._text = text
        self._error = error
    }
    
    
    public var body: some View {
        TextField(placeholder, text: $text)
            .foregroundColor(Color(.textFields))
            .focused($isFocused)
            .padding(EdgeInsets(top: 6, leading: 8, bottom: 6, trailing: 0))
            .background(Color(.searchBackGroundCollor).cornerRadius(4))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(error ? Color.red : Color(.searchBackGroundCollor), lineWidth: 1)
            )
    }
}
