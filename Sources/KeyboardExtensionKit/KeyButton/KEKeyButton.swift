//
//  KEKeyButton.swift
//  KeyboardExtensionKit
//
//  Created by ky0me22 on 2023/09/02.
//

import SwiftUI

public struct KEKeyButton: View {
    private let text: String
    private let width: CGFloat?
    private let height: CGFloat?
    private let maxWidth: CGFloat?
    private let maxHeight: CGFloat?
    private let cornerRadius: CGFloat
    private let foregroundColor: Color
    private let backgroundInactiveColor: Color
    private let backgroundActiveColor: Color
    private let onKeyHandler: () -> Void

    public init(
        text: String,
        width: CGFloat? = 40,
        height: CGFloat? = 40,
        maxWidth: CGFloat? = nil,
        maxHeight: CGFloat? = nil,
        cornerRadius: CGFloat = 8,
        foregroundColor: Color = KEColor.keyForeground,
        backgroundInactiveColor: Color = KEColor.keyBackgroundInactive,
        backgroundActiveColor: Color = KEColor.keyBackgroundActive,
        onKeyHandler: @escaping () -> Void
    ) {
        self.text = text
        self.width = maxWidth == nil ? width : nil
        self.height = maxHeight == nil ? height : nil
        self.maxWidth = maxWidth
        self.maxHeight = maxHeight
        self.cornerRadius = cornerRadius
        self.foregroundColor = foregroundColor
        self.backgroundInactiveColor = backgroundInactiveColor
        self.backgroundActiveColor = backgroundActiveColor
        self.onKeyHandler = onKeyHandler
    }

    public var body: some View {
        Button {
            onKeyHandler()
        } label: {
            Text(verbatim: text)
        }
        .buttonStyle(.command(
            width: width,
            height: height,
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            foregroundColor: foregroundColor,
            backgroundInactiveColor: backgroundInactiveColor,
            backgroundActiveColor: backgroundActiveColor,
            cornerRadius: cornerRadius
        ))
    }
}

struct KEKeyButton_Previews: PreviewProvider {
    static var previews: some View {
        KEKeyButton(text: "A", onKeyHandler: {})
    }
}
