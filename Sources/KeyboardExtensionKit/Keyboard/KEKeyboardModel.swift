//
//  KEKeyboardModel.swift
//  
//
//  Created by ky0me22 on 2023/09/02.
//

import SwiftUI

public protocol KEKeyboardModelProtocol: ObservableObject {
    var hasFullAccess: Bool { get set }
    var needsGlobe: Bool { get set }

    init(operationHandler: @escaping (KEOperationType) -> Void)

    func handleInputModeList(from: UIView, with: UIEvent)
    func insert(text: String)
    func delete(length: Int)
}

open class KEKeyboardModel: KEKeyboardModelProtocol {
    public let operationHandler: (KEOperationType) -> Void

    @Published public var hasFullAccess: Bool = false
    @Published public var needsGlobe: Bool = true

    public required init(operationHandler: @escaping (KEOperationType) -> Void) {
        self.operationHandler = operationHandler
    }

    public func handleInputModeList(from: UIView, with: UIEvent) {
        operationHandler(.globe(from: from, with: with))
    }

    open func insert(text: String) {
        operationHandler(.insert(text: text))
    }

    open func delete(length: Int) {
        operationHandler(.delete(length: length))
    }
}
