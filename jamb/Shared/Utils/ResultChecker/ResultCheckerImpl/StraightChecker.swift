//
//  StraightChecker.swift
//  jamb (iOS)
//
//  Created by Domagoj Bunoza on 24.03.2022..
//

import Foundation

class StraightChecker : ResultChecker {
    
    func check(dice: [Int]) -> GameResult {
        let unique = Array(Set(dice))
        if unique.count > 4 {
            if unique.count == 6 {
                return .straight
            } else {
                let numberOfOnes = unique.filter({ $0 == 1 }).count
                let numberOfSixes = unique.filter({ $0 == 6 }).count
                if numberOfOnes == 0 || numberOfSixes == 0 {
                    return .straight
                }
            }
        }
        return .none
    }
}
