//
//  KEKeyboardViewController.swift
//  KeyboardExtensionKit
//
//  Created by ky0me22 on 2023/09/02.
//

import SwiftUI
import UIKit

open class KEKeyboardViewController<KV: KEKeyboardViewProtocol>: UIInputViewController {
    private var keyboardModel: KV.KM!

    override open func viewDidLoad() {
        super.viewDidLoad()

        keyboardModel = KV.KM.init(operationHandler: { [weak self] operationType in
            self?.performOperation(operationType)
        })
        let keyboardView = KV.init(keyboardModel: self.keyboardModel)
        let hostingController = UIHostingController(rootView: keyboardView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        hostingController.view.backgroundColor = UIColor.clear
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    override public func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        keyboardModel.needsGlobe = needsInputModeSwitchKey
    }

    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        keyboardModel.hasFullAccess = hasFullAccess
    }

    func performOperation(_ operationType: KEOperationType) {
        switch operationType {
        case .globe(let from, let with):
            handleInputModeList(from: from, with: with)
        case .insert(let text):
            textDocumentProxy.insertText(text)
        case .delete(let length):
            textDocumentProxy.deleteBackward(length: length)
        }
    }
}
