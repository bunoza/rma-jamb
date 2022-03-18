//
//  StringFormatter.swift
//  jamb
//
//  Created by Domagoj Bunoza on 18.03.2022..
//

import Foundation

class StringFormatter {
    
    static func format(results: [GameResult]) -> String {
        var tempString = "Your result: "
        
        if results[0] == .none {
            tempString += " None "
            return tempString
        }
        
        for item in results {
            if item == .jamb {
                tempString += " Jamb "
            }
            if item == .poker {
                tempString += " Poker "
            }
            if item == .tris {
                tempString += " Tris "
            }
            if item == .straight {
                tempString += " Straight "
            }
        }
        return tempString

    }
    
}
