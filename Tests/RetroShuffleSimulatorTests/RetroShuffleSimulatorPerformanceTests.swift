//
//  RetroShuffleSimulatorPerformanceTests.swift
//  RetroShuffleSimulatorTests
//
//  Created by Trevor Whittingham on 9/14/21.
//

import XCTest
import RetroShuffleSimulator

class RetroShuffleSimulatorPerformanceTests: XCTestCase {

    func testShufflePerformance() {
        let cardValuesAndCounts = [("MANA", 25), ("g", 1), ("pm", 1), ("gh", 1), ("gw", 2), ("gu", 2), ("pw", 3), ("nh", 3), ("other", 22)]
        let deck = RetroDeck(cardValuesAndCounts: cardValuesAndCounts)
        let startingDeck = deck.cards
        
        measure {
            for _ in 1...100000 {
                let _ = RetroShuffleSimulator.shuffleDeckByMakingPilesThenCombining(startingDeck, numberOfPiles: 9)
            }
        }
    }

}
