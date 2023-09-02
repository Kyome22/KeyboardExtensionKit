//
//  KEPlainImageButton.swift
//  KeyboardExtensionKit
//
//  Created by ky0me22 on 2023/09/02.
//

import SwiftUI

public struct KEPlainImageButton: View {
    private let image: Image
    private let size: CGSize
    private let cornerRadius: CGFloat
    private let foregroundColor: Color
    private let backgroundInactiveColor: Color
    private let backgroundActiveColor: Color
    private let onCommandHandler: () -> Void

    public init(
        image: Image,
        size: CGSize = CGSize(width: 40, height: 40),
        cornerRadius: CGFloat = 8,
        foregroundColor: Color = KEColor.commandForeground,
        backgroundInactiveColor: Color = KEColor.commandBackgroundInactive,
        backgroundActiveColor: Color = KEColor.commandBackgroundActive,
        onCommandHandler: @escaping () -> Void
    ) {
        self.image = image
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
            image
        }
        .buttonStyle(.plain(size: size,
                            foregroundColor: foregroundColor,
                            backgroundInactiveColor: backgroundInactiveColor,
                            backgroundActiveColor: backgroundActiveColor,
                            cornerRadius: cornerRadius))
    }
}

struct KEPlainImageButton_Previews: PreviewProvider {
    static var previews: some View {
        KEPlainImageButton(image: Image(systemName: "command"), onCommandHandler: {})
    }
}
