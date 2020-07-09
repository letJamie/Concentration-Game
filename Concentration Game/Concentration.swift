//
//  Concentration.swift
//  Concentration Game
//
//  Created by Jamie on 2020/07/02.
//  Copyright © 2020 Jamie. All rights reserved.
//

import Foundation

struct Concentration {
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get  {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        } set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "chosen index not in the card")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if card match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                
            } else {
              
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
         
    }
    
    init(numberOfPairsOfCards: Int ) {
        assert(numberOfPairsOfCards > 0, "you must have at least one pair of cards")
        for _ in 1...numberOfPairsOfCards {
          
            let card = Card()
            cards += [card, card]

        }
        //todo shuffle the cards

    }
}

