//
//  MemoryGame.swift
//  Memorize
//
//  Created by sanghyo on 2022/05/26.
//

import Foundation
import SwiftUI

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
        if let chosenIndex = cards.firstIndex(where: {cardInCards in
            cardInCards.id == card.id
        } ), !cards[chosenIndex].isMatched, !cards[chosenIndex].isFaceUp{
            if let potentialMatchedIndex = indexOfTheOneAndOnlyFaceUpCard{
                if cards[potentialMatchedIndex].content == cards[chosenIndex].content{
                    cards[potentialMatchedIndex].isMatched = true
                    cards[chosenIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            }else{
                for index in cards.indices{
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
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
    
    func colorType() -> Color{
        switch self{
        case .fruit:
            return .red
        case .food:
            return .yellow
        case .transportation:
            return .blue
        case .animal:
            return .green
        case .emotion:
            return .black
        default:
            return .purple
        }
    }
}
