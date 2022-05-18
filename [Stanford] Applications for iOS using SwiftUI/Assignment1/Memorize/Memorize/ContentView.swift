//
//  ContentView.swift
//  Memorize
//
//  Created by sanghyo on 2022/05/17.
//

import SwiftUI

struct ContentView: View {
    @State private var emojiCount = 8
    @State private var emojis = "🍎🍏🍐🍊🍋🍌🍉🍇🍓🫐🍈🍒🍑🥭🍍🥥"
        .map{emoji in
            String(emoji)
        }.shuffled()

    
    var body: some View {
        VStack{
            Text("Memorize!").font(.largeTitle)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(emojis[0..<emojiCount], id: \.self){emoji in
                        CardView(emoji: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .padding(.horizontal)
            .foregroundColor(.red)
            Spacer()
            HStack{
                Spacer()
                firstButton
                Spacer()
                secondButton
                Spacer()
                thirdButton
                Spacer()
            }
            .padding(.horizontal)
        }
    }
    
    @ViewBuilder
    var firstButton: some View{
        VStack{
            Button(action:{
                emojis = "🍎🍏🍐🍊🍋🍌🍉🍇🍓🫐🍈🍒🍑🥭🍍🥥"
                    .map{emoji in
                        String(emoji)
                    }.shuffled()
                emojiCount = Int.random(in: 8...emojis.count)
                
            }){
                VStack{
                Image(systemName: "applelogo")
                    .font(.largeTitle)
                Text("Fruits")
                }
            }
            
        }
    }
    
    @ViewBuilder
    var secondButton: some View{
        VStack{
            Button(action:{
                emojis = "🐶🐱🐭🐹🐰🦊🐻🐼🐻‍❄️🐨🐯🦁🐮🐷🐽🐸🐒🐔🐧🐦"
                    .map{emoji in
                        String(emoji)
                    }.shuffled()
                emojiCount = Int.random(in: 8...emojis.count)
                
            }){
                VStack{
                Image(systemName: "pawprint")
                    .font(.largeTitle)
                Text("Animals")
                }
            }
        }
    }
    
    @ViewBuilder
    var thirdButton: some View{
        VStack{
            Button(action:{
                emojis = "😄😆🥹😂☺️😊🙃🥰😌😗🤪😎🥳😔😡😱🥶"
                    .map{emoji in
                        String(emoji)
                    }.shuffled()
                emojiCount = Int.random(in: 8...emojis.count)

            }){
                VStack{
                Image(systemName: "face.smiling")
                    .font(.largeTitle)
                Text("emotions")
                }
            }
        }
    }
    
    private func widthThatBestFits(cardCount: Int){
        
    }
}

struct CardView: View{
    var emoji: String
    @State private var isFaceUp = true
    var body: some View{
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack{
            if isFaceUp{
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(emoji).font(.largeTitle)
            }else{
                shape.fill()
            }
            
        }
        .onTapGesture{
            self.isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
