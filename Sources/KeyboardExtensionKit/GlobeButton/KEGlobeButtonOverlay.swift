//
//  KEGlobeButtonOverlay.swift
//  KeyboardExtensionKit
//
//  Created by ky0me22 on 2023/09/02.
//

import SwiftUI

struct KEGlobeButtonOverlay: UIViewRepresentable {
    private let onGlobeHandler: (UIView, UIEvent) -> Void
    private let onTouchHandler: (Bool) -> Void

    init(
        onGlobeHandler: @escaping (UIView, UIEvent) -> Void,
        onTouchHandler: @escaping (Bool) -> Void
    ) {
        self.onGlobeHandler = onGlobeHandler
        self.onTouchHandler = onTouchHandler
    }

    func makeUIView(context: Context) -> UIButton {
        let button = UIButton()
        let action = #selector(context.coordinator.handleInputModeList(from:with:))
        button.addTarget(context.coordinator, action: action, for: .allTouchEvents)
        return button
    }

    func updateUIView(_ uiView: UIButton, context: Context) {}

    func makeCoordinator() -> Coordinator {
        return Coordinator(globeButtonOverlay: self)
    }

    class Coordinator {
        private let globeButtonOverlay: KEGlobeButtonOverlay

        init(globeButtonOverlay: KEGlobeButtonOverlay) {
            self.globeButtonOverlay = globeButtonOverlay
        }

        @objc func handleInputModeList(from: UIView, with: UIEvent) {
            globeButtonOverlay.onGlobeHandler(from, with)
            if with.type == .touches, let touch = with.allTouches?.first {
                switch touch.phase {
                case .began:
                    globeButtonOverlay.onTouchHandler(true)
                case .ended, .cancelled:
                    globeButtonOverlay.onTouchHandler(false)
                default:
                    break
                }
            }
        }
    }
}
