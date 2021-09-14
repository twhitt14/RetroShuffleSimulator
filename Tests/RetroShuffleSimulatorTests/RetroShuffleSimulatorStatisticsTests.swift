//
//  RetroShuffleSimulatorStatisticsTests.swift
//  RetroShuffleSimulatorTests
//
//  Created by Trevor Whittingham on 9/14/21.
//

import XCTest
import RetroShuffleSimulator

class RetroShuffleSimulatorStatisticsTests: XCTestCase {

    func testShuffleStatistics() {
        let cardValuesAndCounts = [("MANA", 25), ("g", 1), ("pm", 1), ("gh", 1), ("gw", 2), ("gu", 2), ("pw", 3), ("nh", 3), ("other", 22)]
        let deck = RetroDeck(cardValuesAndCounts: cardValuesAndCounts)
        var startingDeck = deck.cards
        
        var manaTimes0 = 0
        var manaTimes1 = 0
        var manaTimes2 = 0
        var manaTimes3 = 0
        var manaTimes4 = 0
        var manaTimes5 = 0
        var manaTimes6 = 0
        var manaTimes7 = 0
        var other = [Int]()
        
        let deals = 10000
        for _ in 1...deals {
//            var totalMana = 0
//            var manaResultArray = [Int]()
            
//            startingDeck.shuffle()
//            let cut = RetroShuffleSimulator.cutDeckRandomly(startingDeck)
            
            let shuffled1 = RetroShuffleSimulator.shuffleDeckByMakingPilesThenCombining(startingDeck, numberOfPiles: 9)
            let cut = RetroShuffleSimulator.cutDeckRandomly(shuffled1)
            
//            let shuffled2 = RetroShuffleSimulator.shuffleDeckByMakingPilesThenCombining(shuffled1, numberOfPiles: 9)
//            let cut = RetroShuffleSimulator.cutDeckRandomly(shuffled2)
            
            let hand = cut.prefix(7)
            let manaCount = hand.filter { $0 == "MANA" }.count
//            print(hand)
//            print("⭐️ mana: \(manaCount)")
//            totalMana += manaCount
//            manaResultArray.append(manaCount)
            switch manaCount {
            case 0:
                manaTimes0 += 1
            case 1:
                manaTimes1 += 1
            case 2:
                manaTimes2 += 1
            case 3:
                manaTimes3 += 1
            case 4:
                manaTimes4 += 1
            case 5:
                manaTimes5 += 1
            case 6:
                manaTimes6 += 1
            case 7:
                manaTimes7 += 1
            default:
                other.append(manaCount)
            }
            
//            let average = Double(totalMana) / Double(deals)
//            print("⭐️⭐️ average: \(average)")
//            print("⭐️⭐️ % mana cards in deck: \(25.0 / 60)")
//            print("⭐️⭐️ % mana cards drawn: \(average / 7)")
//            print("⭐️⭐️ % mana median: \(manaResultArray[manaResultArray.count / 2])")
//            print("⭐️⭐️ % mana 1st quartile: \(manaResultArray[manaResultArray.count / 4])")
//            print("⭐️⭐️ % mana 4th quartile: \(manaResultArray[manaResultArray.count / 4 * 3])")
        }
        
        let total = Double(manaTimes0 + manaTimes1 + manaTimes2 + manaTimes3 + manaTimes4 + manaTimes5 + manaTimes6 + manaTimes7)
        print("⭐️⭐️⭐️ manaTimes0: \(manaTimes0), percentage: \(Double(manaTimes0) / total * 100)")
        print("⭐️⭐️⭐️ manaTimes1: \(manaTimes1), percentage: \(Double(manaTimes1) / total * 100)")
        print("⭐️⭐️⭐️ manaTimes2: \(manaTimes2), percentage: \(Double(manaTimes2) / total * 100)")
        print("⭐️⭐️⭐️ manaTimes3: \(manaTimes3), percentage: \(Double(manaTimes3) / total * 100)")
        print("⭐️⭐️⭐️ manaTimes4: \(manaTimes4), percentage: \(Double(manaTimes4) / total * 100)")
        print("⭐️⭐️⭐️ manaTimes5: \(manaTimes5), percentage: \(Double(manaTimes5) / total * 100)")
        print("⭐️⭐️⭐️ manaTimes6: \(manaTimes6), percentage: \(Double(manaTimes6) / total * 100)")
        print("⭐️⭐️⭐️ manaTimes7: \(manaTimes7), percentage: \(Double(manaTimes7) / total * 100)")
        
        print("done")
    }
}
