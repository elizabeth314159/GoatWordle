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
                VStack {
                    HStack {
                        Image("silly_goat")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 75)
                        Image("baby_goat")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 75)
                        Image("white_hornless_goat")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.tint)
                            .frame(height: 75)
                        
                    }
                    VStack(spacing: 3) {
                        GuessView(guess: dm.guesses[0])
                        GuessView(guess: dm.guesses[1])
                        GuessView(guess: dm.guesses[2])
                        GuessView(guess: dm.guesses[3])
                        GuessView(guess: dm.guesses[4])
                        GuessView(guess: dm.guesses[5])
                    }
                    .frame(width: Global.boardWidth, height: 6 * Global.boardWidth/5)
                    .overlay(alignment: .top) {
                        if let toastText = dm.toastText {
                            ToastView(toastText: toastText)
                                .offset(y: 20)
                        }
                    }
                    
                    Keyboard()
                        .scaleEffect(Global.keyboardScale)
                    
                    Spacer()
                    
                    
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
                                HStack {
                                    if !dm.inPlay {
                                        Button {
                                            dm.newGame()
                                        } label: {
                                            Text("New???")
                                                .font(.system(size: 40, weight: .bold, design: .rounded))
                                                .padding(.horizontal, 5)
                                                .padding(.vertical, 5)
                                                .background(Color.yellow)
                                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.orange, lineWidth: 5))
                                                .foregroundColor(.red)
                                        }
                                    }
                                    if dm.inPlay {
                                        NavigationLink(destination: directions()) {
                                            Text("?  ")
                                            
                                                .font(.system(size: 40, weight: .bold, design: .rounded))
                                                .padding(.horizontal, 5)
                                                .padding(.vertical, 5)
                                                .background(Color.mint)
                                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.orange, lineWidth: 5))
                                                .foregroundColor(.black)
                                        }
                                    }
                                }
                            }
                        ToolbarItem(placement: .topBarTrailing) {
                            if dm.inPlay {
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
                    }
                    /*
                    HStack() {
                        Image("white_hornless_goat")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.tint)
                            .frame(height: 60)
                        
                    }
                     */
                    
                }
                .padding()
                
              
        }
    }
}
#Preview {
    PlayScreen().environmentObject(WordleDataModel())
}
