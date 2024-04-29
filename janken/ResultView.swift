//
//  ResultView.swift
//  janken
//
//  Created by 幾野直人 on 2024/04/29.
//

import SwiftUI

struct ResultView: View {
    var result: [(JankenHand,JankenHand)]
    var body: some View {
        let count = Dictionary(result.map { (player, cpu) in
            (player.battle(cpu), 1)
        }, uniquingKeysWith: +)

        Text("number of wins: \(count["win"] ?? 0)")
        Text("number of loses: \(count["lose"] ?? 0)")

        List{
            ForEach(result.indices, id: \.self) { index in
                HStack{
                    Spacer()
                    Image(result[index].0.toString).resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                    Text(result[index].0.battle(result[index].1))
                    Image(result[index].1.toString).resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ResultView(result: [
        (.gu, .choki),
        (.choki, .choki),
        (.pa, .choki)
    ])
}
