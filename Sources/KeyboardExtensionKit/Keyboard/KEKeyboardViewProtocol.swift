//
//  KEKeyboardViewProtocol.swift
//  KeyboardExtensionKit
//
//  Created by ky0me22 on 2023/09/02.
//

import SwiftUI

public protocol KEKeyboardViewProtocol: View {
    associatedtype KM: KEKeyboardModelProtocol

    var keyboardModel: KM { get }

    init(keyboardModel: @autoclosure @escaping () -> KM)
}
