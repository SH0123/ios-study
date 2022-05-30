//
//  MemorizeApp.swift
//  Memorize
//
//  Created by sanghyo on 2022/05/17.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
