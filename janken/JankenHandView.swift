//
//  JankenHand.swift
//  janken
//
//  Created by 幾野直人 on 2024/04/29.
//

import SwiftUI

struct JankenHandView: View {
    @Binding var hand: JankenHand?
    var body: some View {
        Image(hand?.toString ?? "none")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width:130,height:130)
            .background(
                Circle()
                    .foregroundColor((hand?.color ?? .gray).opacity(0.3))
                    .frame(width:170, height:170)
            )
    }
}


#Preview {
    VStack{
        JankenHandView(hand: .constant(nil)).padding()
        JankenHandView(hand: .constant(.gu)).padding()
        JankenHandView(hand: .constant(.choki)).padding()
        JankenHandView(hand: .constant(.pa)).padding()
    }
}
