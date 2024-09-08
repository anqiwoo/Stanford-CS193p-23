//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Anqi Wu on 6/21/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    typealias Card = MemoryGame<String>.Card
    
    // @ObservedObject: If this thing says something changed, we redraw the view (I am observing this thing, and it should be passed in by someone else!)
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4

    init(viewModel: EmojiMemoryGame) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            title
            score
            theme
            cards
            HStack {
                shuffle
                Spacer()
                newGame
            }
        }
        .padding()
    }
    
    private var title: some View {
        Text("Memorize!")
            .font(.largeTitle)
    }
    
    private var score: some View {
        Text("Score: \(viewModel.getScore())")
            .font(.title2)
            .padding(spacing)
            .foregroundColor(viewModel.getScoreColor())
            .bold()
            .animation(nil, value: viewModel.getScore())
    }
   
    private var theme: some View {
        Text("Theme: \(viewModel.getThemeName())")
            .font(.title2).foregroundColor(viewModel.getThemeColor())
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
                CardView(card)
                .padding(spacing)
                .overlay(FlyingNumber(number: scoreChange(causedBy: card)))
                .onTapGesture {
                    withAnimation {
                        viewModel.choose(card)
                    }
                }
        }
        .foregroundColor(viewModel.getThemeColor())
    }
    
    private func scoreChange(causedBy card: Card) -> Int {
        return 0
    }
    
    private var shuffle: some View {
        Button("Shuffle") {
            withAnimation {
                viewModel.shuffle()
            }
        }.font(.title2)
    }
    
    private var newGame: some View {
        Button("New Game") {
            viewModel.newGame()
        }.font(.title2)
    }
}



#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
