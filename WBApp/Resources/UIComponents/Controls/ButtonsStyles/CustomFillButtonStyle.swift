//
//  CustomFillButtonStyle.swift
//  WBApp
//
//  Created by Назар Ткаченко on 05.06.2024.
//

import SwiftUI

struct CustomFillButtonStyle: ButtonStyle {
    //MARK: - Private Properties
    @Environment(\.isEnabled) private var isEnabled
    
    private let foregroundColor: Color
    private let backgroundColor: Color
    private let typography: Typography?
    private let cornerRadiusSize: CGFloat
    
    // MARK: - Constants
    private enum Constants {
        static let cornerRadiusSize: CGFloat = .init(30)
        static let buttonHeight: CGFloat = UIScreen.main.bounds.height * 0.056
    }
    
    // MARK: - init
    init(foregroundColor: Color = Color(.onboardStartButtonTitle),
         backgroundColor: Color = Color(.brandColorButton),
         typography: Typography? = nil,
         cornerRadiusSize: CGFloat = Constants.cornerRadiusSize
    ) {
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.typography = typography
        self.cornerRadiusSize = cornerRadiusSize
    }
    
    //MARK: - Methods
    func makeBody(configuration: Configuration) -> some View {
        let fstColor: Color
        let secColor: Color
        if configuration.isPressed {
            fstColor = backgroundColor == .clear ? .white : backgroundColor
            secColor = foregroundColor
        } else {
            fstColor = foregroundColor
            secColor = backgroundColor
        }
        return GeometryReader { geo in
            configuration
                .label
                .frame(maxWidth: .infinity)
                .foregroundStyle(isEnabled ? fstColor : .disabledButtonFont)
                .textStyle(with: typography != nil ? typography! : .subHeading2)
                .padding(.vertical)
                .background(isEnabled ? secColor : .disabledButtonBack)
                .cornerRadius(cornerRadiusSize)
                .scaleEffect(configuration.isPressed ? 0.9 : 1)
        }
        .frame(height: Constants.buttonHeight)
        .animation(.default, value: configuration.isPressed)
    }
}

// MARK: - Preview Style
fileprivate struct TestPreviewPurpleButton: View {
    var body: some View {
        Button {
        } label: {
            Text("Начать общаться")
        }
        .buttonStyle(CustomFillButtonStyle())
//        .disabled(true)
    }
}

#Preview {
    TestPreviewPurpleButton()
}
