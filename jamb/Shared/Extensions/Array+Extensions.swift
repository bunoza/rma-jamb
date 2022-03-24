//
//  Array+Extensions.swift
//  jamb (iOS)
//
//  Created by Domagoj Bunoza on 24.03.2022..
//

import Foundation

extension Array {
    func checkForOccurrences() -> Int {
        if !self.isEmpty && self[0] {
            
        }
        var max: Int = 0
        for i in 1...6 {
            let occurrences = self.filter({ $0 as! Int == i }).count
            if occurrences > max {
                max = occurrences
            }
        }
        return max
    }
}
