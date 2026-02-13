//
//  Guess.swift
//  Goat Wordle
//
//  Created by Elizabeth James on 2/4/26.
//

import SwiftUI

class Guess : ObservableObject {
    let index: Int
    @Published var word = "     "
    @Published var bgColors = [Color](repeating: .wrong, count: 5)
    @Published var cardFlipped = [Bool](repeating: false, count: 5)
    var guessLetters: [String] {
        word.map { String($0) }
    }
    init(index: Int) {
           self.index = index
    }
}

