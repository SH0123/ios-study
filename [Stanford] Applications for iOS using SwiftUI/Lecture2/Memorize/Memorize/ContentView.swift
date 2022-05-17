//
//  ContentView.swift
//  Memorize
//
//  Created by sanghyo on 2022/05/17.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack{
        HStack{
            CardView()
            CardView()
            CardView()
            CardView()
            Button{
                print("clicked")
            } label:{
                Text("click")
            }
        }
        .padding(.horizontal)
        Spacer()
            HStack{
                CardView()
                CardView()
                CardView()
                CardView()
                Button{
                    print("clicked")
                } label:{
                    Text("click")
                }
            }
            .padding(.horizontal)

    }
}
}

struct CardView: View{
    var body: some View{
        ZStack{
        RoundedRectangle(cornerRadius: 20)
            .stroke(lineWidth: 3)
        Text("hello world")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
