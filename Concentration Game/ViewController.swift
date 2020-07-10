//
//  ViewController.swift
//  Concentration Game
//
//  Created by Jamie on 2020/07/02.
//  Copyright © 2020 Jamie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int { 
        return (cardButtons.count + 1) / 2
    }
    
    private(set) var flipCount = 0 {
        didSet {
            
            updateFlipCountLabel()
            
        }
    }
    
    private func updateFlipCountLabel() {
        
        let attributes: [NSAttributedString.Key:Any] = [
            .strokeWidth : 5.0,
            .strokeColor : UIColor.orange
        ]
        
        let attributedString = NSAttributedString(string: "flips: \(flipCount)", attributes: attributes)
        flipCountLabel.attributedText = attributedString
    }
    
    
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var flipCountLabel: UILabel! {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    
    @IBAction private func touchCard(_ sender: UIButton) {
        
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            
            
        } else {
            print("...ddd")
        }
    }
    
    private func updateViewFromModel() {
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
    
    //private var emojiChoices = ["👻","🦺","🧵","🎃","🧑🏼‍🍳","🐁","🌿","⛄️","🌝"]
    private var emojiChoices = "👻🦺🧵🎃🧑🏼‍🍳🐁🌿⛄️🌝"

    private var emoji = [Card:String]()
    private func emoji(for card: Card) -> String {
        
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
            
        }
        
        return emoji[card] ?? "?"
    }
    
    
    
}

extension Int {
    var arc4random: Int {
        
        if self > 0 {
            
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
            
        } else {
            return 0
        }
    }
}


