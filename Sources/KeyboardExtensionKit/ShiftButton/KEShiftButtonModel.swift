//
//  KEShiftButtonModel.swift
//  KeyboardExtensionKit
//
//  Created by ky0me22 on 2023/09/02.
//

import SwiftUI

public final class KEShiftButtonModel: ObservableObject {
    private var isTouching: Bool = false
    private var previousDate: Date? = nil
    private let doubleTapThreshold: Double

    @Binding var needsResetShiftState: Bool
    @Binding var shiftState: KEShiftState

    public init(
        doubleTapThreshold: Double = 0.25,
        needsResetShiftState: Binding<Bool>,
        shiftState: Binding<KEShiftState>
    ) {
        self.doubleTapThreshold = doubleTapThreshold
        _needsResetShiftState = needsResetShiftState
        _shiftState = shiftState

    }

    func resetShiftState() {
        needsResetShiftState = false
        if shiftState == .on {
            shiftState = .off
        }
    }

    func touchDown() {
        if isTouching { return }
        isTouching = true
        if let previousDate, -previousDate.timeIntervalSinceNow < doubleTapThreshold {
            shiftState = (shiftState == .capsLock) ? .off : .capsLock
        } else {
            shiftState = (shiftState == .off) ? .on : .off
        }
        previousDate = Date.now
    }

    func touchUp() {
        isTouching = false
    }
}
