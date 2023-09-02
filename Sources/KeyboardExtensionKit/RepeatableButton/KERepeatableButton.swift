//
//  KERepeatableButton.swift
//  KeyboardExtensionKit
//
//  Created by ky0me22 on 2023/09/02.
//

import SwiftUI

public struct KERepeatableButton: View {
    private let systemName: String
    private let size: CGSize
    private let cornerRadius: CGFloat
    private let foregroundColor: Color
    private let backgroundInactiveColor: Color
    private let backgroundActiveColor: Color

    @StateObject private var model: KERepeatableButtonModel

    public init(
        systemName: String,
        size: CGSize = CGSize(width: 40, height: 40),
        cornerRadius: CGFloat = 8,
        foregroundColor: Color = KEColor.commandForeground,
        backgroundInactiveColor: Color = KEColor.commandBackgroundInactive,
        backgroundActiveColor: Color = KEColor.commandBackgroundActive,
        model: @autoclosure @escaping () -> KERepeatableButtonModel
    ) {
        self.systemName = systemName
        self.size = size
        self.cornerRadius = cornerRadius
        self.foregroundColor = foregroundColor
        self.backgroundInactiveColor = backgroundInactiveColor
        self.backgroundActiveColor = backgroundActiveColor
        _model = StateObject(wrappedValue: model())
    }

    public var body: some View {
        Image(systemName: systemName)
            .frame(width: size.width, height: size.height)
            .foregroundColor(foregroundColor)
            .background( model.isTouching ? backgroundActiveColor : backgroundInactiveColor)
            .cornerRadius(cornerRadius)
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 0.0, coordinateSpace: .global)
                    .onChanged { _ in
                        model.touchDown()
                    }
                    .onEnded { _ in
                        model.touchUp()
                    }
            )
    }
}

struct KERepeatableButton_Previews: PreviewProvider {
    static var previews: some View {
        KERepeatableButton(systemName: "return",
                           model: KERepeatableButtonModel(onCommandHandler: {}))
    }
}
