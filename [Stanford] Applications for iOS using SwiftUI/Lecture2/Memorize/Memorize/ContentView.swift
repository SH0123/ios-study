//
//  ContentView.swift
//  Memorize
//
//  Created by sanghyo on 2022/05/17.
//

import SwiftUI

struct ContentView: View {
    @State private var emojiCount = 4
    var emojis = ["🚗", "🚌", "🏎", "🚲", "🚍", "🚀", "🛥", "🛶", "✈️", "🚡", "🛵", "🚟", "🛸"]
    
    var body: some View {
        VStack{
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
                minusButton
                Spacer()
                plusButton
            }
            .font(.largeTitle)
            .padding(.horizontal)
            }
    }
    
    
    var minusButton: some View{
        Button(action:{
            if emojiCount > 1{
                emojiCount -= 1
            }
        }){
            Image(systemName: "minus.circle")
            
        }
    }
    
    var plusButton: some View{
        Button(action:{
            if emojiCount < emojis.count{
                emojiCount += 1
            }
        }){
            Image(systemName: "plus.circle")
            
        }
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
