//
//  File.swift
//  clone-ios-rock-scissor-paper
//
//  Created by Roh on 11/25/23.
//

enum Hand: Int, CaseIterable{
    case rock = 2
    case scissor = 1
    case paper = 3
    
    static let numberOfFingers = 5
    
//    static func randomizeHand() -> Hand {
//        return Hand.allCases.randomElement() ?? .rock
//    }
    
    func wins(_ another: Hand) -> Bool {
        switch self {
        case .rock:
            return another == .scissor
        case .scissor:
            return another == .paper
        case .paper:
            return another == .rock
        }
    }
}
