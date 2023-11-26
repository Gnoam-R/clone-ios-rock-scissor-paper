//
//  Player.swift
//  clone-ios-rock-scissor-paper
//
//  Created by Roh on 11/27/23.
//

import Foundation

class Player {
    var isPlayer : Bool
    var hand: Hand
    
    init(_ hand: Hand, _ isPlayer: Bool) {
        self.hand = hand
        self.isPlayer = isPlayer
    }
}