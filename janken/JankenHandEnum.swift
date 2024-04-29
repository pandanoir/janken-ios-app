//
//  JankenHandEnum.swift
//  janken
//
//  Created by 幾野直人 on 2024/04/29.
//

import SwiftUI

enum JankenHand: Int {
    case gu
    case choki
    case pa
    func toString() -> String {
        switch self {
            case .gu: "gu"
            case .choki: "choki"
            case .pa: "pa"
        }
    }
    func getColor() -> Color {
        switch self {
            case .gu: .red
            case .choki: .yellow
            case .pa: .blue
        }
    }
    func battle(_ cpuHand: JankenHand) -> String {
        ["draw", "lose", "win"][(self.rawValue + 3 - cpuHand.rawValue) % 3]
    }
}
