//
//  MemoryTheme.swift
//  Memorize
//
//  Created by Anqi Wu on 8/28/24.
//

import Foundation

enum MemoryTheme: String, CaseIterable {
    case jungleSafari = "Jungle Safari"
    case oceanAdventure = "Ocean Adventure"
    case farmFriends = "Farm Friends"
    case arcticAnimals = "Arctic Animals"
    case woodlandCreatures = "Woodland Creatures"
    case desertDwellers = "Desert Dwellers"
    
    var numberOfCardsToShow: Int {
        switch self {
        case .jungleSafari:
            return 5
        case .oceanAdventure:
            return 6
        case .farmFriends:
            return 5
        case .arcticAnimals:
            return 6
        case .woodlandCreatures:
            return 7
        case .desertDwellers:
            return 8
        }
    }
    
    var emojis: [String] {
        switch self {
        case .jungleSafari:
            return ["🦁", "🐯", "🐒", "🦓", "🐘", "🦒", "🐍", "🐅", "🦜", "🐊"]
        case .oceanAdventure:
            return ["🐳", "🐬", "🐟", "🦈", "🐠", "🐢", "🦑", "🐙", "🦭", "🦀"]
        case .farmFriends:
            return ["🐮", "🐷", "🐔", "🐑", "🐴", "🦆", "🐐", "🐥", "🐓", "🐖"]
        case .arcticAnimals:
            return ["🐧", "❄️", "🐻‍❄️", "🦭", "🦊", "🐺", "🐦", "🦉", "🐇", "🐋"]
        case .woodlandCreatures:
            return ["🦉", "🦊", "🐻", "🐿️", "🦌", "🐇", "🦔", "🦡", "🦦", "🦋"]
        case .desertDwellers:
            return ["🐪", "🐍", "🦎", "🦂", "🌵", "🐫", "🦅", "🦨", "🦔", "🦢"]
        }
    }
    
    var color: String {
        switch self {
        case .jungleSafari:
            return "Green"
        case .oceanAdventure:
            return "Blue"
        case .farmFriends:
            return "Brown"
        case .arcticAnimals:
            return "Mint"
        case .woodlandCreatures:
            return "Gary"
        case .desertDwellers:
            return "Yellow"
        }
    }
}
