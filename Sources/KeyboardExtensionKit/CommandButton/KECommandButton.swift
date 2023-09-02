//
//  KECommandButton.swift
//  KeyboardExtensionKit
//
//  Created by ky0me22 on 2023/09/02.
//

import SwiftUI

public struct KECommandButton: View {
    private let image: Image
    private let width: CGFloat?
    private let height: CGFloat?
    private let maxWidth: CGFloat?
    private let maxHeight: CGFloat?
    private let cornerRadius: CGFloat
    private let foregroundColor: Color
    private let backgroundInactiveColor: Color
    private let backgroundActiveColor: Color
    private let onCommandHandler: () -> Void

    public init(
        image: Image,
        width: CGFloat? = 40,
        height: CGFloat? = 40,
        maxWidth: CGFloat? = nil,
        maxHeight: CGFloat? = nil,
        cornerRadius: CGFloat = 8,
        foregroundColor: Color = KEColor.commandForeground,
        backgroundInactiveColor: Color = KEColor.commandBackgroundInactive,
        backgroundActiveColor: Color = KEColor.commandBackgroundActive,
        onCommandHandler: @escaping () -> Void
    ) {
        self.image = image
        self.width = maxWidth == nil ? width : nil
        self.height = maxHeight == nil ? height : nil
        self.maxWidth = maxWidth
        self.maxHeight = maxHeight
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

struct KECommandButton_Previews: PreviewProvider {
    static var previews: some View {
        KECommandButton(image: Image(systemName: "command"), onCommandHandler: {})
    }
}
