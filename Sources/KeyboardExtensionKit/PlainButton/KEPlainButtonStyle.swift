//
//  KEPlainButtonStyle.swift
//  KeyboardExtensionKit
//
//  Created by ky0me22 on 2023/09/02.
//

import SwiftUI

struct KEPlainButtonStyle: ButtonStyle {
    let size: CGSize
    let foregroundColor: Color
    let backgroundInactiveColor: Color
    let backgroundActiveColor: Color
    let cornerRadius: CGFloat

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: size.width, height: size.height)
            .foregroundColor(foregroundColor)
            .background(configuration.isPressed ? backgroundActiveColor : backgroundInactiveColor)
            .cornerRadius(cornerRadius)
    }
}

extension ButtonStyle where Self == KEPlainButtonStyle {
    static func plain(
        size: CGSize,
        foregroundColor: Color,
        backgroundInactiveColor: Color,
        backgroundActiveColor: Color,
        cornerRadius: CGFloat
    ) -> KEPlainButtonStyle {
        return KEPlainButtonStyle(size: size,
                                  foregroundColor: foregroundColor,
                                  backgroundInactiveColor: backgroundInactiveColor,
                                  backgroundActiveColor: backgroundActiveColor,
                                  cornerRadius: cornerRadius)
    }
}
