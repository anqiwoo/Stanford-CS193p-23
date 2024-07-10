//
//  ContentView.swift
//  Memorize
//
//  Created by Anqi Wu on 6/21/24.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = [
        ["🚙", "🚗", "🚕", "🚗", "🚎", "🚌", "🚕", "🚙", "🚎", "🚑", "🚌", "🏎️"],
        ["🐱", "🐷", "🐶", "🐭", "🐯", "🐯", "🐮", "🐴", "🐭", "🐴", "🐶", "🐷", "🐱", "🐮", "🦁", "🦁"],
        ["🤣", "😊", "😃", "😂", "😀", "😂", "😃", "🤣", "😁", "😁", "😇", "😄", "😇", "😆", "😆", "😅", "😅", "😄", "😀", "😊"]
    ]
    @State var themeIndex = 0
    // Define a grid layout with 5 columns
    let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 5)
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                cards
            }
            Spacer()
            themeChoosers
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: columns, spacing: 5) {
            ForEach(0..<emojis[themeIndex].count, id: \.self) { index in
                CardView(content: emojis[themeIndex][index])
                    .aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            }
        }.foregroundColor(.red)
    }
    
    var themeChoosers: some View {
        HStack {
            Spacer()
            vehicleTheme
            Spacer()
            animalTheme
            Spacer()
            faceTheme
            Spacer()
        }.imageScale(.large)
    }
    
    func themeChooser(by offset: Int, symbol: String, text: String) -> some View {
        VStack {
            Button(action: {
                themeIndex = offset
                emojis[themeIndex].shuffle()
            }, label: {
                Image(systemName: symbol)
            })
            Text(text)
                .font(.body)
                .foregroundColor(.blue)
        }.font(.title)
    }
    
    var vehicleTheme: some View {
        themeChooser(by: 0, symbol: "car", text: "Vehicles")
    }
    
    var animalTheme: some View {
        themeChooser(by: 1, symbol: "pawprint.fill", text: "Animals")
    }
    
    var faceTheme: some View {
        themeChooser(by: 2, symbol: "face.smiling.inverse", text: "Faces")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1: 0)
            base.fill().opacity(isFaceUp ? 0: 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}









#Preview {
    ContentView()
}
