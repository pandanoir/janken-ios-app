//
//  jankenApp.swift
//  janken
//
//  Created by 幾野直人 on 2024/04/29.
//

import SwiftUI

func ==<T1: Equatable, T2: Equatable>(lhs: (T1,T2), rhs: (T1,T2)) -> Bool {
    return lhs.0 == rhs.0 && lhs.1 == rhs.1
}

enum Routes: Hashable {
    static func == (lhs: Routes, rhs: Routes) -> Bool {
        switch lhs {
        case .root:
            switch rhs {
                case .root: true
                default: false
            }
        case let .result(lhsResult):
            switch rhs {
                case let .result(rhsResult): lhsResult.elementsEqual(rhsResult,by: ==)
                default:false
            }
        }
    }

    func hash(into hasher: inout Hasher) {
        switch self {
        case .root:
            hasher.combine("root")
        case .result(let hands):
            hasher.combine("result")
            for (a,b) in hands {
                hasher.combine(a)
                hasher.combine(b)
            }
        }
    }

    case root, result([(JankenHand,JankenHand)])
    var toString: String {
        switch self {
            case .root: "ホーム"
            case .result: "戦績"
        }
    }
    @ViewBuilder
    func Destination() -> some View{
        switch self {
            case .root: MainView()
        case let .result(result): ResultView(result: result)
        }
    }
}

@main
struct jankenApp: App {
    var body: some Scene {
        WindowGroup {
                ContentView()
        }
    }
}

