//
//  Menu.swift
//  Goat Wordle
//
//  Created by Elizabeth James on 2/1/26.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        NavigationStack {
            VStack {
                
                Text("MENU")
                    .font(.system(size: 45, weight: .bold, design: .rounded))
                    .padding()
                    .padding(.horizontal, 100)
                    .background(Color.mint)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.orange, lineWidth: 5))
                HStack {
                    Image("silly_goat")
                        .resizable()
                        .scaledToFit()
                    Spacer()
                    Spacer()
                    /*
                    NavigationLink(destination: PlayScreen().navigationBarBackButtonHidden(true)) {
                        Text("Menu")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 48)
                            .background(RoundedRectangle(cornerRadius: 25).fill(.orange))
                            .foregroundColor(.black)
                        
                        
                        
                    } */
                }
                
            }
            .padding()
            
            Spacer()
        }
    }
}
#Preview {
    Menu()
}
