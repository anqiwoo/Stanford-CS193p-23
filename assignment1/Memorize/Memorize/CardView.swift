//
//  CardView.swift
//  Memorize
//
//  Created by Anqi Wu on 8/31/24.
//

import SwiftUI

struct CardView: View {
    typealias Card = MemoryGame<String>.Card
    
    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        Pie(endAngle: .degrees(240))
            .opacity(0.4)
            .overlay(
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(5)
                    .rotationEffect(.degrees(card.isMatched ? 360 : 0)).animation(.spin(duration: 1), value: card.isMatched)
            )
            .padding(5)
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

extension Animation {
    static func spin(duration: TimeInterval) -> Animation {
        .linear(duration: 1).repeatForever(autoreverses: false)
    }
}

#Preview {
    typealias Card = CardView.Card
    
    return VStack {
        HStack {
            CardView(Card(isFaceUp: true, content: "🦁", id: "test1"))
            CardView(Card(isFaceUp: true, content: "🦁", id: "test2"))
        }
        HStack {
            CardView(Card(isFaceUp: true, content: "🐱", id: "test3"))
            CardView(Card(isFaceUp: true, content: "🐱", id: "test4"))
        }
    }
    .padding().foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
}

