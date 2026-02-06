//
//  directions.swift
//  Goat Wordle
//
//  Created by Elizabeth James on 2/5/26.
//

import SwiftUI

struct directions: View {
    var body : some View {
        VStack {
            Text("DIRECTIONS!")
                .font(.system(size: 35, weight: .heavy))
            Text("1. guess the secret 5 letter word in 6 tries or less")
                .font(.system(size: 35, weight: .heavy))
            Text("2. after each guess, tiles change color: green for right letter and right spot, yellow for right lettter, wrong spot, and grey for wrong letter")
                .font(.system(size: 35, weight: .heavy))
            Text("3. use these clues and GOOD LUCK!!!")
                .font(.system(size: 35, weight: .heavy))
        }
    }
}

#Preview {
    directions()
}
