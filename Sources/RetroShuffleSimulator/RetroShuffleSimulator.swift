//
//  RetroShuffleSimulator.swift
//  
//
//  Created by Trevor Whittingham on 9/13/21.
//

import Foundation

public struct RetroShuffleSimulator {
    
    public static func shuffleDeckByMakingPilesThenCombining<T>(_ deck: [T], numberOfPiles: Int) -> [T] {
        var piles: [[T]] = []
        for _ in 1...numberOfPiles {
            piles.append([])
        }
        
        var currentPile = 0
        for card in deck {
            if currentPile > numberOfPiles - 1 {
                currentPile = 0
            }
            piles[currentPile].append(card)
            currentPile += 1
        }
        
        var reversedPiles: [[T]] = []
        for pile in piles.reversed() {
            reversedPiles.append(pile.reversed())
        }
        
        return Array(reversedPiles.joined())
    }
    
    public static func cutDeck<T>(_ deck: [T], at indexOfBottomHalfTopCard: Int) -> [T] {
        let topHalf = deck.prefix(upTo: indexOfBottomHalfTopCard)
        let bottomHalf = deck.suffix(from: indexOfBottomHalfTopCard)
        
        return Array(bottomHalf + topHalf)
    }
    
    public static func cutDeckRandomly<T>(_ deck: [T]) -> [T] {
        cutDeck(deck, at: getRandomIndexToCutDeckOf(length: deck.count))
    }
    
    public static func getRandomIndexToCutDeckOf(length: Int) -> Int {
        (1...length - 1).randomElement()!
    }
}
