//
//  TrisChecker.swift
//  jamb (iOS)
//
//  Created by Domagoj Bunoza on 24.03.2022..
//

import Foundation

class TrisChecker : ResultChecker {

    func check(dice: [Int]) -> GameResult {
        if let occurrences = dice.checkForOccurrences() {
            if occurrences > 2 {
                return .tris
            }
        }
        return .none
    }
    
}
