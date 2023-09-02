//
//  KEGlobeButton.swift
//  KeyboardExtensionKit
//
//  Created by ky0me22 on 2023/09/02.
//

import SwiftUI

public struct KEGlobeButton: View {
    private let width: CGFloat?
    private let height: CGFloat?
    private let maxWidth: CGFloat?
    private let maxHeight: CGFloat?
    private let cornerRadius: CGFloat
    private let foregroundColor: Color
    private let backgroundInactiveColor: Color
    private let backgroundActiveColor: Color
    private let onGlobeHandler: (UIView, UIEvent) -> Void

    @State private var isPressed: Bool = false

    public init(
        width: CGFloat? = 40,
        height: CGFloat? = 40,
        maxWidth: CGFloat? = nil,
        maxHeight: CGFloat? = nil,
        cornerRadius: CGFloat = 8,
        foregroundColor: Color = KEColor.commandForeground,
        backgroundInactiveColor: Color = KEColor.commandBackgroundInactive,
        backgroundActiveColor: Color = KEColor.commandBackgroundActive,
        onGlobeHandler: @escaping (UIView, UIEvent) -> Void
    ) {
        self.width = maxWidth == nil ? width : nil
        self.height = maxHeight == nil ? height : nil
        self.maxWidth = maxWidth
        self.maxHeight = maxHeight
        self.cornerRadius = cornerRadius
        self.foregroundColor = foregroundColor
        self.backgroundInactiveColor = backgroundInactiveColor
        self.backgroundActiveColor = backgroundActiveColor
        self.onGlobeHandler = onGlobeHandler
    }

    public var body: some View {
        Image(systemName: "globe")
            .frame(width: width, height: height)
            .frame(maxWidth: maxWidth, maxHeight: maxHeight)
            .foregroundColor(foregroundColor)
            .background(isPressed ? backgroundActiveColor : backgroundInactiveColor)
            .cornerRadius(cornerRadius)
            .overlay {
                KEGlobeButtonOverlay { from, with in
                    onGlobeHandler(from, with)
                } onTouchHandler: { flag in
                    isPressed = flag
                }
            }
    }
}

struct KEGlobeButton_Previews: PreviewProvider {
    static var previews: some View {
        KEGlobeButton(onGlobeHandler: { _, _ in })
    }
}
