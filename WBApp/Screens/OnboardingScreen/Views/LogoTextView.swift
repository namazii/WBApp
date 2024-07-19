//
//  LogoTextView.swift
//  WBApp
//
//  Created by Назар Ткаченко on 05.06.2024.
//

import SwiftUI
import UISystem

struct LogoTextView: View {
     
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
            
            Text(LocalizedStringKey("onboardTitle"))
                .textStyle(with: .heading2)
                .foregroundStyle( .onboardLogoTitle)
                .lineLimit(Constants.lineLimit)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    LogoTextView()
}
