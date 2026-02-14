//
//  ToastView.swift
//  Goat Wordle
//
//  Created by Elizabeth James on 2/13/26.
//

import SwiftUI

struct ToastView: View {
    let toastText: String
    var body: some View {
        Text(toastText)
            .foregroundColor(.systemBackground)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.primary))
    }
}


#Preview {
    ToastView(toastText: "Not in word list")
}
