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
    
    func chooseCard(at index: Int) {
        
        if cards[index].isFaceUp {
            //print(cards[index].isFaceUp)
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
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

