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
    private let updateShiftStateHandler: (KEShiftState) -> Void

    @Published var shiftState: KEShiftState = .off

    public init(
        doubleTapThreshold: Double = 0.25,
        updateShiftStateHandler: @escaping (KEShiftState) -> Void
    ) {
        self.doubleTapThreshold = doubleTapThreshold
        self.updateShiftStateHandler = updateShiftStateHandler
    }

    func updateShiftState() {
        updateShiftStateHandler(shiftState)
    }

    func resetShiftState() {
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
