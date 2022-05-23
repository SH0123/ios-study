//
//  MemorizeApp.swift
//  Memorize
//
//  Created by sanghyo on 2022/05/17.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
