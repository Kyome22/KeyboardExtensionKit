//
//  KECommandButtonStyle.swift
//  KeyboardExtensionKit
//
//  Created by ky0me22 on 2023/09/02.
//

import SwiftUI

struct KECommandButtonStyle: ButtonStyle {
    let width: CGFloat?
    let height: CGFloat?
    let maxWidth: CGFloat?
    let maxHeight: CGFloat?
    let foregroundColor: Color
    let backgroundInactiveColor: Color
    let backgroundActiveColor: Color
    let cornerRadius: CGFloat

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: width, height: height)
            .frame(maxWidth: maxWidth, maxHeight: maxHeight)
            .foregroundColor(foregroundColor)
            .background(configuration.isPressed ? backgroundActiveColor : backgroundInactiveColor)
            .cornerRadius(cornerRadius)
    }
}

extension ButtonStyle where Self == KECommandButtonStyle {
    static func command(
        width: CGFloat?,
        height: CGFloat?,
        maxWidth: CGFloat?,
        maxHeight: CGFloat?,
        foregroundColor: Color,
        backgroundInactiveColor: Color,
        backgroundActiveColor: Color,
        cornerRadius: CGFloat
    ) -> KECommandButtonStyle {
        return KECommandButtonStyle(width: width,
                                    height: height,
                                    maxWidth: maxWidth,
                                    maxHeight: maxHeight,
                                    foregroundColor: foregroundColor,
                                    backgroundInactiveColor: backgroundInactiveColor,
                                    backgroundActiveColor: backgroundActiveColor,
                                    cornerRadius: cornerRadius)
    }
}
