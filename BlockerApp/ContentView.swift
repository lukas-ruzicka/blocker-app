//
//  ContentView.swift
//  BlockerApp
//
//  Created by Lukáš Růžička on 02.09.2021.
//

import SwiftUI
import UIKit

struct ContentView: View {

    @State private var isBlocked = false
    @State private var didBlockingSucceed: Bool?

    var body: some View {
        Text(isBlocked ? "Unblock": "Block")
            .padding()
            .font(.title)
            .onTapGesture {
                didBlockingSucceed = nil
                UIAccessibility.requestGuidedAccessSession(enabled: !isBlocked) {
                    didBlockingSucceed = $0
                    if $0 {
                        isBlocked.toggle()
                    }
                }
            }
        if didBlockingSucceed == false {
            Text("Blocking failed..")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
