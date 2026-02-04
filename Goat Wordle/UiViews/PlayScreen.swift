//
//  PlayScreen.swift
//  Goat Wordle
//
//  Created by Elizabeth James on 2/1/26.
//

import SwiftUI

struct PlayScreen: View {
    @EnvironmentObject var dm: WordleDataModel
    var body: some View {
        NavigationStack {
            NavigationView {
                VStack {
                    
                    VStack(spacing: 3) {
                        GuessView(guess: $dm.guesses[0])
                        GuessView(guess: $dm.guesses[1])
                        GuessView(guess: $dm.guesses[2])
                        GuessView(guess: $dm.guesses[3])
                        GuessView(guess: $dm.guesses[4])
                        GuessView(guess: $dm.guesses[5])
                    }
                    .frame(width: Global.boardWidth, height: 6 * Global.boardWidth/5)
                    
                    HStack {
                        Image("silly_goat")
                            .resizable()
                            .scaledToFit()
                        Image("baby_goat")
                            .resizable()
                            .scaledToFit()
                        
                    }
                    
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                        
                        Text("WORDLE")
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                            .padding(.horizontal, 5)
                            .padding(.vertical, 5)
                            .background(Color.mint)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.orange, lineWidth: 5))
                            .navigationBarTitleDisplayMode(.inline)
                    }
                            ToolbarItem(placement: .topBarLeading) {
                                Button {
                                    
                                } label: {
                                    Text("?  ")
                                    
                                        .font(.system(size: 40, weight: .bold, design: .rounded))
                                        .padding(.horizontal, 5)
                                        .padding(.vertical, 5)
                                        .background(Color.mint)
                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.orange, lineWidth: 5))
                                        .foregroundColor(.black)
                                }
                            }
                        ToolbarItem(placement: .topBarTrailing) {
                            NavigationLink(destination: Menu()) {
                                Text("Menu")
                                    .font(.system(size: 35, weight: .bold, design: .rounded))
                                    .padding(.horizontal, 5)
                                    .padding(.vertical, 5)
                                    .background(Color.mint)
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.orange, lineWidth: 5))
                                    .foregroundColor(.black)
                                
                            }
                        }
                    }
                    
                    /*
                    Image("white_hornless_goat")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.tint) */
                    
                }
                .padding()
                
                
            }
        }
    }
}
#Preview {
    PlayScreen().environmentObject(WordleDataModel())
}
