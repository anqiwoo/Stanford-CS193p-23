//
//  ContentView.swift
//  Memorize
//
//  Created by Anqi Wu on 6/21/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["👻", "🎃", "🕷️", "😈", "🐱", "🥶", "😶‍🌫️", "🤭", "🤡", "💃", "🐰", "🦁"]
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<cardCount, id: \.self) { index in
                    CardView(content: emojis[index])
                }
            }.foregroundColor(.orange)
            
            HStack {
                Button("Remove Card") {
                    cardCount -= 1
                }
                Spacer()
                Button("Add Card") {
                    cardCount += 1
                }
            }
        }
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}









#Preview {
    ContentView()
}
