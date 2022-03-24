//
//  ResultCalculator.swift
//  jamb
//
//  Created by Domagoj Bunoza on 18.03.2022..
//

import Foundation
import SwiftUI

class ResultCalculator {
    
    let resultCheckerFactory: ResultCheckerFactory
    let numbers: [Int]
    
    init(dice: [Die]) {
        numbers = dice.map({ $0.number })
        resultCheckerFactory = ResultCheckerFactory()
    }
    
    func checkForResults() -> [GameResult] {
        let checkers = resultCheckerFactory.getCheckers()
        var results = checkers.map { checker -> (GameResult) in
            return checker.check(dice: self.numbers)
        }
        results.removeAll(where: { $0 == .none })
        if results.isEmpty {
            return [.none]
        }
        return results
    }
}
