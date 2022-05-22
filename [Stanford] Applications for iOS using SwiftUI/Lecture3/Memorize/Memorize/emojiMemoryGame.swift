//
//  emojiMemoryGame.swift
//  Memorize
//
//  Created by sanghyo on 2022/05/22.
//

import SwiftUI

//ViewModel
class EmojiMemoryGame{
    static var emojis = ["🚗", "🚌", "🏎", "🚲", "🚍", "🚀", "🛥", "🛶", "✈️", "🚡", "🛵", "🚟", "🛸"]
    
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame(numberOfPairsOfCards: 4){pairIndex in
            return emojis[pairIndex]
        }
    }

    private var model: MemoryGame<String> = createMemoryGame()
    
}
