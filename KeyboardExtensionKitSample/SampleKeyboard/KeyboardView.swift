//
//  KeyboardView.swift
//  SampleKeyboard
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
            KECandidatesView(candidates: $keyboardModel.candidates) { index in
                keyboardModel.selectCandidate(of: index)
            }
            Divider()
            HStack(spacing: 8) {
                VStack(spacing: 8) {
                    KEShiftButton(
                        needsResetShiftState: $keyboardModel.needsResetShiftState,
                        model: KEShiftButtonModel(updateShiftStateHandler: { shiftState in
                            keyboardModel.shiftState = shiftState
                        })
                    )
                    KEGlobeButton { from, with in
                        keyboardModel.handleInputModeList(from: from, with: with)
                    }
                }
                KEKeyButton(text: "A", height: 88, maxWidth: .infinity) {
                    keyboardModel.insertA()
                }
                KECommandButton(image: Image(systemName: "face.smiling"), height: 88, maxWidth: .infinity) {
                    keyboardModel.insertSmile()
                }
                VStack(spacing: 8) {
                    KERepeatableCommandButton(
                        image: Image(systemName: "delete.backward"),
                        model: KERepeatableCommandButtonModel(onCommandHandler: {
                            keyboardModel.delete()
                        })
                    )
                    KERepeatableCommandButton(
                        image: Image(systemName: "return"),
                        model: KERepeatableCommandButtonModel(onCommandHandler: {
                            keyboardModel.insertNewLine()
                        })
                    )
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
