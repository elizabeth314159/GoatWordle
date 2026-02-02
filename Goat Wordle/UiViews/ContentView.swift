//
//  ContentView.swift
//  Goat Wordle
//
//  Created by Elizabeth James on 2/1/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image("baby_goat")
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
                    .padding(.top, 16)
                    .padding(.trailing, 16)
                }
                Text("Welcome to Goat Wordle")
                    .font(.system(size: 45, weight: .bold, design: .rounded))
                    .padding()
                    .background(Color.mint)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.orange, lineWidth: 5))
                Image("white_hornless_goat")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.tint)
                HStack {
                    NavigationLink(destination: PlayScreen().navigationBarBackButtonHidden(true)) {
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
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
