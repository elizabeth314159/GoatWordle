//
//  LetterButtonView.swift
//  Goat Wordle
//
//  Created by Elizabeth James on 2/8/26.
//

import SwiftUI

struct LetterButtonView: View {
    @EnvironmentObject var dm: WordleDataModel
    var letter: String
    var body: some View {
        Button {
            dm.addToCurrentWord(letter.lowercased())
        } label: {
            Text(letter.uppercased())
                .font(.system(size: 20))
                .frame(width: 35, height: 50)
                .background(dm.keyColors[letter] ?? .unused)
                .foregroundColor(.primary)
        }
        .buttonStyle(.plain)
    }
}


#Preview {
    LetterButtonView(letter: "L")
        .environmentObject(WordleDataModel())
}
