//
//  MemoryGame.swift
//  Memorize
//
//  Created by sanghyo on 2022/05/22.
//

import Foundation

//Model
struct MemoryGame<CardContent>{
    private(set) var cards: [Card]
    
    mutating func choose(_ card: Card){
        let chosenIndex = getIndex(of: card)
        cards[chosenIndex].isFaceUp.toggle()
    }
    
    func getIndex(of card: Card) -> Int{
        for index in 0..<cards.count{
            if cards[index].id == card.id{
                return index
            }
        }
        return -1
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: Identifiable{
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        let id: Int
    }
}
