//
//  Concentration.swift
//  Concentration Game
//
//  Created by Jamie on 2020/07/02.
//  Copyright © 2020 Jamie. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if card match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                //no card or two cards are faced up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
         
    }
    
    init(numberOfPairsOfCards: Int ) {
        
        for _ in 1...numberOfPairsOfCards {
          
            let card = Card()
            cards += [card, card]

        }
        //todo shuffle the cards

    }
}

