//
//  ViewModel.swift
//  Memorize
//
//  Created by sanghyo on 2022/05/26.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject{
    @Published var gameModel: MemoryGame<String>!
    
    init(){
        self.gameModel = self.createNewGame()
    }
    
    func newGame(){
        self.gameModel = self.createNewGame()
    }
    
    private func createNewGame() -> MemoryGame<String>{
        let numberOfPairsOfCards: Int = Int.random(in: 4..<30)
        let themes: [Theme] = [Theme.fruit, Theme.food, Theme.transportation, Theme.animal, Theme.emotion, Theme.flag]
        let theme = themes[Int.random(in : 0..<themes.count)]
        let contentsArr: [String] = theme.rawValue.map{content in
            return String(content)
        }
        
        self.title = theme.themeName()
        self.color = theme.colorType()
        
        let pairNum = numberOfPairsOfCards >= contentsArr.count ? contentsArr.count - 1 : numberOfPairsOfCards
        
        return MemoryGame<String>(numberOfPairsOfCards: pairNum){pairNum in
            return contentsArr[pairNum]
        }
    }
    
    var cards: [MemoryGame<String>.Card]{
        return gameModel.cards
    }
    
    var score: Int{
        return gameModel.score
    }
    
    private(set) var title: String = ""
    private(set) var color: Color = .clear
    
    //MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card){
        gameModel.choose(card: card)
    }
}
