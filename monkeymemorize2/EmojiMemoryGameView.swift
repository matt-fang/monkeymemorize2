//
//  ContentView.swift
//  monkeymemorize2
//
//  Created by Matthew Fang on 1/7/25.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    private var emojis = ["🐶", "🐱", "🐭", "🐰", "🦊", "🐻", "🐼", "🐨", "🐯", "🦁", "🐮", "🐵"]
    @State var pairsOfCards = 4
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(0..<pairsOfCards, id: \.self) { index in
                        CardView(content: emojis[index])
                        CardView(content: emojis[index])
                    }
                }
                .padding()
            }
            incrementButtonView.padding()
        }
    }
    
    
    var incrementButtonView: some View {
        HStack {
            incrementButton(by: -1, symbol: "minus.circle.fill")
            Spacer()
            incrementButton(by: +1, symbol: "plus.circle.fill")
        }
    }
    
    
    func incrementButton(by increment: Int, symbol: String) -> some View {
        Button(action: {
            pairsOfCards += increment
        }, label: {
            Image(systemName: symbol)
                .font(.title)
        })
    }
}


struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(.regularMaterial)
                .aspectRatio(2/3, contentMode: .fit)
            Text(content)
                .font(.largeTitle)
                .opacity(isFaceUp ? 1 : 0)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    EmojiMemoryGameView()
}
