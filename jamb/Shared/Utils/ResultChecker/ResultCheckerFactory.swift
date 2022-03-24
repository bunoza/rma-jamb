//
//  ResultCheckerFactory.swift
//  jamb (iOS)
//
//  Created by Domagoj Bunoza on 24.03.2022..
//

import Foundation

class ResultCheckerFactory {
    private let jambChecker = JambChecker()
    private let pokerChecker = PokerChecker()
    private let trisChecker = TrisChecker()
    private let straightChecker = StraightChecker()
    
    func getCheckers() -> [ResultChecker] {
        return [jambChecker, pokerChecker, trisChecker, straightChecker]
    }
}
