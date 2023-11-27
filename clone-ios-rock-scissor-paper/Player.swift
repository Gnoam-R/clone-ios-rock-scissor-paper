//
//  Player.swift
//  clone-ios-rock-scissor-paper
//
//  Created by Roh on 11/27/23.
//

import Foundation

class Player {
    var hand: Hand
    var isUser: Bool
    
    static func randomizeHand() -> Hand {
        return Hand.allCases.randomElement() ?? .rock
    }
    
    init(hand: Hand?) {
        guard let hand else {
            self.isUser = false
            self.hand = Self.randomizeHand()
            return
        }
        self.isUser = true
        self.hand = hand
    }
}
