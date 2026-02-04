//
//  Guess.swift
//  Goat Wordle
//
//  Created by Elizabeth James on 2/4/26.
//

import SwiftUI

struct Guess {
    let index: Int
    var word = "     "
    var bgColors = [Color](repeating: .systemBackground, count: 5)
    var cardFlipped = [Bool](repeating: false, count: 5)
    var guessLetters: [String] {
        word.map { String($0) }
    }
}
