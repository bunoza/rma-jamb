//
//  ResultCalculator.swift
//  jamb
//
//  Created by Domagoj Bunoza on 18.03.2022..
//

import Foundation

class ResultCalculator {
    
    let numbers : [Int]
    
    init(dice: [Die]) {
        numbers = dice.map({ $0.number })
    }
    
    func checkForResults() -> [GameResult] {
        var results : [GameResult] = []
        if checkForJamb() { results.append(.jamb) }
        if checkForPoker() { results.append(.poker) }
        if checkForTris() { results.append(.tris) }
        if checkForStraight() { results.append(.straight) }
        if results.isEmpty {results.append(.none)}
        return results
    }
    
    func checkForJamb() -> Bool {
        return checkForOccurrences() > 4
    }
    
    func checkForPoker() -> Bool {
        return checkForOccurrences() == 4
    }
    
    func checkForTris() -> Bool {
        return checkForOccurrences() == 3
    }
    
    func checkForStraight() -> Bool {
        let unique = Array(Set(numbers))
        if unique.count > 4 {
            if unique.count == 6 {
                return true
            } else {
                let numberOfOnes = unique.filter({ $0 == 1 }).count
                let numberOfSixes = unique.filter({ $0 == 6 }).count
                if numberOfOnes == 0 || numberOfSixes == 0 {
                    return true
                }
            }
        }
        return false
    }
    
    func checkForOccurrences() -> Int {
        var max : Int = 0
        for i in 1...6 {
            let occurrences = numbers.filter({ $0 == i }).count
            if occurrences > max {
                max = occurrences
            }
        }
        return max
    }
}
