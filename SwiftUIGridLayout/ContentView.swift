//
//  ContentView.swift
//  SwiftUIGridLayout
//
//  Created by Hafiz on 11/07/2021.
//

import SwiftUI

struct ContentView: View {
    // 1. Number of items will be display in row
    var columns: [GridItem] = [
        GridItem(.flexible(minimum: 140)),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    // 2. Fixed height of card
    let height: CGFloat = 150
    // 3. Get mock cards data
    let cards: [Card] = MockStore.cards
    
    var body: some View {
        ScrollView {
            // 4. Populate into grid
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(cards) { card in
                    CardView(title: card.title)
                        .frame(height: height)
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
