//
//  KECandidateButtonStyle.swift
//  KeyboardExtensionKit
//
//  Created by ky0me22 on 2023/09/02.
//

import SwiftUI

public struct KECandidateButtonStyle: ButtonStyle {
    let tintColor: Color
    let backgroundColor: Color

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .tint(tintColor)
            .frame(height: 32)
            .frame(minWidth: 32)
            .fixedSize()
            .padding(.horizontal, 8)
            .background(backgroundColor.opacity(configuration.isPressed ? 1.0 : 0.0))
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

extension ButtonStyle where Self == KECandidateButtonStyle {
    static func candidate(tintColor: Color, backgroundColor: Color) -> KECandidateButtonStyle {
        return KECandidateButtonStyle(tintColor: tintColor,
                                      backgroundColor: backgroundColor)
    }
}
