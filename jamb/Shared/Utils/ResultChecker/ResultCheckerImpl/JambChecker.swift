//
//  JambChecker.swift
//  jamb (iOS)
//
//  Created by Domagoj Bunoza on 24.03.2022..
//

import Foundation

class JambChecker : ResultChecker {

    func check(dice: [Int]) -> GameResult {
        if let occurrences = dice.checkForOccurrences() {
            if occurrences > 4 {
                return .jamb
            }
        }
        return .none
    }
    
}
