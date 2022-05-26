//
//  ContentView.swift
//  Memorize
//
//  Created by sanghyo on 2022/05/17.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel(numberOfPairsOfCards: randPairNum(), theme: randTheme())
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(viewModel.cards){card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card: card)
                            }
                    }
                }
            }
            .padding(.horizontal)
            .foregroundColor(.red)
            Spacer()
        }
    }
    
    static func randPairNum() -> Int{
        return Int.random(in: 4..<30)
    }
    
    static func randTheme() -> Theme{
        let themes: [Theme] = [Theme.fruit, Theme.food, Theme.transportation, Theme.animal, Theme.emotion, Theme.flag]
        return themes[Int.random(in : 0..<themes.count)]
    }
}

struct CardView: View{
    let card: MemoryGame<String>.Card
    var body: some View{
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack{
            if card.isFaceUp{
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            }else if card.isMatched{
                shape.opacity(0)
            }
            else{
                shape.fill()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
