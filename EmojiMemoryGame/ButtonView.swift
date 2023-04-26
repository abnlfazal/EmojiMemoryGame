//
//  ButtonView.swift
//  EmojiMemoryGame
//
//  Created by Fazal on 07/04/23.
//

import SwiftUI

struct ButtonView: View {
    @State var buttonText : String
    var selected : Bool = true
    var body: some View{
        VStack {
            Text(buttonText).foregroundColor(selected ? .white : .red)
                .font(.system(size: 20)).padding(.horizontal, 20).padding(.vertical, 10)
        }.background(selected ? Color.red:Color.clear)
        .cornerRadius(30)
        .background(RoundedRectangle(cornerRadius: 20).strokeBorder(lineWidth: 1).foregroundColor(.red))
    }
}
struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonText: "Preview")
    }
}
