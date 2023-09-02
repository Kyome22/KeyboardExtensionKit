//
//  KeyboardModel.swift
//  Sample
//
//  Created by ky0me22 on 2023/09/02.
//

import SwiftUI
import KeyboardExtensionKit

protocol KeyboardModelProtocol: KEKeyboardModelProtocol {
    var needsResetShiftState: Bool { get set }
    var shiftState: KEShiftState { get set }
    var candidates: [String] { get set }

    func insertHello()
    func insertSmile()
    func insertNewLine()
    func delete()
}

final class KeyboardModel: KEKeyboardModel, KeyboardModelProtocol {
    @Published public var needsResetShiftState: Bool = false
    @Published public var shiftState: KEShiftState = .off
    @Published public var candidates = [String]()

    func insertHello() {
        let hello = (shiftState == .off) ? "hello" : "HELLO"
        super.insert(text: hello)
    }

    func insertSmile() {
        super.insert(text: "😀")
    }

    func insertNewLine() {
        super.insert(text: "\n")
    }

    func delete() {
        super.delete(length: 1)
    }
}

// Model for Preview
final class KeyboardModelDummy: KeyboardModelProtocol {
    @Published var needsResetShiftState: Bool = false
    @Published var shiftState: KEShiftState = .off
    @Published var candidates: [String] = []
    @Published var hasFullAccess: Bool = false
    @Published var needsGlobe: Bool = false

    required init(operationHandler: @escaping (KEOperationType) -> Void) {}

    func handleInputModeList(from: UIView, with: UIEvent) {}
    func insert(text: String) {}
    func delete(length: Int) {}
    func insertHello() {}
    func insertSmile() {}
    func insertNewLine() {}
    func delete() {}
}
