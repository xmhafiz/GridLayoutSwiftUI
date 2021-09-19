//
//  GridContentView.swift
//  SwiftUIGridLayout
//
//  Created by Hafiz on 11/07/2021.
//

import SwiftUI

struct GridContentView: View {
    let itemPerRow: CGFloat = 2
    let horizontalSpacing: CGFloat = 16
    let height: CGFloat = 300
    
    let cards: [Card] = MockStore.cards
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: horizontalSpacing/2) {
                    ForEach(0..<cards.count) { i in
                        if i % Int(itemPerRow) == 0 {
                            buildView(rowIndex: i, geometry: geometry)
                        }
                    }
                }
            }
        }
    }
    
    func buildView(rowIndex: Int, geometry: GeometryProxy) -> RowView? {
        var rowCards = [Card]()
        for itemIndex in 0..<Int(itemPerRow) {
            if rowIndex + itemIndex < cards.count {
                rowCards.append(cards[rowIndex + itemIndex])
            }
        }
        if !rowCards.isEmpty {
            return RowView(cards: rowCards,
                           width: getWidth(geometry: geometry),
                           height: height,
                           horizontalSpacing: horizontalSpacing)
        }
        
        return nil
    }
    
    func getWidth(geometry: GeometryProxy) -> CGFloat {
        let width: CGFloat = (geometry.size.width - horizontalSpacing * (itemPerRow + 1)) / itemPerRow
        return width
    }
}

struct GridContentView_Previews: PreviewProvider {
    static var previews: some View {
        GridContentView()
    }
}

struct Card: Identifiable {
    let id = UUID()
    let title: String
}

struct RowView: View {
    let cards: [Card]
    let width: CGFloat
    let height: CGFloat
    let horizontalSpacing: CGFloat
    var body: some View {
        HStack(spacing: horizontalSpacing) {
            ForEach(cards) { card in
                CardView(title: card.title)
                    .frame(width: width, height: height)
            }
        }
        .padding(.leading, horizontalSpacing)
    }
}
