//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Anqi Wu on 7/22/24.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable { // Model does not care about what you put in the UI. It is UI-independent!
    // private(set): publicly readable but privately modifiable
    private(set) var cards: Array<Card>
    private(set) var score: Int
    private(set) var seenCardIndices: Array<Int>

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        score = 0
        seenCardIndices = []
        // Add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex + 1)a"))
            cards.append(Card(content: content, id: "\(pairIndex + 1)b"))
        }
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { index in cards[index].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) } }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                        score += 2
                    } else {
                        if (cards[chosenIndex].isPreviouslySeen) {
                            score -= 1
                        }
                        if (cards[potentialMatchIndex].isPreviouslySeen) {
                            score -= 1
                        }
                    }
                } else {
                    seenCardIndices.forEach { index in cards[index].isPreviouslySeen = true }
                    seenCardIndices = []
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
                seenCardIndices.append(chosenIndex)
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    mutating func newGame() {
        // MARK: - TODO
        // The cards in a new game should all start face down and shuffled
        shuffle()
        print("New Game!")
    }
    
    func getScore() -> Int {
        return score
    }

    // If every property is equatable, Swift can take care of the == for you, it will just check equality for every property!
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var isPreviouslySeen: Bool = false
        let content: CardContent
        
        var id: String
        var debugDescription: String {
            return "\(id): \(content) \(isFaceUp ? "up": "down")\(isMatched ? " matched" : "")"
        }
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}


