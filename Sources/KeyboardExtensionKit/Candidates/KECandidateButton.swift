//
//  KECandidateButton.swift
//  KeyboardExtensionKit
//
//  Created by ky0me22 on 2023/09/02.
//

import SwiftUI

struct KECandidateButton: View {
    private let candidate: String
    private let tintColor: Color
    private let backgroundColor: Color
    private let onSelectHandler: () -> Void

    public init(
        candidate: String,
        tintColor: Color = KEColor.candidateTint,
        backgroundColor: Color = KEColor.candidateBackground,
        onSelectHandler: @escaping () -> Void
    ) {
        self.candidate = candidate
        self.tintColor = tintColor
        self.backgroundColor = backgroundColor
        self.onSelectHandler = onSelectHandler
    }

    var body: some View {
        Button {
            onSelectHandler()
        } label: {
            Text(candidate)
                .lineLimit(1)
        }
        .buttonStyle(.candidate(
            tintColor: tintColor,
            backgroundColor: backgroundColor
        ))
        .contentShape(Rectangle())
    }
}

struct CandidateButton_Previews: PreviewProvider {
    static var previews: some View {
        KECandidateButton(candidate: "hello", onSelectHandler: {})
    }
}
