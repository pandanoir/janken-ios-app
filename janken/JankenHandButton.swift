//
//  SwiftUIView.swift
//  janken
//
//  Created by 幾野直人 on 2024/04/29.
//

import SwiftUI


struct JankenHandButton: View {
    var hand: JankenHand
    var onChooseHand: (_ hand: JankenHand) -> Void

    var body: some View {
        Button(action: {
            onChooseHand(hand)
        }, label: {
            JankenHandView(hand: .constant(hand)).padding()
        })
    }
}

#Preview {
    JankenHandButton(hand: .gu, onChooseHand: {hand in })
}
