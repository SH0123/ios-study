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
            AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
                CardView(card: card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture {
                        game.choose(card: card)
                    }
                .padding(4)
            })
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
                let shape = RoundedRectangle(cornerRadius: 10)
                if card.isFaceUp{
                    shape.fill(.white)
                    shape.strokeBorder(lineWidth: 3)
                    Pie(startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 20)).padding(4).opacity(0.5)
                    Text(card.content).font(font(in: geometry.size))
                }
                else if card.isMatched{
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
    
    //왜 static인지 찾아보기
    private struct DrawingContents{
        static let fontScale: CGFloat = 0.7
    }
}


struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards.first!)
        return EmojiMemoryGameView(game: game)
            .previewInterfaceOrientation(.portrait)
    }
}
