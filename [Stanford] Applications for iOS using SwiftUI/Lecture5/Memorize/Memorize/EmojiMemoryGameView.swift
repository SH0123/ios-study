//
//  ContentView.swift
//  Memorize
//
//  Created by sanghyo on 2022/05/17.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(game.cards){card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit) 
                            .onTapGesture {
                                game.choose(card: card)
                            }
                    }
                }
            }
            .padding(.horizontal)
            .foregroundColor(.red)
            
        }
    }
}

struct CardView: View{
    let card: EmojiMemoryGame.Card
      
    var body: some View{
        GeometryReader { geometry in
            ZStack{
                let shape = RoundedRectangle(cornerRadius: 20)
                if card.isFaceUp{
                    shape.fill(.white)
                    shape.strokeBorder(lineWidth: 3)
                    Text(card.content).font(font(in: geometry.size))
                }else if card.isMatched{
                    shape.opacity(0)
                }
                else{
                    shape.fill()
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingContents.fontScale)
    }
    
    private struct DrawingContents{
        static let fontScale: CGFloat = 0.8
    }
}


struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(game: EmojiMemoryGame())
            .previewInterfaceOrientation(.portrait)
    }
}
