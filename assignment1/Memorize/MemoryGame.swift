//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Anqi Wu on 7/22/24.
//

import Foundation

struct MemoryGame<CardContent> { // Model does not care about what you put in the UI. It is UI-independent!
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // Add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        let content: CardContent
    }
}
