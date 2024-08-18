//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Anqi Wu on 6/21/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    // @ObservedObject: If this thing says something changed, we redraw the view (I am observing this thing)
    @ObservedObject var viewModel: EmojiMemoryGame
    
    init(viewModel: EmojiMemoryGame) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                cards
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .padding(4)
            }
        }.foregroundColor(.orange)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }.opacity(card.isFaceUp ? 1: 0)
            base.fill().opacity(card.isFaceUp ? 0: 1)
        }
    }
}









#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
