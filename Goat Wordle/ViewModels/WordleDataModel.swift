//
//  WordleDataModel.swift
//  Goat Wordle
//
//  Created by Elizabeth James on 2/4/26.
//

import SwiftUI

class WordleDataModel: ObservableObject {
    @Published var guesses: [Guess] = []
    @Published var incorrentAttempts = [Int](repeating: 0, count: 6)
    @Published var toastText: String?
    
    @Published var keyColors = [String: Color]()
    @Published var matchedLetters = [String]()
    @Published var misplacedLetters = [String]()
    
    @Published var selectedWord = ""
    @Published var currentWord = ""
    @Published var tryIndex = 0
    
    @Published var inPlay = false
    @Published var gameOver = false
    @Published var toastWords = ["Genius", "Magnificent", "Impressive", "Splendid", "Great", "Phew!"]
    
    private var isTesting = true
    
    var gameStarted: Bool {
        !currentWord.isEmpty || tryIndex > 0
    }
    
    var disabledKeys: Bool {
        !inPlay || currentWord.count == 5
    }
    
    init() {
        newGame()
    }
    
    // mark : setup
    func newGame() {
        populateDefaults()
        selectedWord = Global.commonWords.randomElement()!
        currentWord = ""
        inPlay = true
        tryIndex = 0
        gameOver = false
        print(selectedWord)
    }
    
    func populateDefaults() {
        guesses = []
        for index in 0...5 {
            guesses.append(Guess(index: index))
        }
        /*
        let letters = "ABCDEFGHIJKLMNOPQSTUVWXYZ" */
        
        let letters = "abcdefghijklmnopqrstuvwxyz" /* */
        for char in letters {
            keyColors[String(char)] = .unused
        }
        matchedLetters = []
        misplacedLetters = []
        
    }
    
    //mark : - gameplay
    func addToCurrentWord(_ letter: String) {
        currentWord += letter
        updateRow()
    }
    
    func enterWord() {
        if currentWord == selectedWord {
            gameOver = true
            print("you win")
            setCurrentGuessColors()
            inPlay = false
            showToast(with: toastWords[tryIndex])
        } else {
            if verifyWord() {
                print("Valid word")
                setCurrentGuessColors()
                tryIndex += 1
                if tryIndex == 6 {
                    gameOver = true
                    inPlay = false
                    print("you lose")
                }
                currentWord = ""
            } else {
                print("invalid")
                showToast(with: "Not in word list")
            }
        }
    }
    
    func removeLetterFromCurrentWord() {
        currentWord.removeLast()
        updateRow()
    }
    
    func updateRow() {
        let guessWord = currentWord.padding(toLength: 5, withPad: " ", startingAt: 0)
        guesses[tryIndex].word = guessWord
    }
    
    func verifyWord() -> Bool {
        
        let word = currentWord.lowercased()
        if isTesting == true {
            return Global.commonWords.contains(word)
        } else {
            return UIReferenceLibraryViewController.dictionaryHasDefinition(forTerm: currentWord)
        }
    }
    
    func setCurrentGuessColors() {
        let correctLetters = selectedWord.map { String($0) }
        var frequency = [String : Int]()
        for letter in correctLetters {
            frequency[letter, default: 0] += 1
        }
        for index in 0...4 {
            let correctLetter = correctLetters[index]
            let guessLetter = guesses[tryIndex].guessLetters[index]
            if guessLetter == correctLetter {
                guesses[tryIndex].bgColors[index] = .correct
                
                if !matchedLetters.contains(guessLetter) {
                    matchedLetters.append(guessLetter)
                    keyColors[guessLetter] = .correct
                }
                if misplacedLetters.contains(guessLetter) {
                    if let index = misplacedLetters.firstIndex(of: guessLetter) {
                        misplacedLetters.remove(at: index)
                    }
                }
                frequency[guessLetter]! -= 1
            }
            
            
        }
        for index in 0...4 {
            let guessLetter = guesses[tryIndex].guessLetters[index]
            if correctLetters.contains(guessLetter) && guesses[tryIndex].bgColors[index] != .correct && frequency[guessLetter]! > 0 {
                guesses[tryIndex].bgColors[index] = .misplaced
                frequency[guessLetter]! -= 1
                
                if !misplacedLetters.contains(guessLetter) && !matchedLetters.contains(guessLetter) {
                    misplacedLetters.append(guessLetter)
                    keyColors[guessLetter] = .misplaced
                }
            }
            
        }
        for index in 0...4 {
            let guessLetter = guesses[tryIndex].guessLetters[index]
            if keyColors[guessLetter] != .correct && keyColors[guessLetter] != .misplaced {
                keyColors[guessLetter] = .wrong
            }
        }
        
        flipCards(for: tryIndex)
        print(selectedWord)
    }
    
    func flipCards(for row: Int) {
        for col in 0...4 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(col) * 0.2) {
                self.guesses[row].cardFlipped[col].toggle()
            }
        }
    }
    
    func showToast(with text: String?) {
        withAnimation {
            toastText = text
        }
        withAnimation(Animation.linear(duration: 0.2).delay(3)) {
            toastText = nil
        }
    }
}
