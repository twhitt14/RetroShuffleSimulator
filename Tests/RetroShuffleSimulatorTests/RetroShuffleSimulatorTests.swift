import XCTest
import RetroShuffleSimulator

final class RetroShuffleSimulatorTests: XCTestCase {
    func testIndexToSplitDeckIsAlwaysValid() {
        let deckLength = 3
        for _ in (1...100) {
            let index = RetroShuffleSimulator.getRandomIndexToCutDeckOf(length: deckLength)
            XCTAssertTrue((1...deckLength - 1).contains(index), "Invalid index to split deck: \(index) (deck length: \(deckLength))")
        }
    }
    
    func testCutDeck() {
        let deck = [1,2,3,4,5,6,7,8,9]
        
        let splitDeck1 = RetroShuffleSimulator.cutDeck(deck, at: 1)
        XCTAssertTrue([2,3,4,5,6,7,8,9,1] == splitDeck1, "Deck wasn't cut in the right place")
        
        let splitDeck2 = RetroShuffleSimulator.cutDeck(deck, at: 8)
        XCTAssertTrue([9,1,2,3,4,5,6,7,8] == splitDeck2, "Deck wasn't cut in the right place")
        
        let splitDeck3 = RetroShuffleSimulator.cutDeck(deck, at: 4)
        XCTAssertTrue([5,6,7,8,9,1,2,3,4] == splitDeck3, "Deck wasn't cut in the right place")
    }
    
    func testShuffle() {
        let deck = [1,2,3,4,5,6,7,8,9]
        
        let splitDeck1 = RetroShuffleSimulator.shuffleDeckByMakingPilesThenCombining(deck, numberOfPiles: 2)
        let expected1 = [8,6,4,2,9,7,5,3,1]
        XCTAssertTrue(expected1 == splitDeck1, "Deck wasn't shuffled correctly. Expected \(expected1), got \(splitDeck1)")
        
        let splitDeck2 = RetroShuffleSimulator.shuffleDeckByMakingPilesThenCombining(deck, numberOfPiles: 3)
        let expected2 = [9,6,3,8,5,2,7,4,1]
        XCTAssertTrue(expected2 == splitDeck2, "Deck wasn't shuffled correctly. Expected \(expected2), got \(splitDeck2)")
    }
    
    func testRetroDeckInit() {
        let cardValuesAndCounts = [("a", 5), ("b", 5), ("c", 10)]
        let deck = RetroDeck(cardValuesAndCounts: cardValuesAndCounts)
        let expected = ["a", "a", "a", "a", "a", "b", "b", "b", "b", "b", "c", "c", "c", "c", "c", "c", "c", "c", "c", "c"]
        XCTAssertTrue(expected == deck.cards, "Deck wasn't shuffled correctly. Expected \(expected), got \(deck.cards)")
    }
    
    func testRetroDeckShuffle() {
        let cardValuesAndCounts = [("a", 5), ("b", 5), ("c", 10)]
        let deck = RetroDeck(cardValuesAndCounts: cardValuesAndCounts)
        
        let shuffled1 = deck.shuffleDeckByMakingPilesThenCombining(numberOfPiles: 3)
        let expected1 = ["c", "c", "c", "b", "b", "a", "c", "c", "c", "c", "b", "a", "a", "c", "c", "c", "b", "b", "a", "a"]
        XCTAssertTrue(expected1 == shuffled1, "Deck wasn't shuffled correctly. Expected \(expected1), got \(shuffled1)")
        
        let shuffled2 = RetroShuffleSimulator.shuffleDeckByMakingPilesThenCombining(shuffled1, numberOfPiles: 4)
        let expected2 = ["a", "c", "a", "c", "b", "a", "c", "b", "c", "c", "b", "c", "c", "a", "c", "b", "a", "c", "b", "c"]
        XCTAssertTrue(expected2 == shuffled2, "Deck wasn't shuffled correctly. Expected \(expected2), got \(shuffled2)")
    }
    
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
//                print(hand)
//                print("⭐️ mana: \(manaCount)")
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
    
    func testShufflePerformance() {
        
    }
}
