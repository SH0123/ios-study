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
    
    func choose(_ card: Card){
        
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    struct Card{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
