//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Anqi Wu on 7/22/24.
//

import SwiftUI // ViewModel is part of the UI :) But it is not creating any views but just a bridge between the real UI and model.

class EmojiMemoryGame: ObservableObject {
    
    init() {
        let theme = EmojiMemoryGame.createMemoryTheme()
        self.theme = theme
        self.model = EmojiMemoryGame.createMemoryGame(theme)
        self.model.shuffle()
    }
    
    private static func createMemoryTheme() -> MemoryTheme! {
        MemoryTheme.allCases.randomElement()
    }
    
    private static func createMemoryGame(_ theme: MemoryTheme!) -> MemoryGame<String> { // You cannot never infer a return type
        let emojis = theme.emojis.shuffled()
        return MemoryGame(numberOfPairsOfCards: theme.numberOfCardsToShow) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    // @Published: if this var is changed, it says something will change!
    @Published private(set) var model: MemoryGame<String>
    @Published private(set) var theme: MemoryTheme!
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func newGame() {
        // MARK: - TODO: Each new game should use a randomly chosen Theme to display its card
        let theme = EmojiMemoryGame.createMemoryTheme()
        self.theme = theme
        self.model = EmojiMemoryGame.createMemoryGame(theme)
        self.model.newGame()
    }
    
    func getScore() -> Int {
        return model.getScore()
    }
    
    func getScoreColor() -> Color {
        return model.getScore() >= 0 ? .green : .red
    }
    
    func getThemeName() -> String {
        return theme.rawValue
    }
    
    func getThemeColor() -> Color {
        switch theme.color {
        case "Green":
            return .green
        case "Blue":
            return .blue
        case "Brown":
            return .brown
        case "Mint":
            return .mint
        case "Gray":
            return .gray
        default:
            return .yellow
        }
    }

    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
