//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Anqi Wu on 6/21/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    // @ObservedObject: If this thing says something changed, we redraw the view (I am observing this thing, and it should be passed in by someone else!)
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4

    init(viewModel: EmojiMemoryGame) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            Text("Score: \(viewModel.getScore())")
                .font(.title2).padding(spacing).foregroundColor(viewModel.getScoreColor()).bold()
            Text("Theme: \(viewModel.getThemeName())")
                .font(.title2).foregroundColor(viewModel.getThemeColor())
//            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
//            }
            HStack {
                Button("Shuffle") {
                    viewModel.shuffle()
                }.font(.title2)
                Spacer()
                Button("New Game") {
                    viewModel.newGame()
                }.font(.title2)
            }
        }
        .padding()
    }
   
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
                CardView(card)
                .padding(spacing)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
        .foregroundColor(viewModel.getThemeColor())
    }
}



#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
