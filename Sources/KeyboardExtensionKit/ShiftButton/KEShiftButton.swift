//
//  KEShiftButton.swift
//  KeyboardExtensionKit
//
//  Created by ky0me22 on 2023/09/02.
//

import SwiftUI

public struct KEShiftButton: View {
    private let size: CGSize
    private let cornerRadius: CGFloat
    private let foregroundInactiveColor: Color
    private let foregroundActiveColor: Color
    private let backgroundInactiveColor: Color
    private let backgroundActiveColor: Color

    @StateObject var model: KEShiftButtonModel

    public init(
        size: CGSize = CGSize(width: 40, height: 40),
        cornerRadius: CGFloat = 8,
        foregroundInactiveColor: Color = KEColor.shiftForegroundInactive,
        foregroundActiveColor: Color = KEColor.shiftForegroundActive,
        backgroundInactiveColor: Color = KEColor.shiftBackgroundInactive,
        backgroundActiveColor: Color = KEColor.shiftBackgroundActive,
        model: @autoclosure @escaping () -> KEShiftButtonModel
    ) {
        self.size = size
        self.cornerRadius = cornerRadius
        self.foregroundInactiveColor = foregroundInactiveColor
        self.foregroundActiveColor = foregroundActiveColor
        self.backgroundInactiveColor = backgroundInactiveColor
        self.backgroundActiveColor = backgroundActiveColor
        _model = StateObject(wrappedValue: model())
    }

    private var systemName: String {
        switch model.shiftState {
        case .off:
            return "shift"
        case .on:
            return "shift.fill"
        case .capsLock:
            return "capslock.fill"
        }
    }

    private var foregroundColor: Color {
        if model.shiftState == .off {
            return foregroundInactiveColor
        } else {
            return foregroundActiveColor
        }
    }

    private var backgroundColor: Color {
        if model.shiftState == .off {
            return backgroundInactiveColor
        } else {
            return backgroundActiveColor
        }
    }

    public var body: some View {
        Image(systemName: systemName)
            .frame(width: size.width, height: size.height)
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .onChange(of: model.needsResetShiftState) { newValue in
                if newValue {
                    model.resetShiftState()
                }
            }
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

struct KEShiftButton_Previews: PreviewProvider {
    static var previews: some View {
        KEShiftButton(model: KEShiftButtonModel(needsResetShiftState: .constant(false),
                                                shiftState: .constant(.off)))
    }
}
