//
//  Goat_WordleApp.swift
//  Goat Wordle
//
//  Created by Elizabeth James on 2/1/26.
//

import SwiftUI

@main
struct Goat_WordleApp: App {
    
    @StateObject var dm = WordleDataModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dm)
        }
    }
}
