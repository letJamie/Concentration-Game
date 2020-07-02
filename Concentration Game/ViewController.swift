//
//  ViewController.swift
//  Concentration Game
//
//  Created by Jamie on 2020/07/02.
//  Copyright © 2020 Jamie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        FlipCard(name: "👻", button: sender)
        
    }
    
    @IBAction func touchSecondCard(_ sender: UIButton) {
        
        FlipCard(name: "🎃", button: sender)

        
    }
    func FlipCard(name: String, button: UIButton) {
        if button.currentTitle == name {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        } else {
            button.setTitle(name, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.2952712513, green: 0.6914016126, blue: 1, alpha: 1)
        }
    }
}

