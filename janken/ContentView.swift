//
//  ContentView.swift
//  janken
//
//  Created by 幾野直人 on 2024/04/29.
//

import SwiftUI

struct ContentView: View {
    @State var path = NavigationPath()
    var body: some View {
        NavigationStack(path:$path) {
            MainView()
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(
                    for: Routes.self,
                    destination: { appended in
                        appended.Destination()
                            .navigationTitle(appended.toString)
                            .navigationBarTitleDisplayMode(.inline)
                    })
                .navigationTitle(Routes.root.toString)
        }
    }
}

#Preview {
    ContentView()
}
