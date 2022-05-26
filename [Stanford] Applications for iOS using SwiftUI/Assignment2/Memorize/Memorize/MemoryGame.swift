//
//  MemoryGame.swift
//  Memorize
//
//  Created by sanghyo on 2022/05/26.
//

import Foundation

struct MemoryGame<Content> where Content: Equatable{
    
    private(set) var cards: [Card]
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> Content){
        cards = []
        for index in 0..<numberOfPairsOfCards{
            let content = createCardContent(index)
            cards.append(Card(id: index * 2, content: content))
            cards.append(Card(id: index * 2 + 1, content: content))
        }
        cards = cards.shuffled()
    }
    
    mutating func choose(card: Card){
        
    }
    
    
    struct Card : Identifiable{
        var id: Int
        var content: Content
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var seen: Bool = false
    }
}

enum Theme: String{
    case fruit = "🍏🍎🍐🍊🍋🍌🍉🍇🍓🫐🍈🍒🍑🥭🍍🥥🥝🍅🍆"
    case food = "🥐🥯🍞🥨🧀🍳🥞🍔🍟🍕🥘"
    case transportation = "🚕🚎🚑🚚🚲🚔🚝🛬🚀🛳✈️⛵️"
    case animal = "🐶🐱🐭🐹🐰🦊🐻🐼🐻‍❄️🐨"
    case emotion = "😃😂☺️🥰😙😝🤩🥳😡🤯🥶🫥😵‍💫"
    case flag = "🇬🇭🇬🇱🇬🇷🇳🇬🇳🇱🇳🇴🇳🇮🇰🇷🇩🇰🇩🇪🇲🇨🇲🇽🇻🇳🇸🇴"
}
