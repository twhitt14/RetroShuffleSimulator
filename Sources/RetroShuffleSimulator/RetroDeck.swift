//
//  RetroDeck.swift
//  
//
//  Created by Trevor Whittingham on 9/13/21.
//

import Foundation

public struct RetroDeck<T: Hashable> {
    public let cards: [T]
    
    public init(cardValuesAndCounts: [(T, Int)]) {
        var tempCards: [T] = []
        for (_, (cardType, cardCount)) in cardValuesAndCounts.enumerated() {
            tempCards.append(contentsOf: Array(repeating: cardType, count: cardCount))
        }
        cards = tempCards
    }
    
    public func shuffleDeckByMakingPilesThenCombining(numberOfPiles: Int) -> [T] {
        return RetroShuffleSimulator.shuffleDeckByMakingPilesThenCombining(cards, numberOfPiles: numberOfPiles)
    }
}
