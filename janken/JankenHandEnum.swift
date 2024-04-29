//
//  JankenHandEnum.swift
//  janken
//
//  Created by 幾野直人 on 2024/04/29.
//

import SwiftUI

enum JankenHand: Int, Hashable {
    case gu, choki, pa
    var toString: String {
        ["gu", "choki", "pa"][self.rawValue]
    }
    var color: Color {
        [.red, .yellow, .blue][self.rawValue]
    }
    func battle(_ cpuHand: JankenHand) -> String {
        ["draw", "lose", "win"][(self.rawValue + 3 - cpuHand.rawValue) % 3]
    }
}
