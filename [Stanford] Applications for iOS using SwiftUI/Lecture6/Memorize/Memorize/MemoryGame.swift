//
//  MemoryGame.swift
//  Memorize
//
//  Created by sanghyo on 2022/05/22.
//

import Foundation

//Model
struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: [Card]
    private var indexOfTheOneAndOnlyFaceUpCard: Int?{
        get{ cards.indices.filter({cards[$0].isFaceUp}).oneAndOnly }
        set{ cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
    }
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: {cardInCards in cardInCards.id == card.id}), !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched{
            if let potentialMatchedIndex = indexOfTheOneAndOnlyFaceUpCard{
                if cards[potentialMatchedIndex].content == cards[chosenIndex].content{
                    cards[potentialMatchedIndex].isMatched = true
                    cards[chosenIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            }else{
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    func getIndex(of card: Card) -> Int?{
        for index in 0..<cards.count{
            if cards[index].id == card.id{
                return index
            }
        }
        return nil
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
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
        let id: Int
    }
}

extension Array{
    var oneAndOnly: Element?{
        if self.count == 1 {
            return self.first
        }else {
            return nil
        }
    }
}
