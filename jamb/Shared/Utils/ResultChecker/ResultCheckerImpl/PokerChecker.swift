//
//  PokerChecker.swift
//  jamb (iOS)
//
//  Created by Domagoj Bunoza on 24.03.2022..
//

import Foundation

class PokerChecker : ResultChecker {

    func check(dice: [Int]) -> GameResult {
        if let occurrences = dice.checkForOccurrences() {
            if occurrences > 3 {
                return .poker
            }
        }
        return .none
    }
}
