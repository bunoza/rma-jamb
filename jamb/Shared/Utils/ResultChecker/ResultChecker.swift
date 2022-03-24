//
//  ResultChecker.swift
//  jamb (iOS)
//
//  Created by Domagoj Bunoza on 24.03.2022..
//

import Foundation

protocol ResultChecker {
    func check(dice: [Die]) -> Bool
}
