//
//  GameEngine.swift
//  zheka
//
//  Created by Артем Жорницкий on 18/04/2019.
//  Copyright © 2019 Артем Жорницкий. All rights reserved.
//

import Foundation
import UIKit

enum GameState {
    case oneCardIsFacedUp
    case noCardsFacedUp
    case weWon
}

class GameEngine {
    
    private var size = 3
    private var cards: [Card]
    
    var state: GameState = .noCardsFacedUp
    
    var colorHandler: ((_ color: UIColor, _ index: Int) -> Void)?
    
    init(with size: Int) {
        self.size = size
        
        cards = [Card]()
        for idx in 0..<size * size / 2 {
            cards += [Card(withId: idx), Card(withId: idx)]
        }
    }
    
    func checkCard(atIndex index: Int) {
        let card = cards[index]
        
        switch state {
        case .oneCardIsFacedUp:
            guard let facedUpCard = cards.filter({$0.isFaceUp}).first else { return }
            if facedUpCard == card {
                card.won = true
                facedUpCard.won = true

            } else {
                card.isFaceUp = false
                facedUpCard.isFaceUp = false
                
                
            }

        case .noCardsFacedUp:
            card.isFaceUp = true
            
            state = .oneCardIsFacedUp
            
        case .weWon:
            break
        }
    }

    func checkIfWeWon() -> Bool {
        return cards.filter({$0.won == false}).isEmpty
    }
    
}
