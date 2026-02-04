//
//  ContentView.swift
//  Goat Wordle
//
//  Created by Elizabeth James on 2/1/26.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dm: WordleDataModel
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image("baby_goat")
                        .resizable()
                        .scaledToFit()
                    Image("white_hornless_goat")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.tint)
                    NavigationLink(destination: Menu()) {
                        Text("Menu")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 30)
                            .background(RoundedRectangle(cornerRadius: 25).fill(.orange))
                            .foregroundColor(.black)
                        
                        
                        
                    }
                }
                Text("Welcome to Goat Wordle")
                    .font(.system(size: 45, weight: .bold, design: .rounded))
                    .padding()
                    .background(Color.mint)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.orange, lineWidth: 5))
                
                HStack {
                    NavigationLink(destination: PlayScreen().environmentObject(dm).navigationBarBackButtonHidden(true)) {
                        Text("PLAY")
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 48)
                            .background(RoundedRectangle(cornerRadius: 25).fill(.orange))
                            .foregroundColor(.black)
                        
                        
                        
                    }
                    .padding(.top, 16)
                    .padding(.trailing, 16)
                    
                    Image("mountain_goat")
                        .resizable()
                        .scaledToFit()
                    
                    
                }
                Image("derpy_goat")
                    .resizable()
                    .scaledToFit()
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(WordleDataModel())
}
