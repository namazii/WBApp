//
//  LogoTextView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 05.06.2024.
//

import SwiftUI

struct LogoTextView: View {
    
    // MARK: - Constants
    private enum Constants {
        static let spacerFrame: CGFloat = .init(42)
        static let lineLimit: Int = .init(2)
        static let padding: CGFloat = .init(20)
        static let zero: CGFloat = .init(0)
    }
    
    // MARK: - Body
    var body: some View {
        VStack {
            Image(.onboardLogo)
                .resizable()
                .scaledToFit()
                .padding(
                    EdgeInsets(
                        top: Constants.zero,
                        leading: Constants.padding,
                        bottom: Constants.zero,
                        trailing: Constants.padding
                    )
                )
            
            Spacer().frame(height: Constants.spacerFrame)
            
            Text(Texts.OnboardingScreen.mainTitle)
                .textStyle(with: .heading2)
                .foregroundStyle(.onboardLogoTitle)
                .lineLimit(Constants.lineLimit)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    LogoTextView()
}
