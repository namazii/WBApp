//
//  TextFontStyles.swift
//  WBApp
//
//  Created by Назар Ткаченко on 05.06.2024.
//

import SwiftUI

enum Typography {
    case heading1
    case heading2
    
    case subHeading1
    case subHeading2
    
    case bodyText1
    case bodyText2
    
    case metaData1
    case metaData2
    case metaData3
}

struct TextFontStyles: ViewModifier {
    var typography: Typography
    
    func body(content: Content) -> some View {
        switch typography {
        case .heading1:
            return content
                .font(.system(size: 32, weight: .bold))
        case .heading2:
            return content
                .font(.system(size: 24, weight: .bold))
            
        case .subHeading1:
            return content
                .font(.system(size: 18, weight: .semibold))
        case .subHeading2:
            return content
                .font(.system(size: 16, weight: .semibold))
            
        case .bodyText1:
            return content
                .font(.system(size: 14, weight: .semibold))
        case .bodyText2:
            return content
                .font(.system(size: 14, weight: .regular))
            
        case .metaData1:
            return content
                .font(.system(size: 12, weight: .regular))
        case .metaData2:
            return content
                .font(.system(size: 10, weight: .regular))
        case .metaData3:
            return content
                .font(.system(size: 10, weight: .semibold))
        }
    }
}

extension View {
    func textStyle(with typography: Typography ) -> some View {
        modifier(TextFontStyles(typography: typography))
    }
}
