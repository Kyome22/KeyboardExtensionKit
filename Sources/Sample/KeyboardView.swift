//
//  KeyboardView.swift
//  Sample
//
//  Created by ky0me22 on 2023/09/02.
//

import SwiftUI
import KeyboardExtensionKit

struct KeyboardView<KM: KeyboardModelProtocol>: KEKeyboardViewProtocol {
    typealias KM = KM

    @StateObject var keyboardModel: KM

    var body: some View {
        VStack(spacing: 8) {
            KECandidatesView(candidates: $keyboardModel.candidates) { selected in

            }
            HStack(spacing: 8) {
                VStack(spacing: 8) {
                    KEShiftButton(model: KEShiftButtonModel(
                        needsResetShiftState: $keyboardModel.needsResetShiftState,
                        shiftState: $keyboardModel.shiftState
                    ))
                    KEGlobeButton { from, with in
                        keyboardModel.handleInputModeList(from: from, with: with)
                    }
                }
                KEPlainTextButton(text: "hello") {
                    keyboardModel.insertHello()
                }
                KEPlainImageButton(image: Image(systemName: "face.smiling")) {
                    keyboardModel.insertSmile()
                }
                VStack(spacing: 8) {
                    KERepeatableButton(systemName: "delete", model: KERepeatableButtonModel(onCommandHandler: {

                    }))
                    KERepeatableButton(systemName: "return", model: KERepeatableButtonModel(onCommandHandler: {

                    }))
                }
            }
        }
        .padding(4)
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView(keyboardModel: KeyboardModelDummy(operationHandler: { _ in }))
    }
}
