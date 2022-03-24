//
//  HomeScreenViewModel.swift
//  jamb
//
//  Created by Domagoj Bunoza on 17.03.2022..
//

import Foundation
import Combine
import SwiftUI

class HomeScreenViewModel: ObservableObject {
    
    @Published var screenData: [Die]
    @Published var numberOfThrowsLeft: Int
    var resultCalculator: ResultCalculator?
    
    var resultString: String
    
    init() {
        self.numberOfThrowsLeft = 3
        self.screenData = [Die]()
        resultString = "Your result: "
        for _ in 1...6 {
            self.screenData.append(Die(number: Int.random(in: 1...6), isLocked: false))
        }
    }
    
    func getResults() -> String {
        self.resultCalculator = ResultCalculator(dice: screenData)
        if let resultCalculator = resultCalculator {
            let results = resultCalculator.checkForResults()
            let tempResults = createResultString(results: results)
            return tempResults
        }
        return resultString
    }
    
    func createResultString(results: [GameResult]) -> String {
        return StringFormatter.format(results: results)
    }
    
    func throwDice() {
        numberOfThrowsLeft -= 1
        for die in screenData {
            if !die.isLocked {
                die.number = Int.random(in: 1...6)
            }
        }
    }
    
    func lockDie(index: Int) {
        screenData[index].isLocked.toggle()
    }
    
    func startNewGame() {
        setupData()
    }
    
    func setupData() {
        self.numberOfThrowsLeft = 2
        for i in 0...5 {
            self.screenData[i].isLocked = false
            self.screenData[i].number = Int.random(in: 1...6)
        }
        
    }
}
