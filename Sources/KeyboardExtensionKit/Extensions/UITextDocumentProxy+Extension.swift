//
//  UITextDocumentProxy+Extension.swift
//  KeyboardExtensionKit
//
//  Created by ky0me22 on 2023/09/02.
//

import UIKit

extension UITextDocumentProxy {
    public func deleteBackward(length: Int) {
        (0 ..< length).forEach { _ in
            deleteBackward()
        }
    }
}
