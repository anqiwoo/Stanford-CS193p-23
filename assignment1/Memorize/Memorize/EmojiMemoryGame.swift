//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Anqi Wu on 7/22/24.
//

import SwiftUI // ViewModel is part of the UI :) But it is not creating any views but just a bridge between the real UI and model.

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["🐱", "🐶", "🐭", "🐯", "🐴", "🐷", "🐮", "🦁"]
    
    private static func createMemoryGame() -> MemoryGame<String> { // You cannot never infer a return type
        return MemoryGame(numberOfPairsOfCards: 8) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        } // Bad name, just for learning purpose
    }
    
    // @Published: if this var is changed, it says something will change!
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
