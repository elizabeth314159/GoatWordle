//
//  PlayScreen.swift
//  Goat Wordle
//
//  Created by Elizabeth James on 2/1/26.
//

import SwiftUI

struct PlayScreen: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image("silly_goat")
                        .resizable()
                        .scaledToFit()
                    Spacer()
                    Spacer()
                    NavigationLink(destination: Menu()) {
                        Text("Menu")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 48)
                            .background(RoundedRectangle(cornerRadius: 25).fill(.orange))
                            .foregroundColor(.black)
                        
                        
                        
                    }
                }
                Text("PLAY")
                    .font(.system(size: 45, weight: .bold, design: .rounded))
                    .padding()
                    .background(Color.mint)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.orange, lineWidth: 5))
                Image("white_hornless_goat")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.tint)
                
            }
            .padding()
        }
    }
}
#Preview {
    PlayScreen()
}
