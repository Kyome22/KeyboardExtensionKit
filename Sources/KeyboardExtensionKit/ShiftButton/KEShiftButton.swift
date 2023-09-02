//
//  KEShiftButton.swift
//  KeyboardExtensionKit
//
//  Created by ky0me22 on 2023/09/02.
//

import SwiftUI

public struct KEShiftButton: View {
    private let width: CGFloat?
    private let height: CGFloat?
    private let maxWidth: CGFloat?
    private let maxHeight: CGFloat?
    private let cornerRadius: CGFloat
    private let foregroundInactiveColor: Color
    private let foregroundActiveColor: Color
    private let backgroundInactiveColor: Color
    private let backgroundActiveColor: Color

    @Binding var needsResetShiftState: Bool
    @StateObject var model: KEShiftButtonModel

    public init(
        width: CGFloat? = 40,
        height: CGFloat? = 40,
        maxWidth: CGFloat? = nil,
        maxHeight: CGFloat? = nil,
        cornerRadius: CGFloat = 8,
        foregroundInactiveColor: Color = KEColor.shiftForegroundInactive,
        foregroundActiveColor: Color = KEColor.shiftForegroundActive,
        backgroundInactiveColor: Color = KEColor.shiftBackgroundInactive,
        backgroundActiveColor: Color = KEColor.shiftBackgroundActive,
        needsResetShiftState: Binding<Bool>,
        model: @autoclosure @escaping () -> KEShiftButtonModel
    ) {
        self.width = maxWidth == nil ? width : nil
        self.height = maxHeight == nil ? height : nil
        self.maxWidth = maxWidth
        self.maxHeight = maxHeight
        self.cornerRadius = cornerRadius
        self.foregroundInactiveColor = foregroundInactiveColor
        self.foregroundActiveColor = foregroundActiveColor
        self.backgroundInactiveColor = backgroundInactiveColor
        self.backgroundActiveColor = backgroundActiveColor
        _needsResetShiftState = needsResetShiftState
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
            .frame(width: width, height: height)
            .frame(maxWidth: maxWidth, maxHeight: maxHeight)
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .onChange(of: model.shiftState) { _ in
                model.updateShiftState()
            }
            .onChange(of: needsResetShiftState) { newValue in
                if newValue {
                    model.resetShiftState()
                    needsResetShiftState = false
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
        KEShiftButton(needsResetShiftState: .constant(false),
                      model: KEShiftButtonModel(updateShiftStateHandler: { _ in }))
    }
}
