//
//  KECandidatesView.swift
//  KeyboardExtensionKit
//
//  Created by ky0me22 on 2023/09/02.
//

import SwiftUI

public struct KECandidatesView: View {
    @Binding private var candidates: [String]
    private let onSelectHandler: (Int) -> Void

    public init(
        candidates: Binding<[String]>,
        onSelectHandler: @escaping (Int) -> Void
    ) {
        _candidates = candidates
        self.onSelectHandler = onSelectHandler
    }

    public var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 2) {
                ForEach(candidates.indices, id: \.self) { i in
                    KECandidateButton(candidate: candidates[i]) {
                        onSelectHandler(i)
                    }
                }
            }
        }
        .frame(height: 40)
        .frame(maxWidth: .infinity)
    }
}

struct CandidatesView_Previews: PreviewProvider {
    static var previews: some View {
        KECandidatesView(candidates: .constant(["apple", "banana"]),
                         onSelectHandler: { _ in })
    }
}
