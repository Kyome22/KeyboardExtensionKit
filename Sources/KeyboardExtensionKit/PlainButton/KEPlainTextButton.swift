//
//  KEPlainTextButton.swift
//  KeyboardExtensionKit
//
//  Created by ky0me22 on 2023/09/02.
//

import SwiftUI

public struct KEPlainTextButton: View {
    private let text: String
    private let size: CGSize
    private let cornerRadius: CGFloat
    private let foregroundColor: Color
    private let backgroundInactiveColor: Color
    private let backgroundActiveColor: Color
    private let onCommandHandler: () -> Void

    public init(
        text: String,
        size: CGSize = CGSize(width: 40, height: 40),
        cornerRadius: CGFloat = 8,
        foregroundColor: Color = KEColor.commandForeground,
        backgroundInactiveColor: Color = KEColor.commandBackgroundInactive,
        backgroundActiveColor: Color = KEColor.commandBackgroundActive,
        onCommandHandler: @escaping () -> Void
    ) {
        self.text = text
        self.size = size
        self.cornerRadius = cornerRadius
        self.foregroundColor = foregroundColor
        self.backgroundInactiveColor = backgroundInactiveColor
        self.backgroundActiveColor = backgroundActiveColor
        self.onCommandHandler = onCommandHandler
    }

    public var body: some View {
        Button {
            onCommandHandler()
        } label: {
            Text(verbatim: text)
        }
        .buttonStyle(.plain(size: size,
                            foregroundColor: foregroundColor,
                            backgroundInactiveColor: backgroundInactiveColor,
                            backgroundActiveColor: backgroundActiveColor,
                            cornerRadius: cornerRadius))
    }
}

struct KEPlainTextButton_Previews: PreviewProvider {
    static var previews: some View {
        KEPlainTextButton(text: "A", onCommandHandler: {})
    }
}
