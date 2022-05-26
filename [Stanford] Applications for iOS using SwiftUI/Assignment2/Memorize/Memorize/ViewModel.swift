//
//  ViewModel.swift
//  Memorize
//
//  Created by sanghyo on 2022/05/26.
//

import Foundation

class ViewModel: ObservableObject{
    @Published var gameModel: MemoryGame<String>
    
    init(numberOfPairsOfCards: Int, theme: Theme){
        let contentsArr: [String] = theme.rawValue.map{content in
            return String(content)
        }
        
        let pairNum = numberOfPairsOfCards >= contentsArr.count ? contentsArr.count - 1 : numberOfPairsOfCards
        
        gameModel = MemoryGame<String>(numberOfPairsOfCards: pairNum){pairNum in
            return contentsArr[pairNum]
        }
    }
    
    var cards: [MemoryGame<String>.Card]{
        return gameModel.cards
    }
    
    //MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card){
        gameModel.choose(card: card)
    }
}
