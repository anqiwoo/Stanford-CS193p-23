//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Anqi Wu on 7/22/24.
//

import Foundation

struct MemoryGame<CardContent> { // Model does not care about what you put in the UI. It is UI-independent!
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
