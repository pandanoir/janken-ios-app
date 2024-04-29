//
//  Janken.swift
//  janken
//
//  Created by 幾野直人 on 2024/04/29.
//

import SwiftUI

struct MainView: View {
    let jankenHands: [JankenHand] = [.gu, .choki, .pa]
    @State var playerHand = JankenHand.gu
    @State var cpuHand: JankenHand?

    @State var isZoomed = false

    var body: some View {
        Spacer()
        JankenHandView(hand: $cpuHand)
            .scaleEffect(isZoomed ? 0.85 : 1.0).padding()
        Text(cpuHand != nil ?playerHand.battle(cpuHand!):" ")
        Spacer()
        JankenHandButton(hand: .gu, onChooseHand: onChooseHand)
        HStack{
            Spacer()
            JankenHandButton(hand: .choki, onChooseHand: onChooseHand)
            Spacer()
            JankenHandButton(hand: .pa, onChooseHand: onChooseHand)
            Spacer()
        }
        Spacer()
    }
    func onChooseHand(_ hand:JankenHand) {
        playerHand = hand
        cpuHand = jankenHands.randomElement()!
        self.isZoomed = true
        withAnimation(.easeIn(duration: 0.15)) {
            self.isZoomed = false
        }
    }
}

#Preview {
    MainView()
}
