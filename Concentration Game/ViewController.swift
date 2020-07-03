//
//  ViewController.swift
//  Concentration Game
//
//  Created by Jamie on 2020/07/02.
//  Copyright © 2020 Jamie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2 )
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "flips: \(flipCount)"
            
        }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            
            
        } else {
            print("...ddd")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            print(card.isFaceUp)
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.2952712513, green: 0.6914016126, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.2952712513, green: 0.6914016126, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["👻","🦺","🧵","🎃","🧑🏼‍🍳","🐁","🌿","⛄️","🌝"]
    
    var emoji = [Int:String]()
    func emoji(for card: Card) -> String {
        
        if emoji[card.identifier] == nil {
            if emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
        }
        
        return emoji[card.identifier] ?? "?"
    }
    
    
    
}

