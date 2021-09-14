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
            let expected1 = [9,7,5,3,1,8,6,4,2]
            XCTAssertTrue(expected1 == splitDeck1, "Deck wasn't shuffled correctly. Expected \(expected1), got \(splitDeck1)")
            
            let splitDeck2 = RetroShuffleSimulator.shuffleDeckByMakingPilesThenCombining(deck, numberOfPiles: 3)
            let expected2 = [7,4,1,8,5,2,9,6,3]
            XCTAssertTrue(expected2 == splitDeck2, "Deck wasn't shuffled correctly. Expected \(expected2), got \(splitDeck2)")
        }
    }