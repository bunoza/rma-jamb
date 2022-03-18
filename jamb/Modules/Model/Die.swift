//
//  Die.swift
//  jamb
//
//  Created by Domagoj Bunoza on 17.03.2022..
//

import Foundation
import SwiftUI

class Die {
    var number : Int
    var isLocked : Bool
    
    init(number: Int, isLocked: Bool) {
        self.number = number
        self.isLocked = isLocked
    }
    
    init() {
        self.number = 1
        self.isLocked = false
    }
}
