//
//  Keyboard.swift
//  Goat Wordle
//
//  Created by Elizabeth James on 2/8/26.
//

import SwiftUI

struct Keyboard: View {
    @EnvironmentObject var dm: WordleDataModel
    var topRowArray = "QWERTYUIOP".map{ String($0)}
    var secondRowArray = "ASDFGHJKL".map{ String($0)}
    var thirdRowArray = "ZXCVBNM".map{ String($0)}
    
    var body: some View {
        VStack {
            HStack(spacing: 2) {
                ForEach(topRowArray, id: \.self) {
                    letter in LetterButtonView(letter: letter)
                }
            }
            HStack(spacing: 2) {
                ForEach(secondRowArray, id: \.self) {
                    letter in LetterButtonView(letter: letter)
                }
            }
            HStack(spacing: 2) {
                Button {
                    dm.enterWord()
                } label: {
                    Text("Enter")
                        .font(.system(size: 20))
                        .frame(width: 60, height: 50)
                        .foregroundColor(.primary)
                        .background(Color.unused)
                }
                ForEach(thirdRowArray, id: \.self) {
                    letter in LetterButtonView(letter: letter)
                }
                Button {
                    dm.removeLetterFromCurrentWord()
                } label: {
                    Text("Delete")
                        .font(.system(size: 20))
                        .frame(width: 60, height: 50)
                        .foregroundColor(.primary)
                        .background(Color.unused)
                }

            }
        }
    }
}


#Preview {
    Keyboard()
        .environmentObject(WordleDataModel())
}
