//
//  Menu.swift
//  clone-ios-rock-scissor-paper
//
//  Created by Roh on 11/25/23.
//

enum Menu {
    case rsp(UserHand: Hand)
    case exit
    
    // 입력 받은 hand 값에 대한 처리
    init?(rspInput rspNum: Int) {
        if let hand = Hand(rawValue: rspNum){
            self = .rsp(UserHand: hand)
        } else if rspNum == 0 {
            self = .exit
        } else {
            return nil
        }
    }
}
