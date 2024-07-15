//
//  smsCodeComponentView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 10.07.2024.
//

import SwiftUI

struct SMSCodeComponentView: View {
    
    @Binding var input: String
    @FocusState private var isFocused: Bool
    @Binding var isEditingMode: Bool
    
    let maxDigits: Int = 4
    
    var body: some View {
        VStack {
            HStack(spacing: 40) {
                ForEach(0..<maxDigits, id: \.self) { index in
                    if index < input.count {
                        Text(String(input[input.index(input.startIndex, offsetBy: index)]))
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .frame(width: 32, height: 40)
                    } else {
                        Circle()
                            .fill(Color.circleCode)
                            .frame(width: 32, height: 40)
                    }
                }
            }
            .padding()
            
            TextField("", text: $input)
                .keyboardType(.numberPad)
                .frame(width: 0, height: 0)
                .opacity(0)
                .focused($isFocused)
                .onChange(of: input) { newValue in
                    input = String(newValue.prefix(maxDigits))
                    input = input.filter { "0123456789".contains($0) }
                }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isEditingMode = true
                isFocused = true
            }
        }
    }
}

#Preview {
    SMSCodeComponentView(input: .constant(""), isEditingMode: .constant(false))
}
