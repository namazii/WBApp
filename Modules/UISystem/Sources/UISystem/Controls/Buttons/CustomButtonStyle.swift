//
//  CustomButtonStyle.swift
//  WBApp
//
//  Created by Назар Ткаченко on 05.06.2024.
//

import SwiftUI

public enum ButtonStyleType {
    case fill
    case textOnly
}

public struct CustomButtonStyle: ButtonStyle {
    //MARK: - Private Properties
    @Environment(\.isEnabled) private var isEnabled
    
    private let foregroundColor: Color
    private let backgroundColor: Color
    private let typography: Typography?
    private let cornerRadiusSize: CGFloat
    private let styleType: ButtonStyleType
    
    // MARK: - Constants
    public enum Constants {
        public static let cornerRadiusSize: CGFloat = .init(30)
        public static let buttonHeight: CGFloat = UIScreen.main.bounds.height * 0.056
    }
    
    // MARK: - init
    public init(styleType: ButtonStyleType = .fill,
                foregroundColor: Color = Self.defaultForegroundColor,
                backgroundColor: Color = Self.defaultBackgroundColor,
                typography: Typography? = nil,
                cornerRadiusSize: CGFloat = Constants.cornerRadiusSize) {
        self.styleType = styleType
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.typography = typography
        self.cornerRadiusSize = cornerRadiusSize
    }

    public static var defaultForegroundColor: Color {
        return Color(.onboardStartButtonTitle)
    }

    public static var defaultBackgroundColor: Color {
        return Color(.brandColorButton)
    }
    
    //MARK: - Methods
    public func makeBody(configuration: Configuration) -> some View {
        switch styleType {
        case .fill:
            return AnyView(
                GeometryReader { _ in
                    configuration
                        .label
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(isEnabled ? foregroundColor : Color(.disabledButtonFont))
                        .textStyle(with: typography != nil ? typography! : .subHeading2)
                        .padding(.vertical)
                        .background(isEnabled ? backgroundColor : Color(.disabledButtonBack))
                        .cornerRadius(cornerRadiusSize)
                        .scaleEffect(configuration.isPressed ? 0.9 : 1)
                }
                    .frame(height: Constants.buttonHeight)
                    .animation(.default, value: configuration.isPressed)
            )
            
        case .textOnly:
            return AnyView(
                configuration
                    .label
                    .foregroundStyle(isEnabled ? Color(.noFillButton) : Color(.disabledButtonFont))
                    .textStyle(with: typography != nil ? typography! : .subHeading2)
                    .scaleEffect(configuration.isPressed ? 0.9 : 1)
                    .animation(.default, value: configuration.isPressed)
                    .padding(.vertical)
            )
        }
    }
}

// MARK: - Preview Style
fileprivate struct TestPreviewPurpleButton: View {
    var body: some View {
        VStack {
            Button {
            } label: {
                Text("Начать общаться")
            }
            .buttonStyle(CustomButtonStyle(styleType: .fill))

            Button {
            } label: {
                Text("Запросить код повторно")
            }
            .buttonStyle(CustomButtonStyle(styleType: .textOnly))
        }
        .padding()
    }
}

#Preview {
    TestPreviewPurpleButton()
}
