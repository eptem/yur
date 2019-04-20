//
//  Card.swift
//  zheka
//
//  Created by Артем Жорницкий on 18/04/2019.
//  Copyright © 2019 Артем Жорницкий. All rights reserved.
//

import Foundation

class Card {
    var id = 0
    var isFaceUp = false
    var won = false
    
    init() {}
    
    init(withId id: Int) {
        self.id = id
    }
}

extension Card: Equatable {
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.id == rhs.id
    }
    
}
