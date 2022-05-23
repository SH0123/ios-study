//
//  emojiMemoryGame.swift
//  Memorize
//
//  Created by sanghyo on 2022/05/22.
//

import SwiftUI

//ViewModel
class EmojiMemoryGame: ObservableObject{
    static var emojis = ["🚗", "🚌", "🏎", "🚲", "🚍", "🚀", "🛥", "🛶", "✈️", "🚡", "🛵", "🚟", "🛸"]

    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame(numberOfPairsOfCards: 4){pairIndex in
            return emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    
    //MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
}
