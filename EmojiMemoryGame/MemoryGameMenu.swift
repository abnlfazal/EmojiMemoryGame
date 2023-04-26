//
//  MemoryGameMenu.swift
//  EmojiMemoryGame
//
//  Created by Fazal on 07/04/23.
//

import SwiftUI

struct MemoryGameMenu: View {
    @StateObject var game : EmojiMemoryGame
    @State var selectedType = 0
    @State var selectedLevel = 0
    let levels = ["Easy", "Medium", "Hard"]
    let emojiTypes = ["Smiley 😀", "Flags 🇮🇳", "Food 🍆"]
    var body: some View {
        NavigationView {
            VStack{
                Text("Choose game level:")
                HStack (spacing: 10){
                    ForEach(levels.indices, id: \.self) { index in
                        ButtonView(buttonText: levels[index], selected: selectedLevel == index)
                            .onTapGesture {
                                selectedLevel = index
                                game.selectLevel(selectedLevel)
                            }
                    }
                }.padding(.bottom, 50)
                Text("Choose emoji type:")
                HStack (spacing: 10){
                    ForEach(emojiTypes.indices, id: \.self) { index in
                        ButtonView(buttonText: emojiTypes[index], selected: selectedType == index)
                            .onTapGesture {
                                selectedType = index
                                game.selectType(selectedType)
                            }
                    }
                }.padding(.bottom, 50)
                NavigationLink(destination: EmojiMemoryGameView(game: game)) {
                    ButtonView(buttonText: "START")
                }.navigationBarTitle("Menu")
            }
        }.accentColor(.red)
    }
}

struct MemoryGameMenu_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameMenu(game: EmojiMemoryGame())
    }
}
