//
//  EmojiMemoryGame.swift
//  Emoji Memory Game
//
//  Created by Fazal on 13/12/22.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    private static let level = [8,16,24]
    private static var selected = 0
    private static var emoji = emojis.smileys
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: level[selected]) { pairIndex in
            emoji[pairIndex]
        }
    }
    

    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    var isCompleted : Bool {
        return model.cards.allSatisfy { $0.isMatched }
    }
    
    // MARK: - Intent(s)
    
    func chooseCards(_ card: Card){
        model.chooseCards(card)
    }
    
    func play() {
        EmojiMemoryGame.emoji.shuffle()
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    func selectLevel(_ level: Int){
        EmojiMemoryGame.selected = level
    }
    
    func selectType(_ type: Int){
        switch type {
        case 0:
            EmojiMemoryGame.emoji = emojis.smileys
        case 1:
            EmojiMemoryGame.emoji = emojis.flags
        case 2:
            EmojiMemoryGame.emoji = emojis.food
        default:
            EmojiMemoryGame.emoji = emojis.smileys
        }
    }
    
}
