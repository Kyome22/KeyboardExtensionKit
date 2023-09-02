//
//  KERepeatableCommandButtonModel.swift
//  KeyboardExtensionKit
//
//  Created by ky0me22 on 2023/09/02.
//

import Foundation

public final class KERepeatableCommandButtonModel: ObservableObject {
    private var timer: Timer?
    private var counter: Int = 0
    private let threshold: Int = 5
    private let onCommandHandler: () -> Void

    @Published var isTouching: Bool = false

    public init(onCommandHandler: @escaping () -> Void) {
        self.onCommandHandler = onCommandHandler
    }

    func touchDown() {
        if isTouching { return }
        isTouching = true
        onCommandHandler()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            guard let self else { return }
            self.counter += 1
            if self.threshold < self.counter {
                self.onCommandHandler()
            }
        }
    }

    func touchUp() {
        isTouching = false
        timer?.invalidate()
        timer = nil
        counter = 0
    }
}
