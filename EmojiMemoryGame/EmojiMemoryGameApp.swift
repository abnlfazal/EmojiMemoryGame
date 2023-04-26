//
//  EmojiMemoryGameApp.swift
//  Emoji Memory Game
//
//  Created by Fazal on 12/12/22.
//

import SwiftUI

@main
struct EmojiMemoryGameApp: App {
    private let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            MemoryGameMenu(game: game)
        }
    }
}
